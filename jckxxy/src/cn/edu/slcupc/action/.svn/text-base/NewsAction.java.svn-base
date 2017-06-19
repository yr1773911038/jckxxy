package cn.edu.slcupc.action;

import java.io.File;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.edu.slcupc.pojo.Nav;
import cn.edu.slcupc.pojo.News;
import cn.edu.slcupc.pojo.PageBean;
import cn.edu.slcupc.pojo.User;
import cn.edu.slcupc.service.INavService;
import cn.edu.slcupc.service.INewsService;
import cn.edu.slcupc.util.DateUtil;
import cn.edu.slcupc.util.ResponseUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class NewsAction extends ActionSupport implements ModelDriven<News> {

	private static final long serialVersionUID = 1L;
	private INewsService newsService;
	private INavService navService;
	private int page;
	private int rows;
	private String ids;// 批量删除选项的id值
	private String newsTitle;// 界面新闻标题搜索框的值
	private Long erTitle;// 界面二级标题搜索框的值
	private File slide;// 幻灯片存放的位置
	private String slideFileName;// 幻灯片名字
	private String slideContentType;// 上传文件的类型

	private News news = new News();

	public String getSlideFileName() {
		return slideFileName;
	}

	public void setNavService(INavService navService) {
		this.navService = navService;
	}

	public void setSlideFileName(String slideFileName) {
		this.slideFileName = slideFileName;
	}

	public String getSlideContentType() {
		return slideContentType;
	}

	public void setSlideContentType(String slideContentType) {
		this.slideContentType = slideContentType;
	}

	public Long getErTitle() {
		return erTitle;
	}

	public String getSlideName() {
		return slideFileName;
	}

	public void setSlideName(String slideName) {
		this.slideFileName = slideName;
	}

	public File getSlide() {
		return slide;
	}

	public void setSlide(File slide) {
		this.slide = slide;
	}

	public String getNewsTitle() {
		return newsTitle;
	}

	public void setErTitle(Long erTitle) {
		this.erTitle = erTitle;
	}

	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public void setNewsService(INewsService newsService) {
		this.newsService = newsService;
	}

	public void setNews(News news) {
		this.news = news;
	}

	public News getModel() {
		return news;
	}

	public String news() {
		return "news_view";
	}

	// 显示列表
	public String hlist() throws Exception {

		System.out.println("调用  hist方法-------------------------");
		System.out.println("newsTitle   " + newsTitle);
		System.out.println("erTitle     " + erTitle);
		List<News> newsList = this.newsService.findList(newsTitle, erTitle,
				new PageBean(this.page, this.rows));
		Long total = this.newsService.getCount(newsTitle, erTitle);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class,
				new DateJsonValueProcessor("yyyy-MM-dd"));
		jsonConfig.registerJsonValueProcessor(User.class,
				new ObjectJsonValueProcessor(new String[] { "id", "name" },
						User.class));
		jsonConfig.registerJsonValueProcessor(Nav.class,
				new ObjectJsonValueProcessor(new String[] { "id", "name" },
						Nav.class));
		JSONArray rows = JSONArray.fromObject(newsList, jsonConfig);
		JSONObject result = new JSONObject();

		result.put("rows", rows);
		result.put("total", total);
		ResponseUtil.write(ServletActionContext.getResponse(), result);

		return null;
	}

	/**
	 * 保存方法
	 */
	public String save() throws Exception {
		System.out
				.println("进入保存方法                                                          =========");
		if (this.news.getId() == null) {
			if (this.slide != null) {
				String imageName = DateUtil.getCurrentDateStr();
				String realPath = ServletActionContext.getServletContext()
						.getRealPath("/admin/images/news");

				String imageFile = "/"
						+ imageName
						+ "."
						+ this.slideFileName.split("\\.")[(this.slideFileName
								.split("\\.").length - 1)];
				File saveFile = new File(realPath, imageFile);
				FileUtils.copyFile(this.slide, saveFile);

				this.news.setPicture("/admin/images/news" + imageFile);
			} else {
				this.news.setPicture("");
			}
			User author = (User) ActionContext.getContext().getSession().get(
					"curUser");
			if (author == null) {
				return "error";
			}
			Nav parent = this.navService
					.findById(this.news.getParent().getId());
			this.news.setParent(parent);
			this.news.setAuthor(author);
			this.news.setPostTime(new Date());
			this.news.setUpdateTime(new Date());
			this.newsService.save(this.news);
		} else {
			News n = this.newsService.findById(this.news.getId().longValue());
			if (this.slide != null) {
				String imageName = DateUtil.getCurrentDateStr();
				String realPath = ServletActionContext.getServletContext()
						.getRealPath("/admin/images/news");
				String imageFile = "/"
						+ imageName
						+ "."
						+ this.slideFileName.split("\\.")[(this.slideFileName
								.split("\\.").length - 1)];
				File saveFile = new File(realPath, imageFile);
				FileUtils.copyFile(this.slide, saveFile);

				n.setPicture("admin/images/news" + imageFile);
			}
			n.setTitle(this.news.getTitle());
			n.setContent(this.news.getContent());
			n.setParent(this.news.getParent());
			this.news.setUpdateTime(new Date());
			this.newsService.save(n);
		}
		int result = 1;
		ResponseUtil.write(ServletActionContext.getResponse(), Integer
				.valueOf(result));
		return null;
	}

	/**
	 * 删除方法
	 */
	public String delete() throws Exception {
		String[] idsStr = this.ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			News news = this.newsService.findById(Long.parseLong(idsStr[i]));
			this.newsService.delete(news);
		}
		int result = 1;
		ResponseUtil.write(ServletActionContext.getResponse(), Integer
				.valueOf(result));

		return null;
	}
}
