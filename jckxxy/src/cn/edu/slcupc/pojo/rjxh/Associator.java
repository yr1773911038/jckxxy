package cn.edu.slcupc.pojo.rjxh;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.alibaba.fastjson.annotation.JSONField;

//软件协会成员
public class Associator {
	private Long id;
	private String name;
	@JSONField (format="yyyy-MM-dd")  
	private Date startTime;// 进入软件协会的时间
	@JSONField (format="yyyy-MM-dd")
	private Date endTime;//毕业时间
	private String summary;// 简介
	private Integer torwards;// 学习方向
	private String pic;
	// 成员对应的作品
	
	private Set<CodeWorks> codeWorks = new HashSet<CodeWorks>();
	
	
	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Override
	public String toString() {
		return "Associator [codeWorks=" + codeWorks + ", endTime=" + endTime
				+ ", id=" + id + ", name=" + name + ", startTime=" + startTime
				+ ", summary=" + summary + ", torwards=" + torwards + "]";
	}

	public Integer getTorwards() {
		return torwards;
	}

	public void setTorwards(Integer torwards) {
		this.torwards = torwards;
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
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public Set<CodeWorks> getCodeWorks() {
		return codeWorks;
	}
	public void setCodeWorks(Set<CodeWorks> codeWorks) {
		this.codeWorks = codeWorks;
	}


	

}
