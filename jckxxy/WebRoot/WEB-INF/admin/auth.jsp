<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>权限管理</title>   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/js/jquery-easyui-1.2.6/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/js/jquery-easyui-1.2.6/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery-easyui-1.2.6/locale/easyui-lang-zh_CN.js"></script>
  <script type="text/javascript">
   $(function(){
        $("#treegrid").treegrid({
    		idField:'id',
            treeField: 'text',
            title:'权限管理',
            width:'auto',
            height:'auto',
            fitColumns:true,
    		url:'priv_treeList.action',
         	onLoadSuccess:function(){
    			$("#treegrid").treegrid('expandAll');
    		},
             columns:[[
                       {
                           field:'ck',
                           width:50,
                           checkbox:true
                        },{
                           field:'id',
                           title:'编号',
                           width:20,
                           align:'center',
                           hidden:false 
                           
                       },{
                           field:'text',
                           title:'菜单名称',
                           width:100                         
                       },{
                           field:'url',
                           title:'链接地址 ',
                           width:100,
                           align:'center'
                       }
             ]],
             toolbar:'#tb'
          });
  
    });
  
  </script>
  
  <script type="text/javascript">
   

	var url ;
    function openDialog(){

    	var node = $("#treegrid").treegrid('getSelected');//选中节点
    	if(node == null){
             $.messager.alert('系统提示！','请选择一个父节点！');
             return ;
        }
        resetValue();
        $("#mydialog").dialog("open").dialog('setTitle','添加菜单');
        url = "priv_save.action?parentId="+node.id ;
    }

    function closeDialog(){
         $("#mydialog").dialog('close');
         resetValue();
    }


    function resetValue(){
		$("#id").val("");
        $("#text").val("");
        $("#url").val("");
    }
    
    function saveAuth(){
        $("#myform").form('submit',{
            url:url,
            onSubmit:function(){
                return $(this).form("validate");
            },
            success:function(result){
                if(result == 1){
                    $("#mydialog").dialog('close');
                    $("#treegrid").treegrid('reload');
                    $.messager.show({
   						title:'提示信息', 
   						msg:'保存成功！'
   					});
                 }else{
                	$("#mydialog").dialog('close');
                	$.messager.alert('系统提示',"操作失败！ ");
                 }
            }
        });    
    }

    function editAuth(){
         var node = $("#treegrid").treegrid('getSelected');
         if(node == null){
              $.messager.alert("系统提示！","请选择要修改的节点！");
              return ;
         }else{
              $("#mydialog").dialog('open');
              $("#mydialog").dialog('setTitle','修改节点信息！');
              $("#id").val(node.id);
              $("#text").val(node.text);
              $("#url").val(node.url);
              url = "priv_save.action?";
         }
    }
    
    function deleteAuth(){
    	var node = $("#treegrid").treegrid('getSelected');
    	if(node == null){
             $.messager.alert("系统提示！","请选择要删除的节点！");
             return ;
        }
        var id = node.id;
        $.messager.confirm("系统提示！","确定要删除此节点吗？",function(r){
             if(r){
                 $.post("priv_delete.action",{nodeId:id},function(result){
                      if(result == 1){
                          $.messager.alert("系统提示！","删除成功！");
                           $("#treegrid").treegrid('reload');
                      }else if(result == 2){
                           $.messager.alert("系统提示！","该节点下有子节点，请先删除子节点！");
                      }else{
                    	  $.messager.alert('系统提示',"操作失败！ ");
                      }

                 });

             }
        });
    }
  

  
  </script>
  <script type="text/javascript">
  	//添加权限
  
  </script>
  
    </head>
  <body style="margin:0px 0px;">
   <table id="treegrid"></table>
 <div id="tb"> 
	<div>
		<a href="javascript:openDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
		<a href="javascript:editAuth()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		<a href="javascript:deleteAuth()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
	</div>
</div>

<div id="mydialog" title="增加菜单" modal=true dragable=false class="easyui-dialog" closed=true  style="width:400px;height:250px;padding-top:20px;" buttons="#dlg-buttons">
    <form id="myform" method="post" enctype="multipart/form-data">
    <input type="hidden" id="id" name="id" value=""/>
  	<table cellspacing="5px;">
  		<tr>
  			<td>菜单名称：</td>
  			<td><input type="text" id="text" name="text" class="easyui-validatebox" required="true"/></td>
  			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  		</tr>
  		<tr>
  			<td>链接路径：</td>
  			<td colspan="4"><input type="text" id="url" name="url" class="easyui-validatebox" required="true"/></td>
  		</tr>
  	</table>  
    </form>
</div>

<div id="dlg-buttons">
	<a href="javascript:saveAuth()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
	<a href="javascript:closeDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>
   
  </body>
</html>
