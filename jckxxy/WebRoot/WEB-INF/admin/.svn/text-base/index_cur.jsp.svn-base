<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>后台管理页面</title>
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
	function openTab(text, url, iconCls) {
		if ($("#tabs").tabs("exists", text)) {
			$("#tabs").tabs("select", text);
		} else {
			var content = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/admin/"
					+ url + "'>__tag_32$141_"
			$("#tabs").tabs("add", {
				title : text,
				iconCls : iconCls,
				closable : true,
				content : content
			});
		}
	}
</script>
		<script type="text/javascript">
	function refreshSystem() {
		$.post("sys_refreshSystem.action", {}, function(result) {
			if (result.success) {
				$.messager.alert("系统提示", "已成功刷新系统缓存！");
			} else {
				$.messager.alert('系统提示', '刷新系统缓存');
			}
		}, "json");
	}
</script>
		<script type="text/javascript">
	//完成
	function openPasswordModifyDialog() {
		$("#mydialog").dialog('open');
		resetValue();
	}
	function modifyPassword() {
		$("#myform")
				.form(
						"submit",
						{
							url : '${pageContext.request.contextPath}/user_editPassword.action',
							onSubmit : function() {
								var newPassword = $("#newPassword").val();
								var newPassword2 = $("#newPassword2").val();
								if (!$(this).form("validate")) {
									return false;
								}
								if (newPassword != newPassword2) {
									$.messager.alert('系统提示', '确认密码输入错误！');
									return false;
								}
								return true;
							},
							success : function(result) {
								if (result == 1) {
									$.messager.alert('系统提示', '密码修改成功，下一次登录生效！');
									closePasswordModifyDialog();

								} else if (result == 2) {
									$.messager.alert('系统提示', '原密码不正确，请重试！');
									closePasswordModifyDialog();
								} else {
									$.messager.alert('系统提示', "修改失败！");
									return;
								}
							}
						});

	}

	function closePasswordModifyDialog() {
		$("#mydialog").dialog("close");
		resetValue();
	}

	function resetValue() {
		$("#oldPassword").val("");
		$("#newPassword").val("");
		$("#newPassword2").val("");
	}

	function logout() {
		$.messager
				.confirm(
						"系统提示！ ",
						"确定要退出系统吗？ ",
						function(r) {
							if (r) {
								window.location.href = '${pageContext.request.contextPath}/user_logout.action';
							}

						});
	}
