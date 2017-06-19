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
		<div class="" style="max-width: 1920px; max-height: 800px;">
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
								href="${pageContext.request.contextPath}/news_detail?newsid=<s:property value="#carouse.id"/>"
								style="text-decoration: none;" onclick=;> <img
									src="${carouse.picture}"
									style="width: 100%; z-index: 1; size: 40" />
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
									<div class="feature-content-s" style="padding: 0px 0px;">
										<div class="date">
											<span class="day">Fri</span>
											<br />
											<span class="month">May.12</span>
										</div>
										<div style="margin-left: 60px;">
											<h3>
												<a href="#" onclick=;>教学名师讲坛</a>
											</h3>
											<p>
												时间: 05月12日 下午07点00分
												<br>
												地点: 科学会堂一楼报告厅&nbsp;
											</p>
										</div>
									</div>

									<div class="feature-content-s" style="padding: 0px 0px;">
										<div class="date">
											<span class="day">Wed</span>
											<br />
											<span class="month">May.10</span>
										</div>
										<div style="margin-left: 60px;">
											<h3>
												<a href="#" onclick=;>第一百二十九期“华大论坛”</a>
											</h3>
											<p>
												时间: 05月10日 下午04点00分
												<br>
												地点: 研究生院406学术报告厅&nbsp;
											</p>
										</div>
									</div>
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
								<span style="float: right; font-size: 12px; margin-top: 8px;"><a
									style="text-decoration: none;" href="#" onclick=;style="color: #BEBEBE;">更多</a>
								</span>

							</h3>
							<ul class="infolist2 yr_ul">
								<li>
									<span> 2017-05-10 </span>
									<div style="word-break: break-all;">
										<div style="margin-left: 100px;">
											<a href="#;" onclick=;>关于我校教职工子弟孙辈就读一附中初中部报名工作安排的通知</a>

											&nbsp;

										</div>
									</div>
								</li>

								<li>
									<span> 2017-02-15 </span>
									<div style="word-break: break-all;">
										<div style="margin-left: 100px;">
											<a href="#;" onclick=;>关于做好2017年人才招聘工作的通知</a> &nbsp;
										</div>
									</div>
								</li>

								<li>
									<span> 2017-05-09 </span>
									<div style="word-break: break-all;">
										<div style="margin-left: 100px;">
											<a href="#;" onclick=;>关于举办第三期学生党支部书记培训班的通知</a>
										</div>
									</div>
								</li>

								<li>
									<span> 2017-05-04 </span>
									<div style="word-break: break-all;">
										<div style="margin-left: 100px;">
											<a href="#;" onclick=;>会议通知</a>
										</div>
									</div>
								</li>

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
						<a style="text-decoration: none;" class="yr_tit" href="#;"
							onclick=;>学院风采 </a>
					</h3>
				</div>
				<div class="row" style="background: #EDEDED;">
					<div class="col-sm-6 col-md-3" style="">
						<div class="thumbnail" style="background: #89cff0;">
							<img class="lazy"
								src="${pageContext.request.contextPath}/index/imgs/xyfc1.jpg"
								width="180px" alt="风采">
							<div class="caption img-responsive" style="">
								<h3>
									风采风采风采风采风采风采风采风采
								</h3>
								<p>
									风采风采风采风采风采风采风采风采风采风采 风采风采风采风采风采风采风采风采风采风采 风采风采风采风采风采风采
								</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-3">
						<div class="thumbnail" style="background: #89cff0;">
							<img class="lazy img-responsive"
								src="${pageContext.request.contextPath}/index/imgs/xyfc1.jpg"
								width="180px" alt="风采">
							<div class="caption">
								<h3>
									风采风采风采风采风采风采风采风采
								</h3>
								<p>
									风采风采风采风采风采风采风采风采风采风采 风采风采风采风采风采风采风采风采风采风采 风采风采风采风采风采风采
								</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-3">
						<div class="thumbnail" style="background: #89cff0;">
							<img class="lazy img-responsive"
								src="${pageContext.request.contextPath}/index/imgs/xyfc1.jpg"
								width="180px" alt="风采">
							<div class="caption">
								<h3>
									风采风采风采风采风采风采风采风采
								</h3>
								<p>
									风采风采风采风采风采风采风采风采风采风采 风采风采风采风采风采风采风采风采风采风采 风采风采风采风采风采风采
								</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-3">
						<div class="thumbnail" style="background: #89cff0;">
							<img class="lazy img-responsive"
								src="${pageContext.request.contextPath}/index/imgs/xyfc1.jpg"
								width="180px" alt="风采">
							<div class="caption">
								<h3>
									风采风采风采风采风采风采风采风采
								</h3>
								<p>
									风采风采风采风采风采风采风采风采风采风采 风采风采风采风采风采风采风采风采风采风采 风采风采风采风采风采风采
								</p>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>

		<div class="confoot" style="">
			<div class="container" style="">
				<div class="row" style="margin-top: 15px; background: #EDEDED;">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
							<div class="hot-post" onclick=;>
								<img class="yr_img img-responsive" alt=""
									src="${pageContext.request.contextPath}/index/imgs/20162931321a12f1-395a-44a0-9208-4de247575b28.gif">
								<div class="hot-content2" style="background: #EDEDED;">
									<h3>
										华中师范大学“两学一做”专题教育网
									</h3>
									<p>
										<p>
											华中师范大学积极开展&ldquo;两学一做&rdquo;专题教育。
										</p>
									</p>
								</div>
							</div>
						</div>

						<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
							<div class="hot-post" onclick=;>
								<img class="yr_img img-responsive" alt=""
									src="${pageContext.request.contextPath}/index/imgs/20162931321a12f1-395a-44a0-9208-4de247575b28.gif">
								<div class="hot-content2" style="background: #EDEDED;">
									<h3>
										学习贯彻全国高校思想政治工作会议精神
									</h3>
									<p></p>
								</div>
							</div>
						</div>

						<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">

							<div class="hot-post" onclick=;>
								<img class="yr_img img-responsive" alt=""
									src="${pageContext.request.contextPath}/index/imgs/20162931321a12f1-395a-44a0-9208-4de247575b28.gif">
								<div class="hot-content2" style="background: #EDEDED;">
									<h3>
										华师故事专题网
									</h3>
									<p>
										<p>
											共叙桂子情 同筑华师梦
										</p>
									</p>
								</div>
							</div>
						</div>

						<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">

							<div class="hot-post" onclick=;>
								<img class="yr_img img-responsive" alt=""
									src="${pageContext.request.contextPath}/index/imgs/20162931321a12f1-395a-44a0-9208-4de247575b28.gif">
								<div class="hot-content2" style="background: #EDEDED;">
									<h3>
										华中师大理论学习网
									</h3>
									<p></p>
								</div>
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>

		<%--将公共的尾部分提出  --%>
		<%@ include file="/WEB-INF/index/footer.jspf"%>