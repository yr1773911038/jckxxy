<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/admin/js/jquery-easyui-1.2.6/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/admin/js/jquery-easyui-1.2.6/themes/icon.css">
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/admin/js/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/admin/js/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/admin/js/jquery-easyui-1.2.6/locale/easyui-lang-zh_CN.js"></script>

		<script type="text/javascript">
    $(function(){
        $("#datagrid").datagrid({
        	 title:'用户列表',
             width:'auto',
             height:'auto',
             url:'user_hlist.action',
             fitColumns:true,
             rownumbers:true,
             pagination:true ,
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
                           field:'num',
                           title:'工号',
                           width:50,
                           align:'center'
                       },{
                           field:'name',
                           title:'姓名',
                           width:50,
                           align:'center'
                       },{
                           field:'password',
                           title:'密码 ',
                           width:100,
                           align:'center'
                       },
                       {
                       		field:'roles',title:'角色名称', width:80,
							formatter: function(value,row,index){
								for(var key in value[0]){
									return value[0]["name"];
								}
								
							}
						}
                       
                       
                       
             ]],
             toolbar:'#tb'
          });
  
    });

    function openDialog(){
         $("#mydialog").dialog('open');
         resetValue();
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
		$("#num").val("");
        $("#name").val("");
        $("#password").val("");
        $("#roleName").combobox("setValue","");
    }
    
   

    function deleteUser(){
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
				$.post("user_delete.action",{ids:ids},function(result){
					if(result == 1){
						<%--1 刷新数据表格 --%>
						$("#datagrid").datagrid('reload');
						<%--2 清空idField  --%> 
						$("#datagrid").datagrid('unselectAll');
						<%--//3 给提示信息 --%>
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
  
    function searchUser(){
		$('#datagrid').datagrid('load',{
			'userName':$("#userName").val()
		});
	}

  
  </script>
		<SCRIPT type="text/javascript">
   function saveUser(){
        $("#myform").form('submit',{
            url:'user_save.action',
            onSubmit:function(){
            if($("#roleName").combobox("getValue") ==""){
                $.messager.alert("提示信息！","请选择用户角色！ ");
                return false;
            }
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
 					$("#datagrid").datagrid('unselectAll');
					$.messager.alert('系统提示',"操作失败！ ");
                  }
            }
        });    
    }
  
  </SCRIPT>
  <SCRIPT>

    function editUser(){
         var selectedRows = $("#datagrid").datagrid('getSelections');
         if(selectedRows.length != 1){
              $.messager.alert("系统提示！","请选择一条记录进行修改！");
              return ;
         }else{
              $("#mydialog").dialog('open');
              $("#mydialog").dialog('setTitle','修改用户信息！');
              var row = selectedRows[0];
              $("#id").val(row.id);
              $("#num").val(row.num);
              $("#name").val(row.name);
              $("#password").val(row.password);
              var rid;
              for(var key in row.roles[0]){
              	rid=row.roles[0]["id"];
			  }
              $("#roleName").combobox("setValue",rid);
         }
    }
    


  </SCRIPT>



	</head>





	<body style="margin: 0px 0px;">
		<table id="datagrid"></table>
		<div id="tb">
			<div>
				<a href="javascript:openDialog()" class="easyui-linkbutton"
					iconCls="icon-add" plain="true">添加</a>
				<a href="javascript:editUser()" class="easyui-linkbutton"
					iconCls="icon-edit" plain="true">修改</a>
				<a href="javascript:deleteUser()" class="easyui-linkbutton"
					iconCls="icon-remove" plain="true">删除</a>
				<a href="javascript:cancer()" class="easyui-linkbutton"
					iconCls="icon-undo" plain="true">取消选中</a>
				&nbsp;&nbsp;&nbsp;用户姓名：&nbsp;
				<input type="text" name="userName" id="userName" size="20"
					onkeydown="if(event.keyCode==13) searchUser()" />
				<a href="javascript:searchUser()" class="easyui-linkbutton"
					iconCls="icon-search" plain="true">搜索</a>
			</div>
		</div>

		<div id="mydialog" title="增加用户" modal=true dragable=false
			class="easyui-dialog" closed=true style="width: 400px; height: 300px"
			buttons="#dlg-buttons">
			<form id="myform" method="post" enctype="multipart/form-data">
				<table cellspacing="8px;">
					<input type="hidden" id="id" name="id" value="" />
					<tr>
						<td>
							教师工号：
						</td>
						<td colspan="4">
							<input class="easyui-validatebox" id="num" name="num"
								style="width: 175px;" required="true" />
						</td>
					</tr>
					<tr>
						<td>
							用户姓名：
						</td>
						<td colspan="4">
							<input class="easyui-validatebox" id="name" name="name"
								style="width: 175px;" required="true" />
						</td>
					</tr>
					<tr>
						<td>
							用户密码：
						</td>
						<td colspan="4">
							<input class="easyui-validatebox" id="password"
								name="password" style="width: 175px;" required="true" />
						</td>
					</tr>
					<tr>
						<td>
							选择角色：
						</td>
						<td colspan="4">
							<select class="easyui-combobox" id="roleName" name="roleId"
								url="role_comboList.action" valueField="id" textField="name"
								style="width: 176px;"></select>
						</td>
					</tr>

				</table>
			</form>
		</div>

		<div id="dlg-buttons">
			<a href="javascript:saveUser()" class="easyui-linkbutton"
				iconCls="icon-ok">保存</a>
			<a href="javascript:closeDialog()" class="easyui-linkbutton"
				iconCls="icon-cancel">关闭</a>
		</div>

	</body>
</html>
