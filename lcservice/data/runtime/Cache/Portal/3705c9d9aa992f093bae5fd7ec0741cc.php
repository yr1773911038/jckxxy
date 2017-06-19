<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="utf-8">
		<meta http-equiv=Content-Type content=“text/html;charset=utf-8″>
		<meta http-equiv=X-UA-Compatible content=IE=EmulateIE7>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="/lcservice/themes/simplebootx/Public/css/bootstraplhq.css">
		<link rel="stylesheet" type="text/css" href="/lcservice/themes/simplebootx/Public/css/mystylelhq.css">
		<script src="/lcservice/themes/simplebootx/Public/js/jquery.min.js" type="text/javascript"></script>
		<script src="/lcservice/themes/simplebootx/Public/js/bootstrap.min.js" type="text/javascript"></script>
        <title>技术创新服务平台</title>
        <style>
        .navbar .navbar-collapse .nav li{width:11%;}
        
        </style>


	</head>
	
   
	<body>
		<?php echo hook('body_start');?>
<div class="top" id="top">
  <div class="container" id="summary-container">
   <div class="row" style="margin-top: 20px; margin-bottom: 10px;">
    <div class="col-sm-8">
      <img src="/lcservice/themes/simplebootx/Public/images/img/fl2c.png" class="img-responsive abc" alt="Responsive image">
    </div>
     <div class="col-sm-4">
     <img src="/lcservice/themes/simplebootx/Public/images/img/fl22.gif" class="img-responsive abc" alt="Responsive image">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button type="button" class="btn btn-danger">登录</button>
        <button type="button" class="btn btn-danger">注册</button>
     </div>
   </div>
  </div> <!--container-->
  <div class="manu">
    <nav class="navbar navbar-default" role="navigation" style="margin-bottom: 0px;">
        <div class="container-fluid">
          <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
            <a class="navbar-brand visible-xs" href="#">法律服务平台</a>
            </div> <!--navbar-header-->
          <div class="navbar-collapse" id="bs-example-navbar-collapse-1">
              <?php
 $effected_id=""; $filetpl="<a href='\$href' target='\$target'>\$label</a>"; $foldertpl="<a href='\$href' target='\$target' class='dropdown-toggle' data-toggle='dropdown'>\$label <b class='caret'></b></a>"; $ul_class="dropdown-menu" ; $li_class="" ; $style="nav navbar-nav li"; $showlevel=6; $dropdown='dropdown'; echo sp_get_menu("5",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?>
              <ul class="nav navbar-nav li" >
              </ul>
          </div>
      </div>
    </nav><!--nav结束-->
  </div><!--manu-->
<div class="weather" style="background:#F7F7F6 ">
  <div class="container">
      <iframe width="450" scrolling="no" height="20" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=1&icon=4&py=liaocheng&wind=0&num=2"></iframe>

         <div class="col-md-offset-8" style="width: 80%; padding-left: 10%;">
							<form action="<?php echo leuu('list/index',array('id'=>23,'role'=>'parent'));?>" method="post">
					<div class=" col-md-5 input-group" style="margin-top:10px;">
							<input type="text" class="form-control" name="find"  placeholder="search for">
						 	<span class="input-group-btn">
					        <button type="submit" class="btn btn-default">搜索</button>
					      </span>
						</div>
						    </form>
					</div>
      </div>
  </div>
 </div>
		<div class="container head" id="head">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-7">
					<?php $home_slides=sp_getslide("flfw_lunbo"); ?>
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
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
						<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">&lsaquo;</a>
						<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">&rsaquo;</a>
					</div>
					<!--轮播结束myCarousel-->
				</div>
				<div class="col-sm-5 col-md-5">
					<ul class="nav nav-tabs" role="tablist" id="myTab">
						<a href="#" style="float: left;font-size: 17px;font-family:宋体;font-weight:bold;">
							<?php $parent=64; $res=getyousub($parent); print_r($res['name']); ?>
							<!--法界热点-->
						</a>
						<a href="<?php echo leuu('list/index',array('id'=>$res['term_id']));?>" style="float: right;font-size: 17px">更多>></a>
					</ul>
					<div class="tab-pane active" id="home">
						<div class="info">
							<?php $cid=$res['term_id']; $lists = sp_sql_posts_paged("cid:".$cid.";order:post_date DESC;",7); ?>
							<ul>
								<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
									<li><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a>
										<span><?php echo ($vo["post_date"]); ?></span>
									</li><?php endforeach; endif; else: echo "" ;endif; ?>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6 ad1">
					<a href="index.html" class="ad">
						<img src="/lcservice/themes/simplebootx/Public/images/img/f1.jpg" class="img-responsive" alt="Responsive image">
					</a>
				</div>
				<div class="col-sm-6 ad2">
					<a href="index.html">
						<img src="/lcservice/themes/simplebootx/Public/images/img/f2.jpg" class="img-responsive" alt="Responsive image">
					</a>
				</div>
			</div>
			<div class="row">
				<?php $parent=65; $list=get_con($parent); ?>
				<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($i % 2 );++$i;?><div class="col-sm-4 wenz">
						<div class="neir row1">
							<div class="neirong1">
								<a href="#" class="n1a"><?php echo ($vos["name"]); ?></a></div>
							<div class="neirong2"><a href="<?php echo leuu('list/index',array('id'=>$vos['term_id']));?>" class="n2a">更多>></a></div>
						</div>
						<div class="neiro row2">
							<?php $lists = sp_sql_posts_paged("cid:" . $vos['term_id'] . ";order:post_date DESC;",7); ?>
							<ul class="ul1">
								<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
									<li class="li1"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" class="a1"><?php echo ($vo["post_title"]); ?></a>
										<span class="span1"><?php echo ($vo["post_date"]); ?></span>
									</li><?php endforeach; endif; else: echo "" ;endif; ?>
							</ul>
						</div>
					</div><?php endforeach; endif; else: echo "" ;endif; ?>

				<!--<div class="col-sm-4 wenz">
				           <div class="neir row1">
				            <div class="neirong1"><a href="#" class="n1a">扶持政策</a></div>
				            <div class="neirong2"><a href="<?php echo leuu('list/index',array('id'=>8));?>" class="n2a">更多>></a></div>
				           </div>
				              <div class="neiro row2">
				                <?php $lists = sp_sql_posts_paged("cid:8;order:post_date DESC;",7); ?>
				                <ul class="ul1">
				                <?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
				                  <li class="li1"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" class="a1"><?php echo ($vo["post_title"]); ?></a>
				                  <span class="span1"><?php echo ($vo["post_date"]); ?></span>
				                  </li><?php endforeach; endif; else: echo "" ;endif; ?>
				                </ul>
				              </div>
				     </div>
				     <div class="col-sm-4 wenz">
				
				       <div class="neir row1">
				            <div class="neirong1"><a href="#" class="n1a">法治动态</a></div>
				            <div class="neirong2"><a href="<?php echo leuu('list/index',array('id'=>9));?>" class="n2a">更多>></a></div>
				           </div>
				              <div class="neiro row2">
				                <?php $lists = sp_sql_posts_paged("cid:9;order:post_date DESC;",7); ?>
				                <ul class="ul1">
				                <?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
				                  <li class="li1"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" class="a1"><?php echo ($vo["post_title"]); ?></a>
				                  <span class="span1"><?php echo ($vo["post_date"]); ?></span>
				                  </li><?php endforeach; endif; else: echo "" ;endif; ?>
				                </ul>
				              </div>
				     </div>
				     <div class="col-sm-4 wenz">
				           <div class="neir row1">
				            <div class="neirong1"><a href="#" class="n1a">风险防控</a></div>
				            <div class="neirong2"><a href="<?php echo leuu('list/index',array('id'=>10));?>" class="n2a">更多>></a></div>
				           </div>
				              <div class="neiro row2">
				                <?php $lists = sp_sql_posts_paged("cid:10;order:post_date DESC;",7); ?>
				                <ul class="ul1">
				                <?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
				                  <li class="li1"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" class="a1"><?php echo ($vo["post_title"]); ?></a>
				                  <span class="span1"><?php echo ($vo["post_date"]); ?></span>
				                  </li><?php endforeach; endif; else: echo "" ;endif; ?>
				                </ul>
				              </div>
				      </div>
				     <div class="col-sm-4 wenz">
				
				       <div class="neir row1">
				            <div class="neirong1"><a href="#" class="n1a">股权纠纷</a></div>
				            <div class="neirong2"><a href="<?php echo leuu('list/index',array('id'=>11));?>" class="n2a">更多>></a></div>
				           </div>
				              <div class="neiro row2">
				                <?php $lists = sp_sql_posts_paged("cid:11;order:post_date DESC;",7); ?>
				                <ul class="ul1">
				                <?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
				                  <li class="li1"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" class="a1"><?php echo ($vo["post_title"]); ?></a>
				                  <span class="span1"><?php echo ($vo["post_date"]); ?></span>
				                  </li><?php endforeach; endif; else: echo "" ;endif; ?>
				                </ul>
				              </div>
				     </div>
				     <div class="col-sm-4 wenz">
				          <div class="neir row1">
				            <div class="neirong1"><a href="#" class="n1a">制度范本</a></div>
				            <div class="neirong2"><a href="<?php echo leuu('list/index',array('id'=>12));?>" class="n2a">更多>></a></div>
				           </div>
				              <div class="neiro row2">
				                <?php $lists = sp_sql_posts_paged("cid:12;order:post_date DESC;",7); ?>
				                <ul class="ul1">
				                <?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
				                  <li class="li1"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" class="a1"><?php echo ($vo["post_title"]); ?></a>
				                  <span class="span1"><?php echo ($vo["post_date"]); ?></span>
				                  </li><?php endforeach; endif; else: echo "" ;endif; ?>
				                </ul>
				              </div>
				     </div>
				     <div class="col-sm-4 wenz">
				
				       <div class="neir row1">
				            <div class="neirong1"><a href="#" class="n1a">法律文书</a></div>
				            <div class="neir"class="neirong2"><a href="<?php echo leuu('list/index',array('id'=>13));?>" class="n2a">更多>></a></div>
				           </div>
				              <div class="neiro row2">
				                <?php $lists = sp_sql_posts_paged("cid:13;order:post_date DESC;",7); ?>
				                <ul class="ul1">
				                <?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
				                  <li class="li1"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" class="a1"><?php echo ($vo["post_title"]); ?></a>
				                  <span class="span1"><?php echo ($vo["post_date"]); ?></span>
				                  </li><?php endforeach; endif; else: echo "" ;endif; ?>
				                </ul>
				              </div>
				     </div>
				     <div class="col-sm-4 wenz">
				
				           <div class="neir row1">
				            <div class="neirong1"><a href="#" class="n1a">法律讲座</a></div>
				            <div class="neirong2"><a href="<?php echo leuu('list/index',array('id'=>14));?>" class="n2a">更多>></a></div>
				           </div>
				              <div class="neiro row2">
				                <?php $lists = sp_sql_posts_paged("cid:14;order:post_date DESC;",7); ?>
				                <ul class="ul1">
				                <?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
				                  <li class="li1"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" class="a1"><?php echo ($vo["post_title"]); ?></a>
				                  <span class="span1"><?php echo ($vo["post_date"]); ?></span>
				                  </li><?php endforeach; endif; else: echo "" ;endif; ?>
				                </ul>
				              </div>
				     </div>
				     <div class="col-sm-4 wenz">
				
				       <div class="neir row1">
				            <div class="neirong1"><a href="#" class="n1a">案例分析</a></div>
				            <div class="neirong2"><a href="<?php echo leuu('list/index',array('id'=>15));?>" class="n2a">更多>></a></div>
				           </div>
				              <div class="neiro row2">
				                <?php $lists = sp_sql_posts_paged("cid:15;order:post_date DESC;",7); ?>
				                <ul class="ul1">
				                <?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
				                  <li class="li1"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" class="a1"><?php echo ($vo["post_title"]); ?></a>
				                  <span class="span1"><?php echo ($vo["post_date"]); ?></span>
				                  </li><?php endforeach; endif; else: echo "" ;endif; ?>
				                </ul>
				              </div>
				     </div>-->

			</div>

		</div>
		<!--top-->
		<div class="text-center">
			<div class="red">
				<p class="text-center" id="footer_nav">
					<a href="index.html">平台首页</a> |
					<a target="_blank" href="#">联系我们</a> |
					<a target="_blank" href="#">技术支持</a>
				</p>
			</div>

			<p class="text-center">主办单位：山东省中小企业局　　 指导单位：中华人民共和国工业和信息化部中小企业司</p>
			<p class="text-center">
				承办单位：山东省中小企业信息中心 邮箱:
				<a target="_Blank" href="#">smesd@smesd.gov.cn</a>
				<a target="_Blank" href="#">门户管理</a>
				<a target="_Blank" href="#">业务管理</a>
			</p>
			<p class="text-center">
				<a href="#">鲁ICP备06016837号</a>
			</p>
		</div>

	</body>

</html>