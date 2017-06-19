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
       $("#companyid").change(function(){  
         $("#companyname").val ($(this).children('option:selected').text());
      });

        $("#ssyhid").change(function(){  
         $("#ssyhmc").val ($(this).children('option:selected').text());
      });


       });         
       </script>          
</head>
<body class="J_scroll_fixed">
<div class="wrap J_check_wrap">
  <ul class="nav nav-tabs">
     <li><a href="<?php echo U('Enregisteradmin/index');?>">上访登记管理</a></li>
     <li class="active"><a href="<?php echo U('Enregisteradmin/add');?>">上访登记</a></li>
          <!--<li><a href="<?php echo U('Enregisteradmin/importExcel');?>">批量导入上访登记</a></li>-->
  </ul>
  <form class="form-horizontal J_ajaxForm" action="<?php echo U('Enregisteradmin/update');?>" method="post" id="myform">
  <div class="table_full">
      <table width="100%" cellpadding="2" cellspacing="2">
        <tr>
          <th width="180">农民工姓名</th>
          <td width="230"><input type="text" name="xm" value="<?php echo ($vo["xm"]); ?>" class="input" id="xm" style="width:200px;"/></td>
            <th width="180">身份证号</th>
          <td><input type="text" name="cardid" value="<?php echo ($vo["cardid"]); ?>" class="input" id="cardid" style="width:200px;"/></td>
        </tr>
        <tr>
          <th width="180">联系方式</th>
          <td width="230"><input type="text" name="lxfs" value="<?php echo ($vo["lxfs"]); ?>" class="lxfs" id="Text2" style="width:200px;"/></td>
            <th width="180">人数</th>
          <td><input type="text" name="rs" value="<?php echo ($vo["rs"]); ?>" class="input" id="rs" style="width:200px;"/></td>
        </tr>
        <tr>
          <th width="180">所在项目</th>
          <td width="230"><input type="text" name="szxmmc" value="<?php echo ($vo["szxmmc"]); ?>" class="input" id="szxmmc" style="width:200px;"/></td>
            <th width="180">建设单位</th>
          <td><input type="text" name="szdwmc" value="<?php echo ($vo["szdwmc"]); ?>" class="input" id="szdwmc" style="width:200px;"/></td>
        </tr>
          <tr>
          <th width="180">从事工种</th>
          <td width="230"><input type="text" name="csgz" value="<?php echo ($vo["csgz"]); ?>" class="input" id="csgz" style="width:200px;"/></td>
            <th width="180">施工企业</th>
          <td><input type="text" name="sgqymc" value="<?php echo ($vo["sgqymc"]); ?>" class="input" id="sgqymc" style="width:200px;"/></td>
        </tr>
          <tr>
          <th width="180">工程量</th>
          <td width="230"><input type="text" name="gcl" value="<?php echo ($vo["gcl"]); ?>" class="input" id="gcl" style="width:200px;"/></td>
            <th width="180">拖欠金额</th>
          <td><input type="text" name="tqje" value="<?php echo ($vo["tqje"]); ?>" class="input" id="tqje" style="width:200px;"/></td>
        </tr>
         <tr>
          <th width="180">详细事由</th>
          <td colspan="3"><input type="text" name="xxsy" value="<?php echo ($vo["xxsy"]); ?>" class="input" id="xxsy" style="width:700px;">  </input></td>
        </tr>
          <?php $visit_status_true=($vo['visit_status'] ==1)?"checked":""; ?>
          <?php $visit_status_false=($vo['visit_status'] ==0)?"checked":""; ?>
          <?php $sfjs_true=($vo['sfjs'] ==1)?"checked":""; ?>
          <?php $sfjs_false=($vo['sfjs'] ==0)?"checked":""; ?>
          <tr>
          <th width="180">是否处理</th>
            <td>
          	<label class="radio inline" for="active_true">
            		<input type="radio" name="visit_status" <?php echo ($visit_status_true); ?> value="1" id="Radio1"/>是
            </label>
            <label class="radio inline" for="active_false">
            		<input type="radio" name="visit_status" <?php echo ($visit_status_false); ?> value="0" id="Radio2">否
            </label>
          </td>
            <th width="180">是否结清</th>
          <td>
          	<label class="radio inline" for="active_true">
            		<input type="radio" name="sfjs" value="1" <?php echo ($sfjs_true); ?> id="Radio3"/>是
            </label>
            <label class="radio inline" for="active_false">
            		<input type="radio" name="sfjs" value="0" <?php echo ($sfjs_false); ?> id="Radio4">否
            </label>
          </td>
        </tr>
          <tr>
          <th width="180">分期付款时间</th>
        </tr>
          <tr>
          <th width="180">时间一</th>
          <td width="230"><input type="text" name="sj1" id="sj1" value="<?php echo ($vo["sj1"]); ?>" size="21" class="input length_3 J_date" style="width: 100px;"> </input></td>
            <th width="180">时间二</th>
          <td><input type="text" name="sj2" id="sj2" value="<?php echo ($vo["sj2"]); ?>" size="21" class="input length_3 J_date" style="width: 100px;"> </input></td>
        </tr>
          <tr>
          <th width="180">时间三</th>
          <td width="230"><input type="text" name="sj3" id="sj3" value="<?php echo ($vo["sj3"]); ?>" size="21" class="input length_3 J_date" style="width: 100px;"> </input></td>
            <th width="180">时间四</th>
          <td><input type="text" name="sj4" id="sj4" value="<?php echo ($vo["sj4"]); ?>" size="21" class="input length_3 J_date" style="width: 100px;"> </input></td>
        </tr>
      </table>
 
      <input type="hidden" name="id" value="<?php echo ($vo["id"]); ?>" />
         <input type="hidden" class="input" name="ssyhmc" id="ssyhmc"  value="<?php echo ($vo["ssyhmc"]); ?>" />
        <input type="hidden" class="input" name="companyname" id="companyname"  value="<?php echo ($vo["companyname"]); ?>" />


        <input type="hidden" class="input" name="szdwid" id="szdwid"  value="<?php echo ($vo["szdwid"]); ?>" />
        <input type="hidden" class="input" name="sgqyid" id="sgqyid"  value="<?php echo ($vo["sgqyid"]); ?>" />
        <input type="hidden" class="input" name="szxmid" id="szxmid"  value="<?php echo ($vo["szxmid"]); ?>" />
  </div>
    <div class="form-actions">
        <button type="submit" class="btn btn-primary btn_submit  J_ajax_submit_btn">提交</button>
        <a class="btn" href="/zjw/index.php/Sfgl/Enregisteradmin">返回</a>
    </div>
    </form>
</div>
<script src="/zjw/statics/js/common.js"></script>
</body>
</html>