package cn.edu.slcupc.service;

import java.util.List;

import cn.edu.slcupc.pojo.PageBean;
import cn.edu.slcupc.pojo.Role;

public interface IRoleService {
	void save(Role role);

	void delete(Long id);

	void update(Role entity);

	List<Role> findAll();

	List<Role> findAll(String roleName, PageBean pageBean);

	Long getCount(String roleName);
	
	Role findById(long id);
	boolean findUserById(Long id);


}
