package cn.edu.slcupc.interceptor;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import cn.edu.slcupc.pojo.Privilege;
import cn.edu.slcupc.pojo.Role;
import cn.edu.slcupc.pojo.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class CheckAuthInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		User user1 = (User) ActionContext.getContext().getSession().get(
				"curUser");
		Collection<String> authUrls = (Collection<String>) ActionContext
				.getContext().getApplication().get("allAuthUrls");
		String namespace = invocation.getProxy().getNamespace();
		// System.out.println("namespace"+namespace);
		String actionName = invocation.getProxy().getActionName();
		// System.out.println("actionName:"+actionName);
		String authUrl = namespace + actionName + ".action";
		// System.out.println("authUrl:"+authUrl);
		// 如果未登录,如果不是带权限的部分，那么就允许访问
		if (user1 == null) {
			// 如果是登录则放行
			if ("/user_login.action".equals(authUrl)
					|| "/user_loginView.action".equals(authUrl)) {
				return invocation.invoke();
			} else {
				return "login_view";
			}

		}

		// 如果已登 录，就判断权限
		else {
			// 不是权限范围内的，允许
			if (this.isCommon(authUrl, authUrls)) {
				return invocation.invoke();
			}
			if (this.hasAuthByUrl(user1, authUrl)) {
				// 如果有权限，就放行
				return invocation.invoke();
			} else {
				// 如果没有权限，就转到提示页面
				return "noPrivilegeError";
			}

		}
	}

	public boolean isCommon(String authUrl, Collection<String> authUrls) {
		for (String url : authUrls) {
			if (authUrl.equalsIgnoreCase(url)) {
				return false;
			}
		}
		return true;
	}

	private boolean hasAuthByUrl(User user, String authUrl) {
		// 根据用户，查找相应的角色
		Set<Role> roles = user.getRoles();
		List<Role> role = new ArrayList<Role>();
		for (Iterator iterator = roles.iterator(); iterator.hasNext();) {
			Role r = (Role) iterator.next();
			role.add(r);
		}
		System.out.println("角色：" + role.get(0));
		if ("超级管理员".equals(role.get(0).getName())) {
			return true;
		}
		// 去掉后面的参数
		int pos = authUrl.indexOf("?");
		if (pos > -1) {
			authUrl = authUrl.substring(0, pos);
		}
		// 如果不是超级管理员，则应该得到相应的权限
		Set<Privilege> privileges = role.get(0).getPrivileges();
		System.out.println(privileges.size());
		// List<Privilege> prii=new ArrayList<Privilege>();

		if (privileges.size() != 0) {
			// 有权限

			for (Privilege priv : privileges) {
				// prii.add(priv);
				// System.out.println("权限："+priv);
				if (authUrl.equals(priv.getUrl())) {
					return true;
				}

			}

		}

		return false;

	}

}