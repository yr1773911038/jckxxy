<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="keywords" content="<?php echo ($site_seo_keywords); ?>" />
		<meta name="description" content="<?php echo ($site_seo_description); ?>">
		<title><?php echo ($site_seo_title); ?> <?php echo ($site_name); ?></title>
		<!-- Bootstrap core CSS -->
		<link href="/lcservice/themes/simplebootx/Public/css/bootstrap.min.css" rel="stylesheet">
		<link href="/lcservice/themes/simplebootx/Public/css/style_123.css" rel="stylesheet">
		<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
		<style type="text/css">
			.scene{
				background:#EEEEEE;
				height: 130px;
				background-size: cover;
			}
			
		</style>
	</head>

	<body>
		
		
<div class="scene">
	<div class="container">
		<div class="logo">
			<div class="row">
				<div class="col-sm-6" style=" margin-top: 20px;">
					<img src="/lcservice/themes/simplebootx/Public/images/zxqyfwzx.png" class="img-responsive" alt="Responsive image"></img>
				</div>
			</div>
		</div>
	</div>
</div>		
		
		
		
		
		
		
		
		<?php echo hook('body_start');?>
<!--<nav class="navbar navbar-default" role="navigation">
      	<div class="container-fluid">
       		<div class="navbar-header">
          		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
         		<a class="navbar-brand visible-xs" href="#">聊城市中小企业公共服务平台</a> 
          	</div> <!--navbar-header-->
        	<!--<div class="navbar-collapse" id="bs-example-navbar-collapse-1">
         <?php
 $effected_id=""; $filetpl="<a href='\$href' target='\$target'>\$label</a>"; $style="navbar navbar-default"; $showlevel=10; echo sp_get_menu("main",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?>-->
       		<!--</div>--> <!--navbar-collapse---> 
     <!-- </div>--> <!--container-fluid--> 
   <!--</nav>--><!--nav结束-->


<!--<div class="navbar navbar-default">
   <div class="navbar-inner">
     <div class="container">
       <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
       </a>
       <a class="brand" href="/lcservice/"></a>
       <div class="nav-collapse collapse" id="main-menu">
	       	<?php
 $effected_id=""; $filetpl="<a href='\$href' target='\$target'>\$label</a>"; $li_class="" ; $style="navbar navbar-default"; $showlevel=6; echo sp_get_menu("main",$effected_id,$filetpl,$li_class,$style,$showlevel); ?>-->
		<!--</div>--><!--nav-collapse-->
	<!--</div>--> <!--container---> 
   <!--</div> --><!--navbar-inner--> 
<!--</nav>--><!--navbar-->

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
				<a class="navbar-brand  visible-xs" href="#" >服务中心</a> 
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<?php
 $effected_id="main-nav"; $filetpl="<a href='\$href' target='\$target'>\$label</a>"; $style="nav navbar-nav"; $showlevel=1; echo sp_get_menu("main",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?>
			</div>
		</div>
	</nav>




		<div class="scroll">
			<p>
				<?php $lists = sp_sql_posts_paged("cid:76;order:post_date DESC;",1); ?>
				<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
				<marquee>
					<?php echo ($vo['post_content']); ?>
				</marquee><?php endforeach; endif; else: echo "" ;endif; ?>
			</p>
		</div>
		<!--scroll class="scene2" class="container-fluid"-->
		<div class="scene2">
			<div class="comity">
				<div class="container">
					<div class="bolder">	
						<div class="box">
			<!--container开始-->
			<div class="row row_lunbo">
				<div class="col-xs-12 col-sm-12 col-md-7">
					<?php $home_slides=sp_getslide("slide_top"); ?>
					<div id="myCarousel" class="carousel slide">
						<!-- 轮播（Carousel）指标 -->
						<ol class="carousel-indicators">
							<?php if(is_array($home_slides)): foreach($home_slides as $k=>$vo): ?><li data-target="#myCarousel" data-slide-to=$k> </li><?php endforeach; endif; ?>
						</ol>
						<!-- 轮播（Carousel）项目 -->
						<div class="carousel-inner">
							<?php if(is_array($home_slides)): foreach($home_slides as $k=>$vo): ?><div class='item <?php if($k == 0): ?>active<?php endif; ?>'> <img src="<?php echo sp_get_asset_upload_path($vo['slide_pic']);?>" alt="<?php echo ($vo["slide_name"]); ?>"> </div><?php endforeach; endif; ?>
						</div>
						<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
						<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
					</div>
					<!--轮播结束myCarousel-->
				</div>
				<!--左侧轮播-->
				<!--轮播右侧tab切换-->
				<div class="col-xs-12 col-md-5 col-sm-12" id="sidebar">
					<ul class="nav nav-tabs text-center" id="yrmyTab">
						<!--<?php echo leuu('list/index',array('id'=>3));?>-->
						<li><a href="#home" onclick="window.open('<?php echo leuu('list/index',array('id'=>3));?>')">通知公告</a></li>
						<li><a href="#profile" onclick="window.open('<?php echo leuu('list/index',array('id'=>4));?>')">政策文件</a></li>
						<li><a href="#messages" onclick="window.open('<?php echo leuu('list/index',array('id'=>5));?>')">平台动态</a></li>
						<li><a href="#settings" onclick="window.open('<?php echo leuu('list/index',array('id'=>6));?>')">统计总量</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="home">
							<ul class="change">
								<?php $lists = sp_sql_posts_paged("cid:3;order:post_date DESC;",8); ?>
								<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
									<li style="text-overflow:ellipsis"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_keywords"]); ?></a> </li><?php endforeach; endif; else: echo "" ;endif; ?>
							</ul>
						</div>
						<!--tab-pane-->
						<div class="tab-pane" id="profile">
							<ul style="display:block;" class="change">
								<?php $lists = sp_sql_posts_paged("cid:4;order:post_date DESC;",8); ?>
								<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
									<li style="text-overflow:ellipsis"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_keywords"]); ?></a> </li><?php endforeach; endif; else: echo "" ;endif; ?>
							</ul>
						</div>
						<!--tab-pane-->
						<div class="tab-pane" id="messages">
							<ul class="change">
								<?php $lists = sp_sql_posts_paged("cid:5;order:post_date DESC;",8); ?>
								<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
									<li style="text-overflow:ellipsis"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_keywords"]); ?></a> </li><?php endforeach; endif; else: echo "" ;endif; ?>
							</ul>
						</div>
						<!--tab-pane-->
						<div class="tab-pane" id="settings">
							<ul class="change">
								<?php $lists = sp_sql_posts_paged("cid:6;order:post_date DESC;",8); ?>
								<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
									<li style="text-overflow:ellipsis"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_keywords"]); ?></a> </li><?php endforeach; endif; else: echo "" ;endif; ?>
							</ul>
						</div>
						<!--tab-pane-->
					</div>
					<!---tab-content-->
				</div>
				<!---sidebar右侧tab切换-->
			</div>
			<!--row-->
			<!--server row 开始-->
				<div class="row server">
					<div class="col-md-3 list"> <img class="t1" src="/lcservice/themes/simplebootx/Public/images/t4.png">
						<h4 style="">服务</h4>
						<div class="row row1">
							<a href="<?php echo U('User/Register/index');?>">
								<button type="button" class="btn btn-default">&nbsp;&nbsp;注册&nbsp;&nbsp;</button>
							</a>
							<a href="<?php echo U('User/Login/index');?>">
								<button type="button" class="btn btn-default">&nbsp;&nbsp;登录&nbsp;&nbsp;</button>
							</a>
						</div>
						<!--一行按钮-->
						<div class="row row2">
							<button type="button" class="btn btn-default brand">&nbsp;&nbsp;<img src="/lcservice/themes/simplebootx/Public/images/2016-01-14_002113.png" class="img-responsive" alt="发布服务">发布服务&nbsp;&nbsp;</button>
							<button type="button" class="btn btn-default brand">&nbsp;&nbsp;<img src="/lcservice/themes/simplebootx/Public/images/2016-01-14_002128.png" class="img-responsive" alt="发布服务">&nbsp;&nbsp;申请服务&nbsp;&nbsp;</button>
						</div>
						<!--一行按钮-->
						<div class="row row3">
							<button type="button" class="btn btn-default brand col-md-4">&nbsp;&nbsp;<img src="/lcservice/themes/simplebootx/Public/images/2016-01-14_002140.png" class="img-responsive" alt="发布服务">服务活动采集系统&nbsp;&nbsp;</button>
						</div>
					</div>
				<!--左边全部列表-->
					<div class="col-md-4 list2 list sidebar-offcanvas" id="sidebar1">
					<!--2行2列-->
						<img class="t1" src="/lcservice/themes/simplebootx/Public/images/t2.png">
						<ul class="nav nav-tabs" id="myTab22">
							<!--role="tablist"-->
							<li class="active"><a href="#qiye1" onclick="window.open('<?php echo leuu('list/index',array('id'=>7));?>')" <!-- role="tab" data-toggle="tab" -->最新加入的企业</a></li>
							<li><a href="#jigou1" onclick="window.open('<?php echo leuu('list/index',array('id'=>8));?>')" <!--role="tab" data-toggle="tab" -->最新加入的机构</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="qiye1">
								<ul class="change2">
									<?php $lists = sp_sql_posts_paged("cid:7;order:post_date DESC;",5); ?>
									<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
										<li style="text-overflow: ellipsis;"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a> </li><?php endforeach; endif; else: echo "" ;endif; ?>
								</ul>
							</div>
							<div class="tab-pane" id="jigou1">
								<ul class="change2">
									<?php $lists = sp_sql_posts_paged("cid:8;order:post_date DESC;",5); ?>
									<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
										<li><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo (msubstr($vo["post_keywords"],0,20)); ?></a> </li><?php endforeach; endif; else: echo "" ;endif; ?>
								</ul>
							</div><!--tab-pane-->
						</div>
					<!--tab-content-->
					</div>
				<!--2行2列--中间-->
					<div class="col-md-5 list"> <img class="t1" src="/lcservice/themes/simplebootx/Public/images/t3.png">
						<h4>登陆</h4>
						<div class="login">
							<ul class="nav nav-tabs" role="tablist" id="myTab3">
								<li class="active"><a href="#user1" role="tab" data-toggle="tab">一般用户</a></li>
								<li><a href="#user2" role="tab" data-toggle="tab">企业用户</a></li>
								<li><a href="#user3" role="tab" data-toggle="tab">服务机构</a></li>
								<li><a href="#user4" role="tab" data-toggle="tab">系统管理员</a></li>
							</ul>
							<div class="tab-content">
								<div class="log_con tab-pane active" id="user1">
									<ul>
										<li>
											<button type="button" class="btn btn-danger pull-left">&nbsp;&nbsp;发布需求&nbsp;&nbsp;</button>
										</li>
										<li>
											<button type="button" class="btn btn-primary pull-right">&nbsp;&nbsp;申请服务&nbsp;&nbsp;</button>
										</li>
									</ul>
								</div>
							<!--log_con-->
								<div class="log_con tab-pane" id="user2">
									<ul>
										<li>
											this is a test page</li>
									</ul>
								</div>
							<!--log_con-->
								<div class="log_con tab-pane" id="user3">
									<ul>
										<li>
											this is a test page2</li>
									</ul>
								</div>
							<!--log_con-->
								<div class="log_con tab-pane" id="user4">
									<ul>
										<li>
											this is a test page3</li>
									</ul>
								</div>
							<!--log_con-->
							</div>
						<!--tab-content-->
						</div>
					<!--login-->
					</div>
				<!--右边--->
				</div>
			<!--row-->

			<div class="row"> <img class="t1" src="/lcservice/themes/simplebootx/Public/images/2016-01-14_011937.png" style="width:100%" class="img-responsive"> </div>
			<!--图片-->

			<!--服务荟萃栏目-->

			<div class="row huicui container-fluid">
				<h4 style="margin-bottom:-10px;">服务荟萃</h4>
				<img src="/lcservice/themes/simplebootx/Public/images/2016-01-14_131623.png" style="clear:both;float:right;" class="img-responsive"> <img src="/lcservice/themes/simplebootx/Public/images/2016-01-14_131644.png" style="width:100%" class="img-responsive">
				<ul class="nav nav-tabs sev-huicui text-center" role="tablist" id="Tab4">
					<li><a href="#server_1" onclick="window.open('<?php echo leuu('list/index',array('id'=>9));?>')" role="tab" data-toggle="tab">全部服务</a></li>
					<li><a href="#server_2" onclick="window.open('<?php echo leuu('list/index',array('id'=>10));?>')" role="tab" data-toggle="tab">技术创新</a></li>
					<li><a href="#server_3" onclick="window.open('<?php echo leuu('list/index',array('id'=>11));?>')" role="tab" data-toggle="tab">人才培训</a></li>
					<li><a href="#server_4" onclick="window.open('<?php echo leuu('list/index',array('id'=>12));?>')" role="tab" data-toggle="tab">市场开拓</a></li>
					<li><a href="#server_5" onclick="window.open('<?php echo leuu('list/index',array('id'=>13));?>')" role="tab" data-toggle="tab">管理咨询</a></li>
					<li><a href="#server_6" onclick="window.open('<?php echo leuu('list/index',array('id'=>14));?>')" role="tab" data-toggle="tab">融资担保</a></li>
					<li><a href="#server_7" onclick="window.open('<?php echo leuu('list/index',array('id'=>15));?>')" role="tab" data-toggle="tab">法律服务</a></li>
					<li><a href="#server_8" onclick="window.open('<?php echo leuu('list/index',array('id'=>16));?>')" role="tab" data-toggle="tab">信息服务</a></li>
					<li><a href="#server_9" onclick="window.open('<?php echo leuu('list/index',array('id'=>17));?>')" role="tab" data-toggle="tab">创业服务</a></li>
					<li><a href="#server_10" onclick="window.open('<?php echo leuu('list/index',array('id'=>18));?>')" role="tab" data-toggle="tab">其他服务</a></li>
				</ul>

				<div class="tab-content">
					<div class="tab-pane active" id="server_1">
						<div class="hc-1 col-md-12 change4">
							<?php $lists = sp_sql_posts_paged("cid:9;order:post_date DESC;",4); ?>
							<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
								<div class="col-md-6">
									<h4><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></h4>
									<p>服务内容介绍：<?php echo msubstr($vo['post_content'],0,30);?></p>
									<p style="display:inline"><?php echo ($vo["post_keywords"]); ?></p>
									<button type="button" style="float:right !important" class="btn btn-danger pull-left">&nbsp;&nbsp;我要申请&nbsp;&nbsp;</button>
									<p>发布时间:<?php echo ($vo['post_date']); ?></p>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
						<!--hc-1--->
					</div>
					<!--tab-pane--->
					<div class="tab-pane" id="server_2">
						<div class="hc-2 col-md-12 change4">
							<?php $lists = sp_sql_posts_paged("cid:10;order:post_date DESC;",4); ?>
							<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
								<div class="col-md-6">
									<h4><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></h4>
									<p>服务内容介绍：<?php echo msubstr($vo['post_content'],0,30);?></p>
									<p style="display:inline"><?php echo ($vo["post_keywords"]); ?></p>
									<button type="button" style="float:right !important" class="btn btn-danger pull-left">&nbsp;&nbsp;我要申请&nbsp;&nbsp;</button>
									<p>发布时间：2015-05-26 16：15</p>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
						<!--hc-2-->
					</div>
					<!--tab-pane--->

					<div class="tab-pane" id="server_3">
						<div class="hc-3 col-md-12 change4">
							<?php $lists = sp_sql_posts_paged("cid:11;order:post_date DESC;",4); ?>
							<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
								<div class="col-md-6">
									<h4><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></h4>
									<p>服务内容介绍：<?php echo msubstr($vo['post_content'],0,30);?></p>
									<p style="display:inline"><?php echo ($vo["post_keywords"]); ?></p>
									<button type="button" style="float:right !important" class="btn btn-danger pull-left">&nbsp;&nbsp;我要申请&nbsp;&nbsp;</button>
									<p>发布时间：26 16：15</p>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
						<!--hc-2-->
					</div>
					<!--tab-pane--->

					<div class="tab-pane" id="server_4">
						<div class="hc-2 col-md-12 change4">
							<?php $lists = sp_sql_posts_paged("cid:12;order:post_date DESC;",4); ?>
							<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
								<div class="col-md-6">
									<h4><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></h4>
									<p>服务内容介绍：<?php echo msubstr($vo['post_content'],0,30);?></p>
									<p style="display:inline"><?php echo ($vo["post_keywords"]); ?></p>
									<button type="button" style="float:right !important" class="btn btn-danger pull-left">&nbsp;&nbsp;我要申请&nbsp;&nbsp;</button>
									<p>发布时间：2015-05-26 16：15</p>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
						<!--hc-2-->
					</div>
					<!--tab-pane--->
					<div class="tab-pane" id="server_5">
						<div class="hc-2 col-md-12 change4">
							<?php $lists = sp_sql_posts_paged("cid:13;order:post_date DESC;",4); ?>
							<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
								<div class="col-md-6">
									<h4><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></h4>
									<p>服务内容介绍：<?php echo msubstr($vo['post_content'],0,30);?></p>
									<p style="display:inline"><?php echo ($vo["post_keywords"]); ?></p>
									<button type="button" style="float:right !important" class="btn btn-danger pull-left">&nbsp;&nbsp;我要申请&nbsp;&nbsp;</button>
									<p>发布时间：2015-05-26 16：15</p>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
						<!--hc-2-->
					</div>
					<!--tab-pane--->
					<div class="tab-pane" id="server_6">
						<div class="hc-2 col-md-12 change4">
							<?php $lists = sp_sql_posts_paged("cid:14;order:post_date DESC;",4); ?>
							<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
								<div class="col-md-6">
									<h4><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></h4>
									<p>服务内容介绍：<?php echo msubstr($vo['post_content'],0,30);?></p>
									<p style="display:inline"><?php echo ($vo["post_keywords"]); ?></p>
									<button type="button" style="float:right !important" class="btn btn-danger pull-left">&nbsp;&nbsp;我要申请&nbsp;&nbsp;</button>
									<p>发布时间：2015-05-26 16：15</p>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
						<!--hc-2-->
					</div>
					<!--tab-pane--->
					<div class="tab-pane" id="server_7">
						<div class="hc-2 col-md-12 change4">
							<?php $lists = sp_sql_posts_paged("cid:15;order:post_date DESC;",4); ?>
							<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
								<div class="col-md-6">
									<h4><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></h4>
									<p>服务内容介绍：<?php echo msubstr($vo['post_content'],0,30);?></p>
									<p style="display:inline"><?php echo ($vo["post_keywords"]); ?></p>
									<button type="button" style="float:right !important" class="btn btn-danger pull-left">&nbsp;&nbsp;我要申请&nbsp;&nbsp;</button>
									<p>发布时间：2015-05-26 16：15</p>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
						<!--hc-2-->
					</div>
					<!--tab-pane--->
					<div class="tab-pane" id="server_8">
						<div class="hc-2 col-md-12 change4">
							<?php $lists = sp_sql_posts_paged("cid:16;order:post_date DESC;",4); ?>
							<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
								<div class="col-md-6">
									<h4><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></h4>
									<p>服务内容介绍：<?php echo msubstr($vo['post_content'],0,30);?></p>
									<p style="display:inline"><?php echo ($vo["post_keywords"]); ?></p>
									<button type="button" style="float:right !important" class="btn btn-danger pull-left">&nbsp;&nbsp;我要申请&nbsp;&nbsp;</button>
									<p>发布时间：2015-05-26 16：15</p>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
						<!--hc-2-->
					</div>
					<!--tab-pane--->

					<div class="tab-pane" id="server_9">
						<div class="hc-2 col-md-12 change4">
							<?php $lists = sp_sql_posts_paged("cid:17;order:post_date DESC;",4); ?>
							<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
								<div class="col-md-6">
									<h4><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></h4>
									<p>服务内容介绍：<?php echo msubstr($vo['post_content'],0,30);?></p>
									<p style="display:inline"><?php echo ($vo["post_keywords"]); ?></p>
									<button type="button" style="float:right !important" class="btn btn-danger pull-left">&nbsp;&nbsp;我要申请&nbsp;&nbsp;</button>
									<p>发布时间：2015-05-26 16：15</p>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
						<!--hc-2-->
					</div>
					<!--tab-pane--->

					<div class="tab-pane" id="server_10">
						<div class="hc-2 col-md-12 change4">
							<?php $lists = sp_sql_posts_paged("cid:18;order:post_date DESC;",4); ?>
							<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
								<div class="col-md-6">
									<h4><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></h4>
									<p>服务内容介绍：<?php echo msubstr($vo['post_content'],0,30);?></p>
									<p style="display:inline"><?php echo ($vo["post_keywords"]); ?></p>
									<button type="button" style="float:right !important" class="btn btn-danger pull-left">&nbsp;&nbsp;我要申请&nbsp;&nbsp;</button>
									<p>发布时间：2015-05-26 16：15</p>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
						<!--hc-2-->
					</div>
					<!--tab-pane--->

				</div>
				<!---tab-content---->
			</div>
			<!--服务荟萃-->

			<!--
            	作者：1773911038@qq.com
            	时间：2016-01-22
            	描述：融资服务
            -->
			<div class="row middle"> <img src="/lcservice/themes/simplebootx/Public/images/2016-01-14_131644.png" style="width:100%;" class="img-responsive">
				<div class="col-md-5 rz">
					<?php
 $effected_id=""; $filetpl="<a href='\$href' target='\$target'>\$label</a>"; $li_class="rz_list" ; $style="rongzi_nav"; $showlevel=6; echo sp_get_menu("4",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?>
						<!--</ul>-->
						<table class="table table-bordered rz_img text-center">
							<tr>
								<td>
									<a href="#all"><img src="/lcservice/themes/simplebootx/Public/images/2016-01-14_105940.png" class="img-responsive">银行贷款</a>
								</td>
								<td>
									<a href="#all"><img src="/lcservice/themes/simplebootx/Public/images/2016-01-14_105956.png" class="img-responsive">融资租栠</a>
								</td>
								<td>
									<a href="#all"><img src="/lcservice/themes/simplebootx/Public/images/2016-01-14_110005.png" class="img-responsive">信托融资</a>
								</td>
								<td>
									<a href="#all"><img src="/lcservice/themes/simplebootx/Public/images/2016-01-14_110017.png" class="img-responsive">债券融资</a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="#"><img src="/lcservice/themes/simplebootx/Public/images/2016-01-14_110031.png" class="img-responsive">版权融资</a>
								</td>
								<td>
									<a href="#all"><img src="/lcservice/themes/simplebootx/Public/images/2016-01-14_110041.png" class="img-responsive">民间融资</a>
								</td>
								<td>
									<a href="#all"><img src="/lcservice/themes/simplebootx/Public/images/2016-01-14_110101.png" class="img-responsive">其他融资产品</a>
								</td>
								<td>
									<a href="#all"><img src="/lcservice/themes/simplebootx/Public/images/2016-01-14_110110.png" class="img-responsive">全部</a>
								</td>
							</tr>
						</table>
				</div>
				<div class="col-md-7 rz">
					<div class="panel panel-default">
						<div class="panel-heading" style="">
							<ul class="nav nav-pills text-center rz-ul">
								<li style="width:19%;"><a href="" role="tab" data-toggle="tab">企业名称</a></li>
								<li style="width:19%;"><a href="" role="tab" data-toggle="tab">融资金额</a></li>
								<li style="width:19%;"><a href="" role="tab" data-toggle="tab">期期限限</a></li>
								<li style="width:19%;"><a href="" role="tab" data-toggle="tab">项目状态</a></li>
								<li style="width:19%;"><a href="" role="tab" data-toggle="tab">贷款用途</a></li>
							</ul>
						</div>

						<div class="panel-body">
							<div class="row">
								<div class="col-xs-12">
									<ul class="demo2" style="height:300px;">
										<li class="news-item">
											<table class="table" style="margin:0;">
												<tr>
													<td>曹县***公司</td>
													<td>&nbsp;&nbsp;500万&nbsp;&nbsp;</td>
													<td>&nbsp;&nbsp;&nbsp;12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td>&nbsp;&nbsp;未合作&nbsp;&nbsp;&nbsp;</td>
													<td>流动资金</td>
												</tr>
											</table>
										</li>
										<li class="news-item">
											<table class="table" style="margin:0;">
												<tr>
													<td>曹县***公司</td>
													<td>&nbsp;&nbsp;500万&nbsp;&nbsp;</td>
													<td>&nbsp;&nbsp;&nbsp;36&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td>&nbsp;&nbsp;未合作&nbsp;&nbsp;&nbsp;</td>
													<td>固定资产投资</td>
												</tr>
											</table>
										</li>
										<li class="news-item">
											<table class="table" style="margin:0;">
												<tr>
													<td>山东***公司</td>
													<td>&nbsp;&nbsp;7100完&nbsp;&nbsp;</td>
													<td>&nbsp;&nbsp;&nbsp;36&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td>&nbsp;&nbsp;未合作&nbsp;&nbsp;&nbsp;</td>
													<td>固定资产投资</td>
												</tr>
											</table>
										</li>
										<li class="news-item">
											<table class="table" style="margin:0;">
												<tr>
													<td>金乡***公司</td>
													<td>&nbsp;&nbsp;2000万&nbsp;&nbsp;</td>
													<td>&nbsp;&nbsp;&nbsp;24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td>&nbsp;&nbsp;未合作&nbsp;&nbsp;&nbsp;</td>
													<td>流动资金</td>
												</tr>
											</table>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!--融资服务-->
			<div class="row sev-fuwu container-fluid">
				<h4 style="margin-bottom:-10px;">聊城市优秀服务商推荐</h4>
				<img src="/lcservice/themes/simplebootx/Public/images/2016-01-14_131623.png" style=" clear:both;float:right;" class="img-responsive"> <img src="/lcservice/themes/simplebootx/Public/images/2016-01-14_131644.png" style="width:100%;margin-bottom:20px;" class="img-responsive">
				<ul class="nav nav-tabs sev-man  text-center" role="tablist" id="Tab4">
					<li><a href="#man_1" onclick="window.open('<?php echo leuu('list/index',array('id'=>9));?>')" role="tab" data-toggle="tab">全部服务</a></li>
					<li><a href="#man_2" onclick="window.open('<?php echo leuu('list/index',array('id'=>10));?>')" role="tab" data-toggle="tab">技术创新</a></li>
					<li><a href="#man_3" onclick="window.open('<?php echo leuu('list/index',array('id'=>11));?>')" role="tab" data-toggle="tab">人才培训</a></li>
					<li><a href="#man_4" onclick="window.open('<?php echo leuu('list/index',array('id'=>12));?>')" role="tab" data-toggle="tab">市场开拓</a></li>
					<li><a href="#man_5" onclick="window.open('<?php echo leuu('list/index',array('id'=>13));?>')" role="tab" data-toggle="tab">管理咨询</a></li>
					<li><a href="#man_6" onclick="window.open('<?php echo leuu('list/index',array('id'=>14));?>')" role="tab" data-toggle="tab">融资担保</a></li>
					<li><a href="#man_7" onclick="window.open('<?php echo leuu('list/index',array('id'=>15));?>')" role="tab" data-toggle="tab">法律服务</a></li>
					<li><a href="#man_8" onclick="window.open('<?php echo leuu('list/index',array('id'=>16));?>')" role="tab" data-toggle="tab">信息服务</a></li>
					<li><a href="#man_9"  onclick="window.open('<?php echo leuu('list/index',array('id'=>17));?>')"  role="tab" data-toggle="tab">创业服务</a></li>
					<li><a href="#man_10" onclick="window.open('<?php echo leuu('list/index',array('id'=>18));?>')" role="tab" data-toggle="tab">其他服务</a></li>

				</ul>
	

				<div class="tab-content">
					<div class="tab-pane active" id="man_1">
						<div class="hc-1 col-md-12 change4">
							<?php $lists = sp_sql_posts_paged("cid:9;order:post_date DESC;",4); ?>
							<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
								<div class="col-md-6">
									<h4><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></h4>
									<p>服务内容介绍：<?php echo msubstr($vo['post_content'],0,30);?></p>
									<p style="display:inline"><?php echo ($vo["post_keywords"]); ?></p>
									<button type="button" style="float:right !important" class="btn btn-danger pull-left">&nbsp;&nbsp;我要申请&nbsp;&nbsp;</button>
									<p>发布时间:<?php echo ($vo['post_date']); ?></p>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
						<!--hc-1--->
					</div>
					<!--tab-pane--->
					<div class="tab-pane" id="man_2">
						<div class="hc-2 col-md-12 change4">
							<?php $lists = sp_sql_posts_paged("cid:10;order:post_date DESC;",4); ?>
							<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
								<div class="col-md-6">
									<h4><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></h4>
									<p>服务内容介绍：<?php echo msubstr($vo['post_content'],0,30);?></p>
									<p style="display:inline"><?php echo ($vo["post_keywords"]); ?></p>
									<button type="button" style="float:right !important" class="btn btn-danger pull-left">&nbsp;&nbsp;我要申请&nbsp;&nbsp;</button>
									<p>发布时间：2015-05-26 16：15</p>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
						<!--hc-2-->
					</div>
					<!--tab-pane--->

					<div class="tab-pane" id="man_3">
						<div class="hc-3 col-md-12 change4">
							<?php $lists = sp_sql_posts_paged("cid:11;order:post_date DESC;",4); ?>
							<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
								<div class="col-md-6">
									<h4><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></h4>
									<p>服务内容介绍：<?php echo msubstr($vo['post_content'],0,30);?></p>
									<p style="display:inline"><?php echo ($vo["post_keywords"]); ?></p>
									<button type="button" style="float:right !important" class="btn btn-danger pull-left">&nbsp;&nbsp;我要申请&nbsp;&nbsp;</button>
									<p>发布时间：26 16：15</p>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
						<!--hc-2-->
					</div>
					<!--tab-pane--->

					<div class="tab-pane" id="man_4">
						<div class="hc-2 col-md-12 change4">
							<?php $lists = sp_sql_posts_paged("cid:12;order:post_date DESC;",4); ?>
							<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
								<div class="col-md-6">
									<h4><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></h4>
									<p>服务内容介绍：<?php echo msubstr($vo['post_content'],0,30);?></p>
									<p style="display:inline"><?php echo ($vo["post_keywords"]); ?></p>
									<button type="button" style="float:right !important" class="btn btn-danger pull-left">&nbsp;&nbsp;我要申请&nbsp;&nbsp;</button>
									<p>发布时间：2015-05-26 16：15</p>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
						<!--hc-2-->
					</div>
					<!--tab-pane--->
					<div class="tab-pane" id="man_5">
						<div class="hc-2 col-md-12 change4">
							<?php $lists = sp_sql_posts_paged("cid:13;order:post_date DESC;",4); ?>
							<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
								<div class="col-md-6">
									<h4><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></h4>
									<p>服务内容介绍：<?php echo msubstr($vo['post_content'],0,30);?></p>
									<p style="display:inline"><?php echo ($vo["post_keywords"]); ?></p>
									<button type="button" style="float:right !important" class="btn btn-danger pull-left">&nbsp;&nbsp;我要申请&nbsp;&nbsp;</button>
									<p>发布时间：2015-05-26 16：15</p>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
						<!--hc-2-->
					</div>
					<!--tab-pane--->
					<div class="tab-pane" id="man_6">
						<div class="hc-2 col-md-12 change4">
							<?php $lists = sp_sql_posts_paged("cid:14;order:post_date DESC;",4); ?>
							<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
								<div class="col-md-6">
									<h4><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></h4>
									<p>服务内容介绍：<?php echo msubstr($vo['post_content'],0,30);?></p>
									<p style="display:inline"><?php echo ($vo["post_keywords"]); ?></p>
									<button type="button" style="float:right !important" class="btn btn-danger pull-left">&nbsp;&nbsp;我要申请&nbsp;&nbsp;</button>
									<p>发布时间：2015-05-26 16：15</p>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
						<!--hc-2-->
					</div>
					<!--tab-pane--->
					<div class="tab-pane" id="man_7">
						<div class="hc-2 col-md-12 change4">
							<?php $lists = sp_sql_posts_paged("cid:15;order:post_date DESC;",4); ?>
							<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
								<div class="col-md-6">
									<h4><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></h4>
									<p>服务内容介绍：<?php echo msubstr($vo['post_content'],0,30);?></p>
									<p style="display:inline"><?php echo ($vo["post_keywords"]); ?></p>
									<button type="button" style="float:right !important" class="btn btn-danger pull-left">&nbsp;&nbsp;我要申请&nbsp;&nbsp;</button>
									<p>发布时间：2015-05-26 16：15</p>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
						<!--hc-2-->
					</div>
					<!--tab-pane--->
					<div class="tab-pane" id="man_8">
						<div class="hc-2 col-md-12 change4">
							<?php $lists = sp_sql_posts_paged("cid:16;order:post_date DESC;",4); ?>
							<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
								<div class="col-md-6">
									<h4><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></h4>
									<p>服务内容介绍：<?php echo msubstr($vo['post_content'],0,30);?></p>
									<p style="display:inline"><?php echo ($vo["post_keywords"]); ?></p>
									<button type="button" style="float:right !important" class="btn btn-danger pull-left">&nbsp;&nbsp;我要申请&nbsp;&nbsp;</button>
									<p>发布时间：2015-05-26 16：15</p>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
						<!--hc-2-->
					</div>
					<!--tab-pane--->

			<div class="tab-pane" id="man_9">
						<div class="hc-2 col-md-12 change4">
							<?php $lists = sp_sql_posts_paged("cid:17;order:post_date DESC;",4); ?>
							<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
								<div class="col-md-6">
									<h4><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></h4>
									<p>服务内容介绍：<?php echo msubstr($vo['post_content'],0,30);?></p>
									<p style="display:inline"><?php echo ($vo["post_keywords"]); ?></p>
									<button type="button" style="float:right !important" class="btn btn-danger pull-left">&nbsp;&nbsp;我要申请&nbsp;&nbsp;</button>
									<p>发布时间：2015-05-26 16：15</p>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
						<!--hc-2-->
					</div>
					<!--tab-pane--->
				<div class="tab-pane" id="man_10">
						<div class="hc-2 col-md-12 change4">
							<?php $lists = sp_sql_posts_paged("cid:18;order:post_date DESC;",4); ?>
							<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
								<div class="col-md-6">
									<h4><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></h4>
									<p>服务内容介绍：<?php echo msubstr($vo['post_content'],0,30);?></p>
									<p style="display:inline"><?php echo ($vo["post_keywords"]); ?></p>
									<button type="button" style="float:right !important" class="btn btn-danger pull-left">&nbsp;&nbsp;我要申请&nbsp;&nbsp;</button>
									<p>发布时间：2015-05-26 16：15</p>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
						<!--hc-2-->
					</div>
					<!--tab-pane--->
				</div>
				<!---tab-content---->
			</div>
			<!--聊城市优秀服务商推荐-->
		</div>
		<!--底部导航-->
		<div class="row" >
			<!--style="border: solid 1px red;"-->
			<div class="daohang" >
				<h4 style="padding-left: 25px;">网站导航</h4>
				<img src="/lcservice/themes/simplebootx/Public/images/2016-01-14_131644.png" class="img-responsive">
				<div class="row col-md-12 row_xialas">
					<!--style="border: solid 1px red;"-->
					<div class="col-md-2 col-sm-4 col-xs-6">
						<select class="form-control" style="">
							<option>--部门网站--</option>
							<option>--部门网站1--</option>
							<option>--部门网站2--</option>
							<option>--部门网站3--</option>
							<option>--部门网站4--</option>
						</select>
					</div>
					<!--col-md-2--->
					<div class="col-md-2 col-sm-4 col-xs-6">
						<select class="form-control" >
							<option>--部门网站--</option>
							<option>--部门网站1--</option>
							<option>--部门网站2--</option>
							<option>--部门网站3--</option>
							<option>--部门网站4--</option>
						</select>
					</div>
					<!--col-md-2--->
					<div class="col-md-2 col-sm-4 col-xs-6">
						<select class="form-control">
							<option>--部门网站--</option>
							<option>--部门网站1--</option>
							<option>--部门网站2--</option>
							<option>--部门网站3--</option>
							<option>--部门网站4--</option>
						</select>
					</div>
					<!--col-md-2--->
					<div class="col-md-2 col-sm-4 col-xs-6">
						<select class="form-control">
							<option>--部门网站--</option>
							<option>--部门网站1--</option>
							<option>--部门网站2--</option>
							<option>--部门网站3--</option>
							<option>--部门网站4--</option>
						</select>
					</div>
					<!--col-md-2--->
					<div class="col-md-2 col-sm-4 col-xs-6">
						<select class="form-control">
							<option>--部门网站--</option>
							<option>--部门网站1--</option>
							<option>--部门网站2--</option>
							<option>--部门网站3--</option>
							<option>--部门网站4--</option>
						</select>
					</div>
					<!--col-md-2--->
					<div class="col-md-2 col-sm-4 col-xs-6">
						<select class="form-control">
							<option>--部门网站--</option>
							<option>--部门网站1--</option>
							<option>--部门网站2--</option>
							<option>--部门网站3--</option>
							<option>--部门网站4--</option>
						</select>
					</div>
					<!--col-md-2--->
				</div>
				<!--一行导航-->
			</div>
			<!---daohang-->
		</div>

		
		<!-- Bootstrap core JavaScript-->
		<script src="/lcservice/themes/simplebootx/Public/js/jquery.min.js"></script>
		<script src="/lcservice/themes/simplebootx/Public/js/bootstrap.min.js"></script>
		<script src="/lcservice/themes/simplebootx/Public/js/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function() {
				$(".demo2").bootstrapNews({
					newsPerPage: 4,
					autoplay: true,
					pauseOnHover: true,
					navigation: false,
					direction: 'up',
					newsTickerInterval: 1000,
					onToDo: function() {
					}
				});
			});
		</script>
		<script>
			$(function() {
				$('#yrmyTab a:first,#myTab22 a:first,#Tab4 a:first').tab('show'); //初始化显示哪个tab
				$('#yrmyTab a,#myTab22 a,#Tab4  a').hover(function(e) {
					e.preventDefault(); //阻止a链接的跳转行为
					$(this).tab('show'); //显示当前选中的链接及关联的content
				});
			})
		</script>
		<!--<script type="text/javascript">
			var obj = document.getElementsByClassName("daohang");
			obj.removeAttribute("a");
		</script>-->
</div>
</div>
</div>
</div>
</div>
<footer>
			<nav class="navbar1 navbar-default" style="background:#EEEEEE;">
				<div class="container-fluid">
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav" style="width:100%;">
							<li class="col-md-2 col-md-offset-1 col-sm-12"></li>
							<li class="col-md-6 col-sm-12 text-center">
									主办单位：山东省中小企业局 指导单位：中华人民共和国工业和信息化部中小企业<br/>
	            					邮箱：smesd@smesd.gov.cn司 技术支持：山东云大网络科技有限公司
            				</li>
						</ul>
					</div>
				</div>
			</nav>
		</footer>
	</body>

</html>