package cn.edu.slcupc.dao.rjxh.impl;

import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;

import cn.edu.slcupc.dao.base.BaseDaoImpl;
import cn.edu.slcupc.dao.rjxh.IAssDao;
import cn.edu.slcupc.pojo.PageBean;
import cn.edu.slcupc.pojo.rjxh.Associator;
import cn.edu.slcupc.util.CreateDate;
@SuppressWarnings("all")
public class AssDaoImpl extends BaseDaoImpl<Associator> implements IAssDao {

	public Associator findById(Long id) {
		
		 List<Associator> findlist = find("from Associator where id=" + id);
		if (findlist.size()>0) {
			return  findlist.get(0);
		}
		
		return null;
	}

	public List<Associator> findNew() {
		Date date = CreateDate.createDate();
		String hql = "from Associator where endTime < ?";
		List list = getSession().createQuery(hql).setDate(0, date).list();

		return list;
	}

	public List<Associator> findOld() {
		Date date = CreateDate.createDate();
		String hql = "from Associator where endTime > ?";
		List list = getSession().createQuery(hql).setDate(0, date).list();

		return list;
	}

	public Long getCount(int fl) {
		Date date = CreateDate.createDate();
		String hql = "";
		if (fl == 0) {
			// 得到的是历届的
			hql = "select count(ass.name) from Associator ass where endTime > ?";
		} else if (fl == 1) {
			// 得到的是现在的
			hql = "select count(ass.name) from Associator ass where endTime < ?";

		}
		Long count = (Long) getSession().createQuery(hql).setDate(0, date)
				.uniqueResult();

		return count;

	}

	public List<Associator> findList(int flag, PageBean pageBean) {
		Date date = CreateDate.createDate();

		String hql = "";
		if (flag == 0) {
			// 得到的是历届的
			hql = "from Associator ass where endTime > ?";
		} else if (flag == 1) {
			// 得到的是现在的
			hql = "from Associator ass where endTime < ?";

		}
		Query q = getSession().createQuery(hql).setDate(0, date);
		return q.setFirstResult(pageBean.getStart()).setMaxResults(
				pageBean.getRows()).list();

	}

}
