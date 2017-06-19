<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="">
<head>
<meta charset="utf-8">
<title>服务公告</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css" href="/cmf/themes/demo/Public/css/bootstrap2.css">
<script src="/cmf/themes/demo/Public/js/jquery-2.1.1/jquery.js" type="text/javascript"></script>
<script src="/cmf/themes/demo/Public/js/bootstrap.min.js" type="text/javascript"></script>
<style>
	.navbar-default {
			background-color:#C00;
		}
		.site{margin-top:8px;margin-bottom:8px;border-bottom:3px solid #a90201}
		.content ul li{font-size:15px;margin-top:2px;backgroundPosition:1px 0;list-style: none;background:url(/cmf/themes/demo/Public/images/d.png) no-repeat;text-indent:10px;}
		.content ul li a{font-family:"微软雅黑";font-size:14px;color:#000;}
		.content ul li span{float:right;color:#757171;font-family:"kaiti";width: 86px;
		font-size: 14px;overflow: hidden;white-space: nowrap;}
		.pagination > li > span{color:#000;padding: 0 10px;border:0;font-family:"fangsong"}
		.pagination > li > a{color:#000;padding: 0 10px;border:0;}
		.pagination > li:first-child > a{border-radius:0;}
		.pagination > li:last-child > a{border-radius:0;}
		.page{margin:0;}
		.visits{font-size:12px;padding:6px;}
		.visits div strong{color:red;}
		.shows{display:none;}
		.font3 {
			text-overflow:ellipsis; 
			overflow: hidden; 
			white-space: nowrap; 
			width:100%; 	
		}
		.paging{
		margin-bottom: 0;
	}
	.paging ul{
		list-style:none;
		margin: 0px;
		padding: 0px;
		width: auto;
	}
	.paging ul li{
		float:left;
		margin: 0 12px;
	}
	.paging ul li span{
		color:rgb(105, 95, 95);
	}
	.paging ul li a{
		color:#000;
		text-decoration:none;
	}
	.paging ul li a:hover{
		color:red;
	}
	.altogether{
		font-family:"fangsong";
	}
	.pager span{
		margin: 18px;
		color:rgb(105, 95, 95);
	}
	.pager a{
		margin: 18px;
		color:#000;
	}
	.pager a:hover{
		text-decoration:none;
		color:red;
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

   

<div class="container-fluid contents" style="background-color:#FFF; margin： 0 auto;">

	<div class="row message">
	</div>
<!-- 您的位置 -->

		<div class="col-xs-20 col-sm-8 col-md-offset-2 col-lg-offset-2 col-md-2 col-lg-8 site">
			<span>您的位置：<span>
					<a href="<?php echo leuu('list/index',array('id'=>$cat_id));?>"></a>
					<?php $role=$_GET["role"]; $term = sp_get_term($cat_id); $href = leuu('list/index',array('id'=>$cat_id)); $echo = "<a href=" . $href . ">" . $term["name"] . "</a>"; while($term["parent"]!=0){ $term = sp_get_term($term["parent"]); $href = leuu('list/index',array('id'=>$term["term_id"])); $echo = "<a href=" . $href . ">" . $term["name"] . "</a>>>" .$echo; } echo $echo; ?>
		</div>
<!-- 条数据库查询 -->
		<?php $p=0; if($_GET["p"]!=""){ $p=$_GET["p"] * 20; } $find = $_POST['find']; if($role!="parent"){ if($find != ""){ $tag = "cid:$cat_id;order:post_date DESC;where:post_title like '%" . $find . "%'"; }else{ $tag = "cid:$cat_id;order:post_date DESC"; } $lists = sp_sql_posts_paged($tag,20); }else{ import('@.Util.Page'); $posts = M('posts'); if($find != ""){ $where = "post_status=1 and post_title like '%" . $find . "%'"; }else{ $where = "post_status=1"; } $count = $posts->where($where)->count(); $page = new Page($count,20); $limit = $page->firstRow . ',' . $page->listRows; $result =$posts->where($where)->limit($limit)->select(); $this->result = $result; $lists['page'] = $page->show(); $lists['posts'] = $result; } ?>
		<div><?php echo ($first); ?></div>


		<div class="sites col-xs-20 col-sm-8 col-md-offset-2 col-lg-offset-2 col-md-2 col-lg-8 content">
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
		<?php if($altogether!=1&&$altogether!=0) echo '<br><span class="altogether hidden-sm hidden-md hidden-lg">共' . $altogether . '页</span>'; ?>
	</center>

<hr id="hr"></hr>
<footer class="footer">
	<?php $links=sp_getlinks(); ?>
	<?php if(is_array($links)): foreach($links as $key=>$vo): ?><a id="a" href="<?php echo ($vo["link_url"]); ?>"><?php echo ($vo["link_name"]); ?></a><span> | </span><?php endforeach; endif; ?>		
		<p id="p">
			<?php echo ($site_copyright); ?>
		</p>
	</div>
</footer>