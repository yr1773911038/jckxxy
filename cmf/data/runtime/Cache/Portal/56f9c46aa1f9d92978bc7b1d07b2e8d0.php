<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-CN">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>聊城市中小企业公共服务平台</title>	
	<link href="/cmf/themes/demo/Public/css/bootstrap2.css" rel="stylesheet">
	<script src="/cmf/themes/demo/Public/js/jquery-2.1.1/jquery.js" type="text/javascript"></script>
	<script src="/cmf/themes/demo/Public/js/bootstrap.min.js" type="text/javascript"></script>
	<!--[if lt IE 9]>
		  <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
	<style>
		a{color: black;}
		.manu .navbar-default .navbar-nav > li > a:hover,.manu .navbar-default .navbar-nav > li > a:focus{
			background: #F60 none repeat scroll 0% 0%;
			color:#FFF;
			font-size:18px;
		}
		.nbolder {
			padding-top:20px;
		}
		#na {
			color:#FFF;
		}
		#na:focus,#na:hover {
			color:#F60;
			text-decoration: none;
		}
		#article_content p{
			color:#000;
		}
		.navbar-default {
			background-color:#C00;
		}
		#np {
			padding-top:15px;
		}
		hr {
			margin-top:20px;
		}
		.title1{
			background: transparent url("/cmf/themes/demo/Public/images/2-1.png") repeat-x scroll left top;
		}
		.title1 .name_title {
			background: transparent url("/cmf/themes/demo/Public/images/2-2.png") no-repeat scroll 0% 0%;
		}
		.bolder3 {
			border:1px solid  #EDE3D9 ;
			background-color: #F7F7F7;
			text-align:center;			
			font-weight: 900;
			margin:10px 80px;
		}
		.type1 li {
			padding-left: 15px;
			overflow: hidden;
			background: transparent url("/cmf/themes/demo/Public/images/d1.png") no-repeat scroll left center;
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

		<div style="background-color:#FFF;">
			<div class="container">
				<div class="row">
					<div class="col-md-8" style="border:solid 1px gray;border-top:2px solid rgb(156,1,2);margin-top: 20px;">
						<div class="nbolder">				
							<div>
								<span class="">您的位置：
									<a href="<?php echo leuu('article/index',array('id'=>$cat_id));?>"></a>
									<?php $id = $_GET["id"] ; $lists = sp_sql_posts_paged("cid:25;order:post_date DESC;",14); $fenlei = M('term_relationships'); $where = "tid=" . $id; $f_id = $fenlei ->where($where) ->select(); $cat_ids = $f_id[0]['term_id']; $term = sp_get_term($cat_ids); $href = leuu('list/index',array('id'=>$f_id[0]['term_id'])); $echo = ">><a href=" . $href . ">" . $term["name"] . "</a>"; while($term["parent"]!=0){ $term=sp_get_term($term["parent"]); if($f_id['term_id']!=""){ $href = leuu('list/index',array('id'=>$f_id['term_id'])); }else{ $href = leuu('list/index',array('id'=>$term["term_id"])); } if($term["name"]!="首页"){ $echo = ">><a href=" . $href . ">" . $term["name"] . "</a>" .$echo ; }else{ $echo = "<a href=" . "http://127.0.0.1/cmf/index.php?" . ">" . $term["name"] . "</a>" .$echo .">>" .$post_title; } } echo $echo; ?>
								</span>
							</div>
							<div align="center" style="padding:5px;color:#000000;font-size:18pt;font-weight:bold;line-height:200%;font-family:黑体;">
								<div id="article_title">
									<?php echo ($post_title); ?>
								</div>
							</div>
							<div  class="col-md-10" align="center" style="width:100%; border=none; align:center cellpadding:0px cellspacing:0px bgcolor:#F3F3F3">
								<div  class="col-md-4" width='100%' align='center' nowrap style='line-height:25px;color:#666;font-size:10pt;'>发布日期：<?php echo ($post_date); ?></div>
								<div  class="col-md-4" width='100%' align="center" nowrap style='line-height:25px;color:#666;font-size:10pt;'>浏览次数：<a href="javascript:;"><span><?php echo ($post_hits); ?></span></a></div>
								<div  class="col-md-4" width='100%' align="center" nowrap style='line-height:25px;color:#666;font-size:10pt;text-overflow:ellipsis;overflow: hidden;white-space: nowrap; '>信息来源：<font color=#336699><?php echo ($post_source); ?></font></div>
							</div>
							<div style="width:100%;overflow:hidden; text-align:left; font-family: simsun; margin-bottom: 15px; font-size: 15px" ><br/>
								<div id="article_content">
									<?php echo ($post_content); ?>
								</div><br/><br/>
								<hr class="col-md-12" style="border-top:1px solid black;"></hr>
								<div class="col-md-12">								
								<div class="col-md-4 col-xs-12" style="float:left;font-size:12px;margin-top:1%;height:1%;border:0px;">
									<a style="cursor:hand;color:black;margin-left:-10%;font-family:微软雅黑;" onclick="javascript:printInfo();">【打印】</a>
									<a style="cursor:hand;color:black;font-family:微软雅黑;" onclick="javascript:window.close();">【关闭】</a>
									<a style="cursor:hand;color:black;font-family:微软雅黑;" onclick="javascript:window.scroll(0,0);">【回到顶部】</a>
								</div>
								</div>
								<hr class="col-md-12 col-xs-12" style="margin-top:1%;border-top:1px solid black;"></hr>
							</div>
						</div>
					</div>
					<div  class="col-md-4">
						<div class="title1" style="margin-top: 20px;">
							<div class="name_title">公共信息</div>
						</div>
						<div class="bolder2" style="margin-top: -10px;">
								<div class="bolder3"><a href="<?php echo leuu('list/index',array('id'=>29));?>" style="color:#A50203;">焦点新闻</a></div>
								<div class="bolder3"><a href="<?php echo leuu('list/index',array('id'=>30));?>" style="color:#A50203;">政策法规</a></div>
								<div class="bolder3"><a href="<?php echo leuu('list/index',array('id'=>31));?>" style="color:#A50203;">区域动态</a></div>
						</div>
						<div class="title1" style="margin-top:20px;">
							<div class="name_title">新闻聚焦</div>
						</div>
						<div class="bolder2">
							<ul id="text3" class="type1">
								<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>			      
								<li id="font" class="active"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_keywords"]); ?></a> </li><?php endforeach; endif; else: echo "" ;endif; ?>
							</ul>
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