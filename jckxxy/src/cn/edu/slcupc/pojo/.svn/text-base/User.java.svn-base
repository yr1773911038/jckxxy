package cn.edu.slcupc.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * user:存储用户
 * 
 * @author YR
 * 
 */
public class User implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String name;
	private String password;
	private String num;// 登录工号

	// User与Role之间是多对多关系
	private Set<Role> roles = new HashSet<Role>();
	// user 与 news 之间是 1对多关系
	private Set<News> news = new HashSet<News>();

	private Date createTime;// 创建时间
	private Date updateTime;// 更新时间

	public User() {
		super();
	}

	public Set<News> getNews() {
		return news;
	}

	public void setNews(Set<News> news) {
		this.news = news;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
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

	@Override
	public String toString() {
		return "User [createTime=" + createTime + ", id=" + id + ", name="
				+ name + ", news=" + news + ", num=" + num + ", password="
				+ password + ", roles=" + roles + ", updateTime=" + updateTime
				+ "]";
	}

}
