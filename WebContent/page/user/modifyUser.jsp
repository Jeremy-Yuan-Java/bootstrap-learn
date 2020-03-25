<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>H+ 后台主题UI框架 - 表单验证 jQuery Validation</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">

<!-- 全局js -->
<script src="/pms/js/jquery.min.js?v=2.1.4"></script>
<script type="text/javascript" src="/pms/js/jquery.form.js"></script>

<script src="/pms/js/bootstrap.min.js?v=3.3.6"></script>
</head>

<body class="gray-bg">

	<div class="ibox float-e-margins">
		<div class="ibox-title">
			<h5>用户修改</h5>
			<div class="ibox-tools">
				<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
				</a> <a class="dropdown-toggle" data-toggle="dropdown"
					href="form_basic.html#"> <i class="fa fa-wrench"></i>
				</a> <a class="close-link"> <i class="fa fa-times"></i>
				</a>
			</div>
		</div>
		<div class="ibox-content">
			<form class="form-horizontal m-t" id="addformId" method="post"
				action="/pms/user">
				<input type="hidden" name="id" value="${user.id }"> <input
					type="hidden" name="action" value="modifyUser">
				<div class="form-group">
					<label class="col-sm-3 control-label">用户名：</label>
					<div class="col-sm-3">
						<input id="usernameId" name="username" class="form-control"
							type="text" value="${user.username }">
					</div>
					<div class="col-sm-3">
						<span id="usernameMsg"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">密码：</label>
					<div class="col-sm-3">
						<input id="passwordId" name="password" class="form-control"
							type="password" value="${user.password}">
					</div>
					<div class="col-sm-3">
						<span id="passwordMsg"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">真实姓名</label>
					<div class="col-sm-3">
						<input id="realnameId" name="realname" class="form-control"
							type="text" value="${user.realname}" readonly="readonly">
					</div>
					<div class="col-sm-3">
						<span id="realnameMsg"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">电话</label>
					<div class="col-sm-3">
						<input id="phoneId" name="phone" class="form-control" type="text"
							value="${user.phone}">
					</div>
					<div class="col-sm-3">
						<span id="phoneMsg"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">QQ</label>
					<div class="col-sm-3">
						<input id="qqId" name="qq" class="form-control" type="text"
							value="${user.qq}">
					</div>
					<div class="col-sm-3">
						<span id="qqMsg"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">邮箱</label>
					<div class="col-sm-3">
						<input id="emailId" name="email" class="form-control" type="text"
							value="${user.email}">
					</div>
					<div class="col-sm-3">
						<span id="emailMsg"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-4 col-sm-offset-4">
						<button id="btn" class="btn btn-primary" type="submit">修改系统用户</button>
						<button class="btn btn-white" type="submit">取消</button>
					</div>

				</div>

			</form>
		</div>
	</div>
	<script type="text/javascript">
		// 注册时用户名失去焦点事件
		$("#usernameId").blur(function() {
			checkName();// checkName抽取出去
		});

		// checkName封装
		function checkName() {
			var nameFlag = false;
			var username = $("#usernameId").val();
			var preusername ='${user.username}';
			
			if (username==preusername) {
				$("#usernameMsg").text("可以使用").css("color",
				"green");
				nameFlag = true;
			} else if (username.length == 0) {
				$("#usernameMsg").text("用户名不得为空").css("color", "red");
			} else {
				$.ajax({
					type : "post",
					url : "/pms/user",
					async : false,
					data : {
						action : "checkName",
						username : username
					},
					dataType : "json",
					success : function(data) {
						if (data.code == 11) {
							$("#usernameMsg").text(data.msg)
									.css("color", "red");
							nameFlag = false;
						}
						if (data.code == 10) {
							$("#usernameMsg").text(data.msg).css("color",
									"green");
							nameFlag = true;
						}
						/* console.log(nameFlag); */
					}

				});
			}
			return nameFlag;
		};

		$(function() {
			$("#addformId")
					.ajaxForm(
							{
								beforeSubmit : function() {
									//五个判断
									var checkFlag = checkName();
									var passwordFlag = checkInput(
											"#passwordId", "#passwordMsg",
											/\S/, "请输入密码");

									var phoneFlag = checkInput("#phoneId",
											"#phoneMsg",
											/^1(3|4|5|6|7|8|9)\d{9}$/,
											"请输入正确格式的电话号码");
									var qqFlag = checkInput("#qqId", "#qqMsg",
											/\d{6,11}$/, "请输入正确qq号码");
									var emailFlag = checkInput(
											"#emailId",
											"#emailMsg",
											/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/,
											"请输入正确格式的电话号码");
									console.log(checkFlag + "," + passwordFlag
											+ "," + phoneFlag + "," + qqFlag
											+ "," + emailFlag);

									return checkFlag && passwordFlag
											&& phoneFlag && qqFlag && emailFlag;
								},
								resetFrom : true, // 提交后 表单重置 
								dataType : "json",
								success : function(data) {
									if (data.code == 31) {
										alert(data.msg);
										window.location.href = "/pms/user?action=findPage&currentPage=1&pageSize=10";
									}
									if (data.code == 30) {
										alert(data.msg);
									}
									/* console.log(nameFlag); */
								}

							});
		});

		// 表单验证的封装
		// inputid:表单的id,errMsgId:出错的适合span标签的id,reg:正则表达式，msg:出错时携带的信息

		function checkInput(inputId, errMsgId, reg, msg) {

			var val = $(inputId).val();

			if (val.length == 0) {
				// 页面提示 
				$(errMsgId).text("输入不能为空").css("color", "red");
				return false;
			}
			if (reg.test(val)) { // 正则判断 
				return true;
			} else {
				// 页面提示 
				$(errMsgId).text(msg).css("color", "red");
				return false;
			}
		}
	</script>

</body>

</html>