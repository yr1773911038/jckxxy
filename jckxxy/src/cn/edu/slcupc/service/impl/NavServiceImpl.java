package cn.edu.slcupc.service.impl;

import java.util.LinkedList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.edu.slcupc.dao.INavDao;
import cn.edu.slcupc.pojo.Nav;
import cn.edu.slcupc.pojo.PageBean;
import cn.edu.slcupc.service.INavService;
import cn.edu.slcupc.util.StringUtil;

@Transactional
public class NavServiceImpl implements INavService {

	private INavDao navDao;

	public void setNavDao(INavDao navDao) {
		this.navDao = navDao;
	}

	/**
	 * 查询满足条件的的总条数
	 */
	public Long getCount(Long grade, String searchName) {
		String hql = "select count(*) from Nav ";
		List<Object> param = new LinkedList<Object>();

		if (grade == 1) {
			hql = hql + " and pid is null ";
		} else {
			hql = hql + " and pid is not null ";
		}
		if (StringUtil.isNotEmpty(searchName)) {
			if (grade == 1) {
				hql = hql + "and name like ? ";
			} else {
				hql = hql + "and pid like ? ";
			}
			param.add("%" + searchName + "%");
		}
		return navDao.count(hql.replaceFirst("and", "where"), param);
	}

	/**
	 * 查询标题的列表
	 */
	public List<Nav> findList(Long grade, String searchName, PageBean pageBean) {
		String hql = " from Nav ";
		List<Object> param = new LinkedList<Object>();
		if (grade == 1) {
			hql = hql + " and pid is null ";
		} else {
			hql = hql + " and pid is not null ";
		}
		if (StringUtil.isNotEmpty(searchName)) {
			if (grade == 1) {
				hql = hql + "and name like ? ";
			} else {
				hql = hql + "and pid like ? ";
			}
			param.add("%" + searchName + "%");
		}
		if (pageBean != null) {
			return navDao.find(hql.replaceFirst("and", "where"), param,
					pageBean);
		}
		return navDao.find(hql.replaceFirst("and", "where"), param);
	}

	/**
	 * 查询
	 */
	public List<Nav> find(Long grade, Long pid) {
		String hql = " from Nav ";
		if (grade == 1) {
			// 表示是1级标题
			hql = hql + " where pid is null ";
		} else {
			// 表示是2级标题
			if (pid != 0) {
				hql = hql + " where pid =" + pid;
			}
		}
		return navDao.find(hql);
	}

	/**
	 * 保存方法
	 */
	public void save(Nav nav) {
		navDao.save(nav);

	}

	/**
	 * 查询通过id
	 */
	public Nav findById(Long id) {
		return navDao.findById(id);
	}

	/**
	 * 查询一节标题下是否有子标题
	 */
	public boolean findByParId(Long parseLong) {
		String hql = " from Nav nav where  nav.parent.id = " + parseLong;
		List<Nav> sList = this.navDao.find(hql);
		if (sList.size() > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 删除方法
	 */
	public void delete(Nav nav) {
		this.navDao.delete(nav.getId());

	}

	public List<Nav> find(Long grade) {
		String hql = " from Nav where pid is not null  ";
		return navDao.find(hql);
	}

	public List<Nav> findAllYi() {
		String hql = " from Nav where pid is  null  ";
		return navDao.find(hql);
	}

	public List<Nav> findAllEr() {
		String hql = " from Nav where pid is not null  ";
		return navDao.find(hql);
	}
	// 得到与自己有相同父对象的二级导航
	public List<Nav> findAllByPId(Long id) {
		String hql = " from Nav where pid =  " + id;
		return navDao.find(hql);
	}

	public Nav findByName(String erName) {
		String hql = " from Nav where name =  " + erName;
		List<Nav> findlist = navDao.find(hql);
		if (findlist.size()>0) {
			return  findlist.get(0);
		}
		return null;
	}


}
