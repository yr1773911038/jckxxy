package cn.edu.slcupc.action.rjxh;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import cn.edu.slcupc.action.UserPropertyFilter;
import cn.edu.slcupc.pojo.PageBean;
import cn.edu.slcupc.pojo.rjxh.Associator;
import cn.edu.slcupc.pojo.rjxh.CodeWorks;
import cn.edu.slcupc.service.rjxh.IAssService;
import cn.edu.slcupc.service.rjxh.ICodeService;
import cn.edu.slcupc.util.ResponseUtil;
import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


//软件协会作品展示Action
public class CodeAction extends ActionSupport implements ModelDriven<CodeWorks>{

	private ICodeService codeService;
	private IAssService assService;
	private String workName;
	private int page;
	private int rows;
	private String uids;
	private String ids;
	private String assId;
	public void setAssId(String assId) {
		this.assId = assId;
	}
	public void setUids(String uids) {
		this.uids = uids;
	}
	public void setAssService(IAssService assService) {
		this.assService = assService;
	}
	//private  assId;//角色id
	private CodeWorks codeWorks=new CodeWorks();
	
	public void setIds(String ids) {
		this.ids = ids;
	}
	public void setCodeService(ICodeService codeService) {
		this.codeService = codeService;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public void setWorkName(String workName) {
		this.workName = workName;
	}
	
	public CodeWorks getModel() {
		return codeWorks;
	}
	public String show(){
		return "code_view";
	}

	//展示作品列表的内容
	public String hlist() throws Exception{
		//获取workName 的值
		//System.out.println("page:"+page+"rows:"+rows+"workName:"+workName);
		List<CodeWorks> uList = codeService.findList(workName, new PageBean(
				page, rows));
		Long total = codeService.getCount(workName);
		//System.out.println("total:"+total);
		//设置过滤内容
		/*String jsonStr = JSON.toJSONString(uList);
		JSONObject result = new JSONObject();
		result.put("rows", jsonStr);
		result.put("total", total);
		System.out.println(result);
		ResponseUtil.write(ServletActionContext.getResponse(), result);
		return null;*/
		UserPropertyFilter filter = new UserPropertyFilter();
		filter.setExcludes(new HashMap<Class<?>, String[]>() {
			{
				put(Associator.class, new String[] { "startTime", "summary",
						"torwards","codeWorks" });
			}
		});
		String jsonStr = JSON.toJSONString(uList, filter);
		JSONObject result = new JSONObject();
		result.put("rows", jsonStr);
		result.put("total", total);
		System.out.println(result.get("rows"));
		ResponseUtil.write(ServletActionContext.getResponse(), result);
		return null;
		
		
	}
	//添加作品
	public String save() throws Exception{
		System.out.println("uids"+uids+"::"+assId);
		System.out.println("当前保存的成员信息" + codeWorks);
		String idsStr[] = uids.split(",");
		Set<Associator> set = codeWorks.getUsers();
		//添加成员信息到newSet
		Set<Associator> newset=new HashSet<Associator>(); 
		//无论是新增还是修改，都需要保存成员信息
		if(idsStr!=null){
			//有成员信息
			for (int i = 0; i < idsStr.length; i++) {
				System.out.println(idsStr[i]);
				//根据id查找成员
				Associator asso = assService.findById(Long.parseLong(idsStr[i]));
				newset.add(asso);
			}
			
		}
		if(codeWorks.getId()!=null){
			//此时是修改数据
			CodeWorks codework=codeService.findById(codeWorks.getId());
			codework.setAchieveTime(codeWorks.getAchieveTime());
			codework.setDescription(codeWorks.getDescription());
			codework.setUrl(codeWorks.getUrl());
			codework.setName(codeWorks.getName());
			//修改用户信息
			codework.setUsers(newset);
			codeService.save(codework);
		}else{
			//此处是新增
			codeWorks.setUsers(newset);
			codeService.save(codeWorks);
		}
		int result = 1;
		ResponseUtil.write(ServletActionContext.getResponse(), Integer
				.valueOf(result));
		return null;
	}
	//删除
	public String delete() throws Exception{
		String idsStr[] = ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			CodeWorks codeWorks = codeService.findById(Long.parseLong(idsStr[i]));
			codeService.delete(codeWorks);
		}

		int result = 1;
		ResponseUtil.write(ServletActionContext.getResponse(), result);
		return null;
	}
	
	
}
