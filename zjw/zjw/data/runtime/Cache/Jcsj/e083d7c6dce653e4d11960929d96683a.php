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
			<li class="active"><a href="<?php echo U('Projectadmin/index');?>">工程项目管理</a></li>
			<li><a href="<?php echo U('Projectadmin/add');?>">添加项目</a></li>
		</ul>
                <form action="<?php echo U('Projectadmin/search');?>" method="post" id="form">
                        <input type="text" name="projectname1" value="" class="input" id="projectname1" style="width:200px" placeholder="请输入项目名称"> 
                        <button type="submit" class="btn btn-primary btn_submit  J_ajax_submit_btn">查询</button>
                </form>
		<form name="myform" action="<?php echo U('Projectadmin/index');?>" method="post">
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
					    <th width="30">ID</th>
					    <th align="left">项目名称</th>
			                    <th align="left">项目描述</th>                                           
                                            <th align="left">所属区域</th>
                                            <th align="left">所属银行</th>
                                            <th align="left">项目账户</th>
                                            <th align="left">工人数量</th>
                                            <th align="left">总造价</th>
                                            <th align="left">开工日期</th>                                           
                                            <th align="left">开发商</th>
                                            <th align="left">施工方</th>
					    <th width="40">状态</th>
					    <th width="100">操作</th>
					</tr>
				</thead>
				<tbody>
					<?php if(is_array($lists)): foreach($lists as $key=>$vo): ?><tr>
						<td><?php echo ($vo["id"]); ?></td>
						<td>
							<a href="<?php echo U('Projectadmin/read',array('id'=>$vo['id']));?>"><?php echo ($vo["projectname"]); ?></a> 
						</td>
						<td><?php echo ($vo["xmjj"]); ?></td>                                              
                                                <td><?php echo ($vo["ssqymc"]); ?></td>
                                                <td><?php echo ($vo["ssyhmc"]); ?></td>
                                                <td><?php echo ($vo["xmzh"]); ?></td>
                                                <td><?php echo ($vo["grsl"]); ?></td>
                                                <td><?php echo ($vo["zj"]); ?></td>
                                                <td><?php echo ($vo["xmkssj"]); ?></td>                                                                                          
                                                <td><?php echo ($vo["jsfmc"]); ?></td>
                                                <td><?php echo ($vo["sgfmc"]); ?></td>
						<td>
							<?php if($vo['xm_status'] == 1): ?><font color="red">√</font>
							<?php else: ?> 
								<font color="red">╳</font><?php endif; ?>
						</td>
						<td> 
						        <a href="<?php echo U('Projectadmin/edit',array('id'=>$vo['id']));?>">修改</a> | 
							<a class="J_ajax_del" href="<?php echo U('Projectadmin/delete',array('id'=>$vo['id']));?>">删除</a>
                                                </td>        
					</tr><?php endforeach; endif; ?>
				</tbody>
			</table>

			<div class="pagination"><?php echo ($page); ?></div>
		</form>
	</div>
	<script src="/zjw/statics/js/common.js"></script>
</body>
</html>