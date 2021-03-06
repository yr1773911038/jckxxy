<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="">
	<head>
		<meta charset="utf-8">
		<title>列表页面</title>
		<!-- Bootstrap core CSS -->
		<link rel="stylesheet" type="text/css" href="/lcservice/themes/simplebootx/Public/css/bootstrap.css">
		<script src="js/jquery-2.1.1/jquery.js" type="/lcservice/themes/simplebootx/Public/text/javascript"></script>
		<script src="js/bootstrap.min.js" type="/lcservice/themes/simplebootx/Public/text/javascript"></script>
		<style>
				.navbar-inverse .navbar-brand {
				padding-top: 11px;
				color: #FFF;
			}
			.finds {
				font-size: 12px;
			}
			
			.find {
				margin-top: 2px;
				width: 150px;
				padding-left: 9px;
				background: #fff;
				border-radius: 20px 0 0 20px;
				height: 25px;
				border: 1px solid #d6d6d6;
				margin-right: 0;
				border-right: 0;
			}
			
			.find:focus {}
			
			.find_btn {
				width: 65px;
				font-family: '黑体';
				border-radius: 0 20px 20px 0;
				height: 25px;
				border: 1px solid #d6d6d6;
				margin-left: 0;
				border-left: 0;
				/* Firefox 3.6+ */
				background: -moz-linear-gradient(top, #fff, #d6d6d6);
				/* Safari 4-5, Chrome 1-9 */
				/* -webkit-gradient(,  [, ]?,  [, ]? [, ]*) */
				background: -webkit-gradient(linear, top, from(#fff), to(#d6d6d6));
				/* Safari 5.1+, Chrome 10+ */
				background: -webkit-linear-gradient(top, #fff, #d6d6d6);
				/* Opera 11.10+ */
				background: -o-linear-gradient(top, #fff, #d6d6d6);
			}
			
			.tel {
				margin-left: 17px;
				float: right;
				padding-top: 7px;
			}
			
			.site {
				margin-top: 8px;
				margin-bottom: 8px;
				border-bottom: 3px solid #a90201
			}
			
			.site a {
				color: #000;
			}
			
			.site a:hover {
				color: red;
				text-decoration: none;
			}
			
			.site span {
				font-family: 微软雅黑
			}
			
			.site span span a {
				font-family: 楷体；color: #000;
			}
			
			.contents {
				border-bottom: 3px solid #a90201;
				margin-bottom: 2px;
			}
			
			.content ul li {
				font-size: 15px;
				margin-top: 2px;
				backgroundPosition: 1px 0;
				list-style: none;
				background: url(/lcservice/themes/simplebootx/Public/images/d.png) no-repeat;
				text-indent: 10px;
			}
			
			.content ul li a {
				font-family: "微软雅黑";
				font-size: 14px;
				color: #000;
			}
			
			.content ul li span {
				float: right;
				color: #757171;
				font-family: "kaiti";
				width: 86px;
				overflow: hidden;
				white-space: nowrap;
			}
			
			.content a:hover {
				color: red;
				text-decoration: none;
			}
			/*.end{
			    background-color: #EEEEEE;
				
				background-size:7px 7px;
				background: -moz-repeating-linear-gradient(top left -45deg, #920706, #920706 3px, #aa0b07 5px, #aa0b07 3px);
			}
			.end div div{color:black;}*/
			
			.alt {
				color: #000;
				padding: 0 10px;
				border: 0;
			}
			
			.pagination > li > span:focus {
				background-color: #fff;
				color: #000;
			}
			
			.pagination > li > span:hover {
				background-color: #fff;
				color: #000;
			}
			
			.pagination > li > span {
				color: #000;
				padding: 0 10px;
				border: 0;
				font-family: "fangsong"
			}
			
			.pagination > li > a:focus {
				background-color: #fff;
				color: red;
			}
			
			.pagination > li > a:hover {
				background-color: #fff;
				color: red;
			}
			
			.pagination > li > a {
				color: #000;
				padding: 0 10px;
				border: 0;
			}
			
			.pagination > li:first-child > a {
				border-radius: 0;
			}
			
			.pagination > li:last-child > a {
				border-radius: 0;
			}
			/*.end div div:hover{color:#000;
			background-color: #eee;
			background-image: linear-gradient(-45deg,#eee 16%, #fff 17%,#fff 33%, #eee 34%,#eee 66%, #fff 67%,#fff 83%, #eee 84%);
			background-repeat:repeat;
			background-size:7px 7px;
			background: -moz-repeating-linear-gradient(top left -45deg, #eee, #eee 3px, #fff 5px, #fff 3px);
			}*/
			
			.ends {
				background: #EEEEEE;
				font-size: 12px;
				color: #646464;
				padding-top: 20px;
				padding-bottom: 20px;
			}
			
			.page {
				margin: 0;
			}
			/*.visits{font-size:12px;padding:6px;}
			.visits div strong{color:red;}*/
			
			.shows {
				display: none;
			}
			
			.paging {
				margin-bottom: 0;
			}
			
			.paging ul {
				list-style: none;
				margin: 0px;
				padding: 0px;
				width: auto;
			}
			
			.paging ul li {
				float: left;
				margin: 0 12px;
			}
			
			.paging ul li a {
				text-decoration: none;
			}
			
			.paging ul li a:hover {
				color: red;
			}
			
			.altogether {
				font-family: "fangsong";
			}
			
			@media screen and (min-width:1200px) {
				.home {
					display: none;
				}
				.message {
					height: 300px;
				}
			}
			
			@media screen and (max-width: 1200px) and (min-width:992px) {
				.home {
					display: none;
				}
				.message {
					height: 250px;
				}
			}
			
			@media screen and (max-width: 992px) and (min-width:768px) {
				.tel {
					display: none;
				}
				.home {
					display: none;
				}
				.message {
					height: 250px;
				}
			}
			
			@media screen and (max-width:768px) {
				.weather {
					font-size: 10px;
					padding-top: 10px;
					padding-left: 6px;
				}
				.navigation li a {
					border-right: 0;
				}
				.tel {
					display: none;
				}
				.sites {
					padding: 0;
				}
				.sites ul {
					padding: 0;
				}
			}
			
			@media screen and (min-width: 500px) and (max-width:768px) {
				.message {
					height: 200px;
				}
			}
			
			@media screen and (max-width:720px) {
				.content ul li span {
					display: none;
				}
			}
			
			@media screen and (max-width:361px) {
				.noshows {
					display: none;
				}
				.shows {
					display: block;
				}
				.few_page {
					color: #000;
					padding: 0 10px;
					border: 0;
					font-family: "fangsong"
				}
			}
			
			@media screen and (max-width:333px) {
				.week {
					display: none;
				}
				.navigation li a {
					border-right: 0;
				}
				.tel {
					display: none;
				}
				.finds {
					padding: 0;
				}
				.find {
					width: 80px;
				}
				.site {
					font-size: 10px;
					padding-left: 8px;
				}
				/*	.end div div{color:#fff;font-size:10px;}*/
				.ends {
					font-size: 8px;
				}
			}
			
			* {
				margin: 0;
				padding: 0;
				list-style: none;
				border: 0;
				text-decoration: none;
			}
			/*顶部图片*/
			
			.top {
				width: 100%;
				background: #EEEEEE;
				padding-bottom: 20px;
			}
			
			a {
				color: black;
			}
			
			a:hover {
				text-decoration: none;
			}
			/*nav条*/
			
			.navbar {
				background: #CC0000;
				padding-top: 1px;
				clear: both;
				overflow: hidden;
			}
			
			.navbar .navbar-header a,
			.navbar .nav li a {
				color: white;
				font-size: 16px;
			}
			
			.navbar .navbar-collapse .nav {
				width: 100%;
				text-align: center;
			}
			
			.navbar .navbar-collapse .nav li a:hover {
				color: white;
				font-size: 18px;
			}
			
			.navbar .navbar-collapse .nav li {
				width: 10%;
			}
			
			.yr_news {
				white-space: nowrap;
				width: 20em;
				overflow: hidden;
				line-height: 30px;
			}
			
			.yr_ul {
				margin-top: 20px;
			}
			
			@media screen and (max-width:760px) {
				.navbar .navbar-collapse .nav li {
					width: 40%;
					text-align: left;
				}
		</style>
	</head>

	<body>

				
		
		<div class="top col-sm-12 col-md-12 ">
			<div class="row col-md-offset-10 col-sm-offset-10 col-xs-offset-7">
				<p><a href="#">设为首页</a>&nbsp;&#124;&nbsp;<a href="#">加入收藏</a></p>
			</div>
			<div class="row">
				<div class="col-md-offset-1 col-sm-offset-1 col-sm-8 col-md-8"> <img src="/lcservice/themes/simplebootx/Public/images/2016-01-16_094123.png" class="img-responsive" alt="Responsive image"> </div>
			</div>
			<!--row-->
		</div>
		<!--top-->
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




		

		<!-- 导航条 -->
		<div class="container-fluid">
			<div class="row navbars" style="background: #EEEEEE; margin-top:-20px;padding: 10px 20px 10px 20px;">
				<div class="col-xs-12 col-sm-6 col-md-5 col-lg-4 weather">
					<strong>
<!-- 地点 -->
			    <?php  ?>
				<a href="http://map.baidu.com/"><?php echo "聊城"; ?></a>&nbsp;
				<a href="http://www.nmc.cn/publish/forecast/china.html">
<!-- 天气 -->
					<?php $kurl = "http://api.avatardata.cn/Weather/Query?key=168441746d1646ce8c1030f0fb5c83bf&cityname=聊城"; $content = file_get_contents($kurl); $weather = json_decode($content); echo '今天' . '(<span class="warning">周' . $weather -> {'result'} -> {'weather'}[0] -> {'week'} . '</span>)：'; $tmax = $weather -> {'result'} -> {'weather'}[0] ->{'info'} ->{'day'}[2]; if($tmax > 0){ echo '<span class="success">' . $tmax . '</span>'; }else{ echo '<span class="warning">' . $tmax . '</span>'; } $tmin = $weather -> {'result'} -> {'weather'}[0] ->{'info'} ->{'night'}[2]; if($tmin > 0){ echo '<span style="font-family:微软雅黑">~</span><span class="success">' . $tmin . '℃' . '</span>'; }else{ echo '<span style="font-family:微软雅黑">~</span><span class="warning">' . $tmin . '℃' . '</span>'; } $dweather = $weather -> {'result'} -> {'weather'}[0] ->{'info'} ->{'day'}[1]; $nweather = $weather -> {'result'} -> {'weather'}[0] ->{'info'} ->{'night'}[1]; if($dweather != $nweather){ echo $dweather . "转" . $nweather . '</a>'; }else{ echo $dweather . '</a>'; } ?>
			</strong>
					<!-- 日期 -->
					&nbsp;&nbsp;<span class="week">20</span>
					<?php echo date(y).'年'.date('m').'月'.date('d').'日 '; ?><span class="week"><?php $week= array('日','一','二','三','四','五','六');echo '星期'.$week[date('w')] ?></span>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-7 col-lg-8 blockquote-reverse finds">
					<?php $role=$_GET["role"]; if($role == 'parent'){ $url = leuu('list/index',array('id'=>$cat_id,'role'=>'parent')); }else{ $url = leuu('list/index',array('id'=>$cat_id)); } ?>
					<form action="<?php echo ($url); ?>" method="post">
						站内搜索：
						<input type="text" name="find" class="find" placeholder="Q">
						<input type="submit" class="find_btn" value="搜 索">
					</form>
				</div>
			</div>
		</div>
		<!-- 内容 -->
		<div class="container-fluid contents">
			<div class="row message">
				<!-- 您的位置 -->

				<div class="col-xs-12 col-sm-12 col-md-offset-1 col-lg-offset-1 col-md-10 col-lg-10 site">
					<span>您的位置：<span>
			<a href="<?php echo leuu('list/index',array('id'=>$cat_id));?>">法律服务平台</a>
			<?php $term = sp_get_term($cat_id); $href = leuu('list/index',array('id'=>$cat_id)); $echo = ">><a href=" . $href . ">" . $term["name"] . "</a>"; while($term["parent"]!=0){ $term=sp_get_term($term["parent"]); $href = leuu('list/index',array('id'=>$term["term_id"])); $echo = ">><a href=" . $href . ">" . $term["name"] . "</a>" .$echo; } echo $echo; ?>
		</div>
<!-- 条数据库查询 -->
		<?php $p=0; if($_GET["p"]!=""){ $p=$_GET["p"] * 20; } $find = $_POST['find']; if($role!="parent"){ if($find != ""){ $tag = "cid:$cat_id;order:post_date DESC;where:post_title like '%" . $find . "%'"; }else{ $tag = "cid:$cat_id;order:post_date DESC"; } $lists = sp_sql_posts_paged($tag,1); }else{ import('@.Util.Page'); $posts = M('posts'); if($find != ""){ $where = "post_status=1 and post_title like '%" . $find . "%'"; }else{ $where = "post_status=1"; } $count = $posts->where($where)->count(); $page = new Page($count,20); $limit = $page->firstRow . ',' . $page->listRows; $result =$posts->where($where)->limit($limit)->select(); $this->result = $result; $lists['page'] = $page->show(); $lists['posts'] = $result; } ?>
		<div><?php echo ($first); ?></div>
		<div class="sites col-xs-12 col-sm-12 col-md-offset-1 col-lg-offset-1 col-md-10 col-lg-10 content">
			<ul>
<!-- 列内容 -->
				<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
					<li>
						<a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a> <span><?php echo ($vo["post_date"]); ?></span>
					</li><?php endforeach; endif; else: echo "" ;endif; ?>
					</ul>
				</div>
			</div>
			<!-- 分页 -->
			<?php $amount = $lists['count']; $altogether = ceil($amount/20)+1; ?>
			<center>
				<div class="pagination paging">
					<ul>
						<?php echo ($lists['page']); ?>
						<li>
							<?php if($altogether!=1&&$altogether!=0) echo '<span class="altogether hidden-xs">共' . $altogether . '页</span>'; ?>
						</li>
					</ul>
				</div>
				<?php if($altogether!=1&&$altogether!=0) echo '
					<br><span class="altogether hidden-sm hidden-md hidden-lg">共' . $altogether . '页</span>'; ?>
			</center>
		</div>
		<!-- 底栏 -->
		<div class="container-fluid">
			<div class="row ends">
				<div class="text-center col-xs-12 col-sm-12 col-md-12 col-lg-12">主办单位：山东省中小企业局　　 指导单位：中华人民共和国工业和信息化部中小企业司</div>
				<div class="text-center col-xs-12 col-sm-12 col-md-12 col-lg-12">承办单位：山东省中小企业信息中心 邮箱:smesd@smesd.gov.cn 门户管理 业务管理</div>
				<div class="text-center col-xs-12 col-sm-12 col-md-12 col-lg-12">鲁ICP备06016837号</div>

			</div>
		</div>
		<div>