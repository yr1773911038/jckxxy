<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'news.jsp' starting page</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.2.6/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.2.6/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.2.6/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/fckeditor/fckeditor.js"></script>

	<script type="text/javascript">
	 $(function(){
	        $("#datagrid").datagrid({
	        	 idField:'id',
	        	 title:'学院领导',
	        	 url:'teacher_hlist.action',
	             width:'auto',
	             height:'auto',
	             fitColumns:true,
	             rownumbers:true,
	             pagination:true,
	             columns:[[
	                       {
	                           field:'ck',
	                           width:50,
	                           checkbox:true
	                        },{
	                           field:'id',
	                           title:'编号',
	                           width:30,
	                           align:'center',
	                           hidden:true 
	                           
	                       },{
	                           field:'name',
	                           title:'领导姓名',
	                           width:50,
	                           align:'center'
	                       },{
	                           field:'zhiwu',
	                           title:'担任职务',
	                           width:50,
	                           align:'center'
	                       },{
	                             field:'picture',
	                             title:'幻灯图片',
	                             width:100,
	                             align:'center',
	                             formatter:function(val,row){
	                                  return '<img width=100 height=100 src="${pageContext.request.contextPath}/'+val+'">';
	                             }
	                         },{
	                           field:'jianjie',
	                           title:'领导简介',
	                           width:200,
	                           align:'center',
	                           formatter:function(val,row){
	                     		   if(val.length<=10){
	                    			     return val;
	                    		   }else{
	                    			   return val.substr(0,100)+"...";			
	                    		   }

		                       }
	                           
	                       },{
	                           field:'author.id',
	                           title:'作者编号',
	                           width:20,
	                           align:'center',
	                           hidden:true,
	                           formatter:function(val,row){
	                               return row.author.id;
	                           }
	                       },{
	                           field:'author.name',
	                           title:'发布人',
	                           width:40,
	                           formatter:function(val,row){
	                                return row.author.name;
	                           },
	                           align:'center' 
	                       },{
	                           field:'uptime',
	                           title:'编辑时间',
	                           width:50,
	                           align:'center'   
	                       }
	             ]],
	             toolbar:'#tb'
	          });

	    });
	    

	 function saveTeacher() {
          $("#myform").form('submit',{
                url:'teacher_save.action',
                onSubmit:function(){
				var content=FCKeditorAPI.GetInstance("content").GetXHTML("true");
				if(content==null || content==""){
					$.messager.alert("系统提示","领导内容不能为空！");
					return false;
				}
                    return $(this).form("validate");
                },
                success:function(result){
                    if(result == 1){
	                    resetValue();
						$("#mydialog").dialog('close');
						$("#datagrid").datagrid('reload');
						$("#datagrid").datagrid('unselectAll');
						$.messager.show({
							title:'提示信息', 
							msg:'操作成功！'
						});
                    }else{
    					$("#datagrid").datagrid('unselectAll');
    					$.messager.alert('系统提示',"操作失败！ ");
                     }
				} 
              
          });
 
     }

     function editTeacher(){
    	var selectedRows=$("#datagrid").datagrid('getSelections');
    	if(selectedRows.length!=1){
    		$.messager.alert("系统提示","请选择一条要编辑的数据！");
    			return;
    		}
        var row=selectedRows[0];
    	
    	$("#mydialog").dialog("open").dialog("setTitle","修改领导信息");
    	$("#id").val(row.id);
    	$("#name").val(row.name);
    	$("#zhiwu").val(row.zhiwu);
    	$("#jianjie").val(row.jianjie);
        $("#picture").val(row.picture);
        FCKeditorAPI.GetInstance("content").SetHTML(row.content);
     
     }


     function deleteTeacher(){
    	 var selectedRows=$("#datagrid").datagrid('getSelections');
 		if(selectedRows.length==0){
 			$.messager.alert("系统提示","请选择要删除的数据！");
 			return;
 		}
 		var strIds=[];
 		for(var i=0;i<selectedRows.length;i++){
 			strIds.push(selectedRows[i].id);
 		}
 		var ids=strIds.join(",");
 		$.messager.confirm("系统提示","您确认要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
 			if(r){
 				$.post("teacher_delete.action",{ids:ids},function(result){
 	 				if(result == 1){
	 					//1 刷新数据表格 
	 					$("#datagrid").datagrid('reload');
	 					//2 清空idField   
	 					$("#datagrid").datagrid('unselectAll');
	 					//3 给提示信息 
	 					$.messager.show({
	 						title:'提示信息!' , 
	 						msg:'操作成功!'
	 					});
 	 				}else{
 						$("#datagrid").datagrid('unselectAll');
 						$.messager.alert('系统提示',"操作失败！ ");
 	 	 		    }
 				});
 			}
 		});

     }
     

     function searchTeacher(){
    	 $('#datagrid').datagrid('load',{
 			'teacher.name':$("#name1").val()

 		});
     }

	 function openDialog(){
		 resetValue();
         $("#mydialog").dialog('open');
			
	    }

     
     function resetValue(){
          $("#id").val("");
          $("#name").val("");
          $("#zhiwu").val("");
    	  $("#jianjie").val("");
          $("#pic").val("");
          $("#picture").val("");
          FCKeditorAPI.GetInstance("content").SetHTML('');

     }

		function closeDialog(){
			$("#mydialog").dialog("close");
			resetValue();
		}


		function canser(){
			$("#datagrid").datagrid('unselectAll');
        }

		 $(function(){
		       var oFCKeditor = new FCKeditor('content');
		       oFCKeditor.BasePath = "/jckxxy/fckeditor/";
		       oFCKeditor.Width = "600";
		      oFCKeditor.Height= "300";
		       oFCKeditor.ToolbarSet="bbs";
		       oFCKeditor.ReplaceTextarea();
		       
		   });
	
	</script>

  </head>
  
  <body style="margin:0px 0px;">
      <table id="datagrid"></table>
 <div id="tb"> 
	<div>
		<a href="javascript:openDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
		<a href="javascript:editTeacher()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		<a href="javascript:deleteTeacher()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		<a href="javascript:canser()" class="easyui-linkbutton" iconCls="icon-undo" plain="true">取消选中</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		领导姓名：&nbsp;<input type="text" name="teacher.name"  id="name1"  size="15" onkeydown="if(event.keyCode==13) searchTeacher()"/>	
		<a href="javascript:searchTeacher()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
	</div>
