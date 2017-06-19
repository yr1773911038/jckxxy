package cn.edu.slcupc.service.impl;

import java.util.LinkedList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.edu.slcupc.dao.INewsDao;
import cn.edu.slcupc.pojo.News;
import cn.edu.slcupc.pojo.PageBean;
import cn.edu.slcupc.service.INewsService;
import cn.edu.slcupc.util.StringUtil;

/**
 * @author YR 添加事务注解
 */
@Transactional
public class NewsServiceImpl implements INewsService {
	private INewsDao newsDao;

	// 注入Dao层
	public void setNewsDao(INewsDao newsDao) {
		this.newsDao = newsDao;
	}

	@Deprecated
	public boolean findBySmallNavId(long id) {
		String hql = " from News where smallNavId = " + id;
		List<News> nList = this.newsDao.find(hql);
		if (nList.size() > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 进行删除的方法
	 */
	public void delete(News paramNews) {
		this.newsDao.delete(paramNews.getId());

	}

	/**
	 * 查找通过id得到 一条新闻对象
	 */
	public News findById(long paramLong) {
		return this.newsDao.findById(paramLong);
	}

	/**
	 * 添加新的新闻 进行保存方法
	 */
	public void save(News paramNews) {
		this.newsDao.merge(paramNews);

	}

	/**
	 * 后台进行新闻编辑的时候列表显示
	 */
	public List<News> findList(String newsTitle, Long erTitle, PageBean pageBean) {
		String hql = " from News xx ";
		List<Object> param = new LinkedList<Object>();
		if (StringUtil.isNotEmpty(newsTitle)) {
			hql = hql + " and title like ? ";
			param.add("%" + newsTitle + "%");
		}
		if (erTitle != null) {
			hql = hql + " and   xx.parent.id = ?     ";
			param.add(erTitle);
		}
		hql = hql + " ORDER BY id DESC ";
		hql = hql.replaceFirst("and", "where");
		if (pageBean != null) {
			return this.newsDao.find(hql, param, pageBean);

		}
		return this.newsDao.find(hql.replaceFirst("and", "where"), param);

	}

	/**
	 * easyUI 查询分页总页数
	 */
	public Long getCount(String newsTitle, Long erTitle) {
		String hql = " select count(*) from News news";
		List<Object> param = new LinkedList<Object>();
		if (StringUtil.isNotEmpty(newsTitle)) {
			hql = hql + " and title like ? ";
			param.add("%" + newsTitle + "%");
		}
		if (erTitle != null) {
			hql = hql + " and news.parent.id = ? ";
			param.add(erTitle);
		}
		return this.newsDao.count(hql.replaceFirst("and", "where"), param);
	}

	/**
	 * 查询出所有的新闻按加入的顺序逆序排序 并且必须有图片
	 */
	public List<News> findAll() {
		String hql = " from News news where news.picture !='' and news.parent.name in('新闻中心','通知公告')  order by news.id desc";
		return this.newsDao.find(hql);

	}
	/**
	 * 为了避免传参数 写成两个方法
	 * 
	 * @see 查询通知公告有的新闻按加入的顺序逆序排序
	 */
	
	public List<News> findTZAll() {
		String hql = " from News news where news.parent.name ='通知公告'  order by news.id desc";
		return this.newsDao.find(hql);

	}

	/**
	 * 为了避免传参数 写成两个方法
	 * 
	 * @see 查询新闻中心所有的新闻按加入的顺序逆序排序
	 */
	public List<News> findZXAll() {
		String hql = " from News news where news.parent.name ='新闻中心'  order by news.id desc";
		return this.newsDao.find(hql);

	}
	/**
	 * 为了避免传参数 写成两个方法
	 * 
	 * @see 查询学员风采
	 */
	public List<News> findFCAll() {
		String hql = " from News news where news.parent.name ='学院风采'  order by news.id desc";
		return this.newsDao.find(hql);
		
	}

	public List<News> findByIdAll(String catName, PageBean pageBean) {
		String hql = " from News news   order by news.id desc";
		List<Object> param = new LinkedList<Object>();
		if (StringUtil.isNotEmpty(catName)) {
			hql = hql + " and news.parent.name =? ";
			param.add("%" + catName + "%");
		}
		hql = hql + " order by news.id desc ";
		if (pageBean != null) {
			return this.newsDao.find(hql.replaceFirst("and", "where"), param,
					pageBean);

		}
		return this.newsDao.find(hql.replaceFirst("and", "where"), param);

	}

	/**
	 * 新闻列表页 __统计总条数
	 */
	public Long getCount(News news) {
		String hql = " select count(*) from News news ";
		List<Object> param = new LinkedList<Object>();
		if (news != null) {
			if ((news.getParent() != null)
					&& (news.getParent().getId() != null)) {
				hql = hql + " and news.parent.id = ?";
				param.add(news.getParent().getId());
			}
		}
		return this.newsDao.count(hql.replaceFirst("and", "where"), param);
	}

	/**
	 * 新闻列表页
	 */
	public List<News> findList(News news, PageBean pageBean) {
		String hql = " from News news ";
		List<Object> param = new LinkedList<Object>();
		if (news != null) {
			if ((news.getParent() != null)
					&& (news.getParent().getId() != null)) {
				hql = hql + " and news.parent.id = ?";
				param.add(news.getParent().getId());
			}
		}
		hql = hql + " ORDER BY id DESC ";
		if (pageBean != null) {
			return this.newsDao.find(hql.replaceFirst("and", "where"), param,
					pageBean);
		}
		return this.newsDao.find(hql.replaceFirst("and", "where"), param);
	}

	public List<News> getByNavId(Long navId) {
		String hql = " from News news where news.parent.id = " + navId + "order by id desc";
		List<News> nList = this.newsDao.find(hql);
		return nList;
	}

	public News findByName(String erName) {
		String hql = " from News news where news.parent.name = " + erName +" order by id desc  ";
		List<News> findlist = this.newsDao.find(hql);
		
		
		if (findlist.size()>0) {
			return  findlist.get(0);
		}
		
		return null;
	}
	

}
