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
    	
    	$('#torwards').combobox({
    	    url:'ass_toward.action',
    	    valueField:'id',
    	    textField:'name'
    	});
        
        $("#datagrid").datagrid({
        	 title:'用户列表',
             width:'auto',
             height:'auto',
             url:'ass_hlist.action',
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
                           field:'name',
                           title:'姓名',
                           width:50,
                           align:'center'
                       },{
                           field:'summary',
                           title:'简介',
                           width:50,
                           align:'center'
                       },{
                           field:'torwards',
                           title:'学习方向 ',
                           width:100,
                           align:'center'
                           
                       },
                       {
                       		field:'startTime',title:'进入协会的时间', width:80,
							formatter: function(value,row,index){
								return value;
								
							}
						},
						{
                       		field:'endTime',title:'毕业时间', width:80,
							formatter: function(value,row,index){
								return value;
								
							}
						},
						{
                       		field:'codeWorks',title:'作品展示', width:80,
							formatter: function(value,row,index){
								//alert(value.length);
								var returnValue="";
								for(var i=0;i<value.length;i++){
									if(value[i]['name'] =="undefined"){
										
									}else{
										returnValue+=(" , "+value[i]['name']);
									}
								}
								return returnValue.substring(2);
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
        $("#name").val("");
        $("#summary").val("");
        $("#startTime").datebox("setValue","");
        $("#endTime").datebox("setValue","");
        $("#picture").val("");
        $("#torwards").combobox("setValue","");
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
				$.post("${pageContext.request.contextPath}/rjxh/ass_delete.action",{ids:ids},function(result){
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
		//保存成员
   	function saveUser(){
        $("#myform").form('submit',{
            url:'${pageContext.request.contextPath}/rjxh/ass_save.action',
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
              //alert(row['torwards']+":"+row['startTime']);
              //编号
              $("#id").val(row.id);
              //成员名称
              $("#name").val(row.name);
              //简介
              $("#summary").val(row.summary);
              //加入协会的时间
              $("#startTime").datebox("setValue", row.startTime);
              //毕业时间
               $("#endTime").datebox("setValue", row.endTime);
               //图片
               $("#picture").val(row.picture);
              //学习方向
              $("#torwards").combobox("setValue",1);
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
				&nbsp;&nbsp;&nbsp;成员姓名：&nbsp;
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
							成员姓名：
						</td>
						<td colspan="4">
							<input class="easyui-validatebox" id="name" name="name"
								style="width: 175px;" required="true" />
						</td>
					</tr>
					<tr>
						<td>
							成员简介：
						</td>
						<td colspan="4">
							<input class="easyui-validatebox" id="summary" name="summary"
								style="width: 175px;" />
						</td>
					</tr>
					<tr>
						<td>
							加入协会时间：
						</td>
						<td colspan="4">
							<input id="startTime" type="text" class="easyui-datebox"
								name="startTime" required="required" style="width: 175px">
						</td>
					</tr>
					<tr>
						<td>
							毕业时间：
						</td>
						<td colspan="4">
							<input id="endTime" type="text" class="easyui-datebox"
								name="endTime" required="required" style="width: 175px">
						</td>
					</tr>
					<tr>
						<td>
							学习方向：
						</td>
						<td colspan="4">
							<select class="easyui-combobox" id="torwards" name="torwards"
								url="ass_toward.action" valueField="id" textField="name"
								style="width: 176px;"></select>
						</td>
					</tr>
					<tr>
						<td>
							上传照片：
						</td>
						<td colspan="3">
							<input id="picture" name="picture" type="file" />
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
