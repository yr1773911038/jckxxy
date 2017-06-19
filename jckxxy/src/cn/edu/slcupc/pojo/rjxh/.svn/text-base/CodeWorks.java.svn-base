package cn.edu.slcupc.pojo.rjxh;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.alibaba.fastjson.annotation.JSONField;

//代码成品
public class CodeWorks {
	private Long id;
	private String name;// 作品名称
	private String description;// 作品描述
	@JSONField (format="yyyy-MM-dd")  
	private Date achieveTime;// 成品时间
	private String url;// 链接地址
	// 成品与作者之间是多对多的关系
	private Set<Associator> users = new HashSet<Associator>();// 作者
	public Long getId() {
		return id;
	}
	
	@Override
	public String toString() {
		return "CodeWorks [achieveTime="  + ", description="
				+ description + ", id=" + id + ", name=" + name + ", url="
				+ url + ", users=" +users + "]";
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getAchieveTime() {
		return achieveTime;
	}
	public void setAchieveTime(Date achieveTime) {
		this.achieveTime = achieveTime;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Set<Associator> getUsers() {
		return users;
	}
	public void setUsers(Set<Associator> users) {
		this.users = users;
	}

	

}
