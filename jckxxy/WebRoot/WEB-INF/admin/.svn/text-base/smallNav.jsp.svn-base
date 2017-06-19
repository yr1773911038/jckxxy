<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

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
	</head>

	<script type="text/javascript">
	$(function() {
		$("#datagrid").datagrid( {
			title : '二级导航列表',
			width : 'auto',
			height : 'auto',
			url : 'nav_hlist.action?grade=2',
			fitColumns : true,
			rownumbers : true,
			pagination : true,
			columns : [ [ {
				field : 'ck',
				width : 50,
				checkbox : true
			}, {
				field : 'id',
				title : '编号',
				width : 20,
				align : 'center',
				hidden : true

			}, {
				field : 'name',
				title : '二级导航名称',
				width : 50,
				align : 'center'
			}, {
				field : 'path',
				title : '导航链接地址',
				width : 150,
				align : 'center'
			},
			{
                field:'pid',
                title:'一级导航编号',
                width:50,
                align:'center',
                hidden:true,
            },
			 {
				field : 'parent',
				title : '所属一级导航',
				width : 100,
				
				formatter: function(value,row,index){
				for(var key in value){
					return value["name"];
				}
				
			},
				align : 'center'
			} ] ],
			toolbar : '#tb'
		});

	});

	function openDialog() {
		$("#mydialog").dialog('open');
		resetValue();
	}

	function closeDialog() {
		$("#mydialog").dialog('close');
		resetValue();
	}

	function cancer() {
		$("#datagrid").datagrid('unselectAll');
	}

	function resetValue() {
		$("#id").val("");
		$("#name").val("");
		$("#path").val("");
		$("#bigNavName").combobox("setValue", "");
	}

	function saveSmallNav() {
		$("#myform").form('submit', {
			url : 'nav_save.action?grade=2',
			onSubmit : function() {
				if ($('#bigNavName').combobox("getValue") == "") {
					$.messager.alert("系统提示", "请选择一级导航！");
					return false;
				}
				return $(this).form("validate");
			},
			success : function(result) {
				if (result == 1) {
					$("#mydialog").dialog('close');
					$("#datagrid").datagrid('reload');
					$("#datagrid").datagrid('unselectAll');
					$.messager.show( {
						title : '提示信息',
						msg : '保存成功！'
					});
				} else {
					$("#datagrid").datagrid('unselectAll');
					$.messager.alert('系统提示', "操作失败！ ");
				}
			}
		});
	}

	function editSmallNav() {
		var selectedRows = $("#datagrid").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert("系统提示！", "请选择一条记录进行修改！");
			return;
		} else {
			$("#mydialog").dialog('open');
			$("#mydialog").dialog('setTitle', '修改二级导航信息！');
			var row = selectedRows[0];
			$("#id").val(row.id);
			$("#name").val(row.name);
			$("#url").val(row.path);
			$("#bigNavName").combobox("setValue", row.parent.id);
		}
	}

	function deleteSmallNav() {
		var selectedRows = $("#datagrid").datagrid('getSelections');
		if (selectedRows.length == 0) {
			$.messager.alert("系统提示", "请选择要删除的数据！");
			return;
		}
		var strIds = [];
		for ( var i = 0; i < selectedRows.length; i++) {
			strIds.push(selectedRows[i].id);
		}
		var ids = strIds.join(",");
		$.messager.confirm("系统提示","您确认要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
					if (r) {
				$.post("nav_delete.action?grade=2", {
					ids : ids
				}, function(result) {
					if (result == 1) {
						//1 刷新数据表格 
						$("#datagrid").datagrid('reload');
						//2 清空idField   
						$("#datagrid").datagrid('unselectAll');
						//3 给提示信息 
						$.messager.show( {
							title : '提示信息!',
							msg : '操作成功!'
						});
					} else if (result == 2) {
						$.messager.alert('系统提示', "该导航下有新闻，请删除该导航下的新闻后再操作！ ");
					} else {
						$("#datagrid").datagrid('unselectAll');
						$.messager.alert('系统提示', "操作失败！ ");
					}
				});
			}
		});
	}

	function searchSmallNav() {
		$('#datagrid').datagrid('load', {
			'searchName' : $("#searchName").combobox('getValue')
		});
	}
</script>

	<body style="margin: 0px 0px;">
		<table id="datagrid"></table>
		<div id="tb">
			<div>
				<a href="javascript:openDialog()" class="easyui-linkbutton"
					iconCls="icon-add" plain="true">添加</a>
				<a href="javascript:editSmallNav()" class="easyui-linkbutton"
					iconCls="icon-edit" plain="true">修改</a>
				<a href="javascript:deleteSmallNav()" class="easyui-linkbutton"
					iconCls="icon-remove" plain="true">删除</a>
				<a href="javascript:cancer()" class="easyui-linkbutton"
					iconCls="icon-undo" plain="true">取消选中</a>
				&nbsp;&nbsp;&nbsp;所属一级导航：&nbsp;
				<select class="easyui-combobox" id="searchName" name="searchName"
					url="nav_comboList.action?grade=1" valueField="id" textField="name"
					style="width: 155px;" onkeydown=if
					(event.keyCode==13)searchSmallNav();></select>
				<a href="javascript:searchSmallNav()" class="easyui-linkbutton"
					iconCls="icon-search" plain="true">搜索</a>
			</div>
		</div>

		<div id="mydialog" title="增加二级导航" modal=true dragable=false
			class="easyui-dialog" closed=true style="width: 400px; height: 300px"
			buttons="#dlg-buttons">
			<form id="myform" method="post" enctype="multipart/form-data">
				<table cellspacing="8px;">
					<input type="hidden" id="id" name="id" value="" />
					<tr>
						<td>
							二级导航名称：
						</td>
						<td colspan="4">
							<input class="easyui-validatebox" id="name" name="name"
								required="true" />
						</td>
					</tr>
					<tr>
						<td>
							二级导航链接：
						</td>
						<td colspan="4">
							<input class="easyui-validatebox" id="url" name="path"
								required="true" />
						</td>
					</tr>

					<tr>
						<td>
							所属一级导航：
						</td>
						<td colspan="4">
							<select class="easyui-combobox" id="bigNavName" name="parent.id"
								url="nav_comboList.action?grade=1" valueField="id"
								textField="name" style="width: 178px;"></select>
						</td>
					</tr>

				</table>
			</form>
		</div>

		<div id="dlg-buttons">
			<a href="javascript:saveSmallNav()" class="easyui-linkbutton"
				iconCls="icon-ok">保存</a>
			<a href="javascript:closeDialog()" class="easyui-linkbutton"
				iconCls="icon-cancel">关闭</a>
		</div>

	</body>
</html>
