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
    <title>学生注册窗口</title>
	<link rel="stylesheet" href="../../static/layui/css/layui.css">
	<link rel="stylesheet" href="../../static/css/sccl.css">
  	<link href="../../static/layui/css/layui.css" rel="stylesheet" media="all"/>
    <script type="text/javascript" src="../../static/js/jquery.min.js"></script>
    <script type="text/javascript"  src="../../static/js/myself.js"></script>
  <style>
  	.login-box{
  		height:390px;
  	}
  </style>
  </head>
  
  <body class="login-bg">
    <div class="login-box">
        <header>
            <h1>学生注册窗口</h1>
        </header>
        <div class="login-main">
			<form id="login_form" action="#" class="layui-form">              
				<div class="layui-form-item">
					<label class="login-icon">
						<i class="layui-icon"></i>
					</label>
					<input type="text" name="user_name" lay-verify="required" autocomplete="off" placeholder="请输入用户名" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label class="login-icon">
						<i class="layui-icon"></i>
					</label>
					<input type="text" name="phone" lay-verify="required|phone" autocomplete="off" placeholder="请输入手机号" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label class="login-icon">
						<i class="layui-icon"></i>
					</label>
					<input type="password" name="user_password" lay-verify="required" autocomplete="off" placeholder="请输入密码" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label class="login-icon">
						<i class="layui-icon"></i>
					</label>
					<input type="password" name="repeat_password" lay-verify="required" autocomplete="off" placeholder="请重复输入密码" class="layui-input">
				</div>
				<div class="layui-form-item">
					<div class="pull-right">
						<a href="user_login.jsp">
							<span class="layui-btn layui-btn-primary submit">
								<i class="layui-icon"></i> 返回登陆
							</span>
						</a>
						<button class="layui-btn layui-btn-primary submit"  lay-submit="" lay-filter="demo1">
							<i class="layui-icon"></i> 注册
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
  </body>
  <script src="../../static/layui/layui.js" charset="utf-8"></script>
</html>
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
 
  //监听提交
  form.on('submit(demo1)', function(data){
  	url = "register";
    if(data.field.user_password != data.field.repeat_password){
    	layer.msg('两次输入的密码不一致', {icon: 0});
    }else{
    	is_ok(url,data.field,"result_register");
    }
    return false;
  });
});

function result_register(data){
	if(data == 1){
		layer.msg('恭喜你，注册成功，正在跳转。。。', {icon: 1},function(){
		 	$(window).attr('location','user_login.jsp');
		 });	
	}else if(data == 2){
		layer.msg('用户名已经被注册，请重新注册', {icon: 0},function(){
		 	layer.closeAll('loading');
		 });	
	}else{
		layer.msg('注册失败', {icon: 2},function(){
		 	layer.closeAll('loading');
		 });
	}
}
//关闭当iframe
function quiet(){
  var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
  window.parent.location.reload(true);
  parent.layer.close(index); //再执行关闭  
}

</script>
