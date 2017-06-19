package cn.edu.slcupc.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.edu.slcupc.dao.IRoleDao;
import cn.edu.slcupc.pojo.PageBean;
import cn.edu.slcupc.pojo.Role;
import cn.edu.slcupc.service.IRoleService;

@Transactional
public class RoleServiceImpl implements IRoleService {

	private IRoleDao roleDao;

	// 注入roleDao对象
	public void setRoleDao(IRoleDao roleDao) {
		this.roleDao = roleDao;
	}

	/**
	 * 删除
	 */
	public void delete(Long id) {
		roleDao.delete(id);
	}

	/**
	 * 保存
	 */
	public void save(Role role) {
		roleDao.save(role);
	}

	/**
	 * 更新
	 */
	public void update(Role role) {
		roleDao.update(role);
	}

	public List<Role> findAll() {
		return roleDao.findAll();
	}

	/***
	 * 分页查询全部，或者按照条件查询
	 */
	public List<Role> findAll(String roleName, PageBean pageBean) {
		List<Object> param = new ArrayList<Object>();
		List<Role> list = null;
		String hql = "from Role";
		// 如果前台传来的的角色名称不为空，就添加条件语句
		if ((roleName != null) && (!"".equals(roleName.trim()))) {
			hql = hql + " and name like ?";
			param.add("%" + roleName.trim() + "%");
		}
		// 如果传过来的分页参数不为空
		if (pageBean != null) {
			// 进行分页查询
			list = roleDao.find(hql.replaceFirst("and", "where"), param,
					pageBean);
		}
		for (Iterator<Role> iterator = list.iterator(); iterator.hasNext();) {
			Role role2 = (Role) iterator.next();
			System.out.println(role2);
		}

		return list;
	}

	public Long getCount(String roleName) {
		// 查询总的记录数
		List<Object> param = new LinkedList<Object>();
		String hql = " select count(*) from Role ";
		if ((roleName != null) && (!"".equals(roleName.trim()))) {
			hql = hql + " and name like ?";
			param.add("%" + roleName + "%");
		}
		return roleDao.count(hql.replaceFirst("and", "where"), param);
	}

	// 通过id查找角色
	public Role findById(long id) {
		Role role = (Role) roleDao.getById(Long.valueOf(id));
		System.out.println("查找到role：" + role);
		return role;
	}

	// 根据roleId查找相应的用户

	public boolean findUserById(Long id) {
		return roleDao.findUserById(id);
	}

}
