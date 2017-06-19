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
.tab-content{overflow: visible;}

.uploaded_avatar_area{
	margin-top: 20px;
}
.uploaded_avatar_btns{
	margin-top: 20px;
}
.uploaded_avatar_area .uploaded_avatar_btns{display: none;}
</style>
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
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">个人资料</strong> / <small>Personal information</small></div>
    </div>

    <hr/>

    <div class="am-g">

      <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
        <div class="am-panel am-panel-default">
          <div class="am-panel-bd">
            <div class="am-g">
              <div class="am-u-md-4">
              <?php if(empty($avatar)): ?><img src="/lcservice/themes/simplebootx//Public/images/headicon_128.png" class="headicon"/>
			   <?php else: ?>
			   	<img src="<?php echo sp_get_user_avatar_url($avatar);?>?t=<?php echo time();?>" class="headicon"/><?php endif; ?>
              
              
              
              </div>
              <div class="tab-content">
                   <div class="tab-pane active" id="one">
                   		
                   		<input type="file" onchange="avatar_upload(this)" id="avatar_uploder"  name="file"/>
                   		<div class="uploaded_avatar_area">
                   		
                   		<div class="uploaded_avatar_btns">
                   			<a class="btn btn-primary confirm_avatar_btn" onclick="update_avatar()">确定</a>
                   			<a class="btn" onclick="reloadPage()">取消</a>
                   		</div>
                   		</div>
                   </div>
               </div>
            </div>
          </div>
        </div>


      </div>

      <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
        <form class="am-form am-form-horizontal" action="<?php echo U('profile/custom_edit_post');?>" method="post">
          <div class="am-form-group">
            <label for="user-name" class="am-u-sm-3 am-form-label">姓名 / Name</label>
            <div class="am-u-sm-9">
              <input type="text" id="input-user_nicename" name="user_nicename" placeholder="姓名 / Name" value="<?php echo ($user_nicename); ?>">
            </div>
          </div>

          <div class="am-form-group">
            <label for="user-email" class="am-u-sm-3 am-form-label">性别 / Sex</label>
            <div class="am-u-sm-9">
            	<?php $sexs=array("0"=>"保密","1"=>"程序猿","2"=>"程序媛"); ?>
              	<select data-am-selected="{btnSize: 'sm'}" id="input-sex" name="sex">
	              <?php if(is_array($sexs)): foreach($sexs as $key=>$vo): $sexselected=$key==$sex?"selected":""; ?>
					<option value="<?php echo ($key); ?>" <?php echo ($sexselected); ?>><?php echo ($vo); ?></option><?php endforeach; endif; ?>
	            </select>
            </div>
          </div>

          <div class="am-form-group">
            <label for="user-phone" class="am-u-sm-3 am-form-label">电话 / Telephone</label>
            <div class="am-u-sm-9">
              <input type="email" id="user-phone" placeholder="输入你的电话号码 / Telephone">
            </div>
          </div>

          <div class="am-form-group">
            <label for="user-QQ" class="am-u-sm-3 am-form-label">QQ</label>
            <div class="am-u-sm-9">
              <input type="email" id="user-QQ" placeholder="输入你的QQ号码">
            </div>
          </div>

          <div class="am-form-group">
            <label for="user-weibo" class="am-u-sm-3 am-form-label">微博 / Twitter</label>
            <div class="am-u-sm-9">
              <input type="email" id="user-weibo" placeholder="输入你的微博 / Twitter">
            </div>
          </div>

          <div class="am-form-group">
            <label for="user-intro" class="am-u-sm-3 am-form-label">简介 / Intro</label>
            <div class="am-u-sm-9">
              <textarea class="" rows="5" id="input-signature" name="signature" placeholder="输入个人简介"><?php echo ($signature); ?></textarea>
              <small>250字以内写出你的一生...</small>
            </div>
          </div>

          <div class="am-form-group">
            <div class="am-u-sm-9 am-u-sm-push-3">
              <button type="submit" class="am-btn am-btn-primary">保存修改</button>
            </div>
          </div>
        </form>
      </div>
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


	<script type="text/javascript">
	function update_avatar(){
		var area=$(".uploaded_avatar_area img").data("area");
		$.post("<?php echo U('profile/avatar_update');?>",area,
				function(data){
			if(data.status==1){
				reloadPage(window);
			}
			
		},"json");
		
	}
	function avatar_upload(obj){
		var $fileinput=$(obj);
		/* $(obj)
		.show()
		.ajaxComplete(function(){
			$(this).hide();
		}); */
		Wind.css("jcrop");
		Wind.use("ajaxfileupload","jcrop","noty",function(){
			$.ajaxFileUpload({
				url:"<?php echo U('profile/avatar_upload');?>",
				secureuri:false,
				fileElementId:"avatar_uploder",
				dataType: 'json',
				data:{},
				success: function (data, status){
					if(data.status==1){
						$("#avatar_uploder").hide();
						var $uploaded_area=$(".uploaded_avatar_area");
						$uploaded_area.find("img").remove();
						
						var $img=$("<img/>").attr("src","/lcservice/data/upload/avatar/"+data.data.file);
						$img.prependTo($uploaded_area);
						$(".uploaded_avatar_btns").show();
						$img.Jcrop({
					    	aspectRatio:1/1,
					    	setSelect: [ 0, 0, 100, 100 ],
					    	onSelect: function(c){
					    		$img.data("area",c);
					    	}
					    });
						
					}else{
						noty({text: data.info,
                    		type:'error',
                    		layout:'center'
                    	});
					}
					
				},
				error: function (data, status, e){}
			});
		});
		
		
		
		return false;
	}
</script>
</body>
</html>