</div>

<div id="mydialog" title="增加领导" modal=true dragable=false class="easyui-dialog" closed=true  style="width:850px;height:510px" buttons="#dlg-buttons">
    <form id="myform" method="post" enctype="multipart/form-data">
         	<table cellspacing="8px;">
         	<input type="hidden" id="id" name="teacher.id" value=""/>
  		<tr>
  			<td >领导姓名：</td>
  			<td colspan="3"><input class="easyui-validatebox" id="name" name="teacher.name"  required="true" style="width: 150px;"/></td>
  			<td >担任职务：</td>
  			<td colspan="3"><input class="easyui-validatebox" id="zhiwu" name="teacher.zhiwu"  required="true" style="width: 150px;"/></td>

  		</tr>
  		<tr>
  			<td >领导图片：</td>
  			<td colspan="3"><input id="pic"   name="picture"  type="file"/></td>
  		</tr>
  		<tr>
  			<td valign="top">领导简介：</td>
  			<td colspan="6">
  				<textarea rows="2" cols="70" id="jianjie"  name="teacher.jianjie" ></textarea>
  			</td>
  		</tr>
  		<tr>
  			<td valign="top">详细介绍：</td>
  			<td colspan="6">
  				<textarea id="content"  name="teacher.content"></textarea>
  	            <input type="hidden"  id="picture" name="teacher.picture" />
  			</td>
  		</tr>
  	</table>
    
    </form>
</div>

<div id="dlg-buttons">
	<a href="javascript:saveTeacher()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
	<a href="javascript:closeDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>

  </body>
</html>
