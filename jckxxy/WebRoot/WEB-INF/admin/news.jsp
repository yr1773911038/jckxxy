<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>

		<title>基础科学学院</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/js/jquery-easyui-1.2.6/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/js/jquery-easyui-1.2.6/themes/icon.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery-easyui-1.2.6/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#datagrid").datagrid({
					idField: 'id',
					title: '新闻列表',
					url: 'news_hlist.action',
					width: 'auto',
					height: 'auto',
					fitColumns: true,
					rownumbers: true,
					pagination: true,
					columns: [
						[{
								field: 'ck',
								width: 50,
								checkbox: true
							}, {
								field: 'id',
								title: '编号',
								width: 15,
								align: 'center',
								hidden: false

							}, {
								field: 'title',
								title: '新闻标题',
								width: 50,
								align: 'center'
							}, {
								field: 'picture',
								title: '幻灯图片',
								width: 50,
								align: 'center',
								formatter: function(val, row) {
									return '<img width=150 height=100 src="${pageContext.request.contextPath}/' + val + '">';
								}
							}, {
								field: 'parent.id',
								title: '二级导航编号',
								width: 15,
								align: 'center',
								hidden: false,
								formatter: function(val, row) {
									return row.parent.id;
								}
							}, {
								field: 'parent.name',
								title: '二级导航名称  ',
								width: 50,
								align: 'center',
								formatter: function(val, row) {
									return row.parent.name;
								}
							}, {
								field: 'author.id',
								title: '作者编号',
								width: 20,
								align: 'center',
								hidden: true,
								formatter: function(val, row) {
									return row.author.id;
								}
							}, {
								field: 'author.name',
								title: '发布人',
								width: 40,
								formatter: function(val, row) {
									return row.author.name;
								},
								align: 'center'
							}

						]
					],
					toolbar: '#tb'
				});

			});

			function saveNews() {
				$("#myform").form('submit', {
					url: 'news_save.action',
					onSubmit: function() {
						//if ($("#bigNavName").combobox("getValue") == "") {
						//	$.messager.alert("提示信息！", "请选择新闻所属一级导航！ ");
						//	return false;
						//}
						if($("#smallNavName").combobox("getValue") == "") {
							$.messager.alert("提示信息！", "请选择新闻所属二级导航！ ");
							return false;
						}
						return $(this).form("validate");
					},
					success: function(result) {
						if(result == 1) {
							resetValue();
							$("#mydialog").dialog('close');
							$("#datagrid").datagrid('reload');
							$("#datagrid").datagrid('unselectAll');
							$.messager.show({
								title: '提示信息',
								msg: '操作成功！'
							});
						} else {
							$("#datagrid").datagrid('unselectAll');
							$.messager.alert('系统提示', "操作失败！ ");
						}
					}

				});

			}

			function editNews() {
				var selectedRows = $("#datagrid").datagrid('getSelections');
				if(selectedRows.length != 1) {
					$.messager.alert("系统提示", "请选择一条要编辑的数据！");
					return;
				}
				var row = selectedRows[0];

				$("#mydialog").dialog("open").dialog("setTitle", "修改新闻信息");
				$("#id").val(row.id);
				$("#title").val(row.title);
				$("#smallNavName").combobox('setValue', row.parent.id);
				$("#slide").val(row.slide);
				CKEDITOR.instances.content.setData(row.content);
				
				//CKEDITOR.GetInstance("content").SetHTML(row.content);

			}

			function deleteNews() {
				var selectedRows = $("#datagrid").datagrid('getSelections');
				if(selectedRows.length == 0) {
					$.messager.alert("系统提示", "请选择要删除的数据！");
					return;
				}
				var strIds = [];
				for(var i = 0; i < selectedRows.length; i++) {
					strIds.push(selectedRows[i].id);
				}
				var ids = strIds.join(",");
				$.messager.confirm("系统提示", "您确认要删除这<font color=red>" + selectedRows.length +
					"</font>条数据吗？",
					function(r) {
						if(r) {
							$.post("news_delete.action", {
								ids: ids
							}, function(result) {
								if(result == 1) {
									//1 刷新数据表格 
									$("#datagrid").datagrid('reload');
									//2 清空idField   
									$("#datagrid").datagrid('unselectAll');
									//3 给提示信息 
									$.messager.show({
										title: '提示信息!',
										msg: '操作成功!'
									});
								} else {
									$("#datagrid").datagrid('unselectAll');
									$.messager.alert('系统提示', "操作失败！ ");
								}
							});
						}
					});

			}

			function searchNews() {
				$('#datagrid').datagrid('load', {
					'newsTitle': $("#title1").val(),
					//'bigNav.id' : $("#bigNavId").combobox('getValue'),
					'erTitle': $("#smallNavId").combobox('getValue')
				});
			}

			function openDialog() {
				resetValue();
				$("#mydialog").dialog('open');
			}

			function resetValue() {
				$("#id").val("");
				$("#title").val("");
				$("#smallNavName").combobox("setValue", "");
				$("#slide").val("");
				$("#picture").val("");
				CKEDITOR.instances.content.setData("");
				//CKEDITOR.GetInstance("content").SetHTML('');

			}

			function closeDialog() {
				$("#mydialog").dialog("close");
				resetValue();
			}

			$(function() {
				$('#bigNavName')
					.combobox({
						//onSelect : function(record) {
						//$('#smallNavName')
						//.combobox(
						//"reload",
						//'');
						//$('#smallNavName').combobox("setValue", "");
						//}
					});
			});

			$(function() {
				$('#bigNavId')
					.combobox({
						onSelect: function(record) {
							$('#smallNavId')
								.combobox(
									"reload",
									'nav_comboList.action?grade=2&&pid=' + record.id);
							$('#smallNavId').combobox("setValue", "");
						}
					});
			});

			function canser() {
				$("#datagrid").datagrid('unselectAll');
			}
		</script>

	</head>

	<body style="margin: 0px 0px;">
		<table id="datagrid"></table>
		<div id="tb" style="width: 1000px">
			<div>
				<a href="javascript:openDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
				<a href="javascript:editNews()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
				<a href="javascript:deleteNews()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
				<a href="javascript:canser()" class="easyui-linkbutton" iconCls="icon-undo" plain="true">取消选中</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 新闻标题：&nbsp;
				<input type="text" name="newsTitle" id="title1" size="15" onkeydown=if (event.keyCode==1 3)searchNews();/> 所属一级导航: &nbsp;
				<select class="easyui-combobox" id="bigNavId" url="nav_comboList.action?grade=1" valueField="id" textField="name" onkeydown=if (event.keyCode==13)searchNews();></select>
				</td>
				所属二级导航: &nbsp;
				<select name="erTitle" class="easyui-combobox" id="smallNavId" url="" valueField="id" textField="name" onkeydown=if (event.keyCode==13)searchNews();></select>
				</td>
				<a href="javascript:searchNews()" class="easyui-linkbutton" iconCls="icon-search" plain="true" >搜索</a>
			</div>
		</div>

		<div id="mydialog" title="增加新闻" modal=true dragable=false class="easyui-dialog" closed=true style="width: 850px; height: 450px" buttons="#dlg-buttons">
			<form id="myform" method="post" enctype="multipart/form-data">
				<table cellspacing="8px;">
					<input type="hidden" id="id" name="id" value="" />
					<tr>
						<td>
							新闻标题：
						</td>
						<td colspan="3">
							<input class="easyui-validatebox" id="title" name="title" required="true" style="width: 150px;" />
						</td>
						<td>
							幻灯图片：
						</td>
						<td colspan="3">
							<input id="slide" name="slide" type="file" />
						</td>
					</tr>
					<tr>
						<td>
							二级导航：
						</td>
						<td colspan="3">
							<select class="easyui-combobox" id="smallNavName" name="parent.id" url="nav_comboList2.action" valueField="id" textField="name" style="width: 150px;"></select>
						</td>
					</tr>
					<tr>
						<td valign="top">
							新闻内容：
						</td>
						<td colspan="6">
							<textarea id="content" name="content">aaaaa</textarea>
							<input type="hidden" id="picture" name="picture" />
						</td>
					</tr>
				</table>

			</form>
		</div>

		<div id="dlg-buttons">
			<a href="javascript:saveNews()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
			<a href="javascript:closeDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
		</div>
		<script type="text/javascript">
        	CKEDITOR.replace('content');
   		 </script>
	</body>

</html>