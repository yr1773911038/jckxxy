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
</head>
<body>
	<div class="wrap J_check_wrap">
		<ul class="nav nav-tabs">
			<li class="active"><a href="<?php echo U('Orgadmin/index');?>">银行管理</a></li>
			<li><a href="<?php echo U('Orgadmin/add');?>">添加银行</a></li>
		</ul>
            <!--查询-->
                <form action="<?php echo U('Orgadmin/search');?>" method="post" id="form">
                        <input type="text" name="dwqc1" value="" class="input" id="dwqc1" style="width:200px" placeholder="请输入单位名称"> 
                        <button type="submit" class="btn btn-primary btn_submit  J_ajax_submit_btn">查询</button>
                </form>
		<form name="myform" action="<?php echo U('Orgadmin/index');?>" method="post">
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th width="30">ID</th>
						<th align="left">名称</th>
						<th align="left">银行描述</th>
                                                <th width="300" align="left">所属区域</th>
						<th width="40" align="left">状态</th>
						<th width="120">操作</th>
					</tr>
				</thead>
				<tbody>
					<?php if(is_array($lists)): foreach($lists as $key=>$vo): ?><tr>
						<td><?php echo ($vo["id"]); ?></td>
						<td><?php echo ($vo["dwqc"]); ?></td>
						<td><?php echo ($vo["content"]); ?></td>
                                                <td><?php echo ($vo["area"]); ?></td>
						<td>
							<?php if($vo['dw_status'] == 1): ?><font color="red">√</font>
							<?php else: ?> 
								<font color="red">╳</font><?php endif; ?>
						</td>
						<td> 
							<a href="<?php echo U('Orgadmin/edit',array('id'=>$vo['id']));?>">修改</a> | 
							<a class="J_ajax_del" href="<?php echo U('Orgadmin/delete',array('id'=>$vo['id']));?>">删除</a>
					</tr><?php endforeach; endif; ?>
				</tbody>
			</table>

			<div class="pagination"><?php echo ($page); ?></div>
		</form>
	</div>
	<script src="/zjw/statics/js/common.js"></script>
</body>
</html>