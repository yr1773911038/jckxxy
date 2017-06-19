package cn.edu.slcupc.dao;

import cn.edu.slcupc.dao.base.BaseDao;
import cn.edu.slcupc.pojo.User;

public interface IUserDao extends BaseDao<User> {

	/**
	 * 登录user
	 */
	public User findByNumAndPassword(String num, String password);

	public void editPassword(User user);
}
