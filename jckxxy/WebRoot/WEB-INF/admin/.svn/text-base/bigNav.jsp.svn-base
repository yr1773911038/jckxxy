<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>My JSP 'user.jsp' starting page</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/js/jquery-easyui-1.2.6/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/js/jquery-easyui-1.2.6/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery-easyui-1.2.6/locale/easyui-lang-zh_CN.js"></script>
	
	<script type="text/javascript">
	    $(function(){
            $("#datagrid").datagrid({
                 idField:'id',
                 title:'一级导航管理',
                 width:'auto',
                 height:'auto',
                 url:'nav_hlist.action?grade=1',
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
                           width:50,
                           align:'center',
                           hidden:true 
                           
                       },{
                           field:'name',
                           title:'一级导航名称 ',
                           width:50,
                           align:'center'
                       },{
                           field:'path',
                           title:'链接地址 ',
                           width:50,
                           align:'center'
                       }
                 ]],
                 toolbar:'#tb'
            });

		});

	    function openDialog(){
	         $("#mydialog").dialog('open');
	         resetValue();
	         $("#mydialog").window('center');
	    }

	    function closeDialog(){
	         $("#mydialog").dialog('close');
	         resetValue();
	    }

	    function cancer(){
	    	$("#datagrid").datagrid('unselectAll');
	    }

	    function resetValue(){
             $("#id").val("");
             $("#name").val("");
             $("#path").val("");
            
		}


		function saveBigNav(){
             $("#myform").form('submit',{
                  url:'nav_save.action?grade=1',
                  onSubmit:function(){
                        return $(this).form("validate");
                  },
                  success:function(result){
                      if(result == 1){
                    	  $("#mydialog").dialog('close');
                          $("#datagrid").datagrid('reload');
                          $("#datagrid").datagrid('unselectAll');
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

	    function editBigNav(){
	    	var selectedRows = $("#datagrid").datagrid('getSelections');
	         if(selectedRows.length != 1){
	              $.messager.alert("系统提示！","请选择一条记录进行修改！");
	              return ;
	         }else{
	              $("#mydialog").dialog('open');
	              $("#mydialog").dialog('setTitle','修改一级导航信息！');
	              var row = selectedRows[0];
	              $("#id").val(row.id);
	              $("#name").val(row.name);
	              $("#url").val(row.path);
	         }
		}

	    function deleteBigNav(){
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
					$.post("nav_delete.action?grade=1",{ids:ids},function(result){
						if(result == 1){
							$.messager.alert("系统提示","数据已成功删除！");							
							$("#datagrid").datagrid("reload");
							$("#datagrid").datagrid('unselectAll');
						}else if(result == 2){
							$.messager.alert("系统提示","该导航下有子导航，请删除子导航后再操作！");
						}else{
							$("#datagrid").datagrid('unselectAll');
							$.messager.alert('系统提示',"操作失败！ ");
						}
					});

				}
			});
		}

	    function searchBigNav(){
			$('#datagrid').datagrid('load',{
				'searchName':$("#searchName").val()
			});
		}
	
	</script>

  </head>
  
  <body style="margin:0px 0px;">
   <table id="datagrid"></table>
   
    <div id="tb"> 
	<div>
		<a href="javascript:openDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
		<a href="javascript:editBigNav()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		<a href="javascript:deleteBigNav()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		<a href="javascript:cancer()" class="easyui-linkbutton" iconCls="icon-undo" plain="true">取消选中</a>
		&nbsp;&nbsp;&nbsp;一级导航名称：&nbsp;<input type="text" name="searchName"  id="searchName"  size="20" onkeydown="if(event.keyCode==13) searchBigNav()"/>	
		<a href="javascript:searchBigNav()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
	</div>
</div>

<div id="mydialog" title="增加一级导航" modal=true dragable=false class="easyui-dialog" closed=true  style="width:350px;height:250px" buttons="#dlg-buttons">
    <form id="myform" method="post" enctype="multipart/form-data">
         	<table cellspacing="8px;">
         	<input type="hidden" id="id" name="id" value=""/>
  		<tr>
  			<td>一级导航名称：</td>
  			<td colspan="4"><input class="easyui-validatebox" id="name" name="name"  required="true"/></td>
  		</tr>
  		 <tr>
  			<td>导航链接地址：</td>
  			<td colspan="4"><input class="easyui-validatebox" id="url" name="path"/></td>
  		</tr>


  	</table>   
    </form>
</div>

<div id="dlg-buttons">
	<a href="javascript:saveBigNav()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
	<a href="javascript:closeDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>

  </body>
</html>
