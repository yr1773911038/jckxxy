<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>中国石油大学胜利学院-软件协会</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link
			href="${pageContext.request.contextPath}/rjxh/templatemo_style.css"
			rel="stylesheet" type="text/css" />
		<script
			src="${pageContext.request.contextPath}/rjxh/js/jquery-1.2.1.pack.js"
			type="text/javascript"></script>
		<script
			src="${pageContext.request.contextPath}/rjxh/js/jquery-easing.1.2.pack.js"
			type="text/javascript"></script>
		<script
			src="${pageContext.request.contextPath}/rjxh/js/jquery-easing-compatibility.1.2.pack.js"
			type="text/javascript"></script>
		<script
			src="${pageContext.request.contextPath}/rjxh/js/coda-slider.1.1.1.pack.js"
			type="text/javascript"></script>
		<!-- Initialize each slider on the page. Each slider must have a unique id -->
		<script type="text/javascript">
	jQuery(window).bind("load", function() {
		jQuery("div#slider1").codaSlider()
		// jQuery("div#slider2").codaSlider()
			// etc, etc. Beware of cross-linking difficulties if using multiple sliders on one page.
		});
</script>
		<style type="text/css">
ul>li {
	float: left;
	list-style: none;
	margin: 10px;
}
</style>

	</head>
	<body>

		<div id="templatemo_wrapper_outer">
			<div id="templatemo_wrapper_inner">

				<div id="templatemo_header">
					<div id="site_title">
						<a href="http://www.cssmoban.com" target="_parent"> <!--<img src="images/templatemo_logo.png" alt="free templates" />-->
							<h1>
								软件协会
							</h1> </a>
					</div>
				</div>
				<!-- end of templatemo_header -->
				<div id="templatemo_content">
					<div class="slider-wrap">
						<div id="slider1" class="csw">
							<div class="panelContainer">

								<!-- 1 -->
								<div class="panel" title="协会简介">
									<div class="wrapper" style="float: left">
										<h3>
											协会简介
										</h3>

										<div class="image_wrapper fl_image">
											<p class="em_text">
												软件协会前身是在王雪冰老师的带领下成立的软件小组，在学院领导批准同意下，更名为软件协会，正式聘请王雪冰老师为软件协会指导老师.
											</p>
										</div>
									</div>

									<div class="wrapper" style="float: left">
										<h3>
											学习理念
										</h3>

										<div class="image_wrapper fl_image">
											<p class="em_text">
												软件协会秉承相互学习的理念，以实践为宗旨，帮助同学熟练掌握所学知识，较早的接触实践项目，积累经验，为以后的就业打基础
											</p>
										</div>

									</div>
									<div class="wrapper" style="float: left">
										<h3>
											发展方向
										</h3>

										<div class="image_wrapper fl_image">
											<p class="em_text">
												web设计 包括前端以及后台 承接各种非商业项目 ACMICPC比赛
											</p>
										</div>

									</div>
								</div>


								<!-- 2 -->
								<div class="panel" title="导师介绍">
									<div class="wrapper" style="float: left">
										<h3>
											导师介绍
										</h3>
										<p>
											王雪冰副教授目前被聘为工信部中国信息化推进联盟“应急容灾专业委员会”专家委员、天津大学工程硕士生校外导师、山东大学东营研究院“信号与信息处理”领域特聘专家、中国石油大学胜利学院软件协会指导专家，在科技创新领域有独到的见解和丰富的经验。


										</p>
									</div>

									<div class="wrapper" style="float: left">
										<h3>
											现成员介绍
										</h3>
										<p>
										</p>
									</div>

								</div>

								<div class="panel" title="往届成员">
									<div class="wrapper" style="float: left">
										<h3>
											往届成员介绍
										</h3>
										<div id="con">
											<ul>
												<c:forEach items="${nList}" var="oldUser">
													<!-- 显示头像 -->

													<li style="margin-left: 20px; margin-right: 20px;">
														<div>
															<img style="width: 100px; height: 100px;" alt=""
																src="${pageContext.request.contextPath}/${oldUser.pic }" />
														</div>
														${oldUser.name}:
														<c:if test="${oldUser.torwards==1}">前端</c:if>
														<c:if test="${oldUser.torwards==2}">java</c:if>
													</li>

												</c:forEach>

											</ul>

										</div>
										<br />
										<br />
										<br />
										<ul style="margin-left: 50px;">
											${pageCode }
										</ul>
									</div>
								</div>

								<!--4 -->
								<div class="panel" title="在校成员">
									<div class="wrapper">
										<h3>
											在校成员
										</h3>
										<div id="con">
											<ul>
												<c:forEach items="${newList}" var="newUser">
													<!-- 显示头像 -->

													<li style="margin-left: 20px; margin-right: 20px;">
														${newUser.name}:
														<c:if test="${newUser.torwards==1}">前端</c:if>
														<c:if test="${newUser.torwards==2}">java</c:if>
													</li>

												</c:forEach>

											</ul>

										</div>
										<br />
										<br />
										<br />
										<ul style="margin-left: 50px;">
											${pageCode2 }
										</ul>

									</div>
								</div>

								<!-- 5 -->
								<div class="panel" title="作品展示">
									<div class="wrapper">
										<h3>
											作品展示
										</h3>
										<div id="con">
											<ul>
												<c:forEach items="${codeList}" var="codeWork">
													<!-- 显示头像 -->

													<li style="margin-left: 20px; margin-right: 20px;">
														<a href="${codeWork.url }">${codeWork.name}</a>
														${codeWork.description}
													</li>

												</c:forEach>

											</ul>

										</div>
										<br />
										<br />
										<br />
										<ul style="margin-left: 50px;">
											${pageCode3 }
										</ul>


									</div>
								</div>


							</div>
							<!-- .panelContainer -->
						</div>
						<!-- #slider1 -->
					</div>
					<!-- .slider-wrap -->

					<p id="cross-links"
						style="width: 0px; height: 0px; font-size: 0; overflow: hidden;">
						Same-page cross-link controls:
						<br />
						<a href="#1" class="cross-link">Page 1</a> |
						<a href="#2" class="cross-link">Page 2</a> |
						<a href="#3" class="cross-link">Page 3</a> |
						<a href="#4" class="cross-link">Page 4</a> |
						<a href="#5" class="cross-link">Page 5</a>
					</p>

					<!-- end of slider -->

				</div>
				<!-- end of templatemo_content -->

				<div id="templatemo_footer">
					<span class="coffee_cup"></span> Copyright © 2048
					<a href="#">颜冉</a>


				</div>
				<!-- end of templatemo_footer -->


			</div>
			<!-- end of templatemo_wrapper_inner -->
		</div>
		<!-- end of templatemo_wrapper_outer -->

	</body>
</html>
