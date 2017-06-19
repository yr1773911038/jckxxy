package cn.edu.slcupc.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import cn.edu.slcupc.pojo.PageBean;
import cn.edu.slcupc.pojo.rjxh.Associator;
import cn.edu.slcupc.pojo.rjxh.CodeWorks;
import cn.edu.slcupc.service.rjxh.IAssService;
import cn.edu.slcupc.service.rjxh.ICodeService;
import cn.edu.slcupc.util.PageUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RjxhHomeAction extends ActionSupport implements
		ServletRequestAware {
	private static final long serialVersionUID = 1L;
	private IAssService assService;
	private ICodeService codeService;
	private int curpage;// 3的当前页
	private int cur;// 4的当前页
	private int codecur;// 5的当前页
	private HttpServletRequest request;

	public void setCur(int cur) {
		this.cur = cur;
	}

	public void setCodecur(int codecur) {
		this.codecur = codecur;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	private String pageCode;

	private String pageCode2;

	public String getPageCode2() {
		return pageCode2;
	}

	public void setPageCode2(String pageCode2) {
		this.pageCode2 = pageCode2;
	}

	public String getPageCode() {
		return pageCode;
	}

	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}

	public void setCurpage(int curpage) {
		this.curpage = curpage;
	}

	public void setAssService(IAssService assService) {
		this.assService = assService;
	}

	public void setCodeService(ICodeService codeService) {
		this.codeService = codeService;
	}

	public String index() {
		System.out.println("当前页：" + curpage + "rows");
		// 分页实现查找作品，用户
		// 总的历届人数
		int fl = 0;
		int everyPage = 10;
		// 获取前台的
		int totalCount = assService.getCount(fl);
		int currentPage = (curpage >= 1) ? curpage : 1;
		// System.out.println("totalCount:"+totalCount+"currentPage:"+currentPage);
		List<Associator> nList = assService.findList(fl, new PageBean(
				currentPage, everyPage));
		pageCode = PageUtil.genPaginationNoParam(request.getContextPath()
				+ "/qiantai/rjxhHome_index.action", totalCount, curpage,
				everyPage, "#3", "curpage");

		// 获取在校人员
		int totalP = assService.getCount(1);
		pageCode2 = PageUtil.genPaginationNoParam(request.getContextPath()
				+ "/qiantai/rjxhHome_index.action", totalP, cur, everyPage,
				"#4", "cur");
		List<Associator> newList = assService.findList(1, new PageBean(
				cur, everyPage));
		// 获取作品展示
		int totalList = codeService.getCount();
		String pageCode3 = PageUtil.genPaginationNoParam(request
				.getContextPath()
				+ "/qiantai/rjxhHome_index.action", totalList, codecur,
				everyPage, "#4", "codecur");
		List<CodeWorks> codeList = codeService.findList(null, new PageBean(
				codecur, everyPage));

		ActionContext.getContext().put("pageCode3", pageCode3);
		ActionContext.getContext().put("codeList", codeList);
		ActionContext.getContext().put("pageCode2", pageCode2);
		ActionContext.getContext().put("newList", newList);
		ActionContext.getContext().put("pageCode", pageCode);
		ActionContext.getContext().put("nList", nList);

		return "rjxh";
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
