package cn.edu.slcupc.action;

import java.util.HashMap;
import java.util.List;

import net.sf.json.JSONObject;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.struts2.ServletActionContext;

import cn.edu.slcupc.pojo.PageBean;
import cn.edu.slcupc.pojo.Role;
import cn.edu.slcupc.pojo.User;
import cn.edu.slcupc.service.IRoleService;
import cn.edu.slcupc.service.IUserService;
import cn.edu.slcupc.util.ResponseUtil;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("all")
public class UserAction extends ActionSupport implements ModelDriven<User> {

	private static final long serialVersionUID = 1L;
	// 调用userService
	private IUserService userService;
	private IRoleService roleService;
	private User user = new User();
	private String newPassword;
	private int page;
	private String userName;
	private Long roleId;

	public void setRoleService(IRoleService roleService) {
		this.roleService = roleService;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	private int rows;
	private String ids;
	private Long smallNavId;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public Long getSmallNavId() {
		return smallNavId;
	}

	public void setSmallNavId(Long smallNavId) {
		this.smallNavId = smallNavId;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public User getModel() {
		return user;
	}

	public String loginView() {
		return "login_view";
	}

	public String user() {
		return "user";
	}

	/**
	 * 登录
	 * 
	 * @return
	 */
	public String login() {
		// 获取输入的用户名，密码 user
		if (user.getNum() != null) {

			User curUser = userService.findByNumAndPassword(user.getNum(),
					DigestUtils.md5Hex(this.user.getPassword()));
			if (curUser != null) {
				// 将用户信息保存在session
				ActionContext.getContext().getSession().put("curUser", curUser);
				return "admin_index";// 登陆成功返回首页
			} else {

				addFieldError("login", "用户名或密码不正确！");
				return "login_fail";
			}
		} else {
			return "login_view";
		}
	}

	public String editPassword() throws Exception {
		int result = 0;
		User findUser = userService.findByNumAndPassword(user.getNum(), user
				.getPassword());
		if (findUser == null) {
			result = 2;
		} else {
			result = 1;
			// 修改密码
			findUser.setPassword(newPassword);
			// 重新设置密码
			userService.editPassword(findUser);
			// 返回当前修改信息
			ResponseUtil.write(ServletActionContext.getResponse(), Integer
					.valueOf(result));
		}
		return null;
	}

	/**
	 * 退出系统
	 * 
	 * @return
	 * @throws Exception
	 */
	public String logout() throws Exception {
		ActionContext.getContext().getSession().remove("curUser");
		return "logout";
	}

	/**
	 * 保存数据||修改数据
	 */
	public String save() throws Exception {
		if (user.getId() == null) {
			String md5Digest = DigestUtils.md5Hex(user.getPassword());
			user.setPassword(md5Digest);
			// 通过id查找role
			Role role = roleService.findById(roleId);
			user.getRoles().add(role);
			userService.save(user);
		} else {
			User u = userService.findById(user.getId());
			u.setNum(user.getNum());

			// 通过id查找role
			Role role = roleService.findById(roleId);
			u.getRoles().add(role);
			u.setName(user.getName());
			if (user.getPassword().length() != 32) {
				String md5Digest = DigestUtils.md5Hex(user.getPassword());
				u.setPassword(md5Digest);
			}

			userService.save(u);
		}

		int result = 1;
		ResponseUtil.write(ServletActionContext.getResponse(), result);
		return null;
	}

	/**
	 * 查询用户列表
	 */
	public String hlist() throws Exception {
		/**
		 * 分页查询获取用户列表
		 */

		System.out.println("进入用户列表模块------------------------------");
		List<User> uList = userService.findList(userName, new PageBean(page,
				rows));
		Long total = userService.getCount(userName);
		// 设置过滤内容
		UserPropertyFilter filter = new UserPropertyFilter();
		filter.setExcludes(new HashMap<Class<?>, String[]>() {
			{
				put(User.class, new String[] { "news", "createTime",
						"updateTime" });
				put(Role.class, new String[] { "parent", "users", "privileges",
						"updateTime", "createTime" });
			}
		});
		String jsonStr = JSON.toJSONString(uList, filter);
		System.out.println("用户集合json" + jsonStr);
		JSONObject result = new JSONObject();
		result.put("rows", jsonStr);
		result.put("total", total);
		System.out.println(result.get("rows"));
		ResponseUtil.write(ServletActionContext.getResponse(), result);
		return null;
	}

	/**
	 * 删除用户
	 */
	public String delete() throws Exception {
		String idsStr[] = ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			User user = userService.findById(Long.parseLong(idsStr[i]));
			userService.delete(user);
		}

		int result = 1;
		ResponseUtil.write(ServletActionContext.getResponse(), result);
		return null;
	}
}
