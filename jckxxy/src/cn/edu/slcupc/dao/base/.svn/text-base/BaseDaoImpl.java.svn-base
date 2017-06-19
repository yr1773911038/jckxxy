package cn.edu.slcupc.dao.base;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import cn.edu.slcupc.pojo.PageBean;

@SuppressWarnings("unchecked")
public abstract class BaseDaoImpl<T> implements BaseDao<T> {

	private Class<T> clazz;
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public BaseDaoImpl() {
		// 使用反射技术得到T的真实类型
		ParameterizedType pt = (ParameterizedType) this.getClass()
				.getGenericSuperclass(); // 获取当前new的对象的 泛型的父类 类型
		this.clazz = (Class<T>) pt.getActualTypeArguments()[0]; // 获取第一个类型参数的真实类型
	}

	/**
	 * 获取当前可用的Session
	 * 
	 * @return
	 */
	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public void save(T entity) {
		System.out.println("保存");
		System.out.println("session"+getSession());
		getSession().saveOrUpdate(entity);
		System.out.println("保存成功");
	}

	public void update(T entity) {
		getSession().update(entity);
	}

	public void delete(Long id) {
		Object obj = getById(id);
		if (obj != null) {
			getSession().delete(obj);
		}
	}

	public T getById(Long id) {
		return (T) getSession().get(clazz, id);
	}

	public List<T> getByIds(Long[] ids) {
		return getSession().createQuery(//
				"FROM User WHERE id IN (:ids)")//
				.setParameterList("ids", ids)//
				.list();
	}

	public List<T> findAll() {
		return getSession().createQuery(//
				"FROM " + clazz.getSimpleName())//
				.list();
	}

	public List<T> find(String hql, List<Object> param, PageBean pageBean) {
		Query q = getSession().createQuery(hql);
		if ((param != null) && (param.size() > 0)) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.setFirstResult(pageBean.getStart()).setMaxResults(
				pageBean.getRows()).list();
	}

	public List<T> find(String hql) {
		return getSession().createQuery(hql).list();
	}

	public Long getCount(String hql) {
		return (Long) getSession().createQuery(hql).uniqueResult();
	}

	/**
	 * 带参查询
	 * 
	 * @param hql
	 * @param param
	 * @return
	 */
	public Long count(String hql, List<Object> param) {
		Query q = getSession().createQuery(hql);
		if ((param != null) && (param.size() > 0)) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return (Long) q.uniqueResult();
	}

	public List<T> find(String hql, List<Object> param) {
		Query q = getSession().createQuery(hql);
		if ((param != null) && (param.size() > 0)) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.list();
	}

	/**
	 * 合并方法，防止在保存时出现没有id，自动创建
	 * 
	 * @param o
	 */
	public void merge(T o) {
		getSession().merge(o);
	}

}
