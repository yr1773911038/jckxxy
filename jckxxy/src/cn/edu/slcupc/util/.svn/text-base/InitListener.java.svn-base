package cn.edu.slcupc.util;

import java.util.Collection;
import java.util.Iterator;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.edu.slcupc.service.IPrivService;

public class InitListener implements ServletContextListener {
	/**
	 * 软件协会部分
	 */

	public void contextInitialized(ServletContextEvent sce) {
		// 获取容器与相关的Service对象
		ApplicationContext ac = WebApplicationContextUtils
				.getWebApplicationContext(sce.getServletContext());
		IPrivService privService = (IPrivService) ac.getBean("privService");

		// 获取全部权限
		Collection<String> allAuthUrls = privService.getAllAuthUrls();
		sce.getServletContext().setAttribute("allAuthUrls", allAuthUrls);
		for (Iterator iterator = allAuthUrls.iterator(); iterator.hasNext();) {
			String string = (String) iterator.next();
			System.out.println(string);

		}

	}

	public void contextDestroyed(ServletContextEvent arg0) {

	}
}