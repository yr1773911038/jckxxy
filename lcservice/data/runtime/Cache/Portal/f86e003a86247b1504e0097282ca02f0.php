<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<meta name="description" content="">
		<meta name="author" content="">
		<title>内容详情页面</title>
		<!-- Bootstrap core CSS -->
		<link href="/lcservice/themes/simplebootx/Public/css/bootstrap.min.css" rel="stylesheet">
		<link href="/lcservice/themes/simplebootx/Public/css/style_jin.css" rel="stylesheet">
		<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
		<style>
		
			/*@media screen and (max-width:760px) {
				.navbar .navbar-collapse .nav li {
					width: 40%;
					text-align: left;
				}*/
		</style>
	</head>

	<body>
				
		<style type="text/css">
			.scene{
				background:#EEEEEE;
				height: 130px;
				background-size: cover;
			}
			
		</style>
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




		

			<div class="col-md-12" style="background:#EEEEEE;margin-top: -20px; ">
				<div>
					<!--<span class="col-md-1 glyphicon glyphicon-volume-down" style="margin-top:5px;font-size:100%;width:1%;"></span>-->
					<ul class="col-md-5">
						<li>
							<p>
								<marquee direction=up width="0" scrolldelay="80" scrollamount="1" border="0" style="height:20px;width:475px;" onmouseover="if(document.all!=null){this.stop()}" onmouseout="if(document.all!=null){this.start()}">
									全市民营经济和中小企业专项资金申报流程公示
								</marquee>
							</p>
						</li>
					</ul>
				</div>
				<form action="<?php echo leuu('list/index',array('id'=>23,'role'=>'parent'));?>" method="post">
				<div class="col-md-offset-8 ">
					站内搜索：
					<input type="text" class="find" placeholder="Q">
					<input type="submit" class="find_btn" value="搜 索">
				</div>
				</form>
			</div>
			<div class="container" style="clear:both;padding-top: 20px;">
			<div class="col-md-12">
				<div class="col-md-8" style="border:solid 1px gray;border-top:2px solid rgb(156,1,2);">
					<div>
						<span class="">
							您的位置：
							<a href="#">首页</a>
							>>
							<a href="#">焦点新闻</a>
						</span>
					</div>
					
					<div align="center" style="padding:5px;color:#000000;font-size:18pt;font-weight:bold;line-height:200%;font-family:黑体;">
						<!--<$[标题]>begin-->
						<div id="article_title">
							<?php echo ($post_title); ?>
						</div>
						<!--<$[标题]>end-->
					</div>
					
					<div class="col-md-8" align="center" style="width:95%; border=none; align:center cellpadding:0px cellspacing:0px bgcolor:#F3F3F3">
						<div class="col-md-5" width='100%' align='center' nowrap style='line-height:25px;color:#666;font-size:10pt;'>发布日期： <?php echo ($post_date); ?> </div>
						<div class="col-md-3" width='100%' align="center" nowrap style='line-height:25px;color:#666;font-size:10pt;'>浏览次数：<a href="javascript:;"><span><?php echo ($post_hits); ?></span></a></div>
						<div style="width:100%;overflow:hidden; text-align:left;text-indent: 32px; font-family: simsun; margin-bottom: 15px; font-size: 15px">
							<br/>
							<div id="article_content">
								<?php echo ($post_content); ?>
							</div>
							<br/>
							<br/>
							<hr class="col-md-12" style="border-top:1px solid black;"></hr>
							<div class="col-md-12">
								<div class="col-md-8 col-xs-12" style="margin-top:-1%;margin-left:-3%;bgcolor:#F3F3F3;border:none;">
									<p>
										<a style="width:50px;color:black;font-family:微软雅黑; align:left;" href="#" target="_self">上一篇：</a>
										<a style="width:50px;color:black;font-family:微软雅黑; align:left;" href="#" target="_self">没有了</a></p>
									<p>
										<a style="width:50px; color:black;font-family:微软雅黑;align:left;" href="#" target="_self">下一篇：</a>
										<a style="width:50px; color:black;font-family:微软雅黑;align:left;" href="#" target="_self"><?php echo ($post_title); ?></a></p>
								</div>
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
				<div class="col-md-4">
					<img src="/lcservice/themes/simplebootx/Public/images/images_jin/gonggongxinxi.png" class="img-responsive" alt="Responsive image"></img>
				</div>
				<div class="col-md-4" style="padding:10px;background-color:#FFF;height:75px;">
					<a href="#" style="text-decoration:none;color:#A50203;width:125px;display:inline-block;float: left;text-align: center;border: 1px solid #EDE3D9;margin: 1px 5px 7px 7px;font-size: 14px;font-family:微软雅黑;background: #F7F7F7;font-weight: bold;height: 25px;">焦点新闻</a>
					<a href="#" style="text-decoration:none;color:#A50203;width:125px;display:inline-block;float: left;text-align: center;border: 1px solid #EDE3D9;margin: 1px 5px 7px 7px;font-size: 14px;font-family:微软雅黑;background: #F7F7F7;font-weight: bold;height: 25px;">政策法规</a>
					<a href="#" style="text-decoration:none;color:#A50203;width:125px;display:inline-block;float: left;text-align: center;border: 1px solid #EDE3D9;margin: 1px 5px 7px 7px;font-size: 14px;font-family:微软雅黑;background: #F7F7F7;font-weight: bold;height: 25px;">区域动态</a>
				</div>
				<div class="col-md-4">
					<img src="/lcservice/themes/simplebootx/Public/images/images_jin/xinwenjujiao.png" class="img-responsive" alt="Responsive image"></img>
				</div>
				<div class="col-md-4">
					<?php $lists = sp_sql_posts_paged("cid:3;order:post_date DESC;",14); ?>
					<ul class="yr_ul">
						<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
							<li class="yr_news" style="text-overflow: ellipsis;"><img src="/lcservice/themes/simplebootx/Public/images/images_jin/dian.png"></img><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_keywords"]); ?></a> </li><?php endforeach; endif; else: echo "" ;endif; ?>
					</ul>
				</div>
			</div>
		</div>
		<!--container-->
		<div id="footer" class="mt10" style="margin-top:40px;">
			<div class="text-center">
				<div class="bg-red">
					<div class="col-md-12 col-xs-12" style="background-color:#CC0000;width:100%;height:10%;">
						<p class="text-center" id="footer_nav" style="margin-top:15px;">
							<a href="index.html" style="margin-left:8%;margin-right: 4%;">平台首页</a> |
							<a href="/ecdomain/framework/sds_zxqyggfwpt/mhhdppjnbpilbbodiialijnmonpefmlj.html" target="_blank" style="margin-left:4%;margin-right:4%;">联系我们</a> |
							<a href="/ecdomain/framework/sds_zxqyggfwpt/oemopdlobpilbbodiialijnmonpefmlj.html" target="_blank" style="margin-left:4%;margin-right:4%;">技术支持</a> |
							<a href="/ecdomain/framework/sds_zxqyggfwpt/pdkaoflpbpilbbodiialijnmonpefmlj.html" target="_blank" style="margin-left:4%;margin-right:4%;">法律咨询</a> |
							<a href="/ecdomain/framework/sds_zxqyggfwpt/phdmdepabpilbbodiialijnmonpefmlj.html" target="_blank" style="margin-left:4%;margin-right:4%;">信息服务</a>
						</p>
					</div>
				</div>
				<div class="col-md-12 col-xs-12" style="background: #EEEEEE;">
					<p class="text-center">主办单位：聊城市中小企业局　　指导单位：中华人民共和国工业和信息化部中小企业司</p>
					<p class="text-center">承办单位：山东云大网络科技有限公司 &nbsp;&nbsp;
						<a href="http://admin.smesd.gov.cn" target="_blank">门户管理</a>&nbsp;
						<a href="http://accounts.smesd.gov.cn///login/TSDcms.do" target="_Blank">业务管理</a>&nbsp;
						<a href="http://hzxt.smesd.gov.cn" target="_blank">汇总系统</a>
					</p>
					<p class="text-center">鲁ICP备********号
						<!--<script type="text/javascript">
							var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://"); document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F28e0d973d9e330288e203b38214d113c' type='text/javascript'%3E%3C/script%3E"));
						</script>-->
						&nbsp;&nbsp;举报电话：********&nbsp;&nbsp;维权邮箱：********
					</p>
					<div>
						<a href="www.baidu.com" target="_blank">
							<img src="/lcservice/themes/simplebootx/Public/images/images_jin/dangzhengjiguan.png" href="#" style="width: 75px;height:70px;">
							</img>
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- Bootstrap core JavaScript-->
		<script src="/lcservice/themes/simplebootx/Public/js/jquery.min.js"></script>
		<script src="/lcservice/themes/simplebootx/Public/js/bootstrap.min.js"></script>
	</body>
</html>