package cn.edu.slcupc.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 导航菜单实体类
 * 
 * @author YR
 * 
 */
public class Nav implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String name;
	private String path; // 0-1：（一级-二级-...）
	private NavCat navcat;// 导航菜单分属导航类别
	//导航菜单与新闻之间是一对多的关系
	private Date createTime;
	private Date updateTime;
	private Set<News> news = new HashSet<News>();
	private Nav parent; // 上一级菜单
	
	

	public Set<News> getNews() {
		return news;
	}

	public void setNews(Set<News> news) {
		this.news = news;
	}

	public Nav() {
		super();
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

	public Nav getParent() {
		return parent;
	}

	public void setParent(Nav parent) {
		this.parent = parent;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public NavCat getNavcat() {
		return navcat;
	}

	public void setNavcat(NavCat navcat) {
		this.navcat = navcat;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

}