</script>

	</head>
	<body style="margin: 0px 0px; padding: 0px 0px;">
		<c:if test="${empty curUser}">
			<c:redirect url="/admin/login.jsp"></c:redirect>
		</c:if>
		<div class="easyui-layout" fit=true
			style="width: 100%; height: 100%; margin-top: 0px; margin-left: 0px;">
			<div region="north" style="height: 62px;">
				<div
					style="background: url('./admin/image/ps.gif') no-repeat; height: 60px; background-color: #E0ECFF;">
					&nbsp;
					<span
						style="margin-top: 40px; display: block; float: right; margin-right: 40px;"><a
						style="text-decoration: none; color: black;">欢迎：${curUser.name
							}&nbsp; <c:forEach items="${curUser.roles}" var="role"
								varStatus="status">
								<c:if test="${status.count==1}">${role.name }</c:if>
							</c:forEach> </a> </span>
				</div>
			</div>
			<div region="west" iconCls="icon-home" split="true"
				style="width: 200px;" title="菜单列表">
				<div class="easyui-accordion" fit=true>
					<div title="权限管理" selected="true" iconCls="icon-manage"
						style="overflow: auto; padding: 15px">
						<a
							href="javascript:openTab('用户管理','user_user.action','icon-user')"
							class="easyui-linkbutton" plain="true" iconCls="icon-user"
							style="width: 100px;"> 用户管理</a>
						<br />
						<a
							href="javascript:openTab('角色管理','role_role.action','icon-roleManage')"
							class="easyui-linkbutton" plain="true" iconCls="icon-roleManage"
							style="width: 100px;"> 角色管理</a>
						<br />
						<a
							href="javascript:openTab('权限管理','priv_priv.action','icon-roleManage')"
							class="easyui-linkbutton" plain="true" iconCls="icon-roleManage"
							style="width: 100px;"> 权限管理</a>
						<br />
					</div>

					<div title="内容管理" iconCls="icon-manage"
						style="overflow: auto; padding: 15px">
						<a
							href="javascript:openTab('新闻管理','news_news.action','icon-special')"
							class="easyui-linkbutton" plain="true" iconCls="icon-special"
							style="width: 100px;"> 新闻管理</a>
						<br />
					</div>
					<div title="导航管理" iconCls="icon-manage"
						style="overflow: auto; padding: 15px">
						<a
							href="javascript:openTab('一级导航','nav_nav.action?grade=1','icon-user')"
							class="easyui-linkbutton" plain="true" iconCls="icon-user"
							style="width: 100px;"> 一级导航</a>
						<br />
						<a
							href="javascript:openTab('二级导航','nav_nav.action?grade=2','icon-user3')"
							class="easyui-linkbutton" plain="true" iconCls="icon-user3"
							style="width: 100px;"> 二级导航</a>
						<br />
					</div>

					<div title="软件协会管理" iconCls="icon-manage"
						style="overflow: auto; padding: 15px">
						<a
							href="javascript:openTab('成员管理','/rjxh/ass_show.action','icon-file')"
							class="easyui-linkbutton" plain="true" iconCls="icon-file"
							style="width: 100px;"> 成员管理</a>
						<br />
						<a
							href="javascript:openTab('作品管理','code_show.action','icon-topic')"
							class="easyui-linkbutton" plain="true" iconCls="icon-topic"
							style="width: 100px;"> 作品管理 </a>
						<br />
						<br />
					</div>

					<%--<div title="下载管理" iconCls="icon-manage"
						style="overflow: auto; padding: 15px">
						<a
							href="javascript:openTab('下载密码','miMa_miMa.action','icon-modifyPassword')"
							class="easyui-linkbutton" plain="true"
							iconCls="icon-modifyPassword" style="width: 100px;"> 下载密码</a>
						<br />
						<a
							href="javascript:openTab('下载专区','movie_movie.action','icon-down')"
							class="easyui-linkbutton" plain="true" iconCls="icon-down"
							style="width: 100px;"> 下载专区</a>
						<br />
					</div>

					--%>
					<div title="系统管理" iconCls="icon-manage"
						style="overflow: auto; padding: 15px">
						<a href="javascript:openPasswordModifyDialog()"
							class="easyui-linkbutton" iconCls="icon-modifyPassword"
							style="width: 100px;" plain="true">修改密码</a>

						<a href="javascript:refreshSystem()" class="easyui-linkbutton"
							iconCls="icon-refresh" style="width: 100px;" plain="true">刷新缓存</a>
						<a href="javascript:logout()" class="easyui-linkbutton"
							iconCls="icon-exit" style="width: 100px;" plain="true">安全退出</a>

					</div>
				</div>
			</div>



			<div region="center" title="主界面" style="padding: 0px;" collapse=true>
				<div id="tabs" class="easyui-tabs" fit="true"
					style="width: 100%; height: 100%">
					<div title="首页" iconCls="icon-home">
						<div align="center" style="padding-top: 100px">
							<font color="red" size="10">欢迎使用本系统</font>
						</div>
					</div>
				</div>
			</div>

			<div region="south" style="height: 25px; padding: 3px" align="center">
				版权所有 @ 基础科学学院--软件协会 yr/xh
			</div>

			<div id="mydialog" title="修改用户密码" modal=true dragable=false
				class="easyui-dialog" closed=true
				style="width: 350px; height: 250px" buttons="#dlg-buttons">
				<form id="myform" method="post" enctype="multipart/form-data">
					<table cellspacing="4px;">
						<tr>
							<td>
								用户工号：
							</td>
							<td>
								<input type="hidden" name="id" id="id" value="${curUser.id }">
								<input type="text" name="num" id="userName" readonly="readonly"
									value="${curUser.num}" style="width: 150px;" />
							</td>
						</tr>
						<tr>
							<td>
								原 密 码：
							</td>
							<td>
								<input type="password" class="easyui-validatebox"
									name="password" id="oldPassword" style="width: 150px;"
									required="true" />
							</td>
						</tr>
						<tr>
							<td>
								新 密 码：
							</td>
							<td>
								<input type="password" class="easyui-validatebox"
									name="newPassword" id="newPassword" style="width: 150px;"
									required="true" />
							</td>
						</tr>
						<tr>
							<td>
								确认新密码：
							</td>
							<td>
								<input type="password" class="easyui-validatebox"
									name="newPassword2" id="newPassword2" style="width: 150px;"
									required="true" />
							</td>
						</tr>
					</table>
				</form>
			</div>

			<div id="dlg-buttons">
				<a href="javascript:modifyPassword()" class="easyui-linkbutton"
					iconCls="icon-ok">保存</a>
				<a href="javascript:closePasswordModifyDialog()"
					class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
			</div>
		</div>

	</body>
</html>
