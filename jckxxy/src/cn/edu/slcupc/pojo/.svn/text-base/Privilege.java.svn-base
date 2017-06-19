package cn.edu.slcupc.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 权限实体类
 * 
 * @author YR
 * 
 */
public class Privilege implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String text;
	private String url;
	private Privilege parent;
	private Set<Privilege> children = new HashSet<Privilege>();

	// privilege 与 role 是多对多的关系
	private Set<Role> roles = new HashSet<Role>();

	private Date createTime;// 创建时间
	private Date updateTime;// 更新时间
	private Boolean checked;//是否选中
	public void setChecked(Boolean checked) {
		this.checked = checked;
	}
	
	@Override
	public String toString() {
		return "Privilege [createTime=" + createTime + ", id=" + id + ", text="
				+ text + ", roles=" + roles + ", updateTime=" + updateTime
				+ ", url=" + url + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	
	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Boolean getChecked() {
		return checked;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Privilege getParent() {
		return parent;
	}

	public void setParent(Privilege parent) {
		this.parent = parent;
	}

	public Set<Privilege> getChildren() {
		return children;
	}

	public void setChildren(Set<Privilege> children) {
		this.children = children;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
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
