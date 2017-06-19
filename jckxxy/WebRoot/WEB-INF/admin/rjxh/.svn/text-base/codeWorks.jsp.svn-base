<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>基础科学学院</title>
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
	$(function() {
		//显示下拉框中的user
		$('#assId').combobox({
    	    url:'ass_getUserList.action',
    	    valueField:'id',
    	    textField:'name',
    	    multiple:true,
    	    panelHeight:'auto',
    	    formatter: function (row) { //formatter方法就是实现了在每个下拉选项前面增加checkbox框的方法  
	            var opts = $(this).combobox('options');  
	            return '<input type="checkbox" class="combobox-checkbox">' + row[opts.textField]  
       		},
       	 	onLoadSuccess: function () {  //下拉框数据加载成功调用  
                var opts = $(this).combobox('options');  
                var target = this;  
                var values = $(target).combobox('getValues');//获取选中的值的values  
                $.map(values, function (value) {  
                    var el = opts.finder.getEl(target, value);  
                    el.find('input.combobox-checkbox')._propAttr('checked', true);   
                })  
            },  
            onSelect: function (row) { //选中一个选项时调用  
                var opts = $(this).combobox('options');  
                //获取选中的值的values  
                $("#assId").val($(this).combobox('getValues'));  
               //设置选中值所对应的复选框为选中状态  
                var el = opts.finder.getEl(this, row[opts.valueField]);  
                el.find('input.combobox-checkbox')._propAttr('checked', true);  
            },  

            onUnselect: function (row) {//不选中一个选项时调用  
                var opts = $(this).combobox('options');  
                //获取选中的值的values  
                $("#assId").val($(this).combobox('getValues'));  
                var el = opts.finder.getEl(this, row[opts.valueField]);  
                el.find('input.combobox-checkbox')._propAttr('checked', false);  
            }  
    	});

    	//列表展示
		$("#datagrid").datagrid( {
			idField : 'id',
			title : '作品管理',
			url : 'code_hlist.action',
			width : 'auto',
			height : 'auto',
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
				width : 30,
				align : 'center',
				hidden : false

			}, {
				field : 'name',
				title : '作品名称',
				width : 50,
				align : 'center'
			}, {
				field : 'description',
				title : '作品描述',
				width : 50,
				align : 'center',
			}, {
				field : 'achieveTime',
				title : '完成时间',
				width : 50,
				align : 'center',
				hidden : false,
			}, {
				field : 'url',
				title : '链接地址',
				width : 50,
				align : 'center',
				
			}, {
				field : 'users',
				title : '作者',
				width : 20,
				align : 'center',
				hidden : false,
				formatter : function(value,row,index){
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
			
			] ],
			toolbar : '#tb'
		});

	});

	function saveCodeWorks() {
		$("#myform").form('submit', {
			url : 'code_save.action?uids='+assId.value,
			success : function(result) {
				if (result == 1) {
					resetValue();
					$("#mydialog").dialog('close');
					$("#datagrid").datagrid('reload');
					$("#datagrid").datagrid('unselectAll');
					$.messager.show( {
						title : '提示信息',
						msg : '操作成功！'
					});
				} else {
					$("#datagrid").datagrid('unselectAll');
					$.messager.alert('系统提示', "操作失败！ ");
				}
			}

		});

	}

	function editCodeWorks() {
		var selectedRows = $("#datagrid").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一条要编辑的数据！");
			return;
		}
		var row = selectedRows[0];
		$("#mydialog").dialog("open").dialog("setTitle", "修改作品信息");
		$("#id").val(row.id); //编号
		$("#name").val(row.name); //作品名称
		$("#description").val(row.description);//作品描述
		$("#act").datebox('setValue', row.achieveTime);//完成时间
		$("#urlpath").val(row.url);//链接地址

	}

	function deleteCodeWorks() {
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
		$.messager.confirm("系统提示", "您确认要删除这<font color=red>" + selectedRows.length
				+ "</font>条数据吗？", function(r) {
			if (r) {
				$.post("code_delete.action", {
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
			'workName' : $("#workName").val(),
		});
	}

	function openDialog() {
		resetValue();
		$("#mydialog").dialog('open');
	}

	function resetValue() {
		$("#id").val(""); //编号
		$("#name").val(""); //作品名称
		$("#description").val("");//作品描述
		$("#act").datebox('setValue', "");//完成时间
		$("#urlpath").val("");//链接地址


	}

	function closeDialog() {
		$("#mydialog").dialog("close");
		resetValue();
	}

	function canser() {
		$("#datagrid").datagrid('unselectAll');
	}

	
</script>

	</head>

	<body style="margin: 0px 0px;">
		<table id="datagrid"></table>
		<div id="tb">
			<div>
				<a href="javascript:openDialog()" class="easyui-linkbutton"
					iconCls="icon-add" plain="true">添加</a>
				<a href="javascript:editCodeWorks()" class="easyui-linkbutton"
					iconCls="icon-edit" plain="true">修改</a>
				<a href="javascript:deleteCodeWorks()" class="easyui-linkbutton"
					iconCls="icon-remove" plain="true">删除</a>
				<a href="javascript:canser()" class="easyui-linkbutton"
					iconCls="icon-undo" plain="true">取消选中</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 作品名称：&nbsp;
				<input type="text" name="workName" id="workName" size="15"
					onkeydown=if (event.keyCode== 13)searchNews();/>
				<a href="javascript:saveCodeWorks()" class="easyui-linkbutton"
					iconCls="icon-search" plain="true">搜索</a>
			</div>
		</div>

		<div id="mydialog" title="增加成品" modal=true dragable=false
			class="easyui-dialog" closed=true style="width: 800px; height: 300px"
			buttons="#dlg-buttons">
			<form id="myform" method="post" enctype="multipart/form-data">
				<table cellspacing="8px;">
					<input type="hidden" id="id" name="id" value="" />
					<tr>
						<td>
							作品名称：
						</td>
						<td colspan="3">
							<input class="easyui-validatebox" id="name" name="name"
								required="true" style="width: 150px;" />
						</td>
						<td>
							作品描述：
						</td>
						<td colspan="3">
							<%--<textarea id="description" name="description" style="width: 150px;"></textarea>
							--%>
							<input type="text" id="description" name="description"
								style="width: 150px;">
						</td>
					</tr>

					<tr>
						<td>
							完成时间：
						</td>
						<td colspan="3">
							<input id="act" type="text" class="easyui-datebox"
								name="achieveTime" required="required" style="width: 150px">
						</td>
						<td>
							链接地址：
						</td>
						<td colspan="3">
							<input id="urlpath" name="url" type="text" style="width: 150px;">
						</td>
					</tr>
					<tr>
						<td>
							作者：
						</td>
						<td>
							<input id="assId" name="assId" style="width: 150px;"
								class="easyui-combobox">
						</td>

					</tr>
				</table>
			</form>
		</div>

		<div id="dlg-buttons">
			<a href="javascript:saveCodeWorks()" class="easyui-linkbutton"
				iconCls="icon-ok">保存</a>
			<a href="javascript:closeDialog()" class="easyui-linkbutton"
				iconCls="icon-cancel">关闭</a>
		</div>


	</body>
</html>
