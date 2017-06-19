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
      $('#projectids').change(function(){
        var id =  $("#projectids").find("option:selected").val(); //获取切换的类别的id
        
        //alert(url);
        $.post('/zjw/index.php/Bzjgl/Jsfadmin/ld1',{id:id},function(data){
        
        //var bdmc = data[1].length;
        //redata = data.replace(/s/, 'a');
        $("#bdmc").show().html(data);
        //alert(redata);
        //alert(bdmc);
        });

      });


      $('#bdmc').change(function(){
        var bdmc =  $("#bdmc").find("option:selected").text(); //获取切换的类别的id
        //alert(url);
        $.post('/zjw/index.php/Bzjgl/Jsfadmin/ld2',{bdmc:bdmc},function(data){
        var data = data.substr(5);//去掉srray
        //var bdmc = data[1].length;
        //redata = data.replace(/s/, 'a');
        //$("#yhzh").show().html($dataaa);
         $('#yhzh').html(data);
        //alert();
        //alert(dataaa);
        });

      });
      });         
       </script>       
</head>
<body class="J_scroll_fixed">
<div class="wrap J_check_wrap">
  <ul class="nav nav-tabs">
     <li><a href="<?php echo U('Jsfadmin/index');?>">开发商保证金管理</a></li>
     <li class="active"><a href="<?php echo U('Jsfadmin/add');?>">添加保证金</a></li>
  </ul>
  <form class="form-horizontal J_ajaxForm" action="<?php echo U('Jsfadmin/update');?>" method="post" id="myform">
  <div class="table_full">
      <table width="100%" cellpadding="2" cellspacing="2">
          <tr>
            <th width="180">项目名称</th>
            <td>
              <select id="projectids" name="projectid" class="normal_select"> 
                <option value="">请选择</option>
                <?php echo ($select_categorys); ?>
              </select>
            </td>
          </tr>
          <tr>
            <th width="180">标段名称</th>
            <td>
              <select name="bdmc" id="bdmc" class="normal_select"> 
                <option value=""><?php echo ($vo["bdmc"]); ?></option>
               
              </select>
            </td>
          </tr>
          <tr>
            <th width="180">标段所属银行账户</th>
              <td>
                <div id="yhzh"><?php echo ($vo["yhzh"]); ?></div>
                <!--<select id="yhzh" name="yhzh" class="normal_select" style="border-style: none;appearance:none;-moz-appearance:none; /* Firefox */-webkit-appearance:none; /* Safari 和 Chrome */"></select>--> 
              </td>
            </tr> 
          <tr>
       <!-- <tr>
           <th width="180">项目名称</th>
          <td>
              <select name="projectid" class="normal_select"> 
                <option value="">请选择</option>
                <?php echo ($select_categorys); ?>
                </select>
           </td>
        </tr> -->
        <tr>
          <th width="180">工程总造价</th>
          <td><input type="text" name="gczzj" value="<?php echo ($vo["gczzj"]); ?>" class="input" id="gczzj" style="width:200px;">  </input></td>
        </tr>
          <tr>
          <th width="180">保证金比例</th>
          <td><input type="text" name="bzjbl" value="<?php echo ($vo["bzjbl"]); ?>" class="input" id="bzjbl" style="width:50px;">  </input>%</td>
        </tr>
          <tr>
          <th width="180">保证金金额</th>
          <td><input type="text" name="bzjje" value="<?php echo ($vo["bzjje"]); ?>" class="input" id="bzjje" style="width:200px;">  </input></td>
        </tr>
          <tr>
          <th width="180">保证金缴纳时间</th>
          <td>
              <input type="text" name="bzjjnsj" class="input length_2 J_date" value="<?php echo ($vo["bzjjnsj"]); ?>" style="width:100px;" autocomplete="off"></td>
        </tr>
       <tr>
          <th width="180">农民工工资发放比例</th>
          <td><input type="text" name="nmggzffbl" value="<?php echo ($vo["nmggzffbl"]); ?>" class="input" id="nmggzffbl" style="width:200px;">  </input></td>
        </tr>
          <tr>
          <th width="180">农民工工资发放金额</th>
          <td><input type="text" name="nmggzffje" value="<?php echo ($vo["nmggzffje"]); ?>" class="input" id="nmggzffje" style="width:200px;">  </input></td>
        </tr>
          <tr>
          <th width="180">工期</th>
          <td><input type="text" name="gq" value="<?php echo ($vo["gq"]); ?>" class="input" id="gq" style="width:200px;">  </input></td>
        </tr>
          <tr>
          <th width="180">每期应缴金额</th>
          <td><input type="text" name="mqyjje" value="<?php echo ($vo["mqyjje"]); ?>" class="input" id="mqyjje" style="width:80px;">  </input></td>
        </tr>
          <tr>
          <th width="180">已缴纳期数</th>
          <td><input type="text" name="yjnqs" value="<?php echo ($vo["yjnqs"]); ?>" class="input" id="yjnqs" style="width:80px;">  </input></td>
        </tr>

      </table>

      <input type="hidden" name="id" value="<?php echo ($vo["id"]); ?>" />

        <input type="hidden" class="input" name="ssyhmc" id="ssyhmc"  value="<?php echo ($vo["ssyhmc"]); ?>" />
          <input type="hidden" name="shenhe" value="0" />           
  </div>
    <div class="form-actions">
        <button type="submit" class="btn btn-primary btn_submit  J_ajax_submit_btn">提交</button>
        <a class="btn" href="/zjw/index.php/Bzjgl/Jsfadmin">返回</a>
    </div>
    </form>
</div>
<script src="/zjw/statics/js/common.js"></script>
</body>
</html>