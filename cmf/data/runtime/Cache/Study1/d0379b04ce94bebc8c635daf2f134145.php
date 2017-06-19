<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<!-- Set render engine for 360 browser -->
	<meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- HTML5 shim for IE8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->

	<link href="/cmf/public/simpleboot/themes/<?php echo C('SP_ADMIN_STYLE');?>/theme.min.css" rel="stylesheet">
    <link href="/cmf/public/simpleboot/css/simplebootadmin.css" rel="stylesheet">
    <link href="/cmf/public/js/artDialog/skins/default.css" rel="stylesheet" />
    <link href="/cmf/public/simpleboot/font-awesome/4.4.0/css/font-awesome.min.css"  rel="stylesheet" type="text/css">
    <style>
		.length_3{width: 180px;}
		form .input-order{margin-bottom: 0px;padding:3px;width:40px;}
		.table-actions{margin-top: 5px; margin-bottom: 5px;padding:0px;}
		.table-list{margin-bottom: 0px;}
	</style>
	<!--[if IE 7]>
	<link rel="stylesheet" href="/cmf/public/simpleboot/font-awesome/4.4.0/css/font-awesome-ie7.min.css">
	<![endif]-->
<script type="text/javascript">
//全局变量
var GV = {
    DIMAUB: "/cmf/",
    JS_ROOT: "public/js/",
    TOKEN: ""
};
</script>
<!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/cmf/public/js/jquery.js"></script>
    <script src="/cmf/public/js/wind.js"></script>
    <script src="/cmf/public/simpleboot/bootstrap/js/bootstrap.min.js"></script>
<?php if(APP_DEBUG): ?><style>
		#think_page_trace_open{
			z-index:9999;
		}
	</style><?php endif; ?>
 
</head>
<body class="J_scroll_fixed">
<div class="wrap J_check_wrap">
  <ul class="nav nav-tabs">
    <li><a  href="<?php echo U('Study1/Index/index');?>">学生信息查询</a></li>
      <li  class="active"><a>新增</a></li>
  </ul>
  <form class="form-horizontal J_ajaxForm" action="<?php echo U('Study1/Index/insert');?>" method="post" id="myform">
  <div class="table_full">
      <table width="100%" cellpadding="2" cellspacing="2">
        <tr>
          <th width="180">姓名</th>
          <td><input type="text" name="xm" value="" class="input" id="xm" style="width:100px;">  </input><span class="must_red">*</span></td>
        </tr>
        <tr>
          <th width="180">年龄</th>
          <td><input type="text" name="nl" value="" class="input" id="nl" style="width:300px;">  </input><span class="must_red">*</span></td>
        </tr>
       
         <tr>
          <th width="180">学校</th>
          <td><input type="text" name="xx" value="" class="input" id="xx" style="width:300px;">  </input><span class="must_red">*</span></td>
        </tr>
          <tr>
          <th width="180">简介</th>
          <td><textarea name="jj" rows="2" cols="20" id="jj" class="inputtext" style="height:100px;width:500px;"></textarea></td>
        </tr>
 
      </table>
        <input type="hidden" class="input" name="companyname" id="companyname"  value="" />
  </div>
    <div class="form-actions">
        <button type="submit" class="btn btn-primary btn_submit  J_ajax_submit_btn">提交</button>
        <a class="btn" href="/cmf/index.php/Study1/Index">返回</a>
    </div>
    </form>
</div>
<script src="/cmf/statics/js/common.js"></script>
</body>
</html>