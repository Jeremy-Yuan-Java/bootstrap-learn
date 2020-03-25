<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

<title>H+ 后台主题UI框架 - 登录</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet">

<script type="text/javascript" src="/pms/js/jquery.min.js"></script>
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
			<div class="col-sm-6">
				<div class="signin-info">
					<div class="logopanel m-b">
						<h1>欢迎使用</h1>
					</div>
					<div class="m-b"></div>
					<h4>
						深圳尚学堂 <strong>中央绿地广场物业办公系统</strong>
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
			<div class="col-sm-6">
				<!--  在数据提交之前进行 表单校验 
			        1。 不用表单 提交数据 ( 使用 输入框 + button 按钮添加事件 )
			        2.  onsubmit 事件 
			        3. 使用jquery的表单插件  可以实现 表单 验证后提交数据 
			              beforeSubmit: function(){
			                                   如果结果为 true 提交数据   false 不提交数据 
			              }
			 -->
				<!-- 				<form method="post" action=""> -->
				<h4 class="no-margins">登录：</h4>
				<p class="m-t-md">登录到H+后台主题UI框架</p>
				<div class="form-group has-error">
					<label class="control-label" for="inputError1" id="inputErrorid">欢迎使用本系统！</label>
				</div>

				<input id="unameId" type="text" class="form-control uname"
					placeholder="用户名" />、
				<!-- 表单验证的提示 -->
				<span id="unameMsg"></span> <input id="pwdId" type="password"
					class="form-control pword m-b" placeholder="密码" /> <span
					id="pwdMsg"></span> <input id="codeId" style="color: black;"
					type="text" name="verifycode" maxlength="4"
					class="form-control  code	" width="50%" placeholder="验证码" /> <span
					id="codeMsg"></span> <span> <img src="/pms/code" id="verId">
				</span> <a href="javascript:void(0)" id="verId2">看不清？点击图片更换</a> <a href="">忘记密码了？</a>
				<button id="btn" class="btn btn-success btn-block">登录</button>
				<!-- 				</form> -->
			</div>
		</div>
		<div class="signup-footer">
			<div class="pull-left">&copy; 2019 All Rights Reserved. H+</div>
		</div>
	</div>

	<script type="text/javascript">
		// 添加图片点击事件 
		$("#verId,#verId2").click(function() {
			console.log("点我了...");
			$("#verId").attr("src", "/pms/code?time=" + new Date());
		});

		//给登录 按钮添加点击事件 

		$("#btn").click(function() {

			//定义三个标记 (都为true才可以添加 数据到服务器 )

			var nameFlag = true;
			var pwdFlag = true;
			var codeFlag = true;

			//添加 后  表单验证 (不为空)

			// 拿到输入框输入的内容   使用jquery 获取节点 val方法获取值 
			var name = $("#unameId").val();
			var pwd = $("#pwdId").val();
			var code = $("#codeId").val();

			if (name.length == 0) {
				// jquery 文字提示  text()方法 
				// css 修改 span的文字颜色
				$("#unameMsg").text("用户名不能为空").css("color", "red");
				nameFlag = false; // 验证不通过   标记改为false
			}
			if (pwd.length == 0) {
				$("#pwdMsg").text("密码不能为空").css("color", "red");
				pwdFlag = false;
			}
			if (code.length == 0) {
				$("#codeMsg").text("验证码不能为空").css("color", "red");
				codeFlag = false;
			}

			//日志打印 
			console.log(name);
			console.log(pwd);
			console.log(code);

			if (nameFlag && pwdFlag && codeFlag) { // 三个 标记都为true才可以发数据到服务器 
				// 发送数据ajax发送 

				$.ajax({

					type : "post", // 请求的类型 
					url : "/pms/login", // 发送数据到哪里 
					async : true, // 是否异步
					data : { // 发送到服务器数据 
						name : name,
						pwd : pwd,
						code : code

					},
					dataType : "json", //服务器返回的数据类型
					success : function(data) { // 请求成功后执行的函数 

						if (data.code == 0) { // code 0 登录成功 
                             // 页面跳转 
                             window.location.href = "index.jsp";  
						}
						if (data.code == 1) { 
							$("#codeMsg").text(data.msg).css("color", "red");
						}
						if (data.code == 2) {
							$("#codeMsg").text(data.msg).css("color", "red");
						}

					}
				});

			}

		});
	</script>

</body>

</html>
