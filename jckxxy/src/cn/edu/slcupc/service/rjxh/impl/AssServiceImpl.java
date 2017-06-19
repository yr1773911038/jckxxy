package cn.edu.slcupc.service.rjxh.impl;

import java.util.LinkedList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.edu.slcupc.dao.rjxh.IAssDao;
import cn.edu.slcupc.pojo.PageBean;
import cn.edu.slcupc.pojo.rjxh.Associator;
import cn.edu.slcupc.service.rjxh.IAssService;
import cn.edu.slcupc.util.StringUtil;

@Transactional
public class AssServiceImpl implements IAssService {
	// 注入AssDao
	private IAssDao assDao;

	public IAssDao getAssDao() {
		return assDao;
	}

	public void setAssDao(IAssDao assDao) {
		this.assDao = assDao;
	}

	public void save(Associator associator) {

		assDao.save(associator);
	}

	public List<Associator> getAll() {
		System.out.println("查询所有");
		List<Associator> all = assDao.findAll();
		return all;
	}

	// 根据分页信息，及名称查找
	public List<Associator> findList(String userName, PageBean pageBean) {
		List<Object> param = new LinkedList<Object>();
		String hql = " from Associator ";
		if (userName != null) {
			if (!"".equals(userName.trim())) {
				hql = hql + " and name like ? ";
				param.add("%" + userName.trim() + "%");
			}
		}
		if (pageBean != null) {
			return assDao.find(hql.replaceFirst("and", "where"), param,
					pageBean);
		} else {
			return null;
		}
	}

	public Long getCount(String userName) {
		List<Object> param = new LinkedList<Object>();
		String hql = " select count(*) from Associator ";
		if (StringUtil.isNotEmpty(userName)) {
			hql = hql + " and name like ? ";
			param.add("%" + userName.trim() + "%");
		}

		return assDao.count(hql.replaceFirst("and", "where"), param);
	}

	public Associator findById(Long id) {
		return assDao.findById(id);
	}

	public void delete(Associator associator) {
		assDao.delete(associator.getId());

	}

	public List<Associator> getNew() {
		// 获取当前成员
		List<Associator> findUser = assDao.findNew();
		return findUser;
	}

	public List<Associator> getOld() {
		// 获取历届成员
		List<Associator> findUser = assDao.findOld();

		return findUser;
	}

	// 得到历届总数
	public int getCount(int fl) {

		return assDao.getCount(fl).intValue();
	}

	// 查找部分:得到往届或者当前
	public List<Associator> findList(int flag, PageBean pageBean) {
		return assDao.findList(flag, pageBean);

	}

}
