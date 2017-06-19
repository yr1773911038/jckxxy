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
        $("#ssyhid").change(function(){ 
           $("#ssqymc").val ($(this).children('option:selected').text());

      });
      
        $("#ssdwid").change(function(){ 
           $("#ssdwmc").val ($(this).children('option:selected').text());
          });

          $("#sgfid").change(function(){ 
           $("#sgfmc").val ($(this).children('option:selected').text());
          }); 


       });         
       </script>       
</head>
<body class="J_scroll_fixed">
<div class="wrap J_check_wrap">
  <ul class="nav nav-tabs">
     <li><a href="<?php echo U('Projectadmin/index');?>">项目管理</a></li>
     <li class="active"><a href="<?php echo U('Projectadmin/add');?>">添加项目</a></li>
  </ul>
  <form class="form-horizontal J_ajaxForm" action="<?php echo U('Projectadmin/insert');?>" method="post" id="myform">
  <div class="table_full">
      <table width="100%" cellpadding="2" cellspacing="2">
        <tr>
          <th width="180">项目名称</th>
          <td><input type="text" name="projectname" value="" class="input" id="projectname" style="width:500px;"> </input></td>
        </tr>
        <tr>
          <th>项目描述</th>
          <td><textarea name="xmjj" rows="2" cols="20" id="xmjj" class="inputtext" style="height:100px;width:500px;"></textarea></td>
        </tr>

        <tr>
            <th>项目所属区域</th>
            <td>
                <select name="ssyhid" id="ssyhid"  class="normal_select"> 
                <option value="">请选择</option>
                <?php echo ($select_area); ?>
              </select>
            </td>
        </tr>    
        <tr>
          <th width="180">项目账户</th>
          <td><input type="text" name="xmzh" value="" class="input" id="xmzh" style="width:500px;"/></td>
        </tr>
        <tr>
          <th width="180">工人数量</th>
          <td><input type="text" name="grsl" value="" class="input" id="grsl" style="width:100px;"/></td>
        </tr>
        <tr>
          <th width="180">总造价</th>
          <td><input type="text" name="zj" value="" class="input" id="zj" style="width:100px;"/></td>
        </tr>
        <tr>
          <th width="180">开工日期</th>
          <td width="230"><input type="text" name="xmkssj" id="xmkssj" value="" size="21" class="input length_3 J_date" style="width: 100px;"> </input></td>  
        </tr>
         
        <tr>
          <th>所属银行</th>
          <td>
              <select name="ssyhid" id="ssyhid"  class="normal_select"> 
                <option value="">请选择</option>
                <?php echo ($select_categorys); ?>
              </select>
          </td>
        </tr>
        <tr>
            <th>开发商</th>
            <td>
                <select name="ssdwid" id="ssdwid" class="normal_select"> 
                <option value="">请选择</option>
                <?php echo ($select_company); ?>
                </select>
            </td>
        </tr>
        <tr>
            <th>施工方</th>
            <td>
                <select name="sgfid" id="sgfid" class="normal_select"> 
                <option value="">请选择</option>
                <?php echo ($select_construction); ?>
                </select>
            </td>
        </tr>
 
      
        
        <tr>
          <th>是否开启</th>
          <td>
            <label class="radio inline" for="active_true">
            		<input type="radio" name="xm_status" value="1" checked id="dw_status_active_true"/>开启
            </label>
            <label class="radio inline" for="active_false">
            		<input type="radio" name="xm_status" value="0" id="dw_status_active_false">禁止
            </label>
          </td>
        </tr>
        
      </table>
        <input type="hidden" class="input" name="ssqymc" id="ssqymc"  value="" />
        <input type="hidden" class="input" name="ssyhmc" id="ssyhmc"  value="" />
        <input type="hidden" class="input" name="sgfmc" id="sgfmc"  value="" />
        <input type="hidden" class="input" name="ssdwmc" id="ssdwmc"  value="" />            
  </div>
    
    <div class="form-actions">
        <button type="submit" class="btn btn-primary btn_submit  J_ajax_submit_btn" >提交</button>       
        <a class="btn" href="/zjw/index.php/Jcsj/Projectadmin">返回</a>
    </div>
    </form>
</div>
<script src="/zjw/statics/js/common.js"></script>
</body>
</html>