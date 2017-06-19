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
	   $("#projectids").change(function(){  
         $("#projectname").val ($(this).children('option:selected').text());
      });

	$('#projectids').change(function(){
		var id =  $("#projectids").find("option:selected").val(); //获取切换的类别的id
		
		//alert(url);
		$.post('/zjw/index.php/Gzgl/Workeradmin/ld1',{id:id},function(data){
		
		//var bdmc = data[1].length;
		//redata = data.replace(/s/, 'a');
		$("#bdmc").show().html(data);
		//alert(redata);
		//alert(bdmc);
		});

	});




	});         
	</script>       
</head>
<body class="J_scroll_fixed">
<div class="wrap J_check_wrap">
  <ul class="nav nav-tabs">
     <li><a href="<?php echo U('Workeradmin/index');?>">工人管理</a></li>
     <li class="active"><a href="<?php echo U('Workeradmin/add');?>">添加工人</a></li>
      <li><a href="<?php echo U('Workeradmin/importExcel');?>">导入工人</a></li>
  </ul>
  <form class="form-horizontal J_ajaxForm" action="<?php echo U('Workeradmin/insert');?>" method="post" id="myform">
  <div class="table_full">
      <table width="100%" cellpadding="2" cellspacing="2">
        <tr>
          <th width="180">姓名</th>
          <td><input type="text" name="xm" value="" class="input" id="xm" style="width:100px;">  </input><span class="must_red">*</span></td>
        </tr>
        <tr>
          <th width="180">身份证号</th>
          <td><input type="text" name="sfzh" value="" class="input" id="sfzh" style="width:300px;">  </input><span class="must_red">*</span></td>
        </tr>
       

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
          <th width="180">所在项目</th>
          <td>
               <select id="projectids" name="projectid" class="normal_select"> 
                <option value="">请选择</option>
                <?php echo ($select_categorys1); ?>
                </select>
          </td>
        </tr>
        <tr>
          <th width="180">所在标段</th>
          <td>
               <select name="bdmc" id="bdmc" class="normal_select"> 
             		  
                </select>
          </td>
        </tr>
      
        
        <tr>
          <th>是否开启</th>
          <td>
          	<label class="radio inline" for="active_true">
            		<input type="radio" name="user_status" value="1" checked id="dw_status_active_true"/>开启
            </label>
            <label class="radio inline" for="active_false">
            		<input type="radio" name="user_status" value="0" id="dw_status_active_false">禁止
            </label>
          </td>
        </tr>
      </table>
        <input type="hidden" class="input" name="companyname" id="companyname"  value="" />
		 <input type="hidden" class="input" name="projectname" id="projectname"  value="" />
  </div>
    <div class="form-actions">
        <button type="submit" class="btn btn-primary btn_submit  J_ajax_submit_btn">提交</button>
        <a class="btn" href="/zjw/index.php/Gzgl/Workeradmin">返回</a>
    </div>
    </form>
</div>
<script src="/zjw/statics/js/common.js"></script>
</body>
</html>