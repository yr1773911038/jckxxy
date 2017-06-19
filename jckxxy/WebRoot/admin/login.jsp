<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta name="keywords" content="Add,your,site,keywords,here">
		<title>基础科学学院登录界面</title>
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/admin/css/alogin.css">
		<script type="text/javascript">
	// 在被嵌套时就刷新上级窗口
	if (window.parent != window) {
		window.location.href = 'https://www.baidu.com';
	}
</script>
	</head>
	<body>
		<s:form id="form1" name="form1" action="user_login.action"
			method="post" namespace="/">
			<div class="main">
				<ul>
					<li class="top"></li>
					<li class="top2"></li>
					<li class="topA"></li>
					<li class="topB">
						<span class="title"> 基础科学学院后台管理<a href="" target="_blank"><img
									src="${pageContext.request.contextPath}/admin/imglist/login/login.png"
									alt=""
									style="width: 210px; height: 100px; margin-top: 20px; margin-left: 20px;" />
						</a> </span>
					</li>
					<li class="topC"></li>
					<li class="topD">
						<ul class="login" style="padding-top: 30px;">
							<li>
								<font color="red"><s:fielderror/> </font>
							</li>


							<li>
								<span class="left">工&nbsp;&nbsp;&nbsp;号：</span>
								<span style=""> <input id="userNum" name="num"
										type="text" class="txt" /> </span>
							</li>
							<li>
								<span class="left">密&nbsp;&nbsp;&nbsp;码：</span>
								<span style=""> <input id="password" name="password"
										type="password" class="txt" /> </span>
							</li>
						</ul>
					</li>
					<li class="topE"></li>
					<li class="middle_A"></li>
					<li class="middle_B"></li>
					<li class="middle_C">
						<span class="btn"> <input type="submit" value=""
								style="background: url('${pageContext.request.contextPath}/admin/imglist/login/btnlogin.gif') no-repeat; width: 104px; height: 35px; border: 0px;" />
						</span>
						<span><font color="red"></font> </span>
					</li>
					<li class="middle_D"></li>
					<li class="bottom_A"></li>
				</ul>
			</div>
		</s:form>
	</body>
</html>
