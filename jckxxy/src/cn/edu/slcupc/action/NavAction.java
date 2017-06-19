package cn.edu.slcupc.action;

import java.util.HashMap;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.struts2.ServletActionContext;

import cn.edu.slcupc.pojo.Nav;
import cn.edu.slcupc.pojo.PageBean;
import cn.edu.slcupc.service.INavService;
import cn.edu.slcupc.util.ResponseUtil;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 导航管理action
 * 
 * @author YR
 * 
 */
@SuppressWarnings("all")
public class NavAction extends ActionSupport implements ModelDriven<Nav> {

	private static final long serialVersionUID = 1L;
	private Nav nav = new Nav();
	private int page;
	private int rows;
	private String ids;// 当根据id删除时封装数据ids
	private INavService navService;
	private String searchName;// 搜索框用的查询字段
	private Long grade;// 一级标题还是二级标题
	private Long pid;

	public void setGrade(Long grade) {
		this.grade = grade;
	}

	public void setPid(Long pid) {
		this.pid = pid;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public INavService getNavService() {
		return navService;
	}

	public void setNavService(INavService navService) {
		this.navService = navService;
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

	public Nav getModel() {
		return nav;
	}

	/**
	 * 一级菜单
	 */
	public String nav() {
		if (grade == 1) {
			return "bigNavview";
		}
		// 二级菜单
		return "smallNavview";
	}

	/**
	 * 显示二级标题的列表信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String hlist() throws Exception {
		List<Nav> sList = this.navService.findList(grade, searchName,
				new PageBean(this.page, this.rows));
		Long total = navService.getCount(grade, searchName);
		UserPropertyFilter filter = new UserPropertyFilter();
		filter.setExcludes(new HashMap<Class<?>, String[]>() {
			{
				put(Nav.class, new String[] { "createTime", "updateTime",
						"navcat", "news" });
			}
		});
		String jsonStr = JSON.toJSONString(sList, filter);
		JSONObject result = new JSONObject();
		result.put("rows", jsonStr);
		result.put("total", total);
		ResponseUtil.write(ServletActionContext.getResponse(), result);

		return null;
	}

	/**
	 * 一级列表下拉值
	 */
	public String comboList() throws Exception {
		System.out.println("grade:" + grade);
		System.out.println("pid" + pid);
		List<Nav> bList = this.navService.find(grade, pid);
		JSONArray jsonArray = new JSONArray();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "createTime", "updateTime",
				"navcat", "news", "parent" });
		JSONArray rows = JSONArray.fromObject(bList, jsonConfig);
		jsonArray.addAll(rows);
		ResponseUtil.write(ServletActionContext.getResponse(), jsonArray);

		return null;
	}

	/**
	 * 二级列表下拉值
	 */
	public String comboList2() throws Exception {
		List<Nav> bList = this.navService.find(grade);
		JSONArray jsonArray = new JSONArray();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "createTime", "updateTime",
				"navcat", "news", "parent" });
		JSONArray rows = JSONArray.fromObject(bList, jsonConfig);
		jsonArray.addAll(rows);
		ResponseUtil.write(ServletActionContext.getResponse(), jsonArray);
		return null;
	}

	/**
	 * 保存方法
	 * 
	 * @return
	 * @throws Exception
	 */
	public String save() throws Exception {
		if (this.nav.getId() == null) {
			this.navService.save(this.nav);
		} else {
			Nav navnew = this.navService.findById(this.nav.getId());
			navnew.setName(this.nav.getName());
			navnew.setPath(this.nav.getPath());
			navnew.setNavcat(this.nav.getNavcat());
			if (grade != 1) {
				navnew.setParent(this.nav.getParent());
			}
			this.navService.save(navnew);
		}
		int result = 1;
		ResponseUtil.write(ServletActionContext.getResponse(), Integer
				.valueOf(result));
		return null;
	}

	/**
	 * 删除方法
	 * 
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception {
		String[] idsStr = this.ids.split(",");
		int result = 0;
		for (int i = 0; i < idsStr.length; i++) {
			if (this.navService.findByParId(Long.parseLong(idsStr[i]))) {
				result = 2;
				break;
			}
			Nav nav = this.navService.findById(Long.parseLong(idsStr[i]));
			this.navService.delete(nav);
			result = 1;
		}

		ResponseUtil.write(ServletActionContext.getResponse(), Integer
				.valueOf(result));
		return null;
	}
}
