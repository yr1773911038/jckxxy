package cn.edu.slcupc.service.rjxh;

import java.util.List;

import cn.edu.slcupc.pojo.PageBean;
import cn.edu.slcupc.pojo.rjxh.Associator;

public interface IAssService {
	void save(Associator associator);
	List<Associator> getAll();
	List<Associator> findList(String userName, PageBean pageBean);
	Long getCount(String userName);
	Associator findById(Long id);
	void delete(Associator associator);
	List<Associator> getOld();
	List<Associator> getNew();
	int getCount(int fl);
	List<Associator> findList(int fl, PageBean pageBean);
}
