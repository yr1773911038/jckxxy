<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>My JSP 'user.jsp' starting page</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.2.6/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.2.6/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.2.6/locale/easyui-lang-zh_CN.js"></script>
  </head>
  
  <script type="text/javascript">
    $(function(){
        $("#datagrid").datagrid({
        	 title:'学生列表',
             width:'auto',
             height:'auto',
             url:'student_hlist.action',
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
                           hidden:true 
                           
                       },{
                           field:'num',
                           title:'学生学号',
                           width:100,
                           align:'center'
                       },{
                           field:'name',
                           title:'学生姓名',
                           width:100,
                           align:'center'
                       },{
                           field:'password',
                           title:'密码',
                           width:100,
                           align:'center'
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
        $("#num").val("");
        $("#password").val("");
    }
    
    function saveStudent(){
        $("#myform").form('submit',{
            url:'student_save.action',
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

    function editStudent(){
         var selectedRows = $("#datagrid").datagrid('getSelections');
         if(selectedRows.length != 1){
              $.messager.alert("系统提示！","请选择一条记录进行修改！");
              return ;
         }else{
              $("#mydialog").dialog('open');
              $("#mydialog").dialog('setTitle','修改学生信息！');
              var row = selectedRows[0];
              $("#id").val(row.id);
              $("#name").val(row.name);
              $("#num").val(row.num);
              $("#password").val(row.password);

         }
    }
    
    function deleteStudent(){
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
				$.post("student_delete.action",{ids:ids},function(result){
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
  
    function searchStudent(){
		$('#datagrid').datagrid('load',{
			'student.num':$("#num1").val()
		});
	}



  //下载模板
    function downloadTemplate(){
       window.open('template2/student.xls');

    }

	function openUploadFileDialog(){
		$("#mydialog2").dialog("open");
	}

    function uploadFile(){
          $.messager.progress({
		       title: '批量导入' ,
		       text: '正在导入...' ,
		       interval:200
	       });
    	   $("#myform2").form("submit",{
    	       url:'student_uploadFile.action',
    	       success:function(result){
    	          
    	          if(result ==1){
    	        	 $.messager.progress('close');
     	             $.messager.alert("系统提示！","上传成功！");
    	             $("#mydialog2").dialog("close");
    	             $("#datagrid").datagrid("reload");

    	          }else{ 
    	        	  $.messager.progress('close');  	      	    
     	             $.messager.alert("系统提示！","上传失败！");
    	    
    	          }
    	       }
    	   });

    	}

    function closeDialog2(){
        $("#mydialog2").dialog('close');
   }
  
  </script>
  
  <body style="margin:0px 0px;">
   <table id="datagrid"></table>
 <div id="tb"> 
	<div>
		<a href="javascript:openDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
		<a href="javascript:editStudent()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		<a href="javascript:deleteStudent()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		<a href="javascript:cancer()" class="easyui-linkbutton" iconCls="icon-undo" plain="true">取消选中</a>
		<a href="javascript:openUploadFileDialog()" class="easyui-linkbutton" iconCls="icon-import" plain="true">导入数据</a>
		&nbsp;&nbsp;&nbsp;学生学号：&nbsp;<input type="text" name="student.num"  id="num1"  size="20" onkeydown="if(event.keyCode==13) searchStudent()"/>	
		<a href="javascript:searchStudent()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
	</div>
</div>

<div id="mydialog" title="增加学生" modal=true dragable=false class="easyui-dialog" closed=true  style="width:400px;height:300px" buttons="#dlg-buttons">
    <form id="myform" method="post" enctype="multipart/form-data">
         	<table cellspacing="8px;">
         	<input type="hidden" id="id" name="student.id" value=""/>
         	
        <tr>
  			<td>学生学号：</td>
  			<td colspan="4"><input class="easyui-validatebox" id="num" name="student.num"  required="true" width="200px;"/></td>
  		</tr>
  		<tr>
  			<td>学生姓名：</td>
  			<td colspan="4"><input class="easyui-validatebox" id="name" name="student.name"  required="true" width="200px;"/></td>
  		</tr>
  		<tr>
  			<td>登录密码：</td>
  			<td colspan="4"><input class="easyui-validatebox" id="password" name="student.password"  required="true" width="200px;"/></td>
  		</tr>


  	</table>   
    </form>
</div>

<div id="dlg-buttons">
	<a href="javascript:saveStudent()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
	<a href="javascript:closeDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>
  <div id="mydialog2" title="批量导入" modal=true dragable=false class="easyui-dialog" closed=true  style="width:400px;height:300px" buttons="#dlg-buttons2">
    <form id="myform2" method="post" enctype="multipart/form-data">
      <table cellspacing="8px;">
      	<tr>
        			<td>下载模版：</td>
        			<td><a href="javascript:void(0)" class="easyui-linkbutton"  onclick="downloadTemplate()">导入模版</a></td>
        		</tr>
        		<tr>
        			<td>上传文件：</td>
        			<td><input type="file" name="userUploadFile"></td>
        		</tr>
    
  	  </table>   
    </form>
</div>

<div id="dlg-buttons2">
	<a href="javascript:uploadFile()" class="easyui-linkbutton" iconCls="icon-ok" >上传</a>
	<a href="javascript:closeDialog2()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div> 
  </body>
</html>
