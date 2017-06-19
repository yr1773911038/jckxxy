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
<style>
.home_info li em {
float: left;
width: 100px;
font-style: normal;
}
li {
list-style: none;
}

</style>
</head>

<body>
<div class="wrap">
  <div id="home_toptip"></div>
   
  <h4 class="well">待办事项</h4>
  <div class="home_info">
  <ul class="nav nav-tabs">
            <li ><a href="<?php echo U('Admin/Main/index');?>">项目标段模块</a></li>
            <li class="active"><a href="<?php echo U('Admin/Main/index_bzj');?>">保证金模块</a></li>
            <li ><a href="<?php echo U('Admin/Main/index_qt');?>">其他模块</a></li>
        </ul>

            <table class="table table-hover table-bordered">
                <thead>
                    <tr>
                        <th width="30">ID</th>
                        <th align="left">项目名称</th>
                                            <th align="left">标段名称</th>
                                                <th align="left">开发商名称</th>
                        <th align="left">缴纳银行</th>
                                                <th align="left">银行账号</th>
                                                <th align="left">工程总造价</th>
                                            <th align="left">保证金金额</th>
                                            <th align="left">保证金缴纳时间</th>
                                            <th align="left">工资支付归属日期</th>
                                                <th align="left">保证金比例</th>
                                                <th align="left">农民工工资发放比例</th>
                                            <th align="left">备注</th>
                        <th width="120">审核</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if(is_array($lists)): foreach($lists as $key=>$vo): ?><tr>
                        <td><?php echo ($vo["id"]); ?></td>
                        <td><a href="<?php echo U('Bzjgl/Shadmin/index');?>"><?php echo ($vo["xmmc"]); ?></a></td>
                                            <td><?php echo ($vo["bdmc"]); ?></td>    
                                                <td><?php echo ($vo["jsfmc"]); ?></td>     
                        <td><?php echo ($vo["ssyhmc"]); ?></td>
                                                <td><?php echo ($vo["yhzh"]); ?></td>
                                                <td><?php echo ($vo["gczzj"]); ?></td>
                                            <td><?php echo ($vo["bzjje"]); ?></td>
                                            <td><?php echo ($vo["bzjjnsj"]); ?></td>
                                            <td><?php echo ($vo["gzzfgsrq"]); ?></td>
                                                <td><?php echo ($vo["bzjbl"]); ?></td>
                                                <td><?php echo ($vo["nmggzffbl"]); ?></td>
                                            <td><?php echo ($vo["bz"]); ?></td>   
                                            <td>未审核</td>  
                               
                           
                    </tr><?php endforeach; endif; ?>
                </tbody>
            </table>

            <div class="pagination"><?php echo ($page); ?></div>
  </div>
  
</div>
<script src="/zjw/statics/js/common.js"></script> 
</body>
</html>