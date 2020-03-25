<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>H+ 后台主题UI框架 - 基础表格</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
<link href="/pms/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="/pms/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="/pms/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="/pms/css/animate.css" rel="stylesheet">
<link href="/pms/css/style.css?v=4.1.0" rel="stylesheet">
<script src="/pms/js/jquery.min.js?v=2.1.4"></script>
</head>

<body class="gray-bg">
	<div class="col-sm-10">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>查询所有元素</h5>
			</div>
			<div class="ibox-content">

				<table class="table table-hover">
					<tr>
						<th>用户姓名</th>
						<th>真实姓名</th>
						<th>邮箱</th>
						<th>qq</th>
						<th>电话</th>
						<th>日期</th>
					</tr>
					<c:forEach var="user" items="${list}">
						<tr>
							<td>${user.username}</td>
							<td>${user.realname}</td>
							<td>${user.email}</td>
							<td>${user.qq}</td>
							<td>${user.phone}</td>
							<td>${user.regTime}</td>
						</tr>
					</c:forEach>

				</table>
			</div>
		</div>
	</div>
</body>

</html>
