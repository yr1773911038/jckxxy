package cn.edu.slcupc.dao.impl;

import cn.edu.slcupc.dao.INavDao;
import cn.edu.slcupc.dao.base.BaseDaoImpl;
import cn.edu.slcupc.pojo.Nav;

public class NavDaoImpl extends BaseDaoImpl<Nav> implements INavDao {

	public Nav findById(Long id) {
			 
		return   (Nav) getSession().get(Nav.class, id);
	}

}
