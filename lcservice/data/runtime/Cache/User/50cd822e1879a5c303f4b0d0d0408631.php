<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<title><?php echo ($site_name); ?></title>
<meta name="keywords" content="<?php echo ($site_seo_keywords); ?>" />
<meta name="description" content="<?php echo ($site_seo_description); ?>">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="/lcservice/themes/simplebootx/Public/css/bootstrap.css" rel="stylesheet">
<link href="/lcservice/themes/simplebootx/Public/css/user_reg.css" rel="stylesheet">
<link href="/lcservice/themes/simplebootx/Public/css/user_register_btn.css" rel="stylesheet">
<link href="/lcservice/themes/simplebootx/Public/css/layout.css" rel="stylesheet">

</head>

<body >
	<div id="header" class="navbar navbar-fixed-top">
		<div class="wraper">
			<div class="pull-left hidden-phone">
				今天是
				<script type="text/javascript">
					var d = new Date();
					document.write(d.getFullYear() + '年' + (d.getMonth() + 1)
							+ '月' + d.getDate() + '日')
				</script>2016年3月2日
				<iframe scrolling="no" allowtransparency="true" style="vertical-align: middle;" src="http://i.tianqi.com/index.php?c=code&amp;id=11&amp;color=%23000000&amp;icon=4" width="280" frameborder="0" height="18"></iframe>
			</div>	
			
			<!-- <a style="float:right; height: 20px;line-height: 20px; margin-right: 10px; margin-top: 6px;padding-left: 20px;" target="_blank" href="http://accounts.smesd.gov.cn/register/registerServicesAct_show.jspx">注册</a> -->
			<a href="<?php echo U('User/Login/index');?>">
				<span class="btn btn-primary btn-step" style="float:right; background:#AE1108; border:1px solid #950905;  padding:0px 10px; margin-top:5px; margin-right:2px;" type="button">
					登录
				</span>
			</a>
			<a class="reg_ptsy2014" href="./">平台首页</a>		
		</div>
	</div>
	
	
	<div id="body-center">
			<div id="topbanner"></div>
			<ul class="breadcrumb">
				<li>当前位置：</li>
				<li class="active">选择注册会员类型</li>
			</ul>
			<!-- 
			<div style="text-align:right;margin-top:5px;margin-bottom:-25px;">
				<input type="button" class="btn" value="登录" onclick="location.href='http://www.qiban365.com/'">
			</div>
			 -->
			<div class="text-center" id="agreement">
				<div class="rgcontent" style="height:370px;">
			    
					<div>
					 <div class="regleft">
				    	<p><a href="<?php echo U('user/Register/user_register');?>" class="blink"></a></p>
			        	<p>
				        	<strong>专享特权：</strong><br>
				          	1、享受平台提供的电子商务、融资、信息化产品定制、管理咨询、网络培训、法律援助、信息共享、技术创新、信用担保等服务；<br>
							2、优享平台提供的扶持政策；<br> 
							3、发布服务需求、产品供求、招聘等信息；<br>
							4、大批采购，价格再优惠。
							<br>
							<strong>申请条件</strong>： <br>
							能够提供合法营业执照的单位或公司。
						</p>
			        </div><!--regleft结束-->
			   
				  <div class="regcenter">
				    <p><a href="<?php echo U('user/Register/user_register');?>" class="jlink"></a></p>
			        <p><strong>专享特权：</strong><br>
			          1、享受平台提供的电子商务、融资、信息化产品定制、管理咨询、网络培训、法律援助、信息共享、技术创新、信用担保等服务；<br>
			2、优享平台提供的扶持政策；<br>
			3、发布服务项目，服务需求、产品供求、招聘等信息；<br>
			4、大批采购，价格再优惠。
			<br>
			<strong>申请条件</strong>： <br>
			能够提供合法的营业执照，并拥有为企事业单位、社会团体、个体工商户、个人等提供信息、融资、管理咨询、创业辅导、人才与培训、技术创新、法律援助、市场开拓等专项或多项服务资质的机构或单位。</p>
			       
			        </div><!--regleft结束-->
					
		
			        
				  <div class="regright">
				    <p><a href="<?php echo U('user/Register/user_register');?>" class="alink"></a></p>
			        
			        <p><strong>会员特权：</strong><br>
			          1、享受平台提供的电子商务、融资、信息化产品定制、管理咨询、网络培训、法律援助、信息共享、技术创新等服务；<br>
			2、发布服务需求、投放简历；<br>
			3、平台一般用户等级管理办法中相应权利。
			<br>
			<br>
			<strong>申请条件</strong>： <br>
			具备完全民事权利能力和完全民事行为能力的自然人。
			</p>
			      </div><!--regright结束-->
   	  <div class="ptcrl"></div></div>
        
           </div>
			</div>
	</div>		
	
	<div style="height: 20px;"></div>
	<div id="footer">
	<div class="wraper">
<!--		<p class="text-center" id="footer_nav"><a href="#" target="_blank">平台介绍</a> <a href="#" target="_blank">注册说明</a> <a href="#" target="_blank">企服通使用说明</a> <a href="#" target="_blank">网站地图</a> <a href="#" target="_blank">联系我们</a></p>-->
		<p class="text-center">主办单位：聊城市中小企业局　指导单位：中华人民共和国工业和信息化部中小企业司 承办单位:聊城市中小企业信息中心</p>
		<p class="text-center"> 鲁ICP备16000887号</p>
<!--		<p class="text-center"><img src="/themes/wuhan/images/layout/footer_icons.png" /></p>-->
	</div>
</div>
	
	
	
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