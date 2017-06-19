package cn.edu.slcupc.dao.impl;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.hibernate.Query;

import cn.edu.slcupc.dao.IUserDao;
import cn.edu.slcupc.dao.base.BaseDaoImpl;
import cn.edu.slcupc.pojo.User;

/**
 * 用户管理模块Dao层
 * 
 * @author xuhao
 * 
 */
@SuppressWarnings("all")
public class UserDaoImpl extends BaseDaoImpl<User> implements IUserDao {

	public User findByNumAndPassword(String num, String password) {
		
		Query query = getSession().createQuery(
				"from User where num=? and password=?").setString(0, num)
				.setString(1, password);
		if (query == null || query.list().size() < 1) {
			return null;
		} else {
			List<User> users = query.list();
			if (users.size() > 0) {

				return users.get(0);
			}
			return null;
		}

	}

	public void editPassword(User user) {
		System.out.println("修改密码");
		update(user);
	}
}
