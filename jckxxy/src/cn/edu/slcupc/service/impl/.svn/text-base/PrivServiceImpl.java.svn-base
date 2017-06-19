package cn.edu.slcupc.service.impl;

import java.util.Collection;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.edu.slcupc.dao.IPrivDao;
import cn.edu.slcupc.pojo.Privilege;
import cn.edu.slcupc.service.IPrivService;

@Transactional
public class PrivServiceImpl implements IPrivService{
	private IPrivDao privDao;
	public void setPrivDao(IPrivDao privDao) {
		this.privDao = privDao;
	}
	
	public List<Privilege> findTop() {
		String hql = "from Privilege where pid = null order by id ";
		List<Privilege> list = privDao.find(hql);
		return list;
	}
	public Privilege findById(long id) {
		return privDao.getById(id);
	}

	public void save(Privilege privilege) {
		privDao.save(privilege);
	}
	public void delete(Long id){
		
		privDao.delete(id);
		
	}
	public Collection<String> getAllAuthUrls(){
		String hql = "SELECT DISTINCT a.url from Privilege a WHERE a.url IS NOT NULL";
		return privDao.findAll(hql);
	}

}
