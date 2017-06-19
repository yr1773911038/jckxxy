package cn.edu.slcupc.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import cn.edu.slcupc.pojo.Nav;
import cn.edu.slcupc.pojo.News;
import cn.edu.slcupc.pojo.PageBean;
import cn.edu.slcupc.service.INavService;
import cn.edu.slcupc.service.INewsService;
import cn.edu.slcupc.util.PageUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private int page;
	private int rows;
	private String pageCode;
	private Long navId;// 二级标题的id
	private Long id;// 新闻id
	private String erName;// 二级导航的名称

	// 注入一级导航的Service
	private INavService navService;
	// 注入新闻的Service
	private INewsService newsService;

	public void setNavService(INavService navService) {
		this.navService = navService;
	}

	public void setNewsService(INewsService newsService) {
		this.newsService = newsService;
	}

	public String getErName() {
		return erName;
	}

	public void setErName(String erName) {
		this.erName = erName;
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

	public String getPageCode() {
		return pageCode;
	}

	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}

	public Long getNavId() {
		return navId;
	}

	public void setNavId(Long navId) {
		this.navId = navId;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String index() {
		// 查询所有的一级分类.
		List<Nav> yinavList = navService.findAllYi();

		// 查询所有的二级分类.
		// List<Nav> ernavList = navService.findAllEr();
		// 遍历所有的一级分类
		List<Map<String, List<Nav>>> allNavList = new ArrayList<Map<String, List<Nav>>>();
		for (Nav nav : yinavList) {
			Map<String, List<Nav>> map = new HashMap<String, List<Nav>>();
			ArrayList<Nav> list = (ArrayList<Nav>) navService.findAllByPId(nav
					.getId());
			map.put(nav.getName(), list);
			allNavList.add(map);
		}
		ActionContext.getContext().getSession().put("allNavList", allNavList);

		// 查询所有的新闻.作为轮播处的展示
		List<News> carouselList = newsService.findAll();
		// 存入到Session
		ActionContext.getContext().getSession().put("carouselList",
				carouselList);
		// 查询新闻中心所有的新闻
		List<News> newsZX = newsService.findZXAll();
		// 存入到Session
		ActionContext.getContext().put("newsZX", newsZX);
		// 查询通知公告所有的新闻
		List<News> newsGG = newsService.findTZAll();
		// 存入到Session
		ActionContext.getContext().put("newsGG", newsGG);
		// 查询学员风采
		List<News> newsFC = newsService.findFCAll();
		// 存入到Session
		ActionContext.getContext().put("newsFC", newsFC);

		System.out.println("进入前台index");
		return "index";
	}

	public String list() {
		System.out.println("进入前台list");
		return "list";
	}

	public String page() {
		System.out.println("进入前台page");
		return "page";
	}

	/**
	 * 查询新闻列表 带分页
	 * 
	 * @return
	 * @throws Exception
	 */
	public String newsList() throws Exception {
		System.out.println("erName " + erName);
		if (this.page == 0) {
			this.page = 1;
		}
		if (this.rows == 0) {
			this.rows = 10;
		}

		// 通过二级导航的name查询
		Nav erNav = this.navService.findByName(erName);
		navId = erNav.getId();
		// 得到同一一级导航下的所有二级导航
		List<Nav> erNavList = this.navService.findAllByPId(erNav.getParent()
				.getId());
		ActionContext.getContext().put("erNav", erNav);

		ActionContext.getContext().put("erNavList", erNavList);
		StringBuffer param = new StringBuffer();
		if (navId.longValue() != 0L) {
			param.append("navId=" + this.navId);
		}
		News news = new News();
		news.setParent(erNav);
		Long total = this.newsService.getCount(news);
		List<News> nList = this.newsService.findList(news, new PageBean(
				this.page, this.rows));
		this.pageCode = PageUtil.genPagination(ServletActionContext
				.getRequest().getContextPath()
				+ "/" + "qiantai/home_newsList.action", total.longValue(),
				this.page, this.rows, param.toString());
		ActionContext.getContext().put("pageCode", this.pageCode);
		ActionContext.getContext().put("nList", nList);
		return "list";
	}

	/**
	 * 跳转到每一个news的详情页面
	 * 
	 * @return
	 * @throws Exception
	 */
	public String news() throws Exception {
		// 此时是跳转到列表页面所指的具体新闻页
		News oneNews = this.newsService.findById(this.id);
		Nav erNameBean = oneNews.getParent();
		System.out.println("erNameBean" + erNameBean);
		ActionContext.getContext().getValueStack().set("oneNews", oneNews);
		ActionContext.getContext().getValueStack()
				.set("erNameBean", erNameBean);
		return "page";
	}

	/**
	 * 跳转到每一个二级菜单详情页面
	 * 
	 * @return
	 * @throws Exception
	 */
	public String view() throws Exception {
		// 静态的无需改变的 wxgb
		News oneNews = this.newsService.findByName(erName);
		Nav erNameBean = this.navService.findByName(erName);
		ActionContext.getContext().getValueStack().set("oneNews", oneNews);
		ActionContext.getContext().getValueStack()
				.set("erNameBean", erNameBean);
		return "page";
	}
}
