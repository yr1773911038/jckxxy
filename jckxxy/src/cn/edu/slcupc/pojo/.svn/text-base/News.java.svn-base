package cn.edu.slcupc.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 文章类
 * 
 * @author YR
 * 
 */
public class News implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String title;
	private String content;
	private String picture;
	private User author;
	private Nav parent;
	private Date postTime;
	private Date updateTime;

	
	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public User getAuthor() {
		return author;
	}

	public void setAuthor(User author) {
		this.author = author;
	}

	public Nav getParent() {
		return parent;
	}

	public void setParent(Nav parent) {
		this.parent = parent;
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

	@Override
	public String toString() {
		/*return "News [author=" + author + ", content=" + content + ", id=" + id
				+ ", parent=" + parent + ", picture=" + picture + ", postTime="
				+ postTime + ", title=" + title + ", updateTime=" + updateTime
				+ "]";*/
		return "parent=" + parent +", content=" + content + ", id=" + id;
	}

}
