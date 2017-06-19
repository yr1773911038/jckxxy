<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
	<title><?php echo ($name); ?> <?php echo ($seo_title); ?> <?php echo ($site_name); ?></title>
	<meta name="keywords" content="<?php echo ($seo_keywords); ?>" />
	<meta name="description" content="<?php echo ($seo_description); ?>">
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
</head>
<body>
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

<div class="container">
	
	
    <div class="pg-opt pin">
        <div class="container">
            <h2><?php echo ($name); ?></h2>
        </div>
    </div>
    
    <div class="container">
        <div>
             <?php $lists = sp_sql_posts_paged("cid:$cat_id;order:post_date DESC;",20); ?>
             <div id="container">
             	<div class="grid-sizer"></div>
             	<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
             	 
                <div class="item">
					<div class="tc-gridbox">
                        <div class="header">
                            
                      	<?php if(!empty($smeta['thumb'])): ?><div class="item-image">
                      		<a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>">
								<img  src="<?php echo sp_get_asset_upload_path($smeta['thumb']);?>" class="img-responsive" alt="<?php echo ($vo["post_title"]); ?>">
							</a>
						</div>
                      	<?php else: endif; ?>
                     
                            <h3><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></h3>
                            <hr>
                        </div>
                        <div class="body">
                        	<a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo (msubstr($vo["post_excerpt"],0,256)); ?></a>
                        </div>
                        <div class="footer">
                        	<div class="pull-left"><span class="meta"><?php echo ($vo["post_date"]); ?></span></div>
                        	<div class="pull-right">
	                        	<a href="javascript:;"><i class="fa fa-eye"></i><span><?php echo ($vo["post_hits"]); ?></span></a>
								<a href="<?php echo U('article/do_like',array('id'=>$vo['object_id']));?>" class="js-count-btn"><i class="fa fa-thumbs-up"></i><span class="count"><?php echo ($vo["post_like"]); ?></span></a>
								<a href="<?php echo U('user/favorite/do_favorite',array('id'=>$vo['object_id']));?>" class="js-favorite-btn" data-title="<?php echo ($vo["post_title"]); ?>" data-url="<?php echo U('portal/article/index',array('id'=>$vo['tid']));?>" data-key="<?php echo sp_get_favorite_key('posts',$vo['object_id']);?>">
									<i class="fa fa-star-o"></i>
								</a>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
                </div><?php endforeach; endif; else: echo "" ;endif; ?>
               </div>
             <div class="pagination">
              <ul>
                  <?php echo ($lists['page']); ?>
              </ul>
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
 
 
</div>

    
<!-- JavaScript -->
<script type="text/javascript">
//全局变量
var GV = {
    DIMAUB: "",
    JS_ROOT: "/cmf/public/js/",
    TOKEN: ""
};
</script>
<!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/cmf/public/js/jquery.js"></script>
    <script src="/cmf/public/js/wind.js"></script>
    <script src="/cmf/themes/demo/Public/simpleboot/bootstrap/js/bootstrap.min.js"></script>
    <script src="/cmf/public/js/frontend.js"></script>
	<script>
	$(function(){
		$('body').on('touchstart.dropdown', '.dropdown-menu', function (e) { e.stopPropagation(); });
		
		$("#main-menu li.dropdown").hover(function(){
			$(this).addClass("open");
		},function(){
			$(this).removeClass("open");
		});
		
		$.post("<?php echo U('user/index/is_login');?>",{},function(data){
			if(data.status==1){
				if(data.user.avatar){
					$("#main-menu-user .headicon").attr("src",data.user.avatar.indexOf("http")==0?data.user.avatar:"/cmf/data/upload/avatar/"+data.user.avatar);
				}
				
				$("#main-menu-user .user-nicename").text(data.user.user_nicename!=""?data.user.user_nicename:data.user.user_login);
				$("#main-menu-user li.user.login").show();
				
			}
			if(data.status==0){
				$("#main-menu-user li.user.offline").show();
			}
			
		});	
		;(function($){
			$.fn.totop=function(opt){
				var scrolling=false;
				return this.each(function(){
					var $this=$(this);
					$(window).scroll(function(){
						if(!scrolling){
							var sd=$(window).scrollTop();
							if(sd>100){
								$this.fadeIn();
							}else{
								$this.fadeOut();
							}
						}
					});
					
					$this.click(function(){
						scrolling=true;
						$('html, body').animate({
							scrollTop : 0
						}, 500,function(){
							scrolling=false;
							$this.fadeOut();
						});
					});
				});
			};
		})(jQuery); 
		
		$("#backtotop").totop();
		
		
	});
	</script>


 <script src="/cmf/themes/demo/Public/js/imagesloaded.pkgd.min.js"></script>
    <script src="/cmf/themes/demo/Public/js/masonry.pkgd.min.js"></script>
	<script>
	var $container=$('#container').masonry({
		  columnWidth: '.grid-sizer',
		  itemSelector: '.item'
		});
	// layout Masonry again after all images have loaded
	$container.imagesLoaded( function() {
	  $container.masonry();
	});
	
	</script>
</body>
</html>