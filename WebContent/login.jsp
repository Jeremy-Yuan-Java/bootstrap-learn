<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<base href="<%=basePath%>">

<title> 登录 页面 </title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet">
<!-- 导入js代码 -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
<script>
	if (window.top !== window.self) {
		window.top.location = window.location;
	}
</script>

</head>

<body class="signin">
	<div class="signinpanel">
	   
		<div class="row">
			<div class="col-sm-7">
				<div class="signin-info">
					<div class="logopanel m-b">
						<h1>欢迎使用</h1>
					</div>
					<div class="m-b"></div>
					<h4>
						尚学堂 <strong>中央绿地广场物业办公系统</strong>
					</h4>
					<ul class="m-b">
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势一</li>
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势二</li>
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势三</li>
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势四</li>
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势五</li>
					</ul>
					<strong>还没有账号？ <a href="#">立即注册&raquo;</a></strong>
				</div>
			</div>
			<div class="col-sm-5">
				<!-- <form method="post" action="login"> -->
				<h4 class="no-margins">登录：</h4>
				<p class="m-t-md">登录到H+后台主题UI框架</p>
				<div class="form-group has-error">
					<label class="control-label" for="inputError1" id="inputErrorid">欢迎使用本系统！</label>
				</div>
				
<!-- 				输入用户名 -->
				<input id="unameid" type="text" name="uname" class="form-control uname" placeholder="用户名" />
				<div class="form-group has-error">
					<label class="control-label" id="uinputErrorid"></label>
				</div>
<!-- 				输入密码 -->
				<input id="pwdid" type="password" name="pwd" class="form-control pword" placeholder="密码" />
				<!-- m-b 样式导致了输入框不整齐 要么都加上 要么都删了-->
				<div class="form-group has-error">
					<label class="control-label" id="pinputErrorid"></label>
				</div>
				<input id="verifycodeid" style="color: black;" type="text" name="code" maxlength="4" class="form-control code" width="50%" placeholder="验证码" />
				<div class="form-group has-error">
					<label class="control-label" id="vinputErrorid"></label>
				</div>
				<span> <img src="/pms_demo01/code" alt="验证码" id="codeImage">
				</span> <a href="javascript:void(0)" id="codeImage2">看不清？点击图片更换</a> <a href="">忘记密码了？</a>
				<button id="loginbtn" class="btn btn-success btn-block">登录</button>
				<!-- button按钮会自动提交  -->
				<!-- </form> -->
			</div>
		</div>
		<div class="signup-footer">
			<div class="pull-left">&copy; 2015 All Rights Reserved. H+</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		
		//点击事件 
		$("#codeImage,#codeImage2").click(function() {
			$("#codeImage").attr("src", "/pms_demo01/code?" + new Date());
		});

		//验证码自动刷新 
		window.setInterval(function() {
			$("#codeImage").attr("src", "image.jsp?time=" + new Date());
		}, 20 * 60 * 1000)

		//登录的点击按钮
		$("#loginbtn").click(function() {
			var uname = $("#unameid").val();
			var pwd = $("#pwdid").val();
			var verifycode = $("#code").val();
			var uflag = true;
			var pflag = true;
			var vflag = true;

			if (uname.length == 0) {
				$("#uinputErrorid").html("请输入用户名");
				uflag = false;
			} else {
				$("#uinputErrorid").html("");
			}
			if (pwd.length == 0) {
				$("#pinputErrorid").html("请输入密码");
				pflag = false;
			} else {
				$("#pinputErrorid").html("");
			}
			if (verifycode.length == 0) {
				$("#vinputErrorid").html("请输入验证码");
				vflag = false;
			} else {
				$("#vinputErrorid").html("");
			}
			if (uflag && pflag && vflag) {
				$.ajax({
					url : "login",
					data : {
						uname : uname,
						pwd : pwd,
						verifycode : verifycode
					},
					type : "POST",
					datatype : "json",
					success : function(data) {
						if (data.status == 1) {
							$("#vinputErrorid").html(data.msgContent);
							$("#verId").attr("src", "image.jsp?time=" + new Date());
						} else if (data.status == 2) {
							$("#pinputErrorid").html(data.msgContent);
						} else {
							window.location.href = "index.jsp"
						}
						console.log(data);
					}
				})
			}
		});
	})
</script>
</html>