package cn.edu.slcupc.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/***
 * role:角色
 * 
 * @author YR
 * 
 */
public class Role implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String name;
	private String description;// 描述
	// role与user是 多对多的关系
	private Set<User> users = new HashSet<User>();
	// role 与privilege 是多对多关系
	private Set<Privilege> privileges = new HashSet<Privilege>();

	private Date createTime;// 创建时间
	private Date updateTime;// 更新时间

	public Set<Privilege> getPrivileges() {
		return privileges;
	}

	public void setPrivileges(Set<Privilege> privileges) {
		this.privileges = privileges;
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

	/*public Role getParent() {
		return parent;
	}

	public void setParent(Role parent) {
		this.parent = parent;
	}*/

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
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
		return "Role [ description=" + description + ", id=" + id + ", name="
				+ name + "]";
	}

}
