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
<body>
	<div class="wrap">
		<ul class="nav nav-tabs">
			<li class="active"><a>内容信息列表</a></li>
			<li><a href="<?php echo U('Content/Index/add');?>">新增</a></li>
		</ul>
		<form action="<?php echo U('Content/Index/search');?>" method="post" id="form">
            <input type="text" name="title" value="" class="input" id="title" style="width:180px;" placeholder="按照内容标题查找">  </input>
            <input type="text" name="title1" value="" class="input" id="title1" style="width:180px;"  placeholder="按照内容关键字查找">  </input>
            <input type="text" name="title2" value="" class="input" id="title2" style="width:180px;" placeholder="按照内容状态查找">  </input>
			<button type="submit" class="btn btn-primary btn_submit  J_ajax_submit_btn">提交</button>
		<form method="post" class="js-ajax-form">
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th align="center">内容ID</th>
						<th>内容标题</th>
						<th>内容关键字</th>
						<th>内容信息</th>
						<th>内容分类</th> 
						<th>内容状态</th> 
						<th align="center">操作</th>
					</tr>
				</thead>
				<tbody>
					<?php if(is_array($lists)): foreach($lists as $key=>$vo): ?><tr>
						<td align="center"><?php echo ($vo["id"]); ?></td>
						<td><?php echo ($vo["title"]); ?></td>
						<td><?php echo ($vo["keyword"]); ?></td>  
						<td><?php echo ($vo["news"]); ?></td>
						<td><?php echo ($vo["type"]); ?></td>
						<td><?php echo ($vo["state"]); ?></td>
						<td align="center">
						 	<a href="<?php echo U('Content/Index/edit',array('id'=>$vo['id']));?>">修改</a>
							<a href="<?php echo U('Content/Index/delete',array('id'=>$vo['id']));?>" onclick="if(!confirm('确实要删除？')){return false;};"title="删除">删除</a>
						</td>
					</tr><?php endforeach; endif; ?>
				</tbody> 
			</table>
			<div class="pagination"><?php echo ($page); ?></div>
		</form>
	</div>
	<script src="/cmf/public/js/common.js"></script>
</body>
</html>