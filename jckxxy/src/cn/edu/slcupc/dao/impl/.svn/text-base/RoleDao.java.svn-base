package cn.edu.slcupc.dao.impl;

import java.util.List;
import java.util.Set;

import cn.edu.slcupc.dao.IRoleDao;
import cn.edu.slcupc.dao.base.BaseDaoImpl;
import cn.edu.slcupc.pojo.Role;
import cn.edu.slcupc.pojo.User;

/**
 * 角色dao
 * 
 * @author YR
 * 
 */
public class RoleDao extends BaseDaoImpl<Role> implements IRoleDao {
	@SuppressWarnings("unchecked")
	public Boolean findUserById(Long id) {
		String hql = "from Role where id=?";
		List<Role> list = getSession().createQuery(hql).setParameter(0, id)
				.list();
		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				// 查出user
				Role role = list.get(i);
				Set<User> users = role.getUsers();
				if (!users.isEmpty() || users.size()!=0) {
					return true;
				}
			}
			//这样的话就是没有
			return false;
		}
		//此处都没有role
		return false;

	}
}
