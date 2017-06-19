<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<%--将公共的头部分提出  --%>
		<%@ include file="/WEB-INF/index/header.jspf"%>
		<!--
       	作者：offline
       	时间：2017-05-11
       	描述：轮播项目
                -->
		<div class="" style="max-width: 1920px; max-height: 600px;background:url('${pageContext.request.contextPath }/index/imgs/')">
			<div id="myCarousel" class="carousel">
				<ol class="carousel-indicators" style="margin-left: -25%;">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>

					<li data-target="#myCarousel" data-slide-to="1"></li>

					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<!-- 轮播（Carousel）项目 -->
				<div class="carousel-inner" style="width: 100%;">
					<s:iterator value="#session.carouselList" status='st' var="carouse">
						<s:if test="#st.index<3">
							<s:if test="#st.First">
								<div class="item active">
							</s:if>
							<s:else>
								<div class="item ">
							</s:else>
							<a
								href="${pageContext.request.contextPath }/qiantai/home_news.action?id=${carouse.id }"
								style="text-decoration: none;" onclick=;> <img class="img-responsive center-block"
									src="${carouse.picture}"
									style="width: 80%; z-index: 1; size: 40;max-height: 400px "  />
								<div class="carousel-caption">
									${carouse.title}
								</div> </a>
				</div>
				</s:if>
				</s:iterator>

			</div>
			<!-- 轮播（Carousel）导航 -->
			<a href="#myCarousel" data-slide="prev" class="carousel-control left">
			</a>
			<a href="#myCarousel" data-slide="next"
				class="carousel-control right"> </a>
		</div>
		</div>
		<!--
    	作者：offline
    	时间：2017-05-11
    	描述：第一部分 ：新闻类
    -->
		<div class="section">
			<div class="container">
				<div class="about-box triggerAnimation" data-animate="fadeInUp">
					<div class="row"
						style="background: #EDEDED; padding: 15px 0 15px; margin-top: 20px;">
						<!--
                            	作者：offline
                            	时间：2017-05-11
                            	描述：新闻中心部分
                            -->
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
							<h3 id="bx-pager-5">
								<a style="text-decoration: none;" class="yr_tit"
									data-slide-index="0" href="#" onclick="return false;">新闻中心</a>
								<span style="float: right; font-size: 13px; margin-top: 8px;"><a
									style="text-decoration: none;"
									href="${pageContext.request.contextPath }/qiantai/home_newsList.action?erName='新闻中心'"
									style="color: #BEBEBE;">更多</a> </span>
							</h3>
							<ul class="yr_ul">
								<li>
									<s:iterator  value="#newsZX" var="newvar" status="stu">
											<s:if test="#stu.index<2">
											<div class="feature-content-s" style="padding: 0px 0px;">
														<div class="date">
															<span class="day">Title</span>
															<br />
															<span class="month">Date</span>
														</div>
														<div style="margin-left: 60px;">
															<h3>
																<a href="${pageContext.request.contextPath }/qiantai/home_news.action?id=${newvar.id }" >${newvar.title }</a>
															</h3>
															<p>
															<br>
																时间: ${newvar.postTime }
																
															</p>
														</div>
												</div>
											</s:if>
									</s:iterator>
								</li>
							</ul>
						</div>
						<!--
                            	作者：offline
                            	时间：2017-05-11
                            	描述：通知公告部分
                            -->
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
							<h3 style="">
								<a style="text-decoration: none;" class="yr_tit"
									href="javascript:void(0);">通知公告 </a>
								<span style="float: right; font-size: 13px; margin-top: 8px;"><a
									style="text-decoration: none;"
									href="${pageContext.request.contextPath }/qiantai/home_newsList.action?erName='通知公告'"
									style="color: #BEBEBE;">更多</a> </span>

							</h3>
							<ul class="infolist2 yr_ul">
							
							<%--用于替换通知公告的列表 --%>
								<s:iterator  value="#newsGG" var="newvar" status="stu">
											<s:if test="#stu.index<4">
												<li>
													<span> ${newvar.postTime } </span>
													<div style="word-break: break-all;">
														<div style="margin-left: 100px;">
															<a href="${pageContext.request.contextPath }/qiantai/home_news.action?id=${newvar.id }" >${newvar.title }</a> &nbsp;
														</div>
													</div>
												</li>
											</s:if>
									</s:iterator>
							</ul>

						</div>
					</div>
				</div>
			</div>
		</div>

		<!--
        	作者：offline
        	时间：2017-05-11
        	描述：学院风采 <div class="about-box triggerAnimation" data-animate="fadeInUp">
        -->

		<div class="" style="margin-bottom: 20px;">
			<div class="container triggerAnimation" style="margin-top: 10px;"
				data-animate="fadeInUp">
				<div class="row" style="background: #EDEDED; padding-bottom: 10px;">
					<h3 class="">
						<a style="text-decoration: none;" class="yr_tit" href="javascript:void(0);"
							>学院风采 </a>
					</h3>
				</div>
				
				
				<div class="row" style="background: #EDEDED;">
				<%--用于替换学院风采 --%>   
				<s:iterator  value="#newsFC" var="fcvar" status="stu">
						<s:if test="#stu.index<4">
							<div class="col-sm-6 col-md-3" style="">
								<div class="thumbnail" style="background: #89cff0;">
									<a href="${pageContext.request.contextPath }/qiantai/home_news.action?id=${fcvar.id }"  style="text-decoration:none;">
									<img class="lazy"
										src="${pageContext.request.contextPath}/<s:property value="#fcvar.picture"/>"
										width="180px" alt="风采">
									<div class="caption img-responsive" style="">
										<h3>
											${fcvar.title }
										</h3>
										
									</div>
									</a>
								</div>
							</div>
						</s:if>
				</s:iterator>
				</div>

			</div>
		</div>

		<div class="confoot" style="">
			<div class="container" style="">
				<div class="row" style="margin-top: 15px; background: #EDEDED;">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
							<div class="hot-post" onclick=;>
								<img class="yr_img img-responsive" alt=""  style="height: 120px;"
									src="${pageContext.request.contextPath}/index/friendly_link/中国石油大学.png">
								<div class="hot-content2" style="background: #EDEDED;">
									<a   href="http://www.upc.edu.cn/" style=" text-decoration:none; " target="_blank">
									<h3>
										中国石油大学（华东）
									</h3>
									<p>
									中国石油大学（华东）是教育部直属全国重点大学，是国家“211工程”和“985工程优势学科创新平台”高校，是高水平行业特色大学优质资源共享联盟成员高校。
									</p>
									</a>
								</div>
							</div>
						</div>

						<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
							<div class="hot-post" onclick=;>
								<img class="yr_img img-responsive" alt=""  style="height: 120px;"
									src="${pageContext.request.contextPath}/index/friendly_link/中国大学生在线.png">
								<div class="hot-content2" style="background: #EDEDED;">
									<a href="http://www.univs.cn/" style=" text-decoration:none; " target="_blank">
									<h3>
										中国大学生在线
									</h3>
									<p>
									“中国大学生在线”网站是由国家教育部主导并推动，全国大学生参与，全国高校依照“共创、共建、共管、共用、共享”的原则。
									</p>
									</a>
								</div>
							</div>
						</div>

						<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">

							<div class="hot-post" onclick=;>
								<img class="yr_img img-responsive" alt=""    style="height: 120px;"
									src="${pageContext.request.contextPath}/index/friendly_link/山东省教育厅.png">
								<div class="hot-content2" style="background: #EDEDED;">
									<a href="http://www.sdedu.gov.cn/" style=" text-decoration:none; " target="_blank">
									<h3>
										山东省教育厅
									</h3>
									<p>
									山东省教育厅是主管山东省教育事业的政府组成部门，与中共山东省委高等学校工作委员会合署。
									</p>
									</a>
								</div>
							</div>
						</div>

						<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">

							<div class="hot-post" onclick=;>
								<img class="yr_img img-responsive" alt=""   style="height: 120px; "
									src="${pageContext.request.contextPath}/index/friendly_link/胜利油田.png">
								<div class="hot-content2" style="background: #EDEDED;">
									<a href="http://slof.sinopec.com/slof/" style=" text-decoration:none; " target="_blank">
									<h3 >
										胜利油田
									</h3>
									<p>
										胜利油田是胜利石油管理局、胜利油田分公司和胜利石油工程公司的统称，包括勘探开发、石油工程、公用工程、矿区服务四个业务板块。
									</p>
									</a>
								</div>
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>

		
	<%--将公共的尾部分提出  --%>	
<%@ include file="/WEB-INF/index/footer.jspf"%>