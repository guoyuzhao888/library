<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="common.db.*"%>
<%@ page import="common.model.*"%>
<%@ page import="application.admin.Login"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
	<!-- <meta charset="utf-8"> -->
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<meta name="keywords" content="scclui框架">
	<meta name="description" content="scclui为轻量级的网站后台管理系统模版。">
    <title>图书管理员登陆窗口</title>
	<link rel="stylesheet" href="../static/layui/css/layui.css">
	<link rel="stylesheet" href="../static/css/sccl.css">
  	<link href="../static/layui/css/layui.css" rel="stylesheet" media="all"/>
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript"  src="../static/js/myself.js"></script>
  </head>
  <body class="login-bg">
    <div class="login-box">
        <header>
            <h1>图书管理员登陆窗口</h1>
        </header>
        <div class="login-main">
			<form id="login_form" action="index" class="layui-form" method="post">              
				<div class="layui-form-item">
					<label class="login-icon">
						<i class="layui-icon"></i>
					</label>
					<input type="text" name="admin_name" lay-verify="userName" autocomplete="off" placeholder="这里输入登录名" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label class="login-icon">
						<i class="layui-icon"></i>
					</label>
					<input type="password" name="admin_password" lay-verify="password" autocomplete="off" placeholder="这里输入密码" class="layui-input">
				</div>
				<div class="layui-form-item">
					<div class="pull-right">
						<button class="layui-btn layui-btn-primary submit" lay-submit="" lay-filter="login">
							<i class="layui-icon"></i> 登录
						</button>
					</div>
					<div class="clear"></div>
				</div>
			</form>        
		</div>
        <footer style="margin-top: 50px;">
            <p>2017 &copy; 秃子小组</p>
        </footer>
    </div>
    <script src="../static/layui/layui.js"></script>
    <script src="../static/js/admin.js"></script>
  </body>
</html>
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,laydate = layui.laydate;
});
$(function(){
	var is_login = '${is_login}';
	if(is_login === '0'){
		alert("登陆异常");
	}
});

</script>
