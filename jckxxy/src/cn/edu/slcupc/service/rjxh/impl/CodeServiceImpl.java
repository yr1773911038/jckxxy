package cn.edu.slcupc.service.rjxh.impl;

import java.util.LinkedList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.edu.slcupc.dao.rjxh.ICodeDao;
import cn.edu.slcupc.pojo.PageBean;
import cn.edu.slcupc.pojo.rjxh.CodeWorks;
import cn.edu.slcupc.service.rjxh.ICodeService;
import cn.edu.slcupc.util.StringUtil;

@Transactional
public class CodeServiceImpl implements ICodeService {
	// 注入codeDao
	private ICodeDao codeDao;

	public void setCodeDao(ICodeDao codeDao) {
		this.codeDao = codeDao;
	}

	public List<CodeWorks> findList(String workName, PageBean pageBean) {
		List<Object> param = new LinkedList<Object>();
		String hql = " from CodeWorks ";
		if (workName != null) {
			if (!"".equals(workName.trim())) {
				hql = hql + " and name like ? ";
				param.add("%" + workName.trim() + "%");
			}
		}
		if (pageBean != null) {
			return codeDao.find(hql.replaceFirst("and", "where"), param,
					pageBean);
		}
		return codeDao.find(hql.replaceFirst("and", "where"), param);

	}

	public Long getCount(String workName) {
		List<Object> param = new LinkedList<Object>();
		String hql = " select count(*) from CodeWorks ";
		if (StringUtil.isNotEmpty(workName)) {
			hql = hql + " and name like ? ";
			param.add("%" + workName.trim() + "%");
		}

		return codeDao.count(hql.replaceFirst("and", "where"), param);

	}

	public CodeWorks findById(Long id) {

		return codeDao.findById(id);
	}

	public void save(CodeWorks codework) {

		codeDao.save(codework);
	}

	public void delete(CodeWorks codeWorks) {
		codeDao.delete(codeWorks.getId());
	}

	public int getCount() {
		
		return codeDao.getCount().intValue();
	}
}
