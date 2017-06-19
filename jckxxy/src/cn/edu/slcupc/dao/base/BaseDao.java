package cn.edu.slcupc.dao.base;

import java.util.List;

import cn.edu.slcupc.pojo.PageBean;

public interface BaseDao<T> {

	/**
	 * 保存实体
	 * 
	 * @param entity
	 */
	void save(T entity);

	/**
	 * 删除实体
	 * 
	 * @param id
	 */
	void delete(Long id);

	/**
	 * 更新实体
	 * 
	 * @param entity
	 */
	void update(T entity);

	/**
	 * 按id查询
	 * 
	 * @param id
	 * @return
	 */
	T getById(Long id);

	/**
	 * 按id查询
	 * 
	 * @param ids
	 * @return
	 */
	List<T> getByIds(Long[] ids);

	List<T> find(String hql);

	/**
	 * 查询所有
	 * 
	 * @return
	 */
	List<T> findAll();

	/**
	 * 分页带参查询
	 * 
	 * @param hql
	 * @param param
	 * @param pageBean
	 * @return
	 */

	List<T> find(String hql, List<Object> param, PageBean pageBean);

	/**
	 * 得到总行数
	 * 
	 * @return
	 */
	Long getCount(String hql);

	/**
	 * 带参查询
	 * 
	 * @param hql
	 * @param param
	 * @return
	 */
	Long count(String hql, List<Object> param);

	/**
	 * 根据sql 和条件进行查询
	 * 
	 * @param hql
	 * @param param
	 * @return
	 */
	public List<T> find(String hql, List<Object> param);
}
