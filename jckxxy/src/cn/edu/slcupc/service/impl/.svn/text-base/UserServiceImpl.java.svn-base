package cn.edu.slcupc.service.impl;

import java.util.LinkedList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.edu.slcupc.dao.IUserDao;
import cn.edu.slcupc.pojo.PageBean;
import cn.edu.slcupc.pojo.User;
import cn.edu.slcupc.service.IUserService;
import cn.edu.slcupc.util.StringUtil;

@Transactional
public class UserServiceImpl implements IUserService {

	private IUserDao userDao;

	// 注入userDao
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}

	public User findByNumAndPassword(String num, String password) {
		return userDao.findByNumAndPassword(num, password);
	}

	/**
	 * 修改密码
	 */
	public void editPassword(User user) {
		userDao.editPassword(user);
	}

	/**
	 * 通过roleId来查询是否有相应的用户
	 */
	public boolean findByRoleId(Long roleId) {
		String hql = "from User where roleId = " + roleId;
		List<User> uList = userDao.find(hql);
		if (uList.size() > 0) {
			return true;
		}
		return false;
	}

	public User findById(Long id) {
		return userDao.getById(id);
	}

	public void save(User user) {
		userDao.save(user);

	}

	public List<User> findList(String userName, PageBean pageBean) {
		List<Object> param = new LinkedList<Object>();
		String hql = " from User ";
		if (userName != null) {
			if (!"".equals(userName.trim())) {
				hql = hql + " and name like ? ";
				param.add("%" + userName.trim() + "%");
			}
		}
		if (pageBean != null) {
			return userDao.find(hql.replaceFirst("and", "where"), param,
					pageBean);
		} else {
			return null;
		}
	}

	public Long getCount(String userName) {
		List<Object> param = new LinkedList<Object>();
		String hql = " select count(*) from User ";
		if (StringUtil.isNotEmpty(userName)) {
			hql = hql + " and name like ? ";
			param.add("%" + userName.trim() + "%");
		}


		return userDao.count(hql.replaceFirst("and", "where"), param);
	}

	public void delete(User user) {
		userDao.delete(user.getId());

	}

}
