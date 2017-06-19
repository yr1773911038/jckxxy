package cn.edu.slcupc.action;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.apache.struts2.ServletActionContext;

import cn.edu.slcupc.pojo.PageBean;
import cn.edu.slcupc.pojo.Privilege;
import cn.edu.slcupc.pojo.Role;
import cn.edu.slcupc.service.IPrivService;
import cn.edu.slcupc.service.IRoleService;
import cn.edu.slcupc.util.ResponseUtil;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 角色模块
 * 
 * @author YR
 * 
 */
@SuppressWarnings("all")
public class RoleAction extends ActionSupport implements ModelDriven<Role> {

	private static final long serialVersionUID = 1L;
	private Role role = new Role();
	private IRoleService roleService;
	private IPrivService privService;

	public IPrivService getPrivService() {
		return privService;
	}

	public void setPrivService(IPrivService privService) {
		this.privService = privService;
	}

	private int page;// 当前页
	private int rows;// 总记录数
	private String roleName;
	private String ids;
	private String authIds;
	private Long roleId;

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public String getAuthIds() {
		return authIds;
	}

	public void setAuthIds(String authIds) {
		this.authIds = authIds;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getIds() {
		return ids;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	// 注入roleService
	public void setRoleService(IRoleService roleService) {
		this.roleService = roleService;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	// modelDriven驱动模型注入
	public Role getModel() {
		return role;
	}

	// 跳转页设置
	public String role() {
		return "role_view";
	}

	// 查询role列表
	public List<Role> hlist() throws Exception {
		System.out.println("page" + page + " rows" + rows);

		// 分页查询获取
		List<Role> rlist = roleService.findAll(roleName, new PageBean(page,
				rows));
		// 查询总记录
		Long total = this.roleService.getCount(roleName);
		System.out.println(total);
		// 使用setExcludes过滤不需要转换的属性
		// 转化成json代码
		JsonConfig config = new JsonConfig();
		config.setJsonPropertyFilter(new PropertyFilter() {
			public boolean apply(Object arg0, String arg1, Object arg2) {
				if (arg1.equals("users") || arg1.equals("privileges")
						|| arg1.equals("createTime")
						|| arg1.equals("updateTime")) {
					return true;
				} else {
					return false;
				}
			}
		});
		JSONArray arrays = JSONArray.fromObject(rlist, config);
		JSONObject result = new JSONObject();
		result.put("rows", arrays);
		result.put("total", total);
		System.out.println("JSONObject:" + result.get("rows"));
		ResponseUtil.write(ServletActionContext.getResponse(), result);
		return null;
	}

	// 保存角色
	public String save() throws Exception {
		// 获取角色
		System.out.println("role" + this.role);
		// 这个地方其实是保存或者更新数据
		roleService.save(role);
		int result = 1;
		ResponseUtil.write(ServletActionContext.getResponse(), Integer
				.valueOf(result));
		return null;
	}

	// 删除角色
	public String delete() throws Exception {
		// 获取从前台传过来的ids
		System.out.println("ids" + ids);
		// 拆成数组的形式
		String[] idsStr = ids.split(",");
		int result = 0;
		for (int i = 0; i < idsStr.length; i++) {
			// 判断该角色下是否有用户
			if (roleService.findUserById(Long.parseLong(idsStr[i])) == true) {
				// 有用户
				result = 2;
				break;

			}
			// 没有用户，则可以删除角色
			Role role = this.roleService.findById(Long.parseLong(idsStr[i]));
			// 查找到role对象，并且删除
			if (role != null) {
				roleService.delete(Long.parseLong(idsStr[i]));
				result = 1;
			}
		}
		ResponseUtil.write(ServletActionContext.getResponse(), Integer
				.valueOf(result));
		return null;

	}

	// 保存权限
	public String savePriv() throws Exception {
		System.out.println("进入保存权限 " + roleId);
		String authIdsStr[] = authIds.split(",");
		Role role = roleService.findById(roleId);
		Set<Privilege> privileges = new HashSet<Privilege>();
		for (int i = 0; i < authIdsStr.length; i++) {
			System.out.println(authIdsStr[i]);
			Privilege auth = privService
					.findById(Long.parseLong(authIdsStr[i]));
			privileges.add(auth);
		}
		role.setPrivileges(privileges);
		roleService.save(role);
		int result = 1;
		ResponseUtil.write(ServletActionContext.getResponse(), result);

		return null;
	}

	/**
	 * 下拉框查询出所有列表
	 */
	public String comboList() throws Exception {
		JSONArray jsonArray = new JSONArray();

		List<Role> rList = roleService.findAll();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "users", "auths", "description",
				"privileges", "createTime", "updateTime", "parent" });
		JSONArray rows = JSONArray.fromObject(rList, jsonConfig);

		jsonArray.addAll(rows);
		ResponseUtil.write(ServletActionContext.getResponse(), jsonArray);

		return null;
	}
}
