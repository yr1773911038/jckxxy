<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap - Prebuilt Layout</title>

<!-- Bootstrap -->
<link href="/lcservice/themes/simplebootx/Public/css/bootstrap_1.css" rel="stylesheet">


<style>
.classification li{
	list-style:none;float: left;
	margin:8px;

	}
	
.classification a{color:#000000; text-decoration:none; font-size:small;}
.classification a:hover {color:#e92725;
}

.btn-default{width:40%;}
.btn{padding: 7px 12px;
    margin-bottom: 8px;}

.comp a{color:#000000; text-decoration:none;}
.comp a:hover {color:#e92725;
}


.nav-pills li{
	color:none;
	list-style:none;

	font-weight:bold;
	font-size:89%;
background:#e92725;


	}


.nav-pills a{
	color:#FFFFFF;
	border-color:blue;
	
	margin-left:-5px;
margin-right:-5px;
	} 

/*@media screen and (max-width: 900px) and (min-width:0px){
  .container{padding: 0;}
}*/

</style>





</head>
<body>


<div  style=" width:1800px;height:40px;background:#e92725;">
 <div class="container">
<p class="text-center" style="font-size:smaller;color:#FFFFFF;display:inline;">
欢迎访问聊城市中小企业公共服务平台 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ·关于我们 ·首页 ·联系我们&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <img src="/lcservice/themes/simplebootx/Public/images/sinawechat.png" width="94" height="19" alt=""/></p></div>
</div>




<br>
<br>

 <div class="container"><!--containerline2-->
 <div class="row">
 <div class="col-md-8"><!--md-8-->
<img src="/lcservice/themes/simplebootx/Public/images/title.png" class="img-responsive" alt=""/>
</div><!--md-8-->
 <div class="col-md-4"><!--md-4-->
<!--search--><br>
<br><br>

 <div class="input-group" >
               <input type="text" class="form-control" placeholder="请输入关键字..." style="width:80%;">
                 
                   <a href="#"><img style="margin-left:2%;margin-top:-1%;" src="/lcservice/themes/simplebootx/Public/images/sear.png" width="35" height="35" alt=""/></a>
                 
              
            </div><!-- /input-group -->
            </div><!--md-4-->

</div><!--row-->

</div><!--containerline2-->

<div class="container"><!--containerline3-->
<div class="row">

<div class="col-md-8"><!--icn+head col-md-8-->

<br>
<br>


<nav class="navbar navbar-default" role="navigation">
   <div class="navbar-header hidden-lg hidden-md" style="background:#e92725">
      <button style="background:#e92725" type="button" class="navbar-toggle" data-toggle="collapse" 
         data-target="#example-navbar-collapse">
         <span class="sr-only">切换导航</span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
      </button>
     <h4 class="hidden-lg hidden-md hidden-sm" style="color:#FFFFFF;font-weight:bold;margin-top:4%;margin-left:3%;">站点导航</h4>
   </div>

 <div class="collapse navbar-collapse" id="example-navbar-collapse">
<div style="background-color:#FFFFFF;"><!--navi-->
<ul class="nav nav-pills nav-justified" style="padding:12px;">
  <li style="" role="presentation"><a href="<?php echo leuu('portal/page/index',array('id'=>21));?>">首页</a></li>
<!--  portal&m=page&a=index&id=21
-->  <li role="presentation"><a href="#">服务荟萃</a></li>
  <li role="presentation"><a href="<?php echo leuu('portal/page/index',array('id'=>21));?>">电子商务</a></li>
  <li role="presentation"><a href="<?php echo leuu('portal/page/index',array('id'=>21));?>">信息化</a></li>
  <li role="presentation"><a href="<?php echo leuu('portal/page/index',array('id'=>21));?>">融资服务</a></li>
  <li role="presentation"><a href="<?php echo leuu('portal/page/index',array('id'=>21));?>">培训服务</a></li>
  <li role="presentation"><a href="<?php echo leuu('page/index',array('id'=>71));?>">管理咨询</a></li>
  <li role="presentation"><a href="<?php echo leuu('page/index',array('id'=>74));?>">法律服务</a></li>
  <li role="presentation"><a href="<?php echo leuu('page/index',array('id'=>72));?>">技术创新</a></li>
  <li role="presentation"><a href="<?php echo leuu('page/index',array('id'=>73));?>">担保服务</a></li>
</ul>
</div></div>
</nav><!--navi-->
	
<!--classification-->

  <div style="margin-top:5%" >
<div >

<h5 style="border:1px solid #ccc; ">相关筛选</h5>
<ul class="classification"  style="float:left;border:1px solid #ccc;"><li style="margin-bottom:0% ;font-size:small;"> 服务类型：</li><li><a href="#">&nbsp;&nbsp;全&nbsp;部&nbsp;&nbsp;</a></li><li><a href="#">技术创新</a></li><li><a href="#">人才培训</a></li><li><a href="#">市场开拓</a></li><li><a href="#">管理咨询</a></li><li><a href="#">融资担保</a></li><li><a href="#">法律服务</a></li><li><a href="#">信息服务</a></li><li><a href="#">创业服务</a></li><li><a href="#">节能减排</a></li><li><a href="#">其他服务</a></li></ul>
</div>
<div style="">
<ul class="classification"  style="float:left;border:1px solid #ccc;"><li style="margin-bottom:0%;font-size:small;">服务地区：</li><li><a href="#">&nbsp;全&nbsp;部&nbsp;</a></li>
  <li><a href="#">省直属</a></li><li><a href="#">济南市</a></li><li><a href="#">青岛市</a></li><li><a href="#">淄博市</a></li><li><a href="#">枣庄市</a></li><li><a href="#">东营市</a></li><li><a href="#">烟台市</a></li><li><a href="#">潍坊市</a></li><li><a href="#">济宁市</a></li><li><a href="#">泰安市</a></li><li><a href="#">威海市</a></li><li><a href="#">日照市</a></li><li><a href="#">莱芜市</a></li><li><a href="#">临沂市</a></li><li><a href="#">德州市</a></li><li><a href="#">聊城市</a></li><li><a href="#">滨州市</a></li><li><a href="#">菏泽市</a></li></ul> 
</div>
</div>
 
 <div class="visible-lg" style="width:auto;height: 180px;"></div>
 <div class="visible-xs" style="width:auto;height:260px;"></div>
 <div class="visible-sm" style="width:auto;height:160px;"></div>
  <div class="visible-md" style="width:auto;height:200px;"></div>


 <div class="list-group" style="margin-top: 0%;">


<?php $result=sp_sql_posts_paged_bykeyword("服务","",6); ?>

<?php if(is_array($result['posts'])): $i = 0; $__LIST__ = $result['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
<a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" class="list-group-item "><img style="float:right; margin:0%;" src="/lcservice/themes/simplebootx/Public/images/i want apply.png" width="91" height="22" alt=""/>
    <h4 class="list-group-item-heading"><?php echo ($vo["post_title"]); ?></h4>
    <p class="list-group-item-text"><?php echo (msubstr($vo["post_excerpt"],0,256)); ?><br><?php echo ($vo["post_date"]); ?></p>
</a><?php endforeach; endif; else: echo "" ;endif; ?>
</div>

<div class="list-group">
<?php $result=sp_sql_posts_paged_bykeyword("技术","",3); ?>

<?php if(is_array($result['posts'])): $i = 0; $__LIST__ = $result['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>



  <a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" class="list-group-item ">
    <h4 class="list-group-item-heading"><?php echo ($vo["post_title"]); ?> &nbsp;<?php echo ($vo["post_date"]); ?></h4>
    <p class="list-group-item-text"><?php echo (msubstr($vo["post_excerpt"],0,256)); ?> <p class="text-right" style="color:#e92725;font-weight:bold;"> 受理中</p></p>
  </a><?php endforeach; endif; else: echo "" ;endif; ?>
  </div>

<div>
<nav style="position:relative;">
	
  <ul class="pagination" style=" display:inline;position:absolute;top:30px; left: 65px;bottom: 20px;">
    <li class=" hidden-xs"  ><a href="#" >首页<span class="sr-only">(current)</span></a></li>
    <li ><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo; 上一页</span></a></li>
    <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
    <li ><a href="#">2 <span class="sr-only">(current)</span></a></li>
    <li><a href="#">3 <span class="sr-only">(current)</span></a></li>
    <li ><a href="#">4 <span class="sr-only">(current)</span></a></li>
    <li class=" hidden-xs"><a href="#">5 <span class="sr-only">(current)</span></a></li>
    <li class=" hidden-xs"><a href="#">6 <span class="sr-only">(current)</span></a></li>
    <li class=" hidden-xs"><a href="#">7 <span class="sr-only">(current)</span></a></li>
      <li class="hidden-sm hidden-xs"><a href="#">8 <span class="sr-only">(current)</span></a></li>
    <li class="hidden-sm hidden-xs"><a href="#">9 <span class="sr-only">(current)</span></a></li>
    <li class="hidden-sm hidden-xs"><a href="#">10 <span class="sr-only">(current)</span></a></li>    
    <li ><a href="#" aria-label="next"><span aria-hidden="true">下一页 &raquo;</span></a></li>
    <li class=" hidden-xs" ><a href="#">尾页<span class="sr-only">(current)</span></a></li>
  </ul>

</nav>
 
  </div>


<br>


</div><!--col-md-8-->

<div class="col-md-4"><!--icn+head col-md-4-->


<div style="margin-top:25%;" ><!--open service trip-->
<p><img src="/lcservice/themes/simplebootx/Public/images/open trip.png" width="118" height="25" alt=""/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span class="glyphicon glyphicon-question-sign" aria-hidden="true">
</span><small style="font-weight:bold;">服务</small></p>
<button type="button" class="btn btn-default">注册</button>
<button type="button" class="btn btn-default">登录</button><br>
<button type="button" class="btn btn-default" ><img  style="margin-left:-10%;margin-top:-1%;"src="/lcservice/themes/simplebootx/Public/images/green.png" width="25" height="25" alt=""/>发布服务</button>
<button type="button" class="btn btn-default"><img  style="margin-left:-10%;margin-top:-1%;"src="/lcservice/themes/simplebootx/Public/images/red.png" width="25" height="25" alt=""/>申请服务</button><br>
<button type="button" class="btn btn-default" style="width:82%"><img  style="margin-left:-10%;margin-top:-1%;"src="/lcservice/themes/simplebootx/Public/images/yellow.png" width="25" height="25" alt=""/>服务活动采集系统</button>
</div>

<br><br>




<div ><!--list count-->
<div class="visible-xs"><!--xs-->
<ul id="myTab" class="nav nav-tabs" style=" background: #e92725 ;width:105%;margin-bottom:5%;margin-top:5%;margin-right:1%" >
   <li style="font-size:x-small" class="active"><a href="#1" data-toggle="tab">累计服务</a></li>
   <li style="font-size:x-small;"><a href="#2" data-toggle="tab">当年新增</a></li>
   <li style="font-size:x-small;"><a href="#3" data-toggle="tab">服务分布</a></li>
   <li style="font-size:x-small;"><a href="#4" data-toggle="tab">企业分布</a></li>
</ul>
</div>
<div class="visible-sm"><!--sm-->
<ul id="myTab" class="nav nav-tabs" style=" background: #e92725 ;width:46%;margin-bottom:5%;margin-top:5%;margin-right:1%" >
   <li style="font-size:x-small" class="active"><a href="#1" data-toggle="tab">累计服务</a></li>
   <li style="font-size:x-small;"><a href="#2" data-toggle="tab">当年新增</a></li>
   <li style="font-size:x-small;"><a href="#3" data-toggle="tab">服务分布</a></li>
   <li style="font-size:x-small;"><a href="#4" data-toggle="tab">企业分布</a></li>
</ul>
</div>
<div class="visible-md"><!--md-->
<ul id="myTab2" class="nav nav-tabs" style=" background: #e92725 ;width:112%;margin-bottom:5%;margin-top:5%;margin-right:1%" >
   <li style="font-size:x-small" class="active"><a href="#1" data-toggle="tab">累计服务</a></li>
   <li style="font-size:x-small;"><a href="#2" data-toggle="tab">当年新增</a></li>
   <li style="font-size:x-small;"><a href="#3" data-toggle="tab">服务分布</a></li>
   <li style="font-size:x-small;"><a href="#4" data-toggle="tab">企业分布</a></li>
</ul>
</div><!--md-->
<div class="visible-lg"><!--pc-->
<ul id="myTab 1" class="nav nav-tabs" style=" background: #e92725 ;width:100%;margin-bottom:10%;margin-top:10%;" >
   <li class="active" style="width: 25%;"><a href="#1" data-toggle="tab">累计服务</a></li>
   <li style="width: 25%;"><a href="#2" data-toggle="tab">当年新增</a></li>
   <li style="width: 25%;"><a href="#3" data-toggle="tab">服务分布</a></li>
   <li style="width: 25%;"><a href="#4" data-toggle="tab">企业分布</a></li>
</ul>
</div><!--pc-->
<div id="myTabContent" class="tab-content">
   <div class="tab-pane fade in active" id="1" >
      <p >&nbsp;&nbsp;&nbsp;服务项目数量：100 <br><br>&nbsp;&nbsp;&nbsp;服务活动数量：2000  <br><br>&nbsp;&nbsp;&nbsp;入驻企业数量：200000 <br><br>&nbsp;&nbsp;&nbsp;入驻机构数量：100000 </p>
      
   </div>
   <div class="tab-pane fade" id="2">
      <p>&nbsp;&nbsp;&nbsp;服务项目数量:1630000  <br><br>&nbsp;&nbsp;&nbsp;服务活动数量:280000 <br><br>&nbsp;&nbsp;&nbsp;入驻企业数量:1060000 <br><br>&nbsp;&nbsp;&nbsp;入驻机构数量:23</p>
   </div>
   <div class="tab-pane fade" id="3">
      <p>&nbsp;&nbsp;&nbsp;人才与培训服务 :14570000  <br><br>&nbsp;&nbsp;&nbsp;技术创新和质量服务 :1410000 <br><br>&nbsp;&nbsp;&nbsp;管理咨询服务:274000 <br><br>&nbsp;&nbsp;&nbsp;市场开拓服务:8998</p>
   </div>
   <div class="tab-pane fade" id="4">
      <p>&nbsp;&nbsp;&nbsp;菏泽市:4640000  <br><br>&nbsp;&nbsp;&nbsp;莱芜市:590000 <br><br>&nbsp;&nbsp;&nbsp;济南市:8710000 <br><br>&nbsp;&nbsp;&nbsp;淄博市:3480000 <br><br>&nbsp;&nbsp;&nbsp;枣庄市:2390000 <br><br>&nbsp;&nbsp;&nbsp;东营市:2480000  <br><br>&nbsp;&nbsp;&nbsp;烟台市:8210000  <br><br>&nbsp;&nbsp;&nbsp;潍坊市:1702</p>
   </div>
</div>
</div><!--list count-->

<div>



<ul id="myTab2" class="nav nav-tabs visible-xs" style=" background: #e92725 ;width:77.5%;margin-right:0px;margin-bottom:;margin-top:15%;">
   <li class="active" style="font-size:x-small;"><a href="#01" data-toggle="tab">最新加入的企业</a></li>
    <li style="font-size:x-small;"><a href="#02" data-toggle="tab">最新加入的机构</a></li>
</ul>



<ul id="myTab2" class="nav nav-tabs visible-sm" style=" background: #e92725 ;width:34%;margin-right:0px;margin-bottom:;margin-top:15%;">
   <li class="active" style="font-size:x-small;"><a href="#01" data-toggle="tab">最新加入的企业</a></li>
    <li style="font-size:x-small;"><a href="#02" data-toggle="tab">最新加入的机构</a></li>
</ul>




<ul id="myTab2" class="nav nav-tabs visible-md" style=" background: #e92725 ;width:83%;margin-right:0px;margin-bottom:;margin-top:15%;">
   <li class="active" style="font-size:x-small;"><a href="#01" data-toggle="tab">最新加入的企业</a></li>
    <li style="font-size:x-small;"><a href="#02" data-toggle="tab">最新加入的机构</a></li>
</ul>


<ul id="myTab2" class="nav nav-tabs visible-lg" style=" background: #e92725 ;width:100%;margin-right:0px;margin-bottom:;margin-top:15%;">
   <li class="active" style="font-size:small; width: 50%;"><a href="#01" data-toggle="tab">最新加入的企业</a></li>
    <li style="font-size:small;width: 50%;"><a href="#02" data-toggle="tab">最新加入的机构</a></li>
</ul>




<div id="myTabContent2" class="tab-content">
   <div class="tab-pane fade in active" id="01">
    <ul class="comp">
   <li style="list-style:none;"><br></li>
<li><a href="#">山东省地矿测绘院</a></li>
<li><a href="#">山东宏泰物业发展有限公司</a></li>
<li><a href="#">山东山大华天科技集团股份有限公司</a></li>
<li><a href="#">山东华森建筑消防项目管理有限公司</a></li>
<li><a href="#">济南时代试金仪器有限公司</a></li>
	</ul>

    </div>
   <div class="tab-pane fade" id="02">
    <ul  class="comp">
 <li style="list-style:none;"><br></li>
<li><a href="#">山东省地矿院</a></li>
<li><a href="#">山东宏泰物业限公司</a></li>
<li><a href="#">山东山大华天股份有限公司</a></li>
<li><a href="#">山东华森建筑目管理有限公司</a></li>
<li><a href="#">济南时代试有限公司</a></li>
	</ul>
   </div>
</div></div>


</div> <!--col-md-4-->



</div><!--row-->
</div><!--container line3-->

<div style="width:100%;height:60px;%;background:#e92725;margin-top:10%;margin-bottom:0%;"><!--down #e92725-->
  </div>


<p class="text-center hidden-xs" style="font-size:120%;color:#FFFFFF" ><strong style="position:relative;top:-45px;">为中小企业提供“找得着、用得起、有保障”的一站式服务</strong></p>

<p class="text-center visible-xs" style="font-size:120%;color:#FFFFFF" ><strong style="position:relative;top:-52px;">为中小企业提供“找得着、用得起、有保障”的一站式服务</strong></p>


  

  <div class="row" style=" margin-top:7%;"><!--end-->
    <div class="text-center col-md-6 col-md-offset-3">
      <small>主办单位：山东省中小企业局 指导单位中华人民共和国工业和信息化部中小企业司 承办单位：山东省中小企业信息中心  </small><br>
      <small>邮箱：smesd@smesd.gov.cn</small><img style="margin-left:8%" src="/lcservice/themes/simplebootx/Public/images/mail.png" width="263" height="27" alt=""/><br><small>鲁ICP备06016837号 </small>
    </div>
  </div>


<script src="/lcservice/themes/simplebootx/Public/js/jquery.min.js"></script>
<script src="/lcservice/themes/simplebootx/Public/js/bootstrap.min.js"></script>



</body>
</html>