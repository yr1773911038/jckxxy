<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<link href="${pageContext.request.contextPath}/index/css/inner.css"
			rel="stylesheet" />
		<%@ include file="/WEB-INF/index/header.jspf"%>
		<!--
        	作者：1773911038@qq.com
        	时间：2017-05-12
        	描述：这是正文列表部分
        -->
		<div class="container " style="margin-top: 30px;">
			<div class="row detailContent" style="">
				<div class="column_1 col-md-3">
					<!--
                        	作者：1773911038@qq.com
                        	时间：2017-05-12
                        	描述：相关部分列表
                        -->
					<div class="leftNav">
						<ul>
							<%-- 替换列表页左侧列表显示--%>
							<s:iterator value="#erNavList" var="var" status="stu">
								<s:if test="#var.name==#erNav.name">
									<li class="current" target="_blank" style="cursor: pointer;">
								</s:if>
								<s:else>
									<li class="ncurrent" target="_blank" style="cursor: pointer;">
								</s:else>
								<a
									href="${pageContext.request.contextPath }/qiantai/home_newsList.action?erName='${var.name }'"
									class="">${var.name }</a>
								</li>
							</s:iterator>
						</ul>
					</div>

				</div>
				<div class="col-md-9" style="padding: 5px 10px 0px 30px;">
					<div class="pull-right">
						<s:iterator value="#erNavList" var="var" status="stu">
							<s:if test="#var.name==#erNav.name">
								当前位置:首页/${var.parent.name }/${var.name}
								</s:if>
						</s:iterator>
					</div>
					<hr width="100%" />
					<div class="lists" style="clear: both;">
						<ul class="yr_ul_list">
							<%-- 替换主列表--%>
							<s:iterator value="#nList" var="news">
								<li>
									<a
										href="${pageContext.request.contextPath }/qiantai/home_news.action?id=${news.id }"
										style="text-decoration: none;">${news.title }</a>
									<p>
										${news.postTime }
									</p>
								</li>
							</s:iterator>
						</ul>

					</div>

					<!--
                        	作者：1773911038@qq.com
                        	时间：2017-05-12
                        	描述：分页部分
                        -->
					<div class="divPage">
						<ul class="pagination">
							${pageCode }
						</ul>
					</div>

				</div>

			</div>

		</div>

		<%--将公共的尾部分提出  --%>
		<%@ include file="/WEB-INF/index/footer.jspf"%>