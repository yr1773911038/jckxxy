package cn.edu.slcupc.dao.impl;

import java.util.Collection;

import cn.edu.slcupc.dao.IPrivDao;
import cn.edu.slcupc.dao.base.BaseDaoImpl;
import cn.edu.slcupc.pojo.Privilege;

public class PrivDaoImpl extends BaseDaoImpl<Privilege> implements IPrivDao {

	@SuppressWarnings("unchecked")
	public Collection<String> findAll(String hql) {
		return getSession().createQuery(hql).list();
	}

}
