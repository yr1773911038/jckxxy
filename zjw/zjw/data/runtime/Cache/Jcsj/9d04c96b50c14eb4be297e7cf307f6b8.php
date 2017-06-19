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

	<link href="/zjw/statics/simpleboot/themes/<?php echo C('SP_ADMIN_STYLE');?>/theme.min.css" rel="stylesheet">
    <link href="/zjw/statics/simpleboot/css/simplebootadmin.css" rel="stylesheet">
    <link href="/zjw/statics/js/artDialog/skins/default.css" rel="stylesheet" />
    <link href="/zjw/statics/simpleboot/font-awesome/4.2.0/css/font-awesome.min.css"  rel="stylesheet" type="text/css">
    <style>
		.length_3{width: 180px;}
		form .input-order{margin-bottom: 0px;padding:3px;width:40px;}
		.table-actions{margin-top: 5px; margin-bottom: 5px;padding:0px;}
		.table-list{margin-bottom: 0px;}
	</style>
	<!--[if IE 7]>
	<link rel="stylesheet" href="/zjw/statics/simpleboot/font-awesome/4.2.0/css/font-awesome-ie7.min.css">
	<![endif]-->
<script type="text/javascript">
//全局变量
var GV = {
    DIMAUB: "/zjw/",
    JS_ROOT: "statics/js/",
    TOKEN: ""
};
</script>
<!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/zjw/statics/js/jquery.js"></script>
    <script src="/zjw/statics/js/wind.js"></script>
    <script src="/zjw/statics/simpleboot/bootstrap/js/bootstrap.min.js"></script>
<?php if(APP_DEBUG): ?><style>
		#think_page_trace_open{
			z-index:9999;
		}
	</style><?php endif; ?>
      <script type="text/javascript"> 
   $(document).ready(function(){
           $("#ssyhid").change(function(){ 
       $("#ssyhmc").val ($(this).children('option:selected').text());

      });

       });         
       </script>             
  
</head>
<body class="J_scroll_fixed">
<div class="wrap J_check_wrap">
    <ul class="nav nav-tabs">
		
		<li class="active"><a href="<?php echo U('Bdadmin/edit');?>">标段修改</a></li>
    </ul>
    <form class="form-horizontal J_ajaxForm" action="<?php echo U('Bdadmin/update');?>" method="post" id="myform">
		
    <div class="table_full">
        <table width="100%" cellpadding="2" cellspacing="2"> 
          <tr>
            <th width="180">标段名称</th>
            <td><input type="text" name="bdmc" value="<?php echo ($vo["bdmc"]); ?>" class="input" id="bdmc" style="width:500px;"/></td>
          </tr>          
          <tr> 
            <th width="180">所属银行</th>
              <td>
                <select name="ssyhid" id="ssyhid" class="normal_select"> 
                  <option value=""><?php echo ($vo["ssyhmc"]); ?></option>
                  <?php echo ($select_categorys2); ?>
                </select>
            </td>
           <!--<input type="text" name="ssyh" value="<?php echo ($vo["ssyhmc"]); ?>" class="input" id="ssyhmc" style="width:500px;"/>--> 
          </tr>
         <!--  <tr>
            <th width="180">银行账号</th>
            <td><input type="text" name="yhzh" value="<?php echo ($vo["yhzh"]); ?>" class="input" id="yhzh" style="width:500px;"/></td>
          </tr> -->
		  <?php $dw_status_active_true=($vo['bd_status'] ==1)?"checked":""; ?>
                  <?php $dw_status_active_false=($vo['bd_status'] ==0)?"checked":""; ?>
          <tr>
          <th>是否开启</th>
            <td>
              <label class="radio inline" for="active_true">
            		<input type="radio" name="bd_status" value="1" <?php echo ($dw_status_active_true); ?>  id="dw_status_active_true"/>开启
              </label>
              <label class="radio inline" for="active_false">
            		<input type="radio" name="bd_status" value="0" <?php echo ($dw_status_active_false); ?> id="dw_status_active_false"/>禁止
              </label>
            </td>
          </tr>
        </table> 
        <input type="hidden" name="projectid" value="<?php echo ($vo["projectid"]); ?>" />
        <input type="hidden" class="input" name="ssyhmc" id="ssyhmc"  value="<?php echo ($vo["ssyhmc"]); ?>" />
	     <input type="hidden" name="id" value="<?php echo ($vo["id"]); ?>" />
    </div>

       
    <div class="form-actions">
        <button type="submit" class="btn btn-primary btn_submit  J_ajax_submit_btn">提交</button>
        <a class="btn" onclick="history.go(-1)">返回</a>
        <!--<a class="btn" href="<?php echo U('Projectadmin/edit');?>">返回</a>-->
    </div>
    </form>
</div>
<script src="/zjw/statics/js/common.js"></script>
</body>
</html>