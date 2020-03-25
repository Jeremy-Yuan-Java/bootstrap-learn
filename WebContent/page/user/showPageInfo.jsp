<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>H+ 后台主题UI框架 - 数据表格</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">

<!-- Data Tables -->
<link href="css/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet">

<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">
<script src="/pms/js/jquery.min.js?v=2.1.4"></script>
</head>

<body class="gray-bg">
	<div class="ibox-content">

		<div id="DataTables_Table_0_wrapper"
			class="dataTables_wrapper form-inline" role="grid">

			<div id="DataTables_Table_0_wrapper"
				class="dataTables_wrapper form-inline" role="grid">
				<div class="row">
					<div class="col-sm-6">
						<div class="dataTables_length" id="DataTables_Table_0_length">
							<label>每页 <select name="DataTables_Table_0_length"
								aria-controls="DataTables_Table_0" class="form-control input-sm"><option
										value="10">10</option>
									<option value="25">25</option>
									<option value="50">50</option>
									<option value="100">100</option></select> 条记录
							</label>
						</div>
					</div>
					<div class="col-sm-6">
						<div id="DataTables_Table_0_filter" class="dataTables_filter">
							<label>查找：<input type="search"
								class="form-control input-sm" aria-controls="DataTables_Table_0"></label>
						</div>
					</div>
				</div>
				<table
					class="table table-striped table-bordered table-hover dataTables-example dataTable"
					id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info">

					<tr role="row">
						<th>用户姓名</th>
						<th>真实姓名</th>
						<th>邮箱</th>
						<th>qq</th>
						<th>电话</th>
						<th>日期</th>
						<th>操作</th>
					</tr>

					<c:forEach var="user" items="${pageUtils.pageData}">
						<tr class="gradeA odd">
							<td class="sorting_1">${user.username}</td>
							<td class="center">${user.realname}</td>
							<td class="center">${user.email}</td>
							<td class="center">${user.qq}</td>
							<td class="center">${user.phone}</td>
							<td class="center">${user.regTime}</td>
							<td><a
								href="/pms/user?action=findUserById&userId=${user.id}"><span
									class="glyphicon glyphicon-edit"></span>修改</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
								onclick="delUser(this,${user.id})"> <span
									class="glyphicon glyphicon-trash"></span>删除
							</a></td>

						</tr>
					</c:forEach>

				</table>

			</div>
			<div class="row">
				<div class="col-sm-5">
					<div class="dataTables_info" id="DataTables_Table_0_info"
						role="alert" aria-live="polite" aria-relevant="all">显示
						&nbsp;${pageUtils.startNav} &nbsp;到
						&nbsp;${pageUtils.endNav}&nbsp; 项，共&nbsp;
						${pageUtils.lastPage}&nbsp;项</div>
				</div>
				<div class="col-sm-7">
					<div class="dataTables_paginate paging_simple_numbers"
						id="DataTables_Table_0_paginate">
						<ul class="pagination">
							<li class="paginate_button previous"
								aria-controls="DataTables_Table_0" tabindex="0"
								id="DataTables_Table_0_previous"><a
								href="/pms/user?action=findPage&currentPage=${pageUtils.firstPage}&pageSize=10">首页</a></li>
							<c:if test="${pageUtils.currentPage==pageUtils.firstPage}">
								<li class="paginate_button previous disabled"
									aria-controls="DataTables_Table_0" tabindex="0"
									id="DataTables_Table_0_next"><a href=javaScript:void(0)>上一页</a></li>
							</c:if>
							<c:if test="${pageUtils.currentPage!=pageUtils.firstPage}">
								<li class="paginate_button" aria-controls="DataTables_Table_0"
									tabindex="0" id="DataTables_Table_0_next"><a
									href="/pms/user?action=findPage&currentPage=${pageUtils.prePage}&pageSize=10">上一页</a></li>
							</c:if>

							<c:forEach var="index" begin="${pageUtils.startNav }"
								end="${pageUtils.endNav }">
								<c:if test="${index == pageUtils.currentPage}">
									<li class="paginate_button active"
										aria-controls="DataTables_Table_0" tabindex="0"><a
										href="/pms/user?action=findPage&currentPage=${index}&pageSize=10">${index}</a></li>

								</c:if>
								<c:if test="${index != pageUtils.currentPage}">
									<li class="paginate_button " aria-controls="DataTables_Table_0"
										tabindex="0"><a
										href="/pms/user?action=findPage&currentPage=${index}&pageSize=10">${index}</a></li>
								</c:if>

							</c:forEach>

							<c:if test="${pageUtils.currentPage==pageUtils.lastPage}">
								<li class="paginate_button previous disabled"
									aria-controls="DataTables_Table_0" tabindex="0"
									id="DataTables_Table_0_next"><a href=javaScript:void(0)>下一页</a></li>
							</c:if>
							<c:if test="${pageUtils.currentPage!=pageUtils.lastPage}">
								<li class="paginate_button" aria-controls="DataTables_Table_0"
									tabindex="0" id="DataTables_Table_0_next"><a
									href="/pms/user?action=findPage&currentPage=${pageUtils.nextPage}&pageSize=10">下一页</a></li>
							</c:if>
							<li class="paginate_button next"
								aria-controls="DataTables_Table_0" tabindex="0"
								id="DataTables_Table_0_next"><a
								href="/pms/user?action=findPage&currentPage=${pageUtils.lastPage}&pageSize=10">尾页</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script type="text/javascript">
		function delUser(obj,id){
// 			console.log(id);

		if (confirm("是否需要删除")) {
			$.ajax({
				type:"post",
				async:true,
				url:"/pms/user",
				data:{
					action:"delUser",
					id:id
				},
				dataType:"json",
				success:function(data){
					if (data.code==41) {
//	 					console.log("success");
						$(obj).parent().parent().remove();//移除
						alert(data.msg);
					}
					if (data.code==40) {
						alert(data.msg);
					}
				}
				
			});
		}
		
		}
	
	</script>
</body>

</html>
