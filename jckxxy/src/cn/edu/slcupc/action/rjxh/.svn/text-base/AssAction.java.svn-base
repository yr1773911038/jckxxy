package cn.edu.slcupc.action.rjxh;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.edu.slcupc.action.UserPropertyFilter;
import cn.edu.slcupc.pojo.PageBean;
import cn.edu.slcupc.pojo.rjxh.Associator;
import cn.edu.slcupc.pojo.rjxh.CodeWorks;
import cn.edu.slcupc.pojo.rjxh.Toward;
import cn.edu.slcupc.service.rjxh.IAssService;
import cn.edu.slcupc.util.DateUtil;
import cn.edu.slcupc.util.ResponseUtil;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

//软件协会成员Action
public class AssAction extends ActionSupport implements ModelDriven<Associator> {
	private static final long serialVersionUID = 1L;

	private File picture;
	private String pictureFileName;
	private String pictureContentType;
	private int page;
	private int rows;
	private String userName;
	private IAssService assService;
	private String ids;

	private Associator associator = new Associator();

	
	public String getPictureContentType() {
		return pictureContentType;
	}

	public void setPictureContentType(String pictureContentType) {
		this.pictureContentType = pictureContentType;
	}

	public File getPicture() {
		return picture;
	}

	public void setPicture(File picture) {
		this.picture = picture;
	}

	public String getPictureFileName() {
		return pictureFileName;
	}

	public void setPictureFileName(String pictureFileName) {
		this.pictureFileName = pictureFileName;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public void setAssService(IAssService assService) {
		this.assService = assService;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setAssociator(Associator associator) {
		this.associator = associator;
	}

	public String show() {
		return "ass_view";
	}

	// 展示列表
	public String hlist() throws Exception {
		System.out.println("page" + page + ":rows" + rows + "userName:"
				+ userName);
		List<Associator> uList = assService.findList(userName, new PageBean(
				page, rows));
		Long total = assService.getCount(userName);
		// 设置过滤内容
		UserPropertyFilter filter = new UserPropertyFilter();
		filter.setExcludes(new HashMap<Class<?>, String[]>() {
			{
				put(Associator.class, new String[] { "pic" });
				put(CodeWorks.class, new String[] { "description", "url",
						"users" });
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

	// 修改
	public String save() throws Exception {
		System.out.println("保存图片：" + picture);
		System.out.println("save");
		System.out.println("当前保存的成员信息" + associator);

		if (associator.getId() != null) {
			Associator ass = assService.findById(associator.getId());
			ass.setName(associator.getName());
			ass.setStartTime(associator.getStartTime());
			ass.setEndTime(associator.getEndTime());
			ass.setSummary(associator.getSummary());
			ass.setTorwards(associator.getTorwards());
			assService.save(ass);
			// 此时是修改数据
		} else {
			System.out.println(picture+":"+pictureFileName);
			if (picture != null) {
				String imageName = DateUtil.getCurrentDateStr();
				System.out.println("imageName" + imageName);
				String realPath = ServletActionContext.getServletContext()
						.getRealPath("/images/associate");
				String imageFile = "/"
						+ imageName
						+ "."
						+ pictureFileName.split("\\.")[(this.pictureFileName
								.split("\\.").length - 1)];
				System.out.println("imageFile" + imageFile);
				File saveFile = new File(realPath, imageFile);
				FileUtils.copyFile(this.picture, saveFile);

				this.associator.setPic("images/associate" + imageFile);
			} else {
				this.associator.setPic("");
			}

			assService.save(associator);
		}
		int result = 1;
		ResponseUtil.write(ServletActionContext.getResponse(), Integer
				.valueOf(result));

		return null;
	}

	public String toward() throws Exception {
		Toward a = new Toward(1, "前端");
		Toward b = new Toward(2, "java");
		List<Toward> list = new ArrayList<Toward>();
		list.add(a);
		list.add(b);

		JSONArray jsonArray = new JSONArray();
		JSONArray rows = JSONArray.fromObject(list);
		jsonArray.addAll(rows);
		System.out.println("传过去的值" + rows);
		ResponseUtil.write(ServletActionContext.getResponse(), jsonArray);
		return null;

	}

	// 删除
	public String delete() throws Exception {
		String idsStr[] = ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			Associator associator = assService.findById(Long
					.parseLong(idsStr[i]));
			assService.delete(associator);
		}

		int result = 1;
		ResponseUtil.write(ServletActionContext.getResponse(), result);
		return null;

	}

	public String getUserList() throws Exception {
		System.out.println("进入展示user列表");
		List<Associator> all = assService.getAll();
		/*
		 * for (int i = 0; i < all.size(); i++) {
		 * System.out.println(""+all.get(i)); }
		 */
		JSONArray jsonArray = new JSONArray();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "startTime", "summary",
				"torwards", "codeWorks", "endTime" });
		JSONArray rows = JSONArray.fromObject(all, jsonConfig);
		jsonArray.addAll(rows);
		ResponseUtil.write(ServletActionContext.getResponse(), jsonArray);
		return null;
	}

	public Associator getModel() {
		return associator;
	}

}
