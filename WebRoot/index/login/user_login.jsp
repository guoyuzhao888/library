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
    <title>学生借阅登陆窗口</title>
	<link rel="stylesheet" href="../../static/layui/css/layui.css">
	<link rel="stylesheet" href="../../static/css/sccl.css">
  	<link href="../../static/layui/css/layui.css" rel="stylesheet" media="all"/>
    <script type="text/javascript" src="../../static/js/jquery.min.js"></script>
    <script type="text/javascript"  src="../../static/js/myself.js"></script>

  </head>
  
  <body class="login-bg">
    <div class="login-box">
        <header>
            <h1>学生借阅登陆窗口</h1>
        </header>
        <div class="login-main">
			<form id="login_form" action="" class="layui-form" method="post">              
				<div class="layui-form-item">
					<label class="login-icon">
						<i class="layui-icon"></i>
					</label>
					<input type="text" name="user_name" lay-verify="userName" autocomplete="off" placeholder="这里输入登录名" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label class="login-icon">
						<i class="layui-icon"></i>
					</label>
					<input type="password" name="user_password" lay-verify="password" autocomplete="off" placeholder="这里输入密码" class="layui-input">
				</div>
				<div class="layui-form-item">
					<div class="pull-right">
						<button class="layui-btn layui-btn-primary submit" lay-submit="" lay-filter="demo1">
							<i class="layui-icon"></i> 登录
						</button>
						<a href="register.jsp"><span class="layui-btn layui-btn-primary submit" lay-submit="" lay-filter="login">
							<i class="layui-icon"></i> 注册
						</span></a>
					</div>
					<div class="clear"></div>
				</div>
			</form>        
		</div>
        <footer style="margin-top: 50px;">
            <p>2017 &copy; 秃子小组</p>
        </footer>
    </div>
    <script src="../../static/layui/layui.js" charset="utf-8"></script>
  </body>
</html>
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,laydate = layui.laydate;
  //监听提交
  form.on('submit(demo1)', function(data){
  	url = "check_login";
  	is_ok(url,data.field,"check_login");
    return false;
  });
});
function check_login(data){
	if(data == 1){
		$(window).attr('location','../index/user_index.jsp');
	}else{
		layer.msg('账号或密码错误', {icon: 2},function(){
		 	layer.closeAll('loading');
		 });
	}
}
</script>
