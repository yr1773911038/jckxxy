package cn.edu.slcupc.service;

import java.util.List;

import cn.edu.slcupc.pojo.News;
import cn.edu.slcupc.pojo.PageBean;

public abstract interface INewsService {
	public abstract boolean findBySmallNavId(long paramLong);

	public abstract void delete(News paramNews);

	public abstract News findById(long paramLong);

	public abstract void save(News paramNews);

	public abstract List<News> findList(String newsTitle, Long erTitle,
			PageBean pageBean);

	public abstract Long getCount(String newsTitle, Long erTitle);

	public abstract List<News> findAll();

	public abstract List<News> findZXAll();

	public abstract List<News> findTZAll();

	public abstract List<News> findByIdAll(String catName, PageBean pageBean);

	public abstract Long getCount(News news);

	public abstract List<News> findList(News news, PageBean pageBean);

	public abstract List<News> getByNavId(Long navId);

	public abstract List<News> findFCAll();

	public abstract News findByName(String erName);
}
