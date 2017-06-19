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
<style type="text/css">
.am-selected-btn {
    text-align: right;
    width: 513px;
}
.am-btn-default {
    color: #444;
    border-color: #CCCCCC;
}
</style>
<script type="text/javascript">
	saveUnService = function(){
		
		var servtitle = $("#_servtitle").val();
		if (servtitle == null || "" == servtitle) {
			alert('标题不能为空!!!');
			$("#_servtitle").focus();
			return false;
		}
		
		var servtype = $("#_servtype option:selected").val();
		
		if (servtype == null || "" == servtype) {
			alert('所属不能为空!!!');
			$("#_servtype").focus();
			return false;
		}
		
		var servneirong = $("#_servneirong").val();
		if (servneirong == null || "" == servneirong) {
			alert('服务内容不能为空!!!');
			$("#_servneirong").focus();
			return false;
		}
		
		var servfangshi = $("#_servfangshi").val();
		if (servfangshi == null || "" == servfangshi) {
			alert('服务方式不能为空!!!');
			$("#servfangshi").focus();
			return false;
		}
		
		var servshoufei = $("#_servshoufei").val();
		if (servshoufei == null || "" == servshoufei) {
			alert('收费模式不能为空!!!');
			$("#_servshoufei").focus();
			return false;
		}
		
		var servflow = $("#_servflow").val();
		if (servflow == null || "" == servflow) {
			alert('收费流程不能为空!!!');
			$("#_servflow").focus();
			return false;
		}
		
		$('#addUnServiceForm').submit();
	}
		
</script>


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
		<!-- content start -->
  <div class="admin-content">

  <div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">企业服务</strong> / <small>服务信息添加</small></div>
  </div>
  <div class="am-tabs am-margin" data-am-tabs>
        <form id="addUnServiceForm" class="am-form" method="post" action="<?php echo U('uservice/index/addUnServices');?>">
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
              标题<font color="red">*</font>
            </div>
            <div class="am-u-sm-8 am-u-md-4">
              <input type="text" id="_servtitle" name="servtitle" class="am-input-sm">
            </div>
            <div class="am-hide-sm-only am-u-md-6"></div>
          </div>
        
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
              所属分类<font color="red">*</font>
            </div>
            <div class="am-u-sm-8 am-u-md-5">
              <select id="_servtype" name="servtype" data-am-selected="{btnSize: 'sm'}">
	            <option value="1">节能减排</option>
	            <option value="2">技术创新</option>
	            <option value="3">人才培训</option>
	            <option value="4">市场开拓</option>
	            <option value="5">管理咨询</option>
	            <option value="6">融资担保</option>
	            <option value="7">法律服务</option>
	            <option value="8">信息服务</option>
	            <option value="9">创业服务</option>
	            <option value="10">其他服务</option>
	          </select>
            </div>
            <div class="am-hide-sm-only am-u-md-6"></div>
          </div>


          <div class="am-g am-margin-top-sm">
            <div class="am-u-sm-8 am-u-md-2 am-text-right admin-form-text">
              服务内容<font color="red">*</font>
            </div>
            <div class="am-u-sm-8 am-u-md-5" style="float:left;">
              <textarea rows="10" id="_servneirong" name="servneirong"></textarea>
            </div>
            <div class="am-hide-sm-only am-u-md-6"></div>
          </div>
          
       
          
		<div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
              服务方式<font color="red">*</font>
            </div>
            <div class="am-u-sm-8 am-u-md-4">
              <input type="text" id="_servfangshi" name="servfangshi" class="am-input-sm">
            </div>
            <div class="am-hide-sm-only am-u-md-6"></div>
          </div>
          
        
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
              收费模式<font color="red">*</font>
            </div>
            <div class="am-u-sm-8 am-u-md-4">
              <input type="text" id="_servshoufei" name="servshoufei" class="am-input-sm">
            </div>
            <div class="am-hide-sm-only am-u-md-6"></div>
          </div>
          
         
          
          <div class="am-g am-margin-top-sm">
            <div class="am-u-sm-8 am-u-md-2 am-text-right admin-form-text">
              服务流程<font color="red">*</font>
            </div>
            <div class="am-u-sm-8 am-u-md-5" style="float:left;">
              <textarea  rows="10" id="_servflow" name="servflow"></textarea>
            </div>
            <div class="am-hide-sm-only am-u-md-6"></div>
          </div>
        </form>
  </div>

  <div class="am-margin">
    <button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="saveUnService();" >提交保存</button>
  </div>
</div>




<!-- content end -->
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
				$("#leijifuwucount").text(data.count);
				$("#leijiqingqiu").text(data.count2);
				
				var doctorList=eval(data.listss); 
				$(doctorList).each(function(index) {
					var list = doctorList[index];
					
					var aa = '<tr>'+
			          '<td>'+list.enterprise+'</td>'+
			          '<td>'+list.servtype+'</td>'+
			          '<td>'+list.starttime+'</td>'+
			          '<td>'+
		                '<div class="am-btn-toolbar">'+
		                 ' <div class="am-btn-group am-btn-group-xs">'+
		                    '<button class="am-btn am-btn-default am-btn-xs am-text-secondary">'+
		                    	'<span class="am-icon-pencil-square-o"></span>接受'+
		                   ' </button>'+
		                    '<button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">'+
		                    '	<span class="am-icon-trash-o"></span>拒绝'+
		                    '</button>'+
		                 ' </div>'+
		                '</div>'+
		              '</td>'+
		         ' </tr>';
					
					$("#fuWuGrid").html($("#fuWuGrid").html()+aa);
					
					
					
					
					
					
					
				})
				
				
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