<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<title><?php echo ($site_seo_title); ?> <?php echo ($site_name); ?></title>
		<meta name="keywords" content="<?php echo ($site_seo_keywords); ?>" />
		<meta name="description" content="<?php echo ($site_seo_description); ?>">
		<link href="/cmf/themes/demo/Public/css/bootstrap2.css"  rel="stylesheet">	
		<script src="/cmf/themes/demo/Public/js/jquery-2.1.1/jquery.js" type="text/javascript"></script>
		<script src="/cmf/themes/demo/Public/js/bootstrap.min.js" type="text/javascript"></script>
		<style>
			.scene2{
				margin-top:-50px;
				background-image:url("/cmf/themes/demo/Public/images/scene2.png");
				background-size: cover;
			}
			.title1{
				background: transparent url("/cmf/themes/demo/Public/images/2-1.png") repeat-x scroll left top;
			}
			.title1 .name_title {
				background: transparent url("/cmf/themes/demo/Public/images/2-2.png") no-repeat scroll 0% 0%;
			}
			.type li {
				background: transparent url("/cmf/themes/demo/Public/images/jiao.png") no-repeat scroll left center;
			}
			.type1 li {
				padding-left: 15px;
				overflow: hidden;
				background: transparent url("/cmf/themes/demo/Public/images/d1.png") no-repeat scroll left center;
			}
			#btn {
				background: transparent url("/cmf/themes/demo/Public/images/5-1.png") no-repeat scroll left center;
				background-size: 100% 100%;
			}
		</style>				
	</head>
	<body>
		﻿<div class="scene">
	<div class="container">
		<div class="top">
			<div class="row" >
				<div class="top1">
					<a id="a" src="#">设为首页</a><span> | </span><a id="a" src="#">加入收藏</a>
				</div>
			</div>  
		</div>				
		<div class="logo">
			<div class="row">
				<div class="col-sm-6">
					<img src="/cmf/themes/demo/Public/images/zxqyfwzx.png" class="img-responsive" alt="Responsive image"></img>
				</div>
				<div class="col-lg-3 col-md-offset-3">
				<form action="<?php echo leuu('list/index',array('id'=>4,'role'=>'parent'));?>" method="post">
					<div class="input-group">
						<input type="text" class="form-control" name="find" placeholder="Search for...">
						<span class="input-group-btn">
							<input class="btn btn-default" value="搜索" type="submit">
							搜索</input>															
						</span>
					</div>
				</form>
			</div>  
		</div>
	</div>
