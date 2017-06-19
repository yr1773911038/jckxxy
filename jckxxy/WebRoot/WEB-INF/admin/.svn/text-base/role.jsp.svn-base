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
		<script type="text/javascript">
	//列表显示
	    $(function(){
            $("#datagrid").datagrid({
                 idField:'id',
                 title:'角色管理',
                 width:'auto',
                 height:'auto',
                 url:'role_hlist.action',
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
                           //hidden:true 
                           
                       },{
                           field:'name',
                           title:'角色名称 ',
                           width:50,
                           align:'center'
                       },{
                           field:'description',
                           title:'角色描述',
                           width:200,
                           align:'center'
                       }
                 ]],
                 toolbar:'#tb'
            });

		});
	</script>

		<script type="text/javascript">
	//添加角色
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
             $("#description").val("");
		}


		function saveRole(){
             $("#myform").form('submit',{
                  url:'role_save.action',
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
	</script>


		<script type="text/javascript">
	 function editRole(){
	    	var selectedRows = $("#datagrid").datagrid('getSelections');
	         if(selectedRows.length != 1){
	              $.messager.alert("系统提示！","请选择一条记录进行修改！");
	              return ;
	         }else{
	          	$("#mydialog").dialog('open');
	            $("#mydialog").dialog('setTitle','修改角色信息！');	
	         	var row = $('#datagrid').datagrid('getSelected');
	         	//var row = selectedRows[0];
	         	alert(row.id);
	         	 $("#id").val(row.id);
	             $("#name").val(row.name);
                 $("#description").val(row.description);
	         }
		}
	</script>
		<script type="text/javascript">
		 function deleteRole(){
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
					$.post("role_delete.action",{ids:ids},function(result){
						if(result == 1){
							$.messager.alert("系统提示","数据已成功删除！");							
							$("#datagrid").datagrid("reload");
							$("#datagrid").datagrid('unselectAll');
						}else if(result == 2){
							$.messager.alert("系统提示","该角色下有用户，请删除该角色下的用户！");
						}else{
							$("#datagrid").datagrid('unselectAll');
							$.messager.alert('系统提示',"操作失败！ ");
						}
					});

				}
			});
		}
	   
	    function searchRole(){
			$('#datagrid').datagrid('load',{
				'roleName':$("#roleName").val()
			});
		}
	</script>
	
	<script type="text/javascript">
		//展示权限列表
		function openAuthDialog(){
			var selectedRows=$("#datagrid").datagrid('getSelections');
			if(selectedRows.length!=1){
				$.messager.alert('系统提示','请选择一条要授权的角色！');
				return;
			}
			var row=selectedRows[0];
			roleId =row.id;
			$("#mydialog2").dialog("open").dialog("setTitle","角色授权");
			
			$("#tree").tree({
				lines:true,
				url:'priv_tree.action?roleId='+roleId,
				checkbox:true,
				cascadeCheck:false,
				onLoadSuccess:function(){ //当数据加载成功时触发。
					$("#tree").tree('expandAll');
				},
				onCheck:function(node,checked){ //当用户点击复选框时触发。
					if(checked){
						checkNode($('#tree').tree('getParent',node.target));
					}
				}
			});
        }

		function checkNode(node){
			if(!node){
				return;
			}else{
				checkNode($('#tree').tree('getParent',node.target));
				$('#tree').tree('check',node.target);
			}
		}
		 
		
	</script>
	<script type="text/javascript">
	function saveAuth(){
			var nodes=$('#tree').tree('getChecked');
			var authArrIds=[];
			for(var i=0;i<nodes.length;i++){
				authArrIds.push(nodes[i].id);
			}
			var authIds=authArrIds.join(",");
			$.post("role_savePriv.action",{authIds:authIds,roleId:roleId},function(result){
				if(result == 1){
					$.messager.alert('系统提示','授权成功！');
					closeAuthDialog();
				}else{
					$("#datagrid").datagrid('unselectAll');
					$.messager.alert('系统提示',"操作失败！ ");
				}
			});
		}

        function closeAuthDialog(){
        	$("#mydialog2").dialog('close');
        }
	
	</script>

	</head>

	<body style="margin: 0px 0px;">
		<table id="datagrid"></table>

		<div id="tb">
			<div>
				<a href="javascript:openDialog()" class="easyui-linkbutton"
					iconCls="icon-add" plain="true">添加</a>
				<a href="javascript:editRole()" class="easyui-linkbutton"
					iconCls="icon-edit" plain="true">修改</a>
				<a href="javascript:deleteRole()" class="easyui-linkbutton"
					iconCls="icon-remove" plain="true">删除</a>
				<a href="javascript:cancer()" class="easyui-linkbutton"
					iconCls="icon-undo" plain="true">取消选中</a>
				<a href="javascript:openAuthDialog()" class="easyui-linkbutton"
					iconCls="icon-roleManage" plain="true">角色授权</a>
				&nbsp;&nbsp;&nbsp;角色名称：&nbsp;
				<input type="text" name="roleName" id="roleName" size="20"
					onkeydown="if(event.keyCode==13) searchRole()" />
				<a href="javascript:searchRole()" class="easyui-linkbutton"
					iconCls="icon-search" plain="true">搜索</a>
			</div>
		</div>

		<div id="mydialog" title="增加角色" modal=true dragable=false
			class="easyui-dialog" closed=true style="width: 300px; height: 250px"
			buttons="#dlg-buttons">
			<form id="myform" method="post" enctype="multipart/form-data">
				<table cellspacing="8px;">
					<input type="hidden" id="id" name="id" value="" />
					<tr>
						<td>
							角色名称：
						</td>
						<td colspan="4">
							<input class="easyui-validatebox" id="name" name="name"
								required="true" />
						</td>
					</tr>
					<tr>
						<td>
							角色描述：
						</td>
						<td colspan="4">
							<input class="easyui-validatebox" id="description"
								name="description" />
						</td>
					</tr>


				</table>
			</form>
		</div>

		<div id="dlg-buttons">
			<a href="javascript:saveRole()" class="easyui-linkbutton"
				iconCls="icon-ok">保存</a>
			<a href="javascript:closeDialog()" class="easyui-linkbutton"
				iconCls="icon-cancel">关闭</a>
		</div>

		<div id="mydialog2" class="easyui-dialog"
			style="width: 300px; height: 400px; padding: 10px 20px" closed="true"
			buttons="#dlg2-buttons">
			<ul id="tree" class="easyui-tree"></ul>
		</div>

		<div id="dlg2-buttons">
			<a href="javascript:saveAuth()" class="easyui-linkbutton"
				iconCls="icon-ok">保存</a>
			<a href="javascript:closeAuthDialog()" class="easyui-linkbutton"
				iconCls="icon-cancel">关闭</a>
		</div>
	</body>
</html>
