<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<title><?php echo ($site_name); ?></title>
<meta name="keywords" content="<?php echo ($site_seo_keywords); ?>" />
<meta name="description" content="<?php echo ($site_seo_description); ?>">
<meta name="author" content="聊城市中小企业局">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="/image/png" href="/lcservice/themes/simplebootx/Public/assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed" href="/lcservice/themes/simplebootx/Public/assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="/lcservice/themes/simplebootx/Public/assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="/lcservice/themes/simplebootx/Public/assets/css/admin.css">
</head>
<body class="body-white" id="top">
	<header class="am-topbar admin-header">
  <div class="am-topbar-brand">
    <strong><?php echo ($site_name); ?></strong> <small>管理中心</small>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>
  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
    <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          <span class="am-icon-users"></span><span class="am-icon-caret-down"></span>
        </a>
        <ul class="am-dropdown-content">
          <li><a href="<?php echo U('user/profile/custom_edit');?>"><span class="am-icon-user"></span> 资料</a></li>
          <li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
          <li><a href="<?php echo U('user/index/logout');?>"><span class="am-icon-power-off"></span> 退出</a></li>
        </ul>
      </li>
      <li class="am-hide-sm-only">
        <a href="<?php echo U('user/index/logout');?>" >
         <span class="admin-fullText am-icon-sign-out">注销</span></a>
      </li>
    </ul>
  </div>
</header>
	
	<div class="am-cf admin-main">
		<div class="am-cf admin-main">
  <!-- sidebar start -->
  <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
      <ul class="am-list admin-sidebar-list">
        <li><a href="<?php echo U('user/index/user_indexs_init');?>"><span class="am-icon-home"></span> 系统导航</a></li>
        <li><a href="<?php echo U('Uservice/index/index');?>" class="am-cf"><span class="am-icon-check"></span> 企业服务</a></li>
        <li><a href="<?php echo U('Uservice/index/req_service');?>"><span class="am-icon-th"></span>  企业请求</a></li>
      </ul>
      <div class=" am-panel-default " style="background-color: #FFFFFF; border-color:#F3F3F3; ">
        <div class="am-panel-bd">
          <p></p>
        </div>
      </div>
       <div class=" am-panel-default " style="background-color: #FFFFFF; border-color:#F3F3F3; ">
        <div class="am-panel-bd">
          <p></p>
        </div>
      </div>
       <div class=" am-panel-default " style="background-color: #FFFFFF; border-color:#F3F3F3; ">
        <div class="am-panel-bd">
          <p></p>
        </div>
      </div>
       <div class=" am-panel-default " style="background-color: #FFFFFF; border-color:#F3F3F3; ">
        <div class="am-panel-bd">
          <p></p>
        </div>
      </div>
       <div class=" am-panel-default " style="background-color: #FFFFFF; border-color:#F3F3F3; ">
        <div class="am-panel-bd">
          <p></p>
        </div>
      </div>
       <div class=" am-panel-default " style="background-color: #FFFFFF; border-color:#F3F3F3; ">
        <div class="am-panel-bd">
          <p></p>
        </div>
      </div>
      <div class=" am-panel-default " style="background-color: #FFFFFF; border-color:#F3F3F3; ">
        <div class="am-panel-bd">
          <p></p>
        </div>
      </div>
      <div class=" am-panel-default " style="background-color: #FFFFFF; border-color:#F3F3F3; ">
        <div class="am-panel-bd">
          <p></p>
        </div>
      </div>
     <div class=" am-panel-default " style="background-color: #FFFFFF; border-color:#F3F3F3; ">
        <div class="am-panel-bd">
          <p></p>
        </div>
      </div>
      <div class=" am-panel-default " style="background-color: #FFFFFF; border-color:#F3F3F3; ">
        <div class="am-panel-bd">
          <p></p>
        </div>
      </div>
      <div class=" am-panel-default " style="background-color: #FFFFFF; border-color:#F3F3F3; ">
        <div class="am-panel-bd">
          <p></p>
        </div>
      </div>
      <div class=" am-panel-default " style="background-color: #FFFFFF; border-color:#F3F3F3; ">
        <div class="am-panel-bd">
          <p></p>
        </div>
      </div>
      
    </div>
  </div>
		<div class="admin-content">

    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">供求信息----<?php echo ($uc_uid->user_login); ?></strong></div>
    </div>
  

    <ul class="am-avg-sm-1 am-avg-md-4 am-margin am-padding am-text-center admin-content-list ">
      <li><a href="#" class="am-text-success"><span class="am-icon-btn am-icon-file-text"></span><br/>累计服务<br/>50</a></li>
      <li><a href="#" class="am-text-warning"><span class="am-icon-btn am-icon-briefcase"></span><br/>累计请求<br/>10</a></li>
    </ul>

    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">待处理服务</strong></div>
    </div>
    <div class="am-g">
      <div class="am-u-sm-12">
        <table class="am-table am-table-bd am-table-striped admin-content-table">
          <thead>
	          <tr>
	            <th>企业名称</th><th>服务类型</th><th>请求时间</th><th>操作</th>
	          </tr>
          </thead>
          <tbody>
	          <tr>
		          <td>${list.user_name}</td>
		          <td>${list.user_time}</td>
		          <td>${list.user_time}</td>
		          <td>
	                <div class="am-btn-toolbar">
	                  <div class="am-btn-group am-btn-group-xs">
	                    <button class="am-btn am-btn-default am-btn-xs am-text-secondary">
	                    	<span class="am-icon-pencil-square-o"></span>接受
	                    </button>
	                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
	                    	<span class="am-icon-trash-o"></span>拒绝
	                    </button>
	                  </div>
	                </div>
	              </td>
	          </tr>
          </tbody>
        </table>
      </div>
    </div>
    </div>
	</div>
	<a class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
<footer style=" border-top: 1px solid #CECECE; background-color: #FFFFFF; height: 30px; " >
  <hr>
  <p class="am-padding-center" style="text-align: center;">© 2016 版权所有：聊城市中小企业局.</p>
</footer>
	
	<!--[if (gte IE 9)|!(IE)]><!-->
<script src="/lcservice/themes/simplebootx/Public/assets/js/jquery.min.js"></script>
<script src="/lcservice/themes/simplebootx/Public/assets/js/amazeui.min.js"></script>
<!--<![endif]-->
<script src="/lcservice/themes/simplebootx/Public/assets/js/app.js"></script>
	<script type="text/javascript">
//全局变量
var GV = {
    DIMAUB: "",
    JS_ROOT: "/lcservice/public/js/",
    TOKEN: ""
};
</script>
<!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/lcservice/public/js/jquery.js"></script>
    <script src="/lcservice/public/js/wind.js"></script>
    <script src="/lcservice/themes/simplebootx/Public/simpleboot/bootstrap/js/bootstrap.min.js"></script>
    <script src="/lcservice/public/js/frontend.js"></script>
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
					$("#main-menu-user .headicon").attr("src",data.user.avatar.indexOf("http")==0?data.user.avatar:"/lcservice/data/upload/avatar/"+data.user.avatar);
				}
				
				$("#main-menu-user .user-nicename").text(data.user.user_nicename!=""?data.user.user_nicename:data.user.user_login);
				$("#main-menu-user li.user.login").show();
				$(".am-icon-users").text(data.user.user_nicename!=""?data.user.user_nicename:data.user.user_login);
				
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


</body>
</html>