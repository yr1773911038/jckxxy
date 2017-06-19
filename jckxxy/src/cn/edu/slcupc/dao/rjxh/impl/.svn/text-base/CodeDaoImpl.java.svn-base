package cn.edu.slcupc.dao.rjxh.impl;

import java.util.List;

import cn.edu.slcupc.dao.base.BaseDaoImpl;
import cn.edu.slcupc.dao.rjxh.ICodeDao;
import cn.edu.slcupc.pojo.rjxh.CodeWorks;

public class CodeDaoImpl extends BaseDaoImpl<CodeWorks> implements ICodeDao {
	public CodeWorks findById(Long id) {
		List<CodeWorks> findlist = find("from CodeWorks where id=" + id);
		if (findlist.size()>0) {
			return  findlist.get(0);
		}
		
		return null;
	}

	public Long getCount() {
		String hql = "select count(code.name) from CodeWorks code order by id";
		Long count = (Long) getSession().createQuery(hql).uniqueResult();
		return count;
	}

}
