package cn.edu.slcupc.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 导航分类实体
 * 
 * @author YR
 * 
 */
public class NavCat implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String name;
	private String remark;
	private Date postTime;
	private Date updateTime;
	private Set<Nav> navs = new HashSet<Nav>();

	

	public NavCat(String remark) {
		super();
		this.remark = remark;
	}

	public NavCat() {
		super();
	}

	public Set<Nav> getNavs() {
		return navs;
	}

	public void setNavs(Set<Nav> navs) {
		this.navs = navs;
	}

	public Date getPostTime() {
		return postTime;
	}

	public void setPostTime(Date postTime) {
		this.postTime = postTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
