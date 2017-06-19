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
     <li><a href="<?php echo U('Projectadmin/index');?>">工程项目管理</a></li>
     <li class="active"><a href="<?php echo U('Projectadmin/edit');?>">添加项目</a></li>
  </ul>
  <form class="form-horizontal J_ajaxForm" action="<?php echo U('Projectadmin/update');?>" method="post" id="myform">
  <div class="table_full">
      <table width="100%" cellpadding="2" cellspacing="2">
        <input type="hidden" name="projectid" value="<?php echo ($_GET['id']); ?>" class="input" style="width:300px;" />
        <tr>
          <th width="180">项目名称</th>
          <td><input type="text" name="projectname" value="<?php echo ($vo["projectname"]); ?>" class="input" id="projectname" style="width:500px;">  </input></td>
        </tr>
        <tr>
          <th>项目描述</th>
          <td><textarea name="xmjj" rows="2" cols="20" id="xmjj" class="inputtext" style="height:100px;width:500px;"><?php echo ($vo["xmjj"]); ?></textarea></td>
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
          <td><input type="text" name="xmzh" value="<?php echo ($vo["xmzh"]); ?>" class="input" id="xmzh" style="width:500px;"/></td>
        </tr>
        <tr>
          <th width="180">工人数量</th>
          <td><input type="text" name="grsl" value="<?php echo ($vo["grsl"]); ?>" class="input" id="grsl" style="width:100px;"/></td>
        </tr>
        <tr>
          <th width="180">总造价</th>
          <td><input type="text" name="zj" value="<?php echo ($vo["zj"]); ?>" class="input" id="zj" style="width:100px;"/></td>
        </tr>
        <tr>
          <th width="180">开工日期</th>
          <td width="230"><input type="text" name="xmkssj" id="xmkssj" value="<?php echo ($vo["xmkssj"]); ?>" size="21" class="input length_3 J_date" style="width: 100px;"> </input></td>  
        </tr>               
        <tr>
          <th>所属银行</th>
          <td>
             <select name="ssyhid" id="ssyhid" class="normal_select"> 
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
   
         <?php $dw_status_active_true=($vo['xm_status'] ==1)?"checked":""; ?>
         <?php $dw_status_active_false=($vo['xm_status'] ==0)?"checked":""; ?>
 
        <tr>
          <th>是否开启</th>
          <td>
            <label class="radio inline" for="active_true">
                <input type="radio" name="xm_status" value="1" <?php echo ($dw_status_active_true); ?> id="dw_status_active_true"/>开启
            </label>
            <label class="radio inline" for="active_false">
                <input type="radio" name="xm_status" value="0" <?php echo ($dw_status_active_false); ?> id="dw_status_active_false"/>禁止
            </label>
          </td>
        </tr>
      </table>

        <input type="hidden" name="id" value="<?php echo ($vo["id"]); ?>" />
        <input type="hidden" class="input" name="ssyhmc" id="ssyhmc"  value="<?php echo ($vo["ssyhmc"]); ?>" />
        <input type="hidden" class="input" name="ssqymc" id="ssqymc"  value="<?php echo ($vo["ssqymc"]); ?>" />
        <input type="hidden" class="input" name="sgfmc" id="sgfmc"   value="<?php echo ($vo["sgfmc"]); ?>"/>
        <input type="hidden" class="input" name="ssdwmc" id="ssdwmc"   value="<?php echo ($vo["ssdwmc"]); ?>" /> 
  </div>
    <div class="form-actions">
        <button type="submit" class="btn btn-primary btn_submit  J_ajax_submit_btn">提交</button>
        <a class="btn" href="/zjw/index.php/Jcsj/Projectadmin">返回</a>
    </div>  
  </form> 
      
    
       <table class="table table-hover table-bordered">
       <!--   <input type="text" name="projectid" value="<?php echo ($_GET['id']); ?>" class="input" style="width:300px;" />-->
                <caption> 项目标段</caption>

                <thead>
                    <tr>
                         <th width="30">ID</th>
                 
                         <th align="left">标段名称</th>
                         <th align="left">所属银行</th>
                         <th align="left">银行账号</th>                     
                         <th width="40">状态</th>
		         <th width="120">操作</th>
               
                            <?php $url = $_GET['id']; ?>
		            <th width="120"><a href="<?php echo U('Bdadmin/add',array('projectid'=>$url));?>">添加</a></th>

                    </tr>
                </thead>    
            <tbody>
                    <!--<?php $listbd = M("projectsbd")->select(); ?>-->
		    <?php if(is_array($list_bd)): foreach($list_bd as $key=>$vo): ?><tr>
						<td><?php echo ($vo["id"]); ?></td>
                                            
                                                <td><?php echo ($vo["bdmc"]); ?></td>
                                                <td><?php echo ($vo["ssyhmc"]); ?></td>						
						<td><?php echo ($vo["yhzh"]); ?></td>                                                                                                                         
						<td>
							<?php if($vo['bd_status'] == 1): ?><font color="red">√</font>
							<?php else: ?> 
								<font color="red">╳</font><?php endif; ?>
						</td>	
                                                <td>                                                        
						        <a href="<?php echo U('Bdadmin/edit',array('id'=>$vo['id']));?>">修改</a> | 
							<a class="J_ajax_del" href="<?php echo U('Bdadmin/delete',array('id'=>$vo['id']));?>">删除</a>
                                                </td>   
                                                <td></td>
		        </tr><?php endforeach; endif; ?>
	    </tbody>
         </table> 
            
            
            <table class="table table-hover table-bordered">
            <caption> 项目联系人</caption>    
            <thead>
                    <tr>
                         <th width="30">ID</th>
                         <th align="left">类别</th>
                         <th align="left">姓名</th>
                         <th align="left">联系方式</th>
                         <th width="40">状态</th>
		         <th width="120">操作</th>
                         
                         <?php $url = $_GET['id']; ?>
                         <th width="120"><a href="<?php echo U('Ryadmin/add',array('projectid'=>$url));?>">添加</a></th>
                    </tr>
            </thead>
            <tbody>
                    <!--<?php $listlxr = M("projectsry")->select(); ?>-->
		    <?php if(is_array($list_ry)): foreach($list_ry as $key=>$vo): ?><tr>
						<td><?php echo ($vo["id"]); ?></td>
						<td><?php echo ($vo["rylb"]); ?></td> 
						<td><?php echo ($vo["name"]); ?></td>                                              
                                                <td><?php echo ($vo["lxfs"]); ?></td>                                                                               
						<td>
							<?php if($vo['ry_status'] == 1): ?><font color="red">√</font>
							<?php else: ?> 
								<font color="red">╳</font><?php endif; ?>
						</td>	
                                               <td>                                                       
						        <a href="<?php echo U('Ryadmin/edit',array('id'=>$vo['id']));?>">修改</a> | 
							<a class="J_ajax_del" href="<?php echo U('Ryadmin/delete',array('id'=>$vo['id']));?>">删除</a>
                                                </td>   
                                                <td></td>
		        </tr><?php endforeach; endif; ?>
	    </tbody>
        </table> 
</div>
<script src="/zjw/statics/js/common.js"></script>
</body>
</html>