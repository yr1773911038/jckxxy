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
<link rel="stylesheet" href="/lcservice/themes/simplebootx/Public/css/style.css">
<link rel="stylesheet" href="/lcservice/themes/simplebootx/Public/css/userlogin.css">
<link rel="icon" type="/image/png" href="/lcservice/themes/simplebootx/Public/assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed" href="/lcservice/themes/simplebootx/Public/assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="/lcservice/themes/simplebootx/Public/assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="/lcservice/themes/simplebootx/Public/assets/css/admin.css">

<style>
    .header {
      text-align: center;
    }
    .header h1 {
      font-size: 200%;
      color: #333;
      margin-top: 30px;
    }
    .header p {
      font-size: 14px;
    }
    
  </style>
</head>

<body class="body-white2" id="jn">
	<div class="wraper">
        <div class="header"><img alt="" src="/lcservice/themes/simplebootx/Public/images/right_bg.png"></div>
        
       <div class="content">
        <!--<div class="left_bg">
         <div class="title_font">登录说明</div>
         <div>
          <p> 个人用户请勾选“个人登录”；企业与服务机构请填写“企业域”；</p>
          <p> 企业域是一个企业的唯一标识，一个企业域下可以创建多个用户，但是一个用户只能属于一个企业域；</p>
         </div>
        </div>
         -->
         <form class="form-horizontal js-ajax-forms" id="user_login_form" action="<?php echo U('user/login/dologin');?>" method="post">
         <div class="right_bg">
            <div class="ibox">
            </div>
            <div class="yhm">
            <input type="text" value="" id="input_username" name="username" maxlength="30" autocomplete="off"
             onkeydown="if(event.keyCode==13) $('#password').focus()"/></div>
            <div class="mima">
            <input type="password" id="input_password" name="password" maxlength="30" onkeydown="if(event.keyCode==13) FormSubmit()"/></div>
            <div class="iButton">
                <ul>
                    <li><a href="javascript:void(0)"  onclick="FormSubmit()" id="btn_submit" hidefocus="true" >登录</a></li>
                    <li><a class="reg" href="<?php echo U('User/Register/index');?>" id="btn_reset" hidefocus="true" >注册</a></li>
                </ul>
            </div>
            <div class="ibox">
                <span class="fb"><a href="./">返回首页</a></span>
            </div>
        </div>
        </form>
        	<!-- 用户功能提示开始 -->
        	<div  class="permission">
        		<div class="title">用户权限：</div>
        		<ul>
	        		<li>
		        		<div>
							<div class="ft">服务机构：</div>
							<div class="ml5"><p>发布服务项目</p><p>回应服务需求</p></div>
		        		</div>
	        		</li>
	        		<li>
		        		<div>
							<div class="ft">企业：</div>
							<div class="ml5"><p>发布服务需求</p><p>申请服务项目</p></div>
		        		</div>
	        		</li>
	        		<li style="margin:0;">
		        		<div>
							<div class="ft">一般用户：</div>
							<div class="ml5"><p>发布服务需求</p><p>申请服务项目</p></div>
		        		</div>
	        		</li>        		        		
				</ul>
        	</div>
        	<!-- 用户功能提示结束 -->
        </div>
        <div class="footer">
            <p>主办单位：聊城市中小企业局 指导单位：中华人民共和国工业和信息化部中小企业司 承办单位:聊城市中小企业信息中心 鲁ICP备16000887号</p>
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
				$("#leijifuwucount").text(data.count);
				$("#leijiqingqiu").text(data.count2);
				
				var doctorList=eval(data.listss); 
				$(doctorList).each(function(index) {
					var list = doctorList[index];
					var servtype;
					if(list.servtype == "1"){
						servtype = "节能减排";
					}else if(list.servtype == "2"){
						servtype = "技术创新";
					}else if(list.servtype == "3"){
						servtype = "人才培训";
					}else if(list.servtype == "4"){
						servtype = "市场开拓";
					}else if(list.servtype == "5"){
						servtype = "管理咨询";
					}else if(list.servtype == "6"){
						servtype = "融资担保";
					}else if(list.servtype == "7"){
						servtype = "法律服务";
					}else if(list.servtype == "8"){
						servtype = "信息服务";
					}else if(list.servtype == "9"){
						servtype = "创业服务";
					}else if(list.servtype == "10"){
						servtype = "其他服务";
					}
					
					
					var aa = '<tr>'+
			          '<td>'+list.enterprise+'</td>'+
			          '<td>'+servtype+'</td>'+
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


	<script language="javascript">
	FormSubmit = function (){
			$('#user_login_form').submit();
		}
	</script>
</body>
</html>