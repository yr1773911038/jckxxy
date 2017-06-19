package cn.edu.slcupc.service;

import java.util.List;

import cn.edu.slcupc.pojo.Nav;
import cn.edu.slcupc.pojo.PageBean;

public interface INavService {

	Long getCount(Long type, String searchName);

	List<Nav> findList(Long type, String searchName, PageBean pageBean);

	List<Nav> find(Long grade,Long pid);

	void save(Nav nav);

	Nav findById(Long id);

	boolean findByParId(Long parseLong);

	void delete(Nav nav);

	List<Nav> find(Long grade);


	List<Nav> findAllYi();

	List<Nav> findAllEr();

	List<Nav> findAllByPId(Long id);

	Nav findByName(String erName);


}
