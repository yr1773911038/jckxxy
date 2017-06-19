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
     <li><a href="<?php echo U('Moneycardadmin/index');?>">工资卡管理</a></li>
     <li ><a href="<?php echo U('Moneycardadmin/add');?>">添加工资卡</a></li>
          <li class="active"><a href="<?php echo U('Moneycardadmin/importExcel');?>">导入工资卡</a></li>
  </ul>
  <form method="post" action="<?php echo U('Moneycardadmin/importExcelSave');?>" enctype="multipart/form-data" > 

  <div class="table_full">
      <table width="100%" cellpadding="2" cellspacing="2"> 

        <tr>
          <th>所在公司</th>
          <td>
              <select name="companyid" id="companyid" class="normal_select"> 
                <option value="">请选择</option>
                <?php echo ($select_categorys); ?>
              </select>

          </td>
        </tr>
        <tr>
          <th>所属银行</th>
          <td>
              <select name="ssyhid" id="ssyhid" class="normal_select"> 
                <option value="">请选择</option>
                <?php echo ($select_org_categorys); ?>
              </select>

          </td>
        </tr>
      
        
        <tr>
          <th>选择Excel</th>
          <td>
          	<input type="file" name="import" /><br />
          </td>
        </tr>
      </table>
        <input type="hidden" class="input" name="companyname" id="companyname"  value="" />
        <input type="hidden" class="input" name="ssyhmc" id="ssyhmc"  value="" />
  </div>
    <div class="form-actions">
        <button type="submit" class="btn btn-primary btn_submit  J_ajax_submit_btn">提交</button>
        <a class="btn" href="/zjw/index.php/Gzgl/Moneycardadmin">返回</a>
    </div>
    </form>
</div>
<script src="/zjw/statics/js/common.js"></script>
</body>
</html>