package cn.edu.slcupc.dao.impl;

import cn.edu.slcupc.dao.INewsDao;
import cn.edu.slcupc.dao.base.BaseDaoImpl;
import cn.edu.slcupc.pojo.News;

public class NewsDaoImpl extends BaseDaoImpl<News> implements INewsDao {

	public News findById(long paramLong) {
		return (News) this.getSession()
				.get(News.class, Long.valueOf(paramLong));
	}

}