</div>
		<div class="manu">
	<nav class="navbar navbar-default" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
				data-target="#bs-example-navbar-collapse-1"> 
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
				</button>
				<a class="navbar-brand visible-xs" href="#">菜单</a> 
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<?php
 $effected_id="main-nav"; $filetpl="<a href='\$href' target='\$target' >\$label</a>"; $style="nav navbar-nav"; $showlevel=1; echo sp_get_menu("main",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?>
			</div>
		</div>
	</nav>
</div>

		<div class="scene2">
			<div class="comity" >
				<div class="container">
					<div class="bolder">	
						<div class="box" >
							<div class="row">
								<div class="col-md-4 col-sm-12" id="bolder">
									<?php $home_slides=sp_getslide("slide_top"); ?>
									<div id="myCarousel" class="carousel slide">
									<!-- 轮播（Carousel）指标 -->
										<ol class="carousel-indicators">
											 <?php if(is_array($home_slides)): foreach($home_slides as $k=>$vo): ?><li data-target="#myCarousel" data-slide-to=$k></li><?php endforeach; endif; ?>
										</ol>
									<!-- 轮播（Carousel）项目 -->
									<div class="carousel-inner">
											<?php if(is_array($home_slides)): foreach($home_slides as $k=>$vo): ?><div class='item <?php if($k == 0): ?>active<?php endif; ?>'> 
													<img id="img" src="<?php echo sp_get_asset_upload_path($vo['slide_pic']);?>" alt="<?php echo ($vo["slide_name"]); ?>"> 
												</div><?php endforeach; endif; ?>
									</div> 
									<a class="carousel-control left" href="#myCarousel"  data-slide="prev">&lsaquo;</a>
									<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a> 
									
									</div><!--轮播结束myCarousel-->
								</div>					
								<div class="col-md-4 col-sm-12" id="bolder">
									<div class="bolder1">										
										<h2>
											<?php $lists = sp_sql_posts_paged("cid:18;order:post_date DESC;",1); ?>
											<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
												<li id="font2" class="active"><a id="a2" href="<?php echo leuu('list/index',array('id'=>4));?>"><?php echo ($vo["post_title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>												
										</h2>										
											<img src="/cmf/themes/demo/Public/images/1-1.png" class="img-responsive" alt="Responsive image"></img>
											<ul id="text" class="type1">				
											<?php $lists = sp_sql_posts_paged("cid:18;order:post_date DESC;",2);; ?>
											<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
												<li id="font" class="active"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></li>																												
												<div class="date hidden-xs"><?php echo date('[Y-m-d]',strtotime($vo['post_date']));?></div><?php endforeach; endif; else: echo "" ;endif; ?>											
											</ul>
											<hr></hr>
											<img src="/cmf/themes/demo/Public/images/1-2.png" class="img-responsive" alt="Responsive image"></img>
											<ul id="text" class="type1">
												<?php $lists = sp_sql_posts_paged("cid:17;order:post_date DESC;",2); ?>
												<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
													<li id="font" class="active"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></li>																												
													<div class="date hidden-xs"><?php echo date('[Y-m-d]',strtotime($vo['post_date']));?></div><?php endforeach; endif; else: echo "" ;endif; ?>											
											</ul>
											<hr></hr>
											<img src="/cmf/themes/demo/Public/images/1-3.png" class="img-responsive" alt="Responsive image"></img>												
											<ul id="text" class="type1">
												<?php $lists = sp_sql_posts_paged("cid:21;order:post_date DESC;",2); ?>
												<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
													<li id="font" class="active"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></li>																												
													<div class="date hidden-xs"><?php echo date('[Y-m-d]',strtotime($vo['post_date']));?></div><?php endforeach; endif; else: echo "" ;endif; ?>																								
											</ul>
											<hr></hr>
											<img src="/cmf/themes/demo/Public/images/1-4.png" class="img-responsive" alt="Responsive image"></img>
											<ul id="text" class="type1">
												<?php $lists = sp_sql_posts_paged("cid:22;order:post_date DESC;",2); ?>
												<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
													<li id="font" class="active"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></li>																												
													<div class="date hidden-xs"><?php echo date('[Y-m-d]',strtotime($vo['post_date']));?></div><?php endforeach; endif; else: echo "" ;endif; ?>
											</ul>
									</div>
								</div>
								<div class="col-md-4 col-sm-12" id="bolder">
									<div class="title1">
										<div class="name_title">通知公告</div>
										<a href="<?php echo leuu('list/index',array('id'=>19));?>">
											<div class="title1-img">
												<img src="/cmf/themes/demo/Public/images/2-3.png"></img>
											</div>
										</a>
									</div>
									<div class="bolder2">
										<ul class="list-unstyled" id="text1">
											<?php $lists = sp_sql_posts_paged("cid:19;order:post_date DESC;",4); ?>
											<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
												<li id="font" class="active"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></li>																												
												<div class="date1 hidden-xs"><?php echo date('[Y-m-d]',strtotime($vo['post_date']));?></div><?php endforeach; endif; else: echo "" ;endif; ?>
										</ul>
									</div>
									<div class="title1" id="title1">
										<div class="name_title">用户登录</div>
									</div>
									<div class="bolder2">
										<div class="button2">
											<form class="form-horizontal" id="button3" action="<?php echo U('admin/public/dologin');?>" method="post" name="login">
												<div class="form-group">
												<label for="inputEmail3" class="col-sm-3 control-label">用户名</label>
													<div class="col-sm-6">
														<input type="text" class="form-control" id="js-admin-name" required name="username" >
													</div>
												</div>
												<div class="form-group">
												<label for="inputEmail3" class="col-sm-3 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
													<div class="col-sm-6">
														<input type="password" class="form-control" id="admin_pwd" required name="password" >
													</div>
												</div>
												<div class="button1">
												<button class="btn btn-default" type="submit">登录</button>
											</div>
											</form>
										</div>											
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4 col-sm-12" id="bolder1">
									<div class="thumbnail">	
										<?php echo sp_getad('中小企业产品展销展示');?>
									</div>
								</div>
								<div class="col-md-4 col-sm-12" id="bolder1">
									<div  class="thumbnail">
										<?php echo sp_getad('城市时尚电动汽车');?>
									</div>
								</div>
								<div class="col-md-4 col-sm-12" id="bolder1">
									<div class="thumbnail">
										<?php echo sp_getad('政策文件查询');?>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4 col-sm-12" id="bolder">
									<div class="title1" id="title1">
										<div class="name_title">专题活动</div>
										<a href="<?php echo leuu('list/index',array('id'=>20));?>">
											<div class="title1-img">
												<img src="/cmf/themes/demo/Public/images/2-3.png"></img>
											</div>
										</a>
									</div>
									<div class="bolder2">
										<ul id="text1" class="type" >
											<?php $lists = sp_sql_posts_paged("cid:20;order:post_date DESC;",8); ?>
											<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
												<li id="font1" class="active"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
										</ul>
									</div>
								</div>
								<div class="col-md-4 col-sm-12" id="bolder">
									<div class="title1" id="title1">
										<div class="name_title">人才服务</div>
										<a href="<?php echo leuu('list/index',array('id'=>23));?>">
											<div class="title1-img">
												<img src="/cmf/themes/demo/Public/images/2-3.png"></img>
											</div>
										</a>
									</div>
									<div class="bolder2">
										<ul id="text1" class="type">
										<?php $lists = sp_sql_posts_paged("cid:23;order:post_date DESC;",8); ?>
										<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
											<li id="font1" class="active"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
										</ul>
									</div>
								</div>
								<div class="col-md-4 col-sm-12" id="bolder">
									<div class="title1" id="title1">
										<div class="name_title">融资服务</div>
										<a href="<?php echo leuu('list/index',array('id'=>24));?>">
											<div class="title1-img">
												<img src="/cmf/themes/demo/Public/images/2-3.png"></img>
											</div>
										</a>
									</div>
									<div class="bolder2">
										<ul id="text2" class="type1">
											<?php $lists = sp_sql_posts_paged("cid:24;order:post_date DESC;",6); ?>
											<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
												<li id="font" class="active"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></li><hr id="hr1"></hr>																												
												<div class="date2 hidden-xs"><?php echo date('[Y-m-d]',strtotime($vo['post_date']));?></div><?php endforeach; endif; else: echo "" ;endif; ?>
										</ul>
										<ul id="text4" class="type1">
											<?php $lists = sp_sql_posts_paged("cid:24;order:post_date DESC;",1); ?>
											<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
												<li id="font" class="active"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></li>																											
												<div class="date4 hidden-xs"><?php echo date('[Y-m-d]',strtotime($vo['post_date']));?></div><?php endforeach; endif; else: echo "" ;endif; ?>
										</ul>
									</div>
								</div>
							</div>
							<div class="row" id="bolder">
								 <?php echo sp_getad('交易会');?>
							</div>
							<div class="row">
							<div class="col-md-4 col-sm-12" id="bolder">
								<div class="title1" id="title1">
									<div class="name_title">机构设置</div>
									<a href="<?php echo leuu('list/index',array('id'=>25));?>">
										<div class="title1-img">
											<img src="/cmf/themes/demo/Public/images/2-3.png"></img>
										</div>
									</a>
								</div>
								<div class="bolder2">
									<ul id="text1" class="type" >
										<?php $lists = sp_sql_posts_paged("cid:25;order:post_date DESC;",11); ?>
										<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
											<li id="font1" class="active"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
									</ul>
								</div>
							</div>
							<div class="col-md-4 col-sm-12" id="bolder">
								<div class="title1" id="title1">
									<div class="name_title">领导讲话</div>
										<a href="<?php echo leuu('list/index',array('id'=>26));?>">
											<div class="title1-img">
												<img src="/cmf/themes/demo/Public/images/2-3.png"></img>
											</div>
										</a>
								</div>
								<div class="bolder2">
									<ul id="text3" class="type1">
										<?php $lists = sp_sql_posts_paged("cid:26;order:post_date DESC;",4); ?>
										<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
											<li id="font" class="active"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></li>																											
											<div class="date2 hidden-xs" id="date3"><?php echo date('[Y-m-d]',strtotime($vo['post_date']));?></div><?php endforeach; endif; else: echo "" ;endif; ?>
									</ul>
								</div>
								<div class="title1" id="title1">
									<div class="name_title">政策文件</div>
										<a href="<?php echo leuu('list/index',array('id'=>27));?>">
											<div class="title1-img">
												<img src="/cmf/themes/demo/Public/images/2-3.png"></img>
											</div>
										</a>
								</div>
								<div class="bolder2">
									<ul id="text3" class="type1">
										<?php $lists = sp_sql_posts_paged("cid:27;order:post_date DESC;",4); ?>
										<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
											<li id="font" class="active"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></li>																											
											<div class="date2 hidden-xs" id="date3"><?php echo date('[Y-m-d]',strtotime($vo['post_date']));?></div><?php endforeach; endif; else: echo "" ;endif; ?>
									</ul>
								</div>
							</div>
							<div class="col-md-4 col-sm-12" id="bolder">
									<?php $lists = sp_sql_posts_paged("cid:28;order:post_date DESC;",7); ?>
									<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
										<button class="btn btn-default btn-lg btn-block font" id="btn"><a href="<?php echo leuu('list/index',array('id'=>4));?>"><?php echo ($vo["post_title"]); ?></a></button><?php endforeach; endif; else: echo "" ;endif; ?>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>			
			<hr id="hr"></hr>
<footer class="footer">
	<?php $links=sp_getlinks(); ?>
	<?php if(is_array($links)): foreach($links as $key=>$vo): ?><a id="a" href="<?php echo ($vo["link_url"]); ?>"><?php echo ($vo["link_name"]); ?></a><span> | </span><?php endforeach; endif; ?>		
		<p id="p">
			<?php echo ($site_copyright); ?>
		</p>
	</div>
</footer>
 
 
	</body>
</html>