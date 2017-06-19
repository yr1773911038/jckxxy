package cn.edu.slcupc.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import cn.edu.slcupc.pojo.Privilege;
import cn.edu.slcupc.pojo.Role;
import cn.edu.slcupc.service.IPrivService;
import cn.edu.slcupc.service.IRoleService;
import cn.edu.slcupc.util.ResponseUtil;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 权限action
 * 
 * @author YR
 * 
 */
@SuppressWarnings("all")
public class PrivAction extends ActionSupport implements ModelDriven<Privilege> {

	private static final long serialVersionUID = 1L;
	private Privilege privilege = new Privilege();
	private IPrivService privService;
	private IRoleService roleService;
	private Long roleId;
	private Long parentId;
	private Long nodeId;

	public void setNodeId(Long nodeId) {
		this.nodeId = nodeId;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public void setRoleService(IRoleService roleService) {
		this.roleService = roleService;
	}

	public void setPrivService(IPrivService privService) {
		this.privService = privService;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Privilege getModel() {
		return privilege;
	}

	public String priv() {
		return "priv_view";
	}

	public String treeList() throws Exception {
		// 显示tree
		List<Privilege> aList = privService.findTop();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "roles", "parent", "createTime",
				"updateTime", "checked" });
		JSONArray rows = JSONArray.fromObject(aList, jsonConfig);
		ResponseUtil.write(ServletActionContext.getResponse(), rows);
		return null;

	}

	public String tree() throws Exception {
		System.out.println("当前选中角色" + roleId);
		// 得到当前的角色
		Role role = roleService.findById(roleId);
		List<Privilege> rauthList = new ArrayList<Privilege>();
		// 得到当前角色所有的权限
		for (Privilege privilege : role.getPrivileges()) {
			rauthList.add(privilege);
		}
		List<Privilege> aList = privService.findTop();
		// 设置整个树
		// setTree(rauthList, aList);
		if (rauthList.size() != 0) {
			for (int i = 0; i < rauthList.size(); i++) {
				setTreeChecked(rauthList.get(i), aList);
			}
		}

		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "roles", "parent", "createTime",
				"updateTime" });
		JSONArray rows = JSONArray.fromObject(aList, jsonConfig);
		System.out.println(rows);
		ResponseUtil.write(ServletActionContext.getResponse(), rows);
		return null;
	}

	public void setTreeChecked(Privilege priv, List<Privilege> aList) {
		// 在总的权限列表中循环，标记priv为checked
		// 首先查找第一层，
		Long privid = priv.getId();
		for (int j = 0; j < aList.size(); j++) {
			// 查找是否有priv id
			if (privid.longValue() == aList.get(j).getId().longValue()) {
				// 找到了，标记为checked
				aList.get(j).setChecked(true);
				break;
			}
			// 没有找到查看其子类
			if (aList.get(j).getChildren().size() != 0) {
				// 看你children中有没有，得到子类列表
				List<Privilege> chList = new ArrayList();
				for (Privilege auth : aList.get(j).getChildren()) {
					chList.add(auth);
				}
				// ildren 中有没有
				if (chList.size() != 0) {
					// 查看你的子类中有没有
					setTreeChecked(priv, chList);
				}
			}

		}

	}

	public String save() throws Exception {
		// 保存权限
		// 获取权限的信息
		System.out.println("privilege" + privilege);
		Privilege findById = null;
		// 获取穿过来的parentId
		if (parentId != null) {
			// 当保存的时候，获取parentId
			System.out.println("parentId" + parentId);
			// 通过parentId 找到parent对象
			findById = privService.findById(parentId);
			System.out.println("找到父节点" + findById);
			// 设置父节点
			privilege.setParent(findById);
		} else {
			// 更新的时候
			// 此时parentId为空，那么获取privilege的信息
			findById = privService.findById(privilege.getId());
			// 找到了要修改的对象，进行修改
			findById.setText(privilege.getText());
			findById.setUrl(privilege.getUrl());
			privilege = findById;

		}
		System.out.println("需要的对象" + privilege);
		// 封装
		privService.save(privilege);
		int result = 1;
		ResponseUtil.write(ServletActionContext.getResponse(), Integer
				.valueOf(result));

		return null;

	}

	public String delete() throws Exception {
		// 获取要删除的id
		System.out.println("删除id" + nodeId);
		int result = 0;
		// 删除的时候需要进行判断
		// 如果当前节点下有子节点，不允许删除
		Privilege findById = privService.findById(nodeId);
		if (findById.getChildren().size() != 0) {
			result = 2;
		} else {
			// 没有子节点可以进行删除
			privService.delete(nodeId);
			result = 1;
		}

		ResponseUtil.write(ServletActionContext.getResponse(), Integer
				.valueOf(result));
		return null;

	}

	/**
	 * 
	 * @param rauthList
	 * @param aList
	 */
	@SuppressWarnings("unchecked")
	public void setTree(List<Privilege> rauthList, List<Privilege> aList) {
		for (int i = 0; i < rauthList.size(); i++) {
			Privilege a = (Privilege) rauthList.get(i);
			// 判断alist中是否存在rauthlist的项，
			for (int j = 0; j < aList.size(); j++) {
				System.out.println(aList.get(j));
				// 说明找到该对象，那么将该对象checked属性设置为true；
				/*
				 * if(aList.get(j).getId()== a.getId()){
				 * 
				 * }
				 */
				// 从子类中获取看看
				if (aList.get(j).getChildren() != null) {
					// 得到子类列表
					List<Privilege> chList = new ArrayList();
					for (Privilege auth : aList.get(i).getChildren()) {
						// chList.add(auth);
						System.out.println(auth);
					}
					setTree(rauthList, chList);
				}
			}
			continue;
		}
	}

}
