package cn.edu.slcupc.service;

import java.util.List;

import cn.edu.slcupc.pojo.PageBean;
import cn.edu.slcupc.pojo.User;

public interface IUserService {
	public User findByNumAndPassword(String num, String password);

	public void editPassword(User user);
	 boolean findByRoleId(Long roleId);

	 void save(User user);

	 User findById(Long id);

	 List<User> findList(String userName, PageBean pageBean);

	 Long getCount(String userName);

	 void delete(User user);
}
