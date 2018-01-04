<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%  
  if(session.getAttribute("user_id") == null)  
  {  
      out.println("<script>window.location.href='user_login.jsp'</script>");  
      return;  
  }  
%> 
<%@include file="../common/header.jsp"%>        
<form class="layui-form" action="" style="display:inline-block;width:70%;margin:0 auto;padding-top:5%;padding-left:5%;">

  <div class="layui-form-item">
    <label class="layui-form-label">用户名:</label>
    <div class="layui-input-block">
      <input type="text" value="" name="user_name" disabled lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input user_name">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">手机号:</label>
    <div class="layui-input-block">
      <input type="text" name="phone" lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input phone">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">新密码:</label>
    <div class="layui-input-block">
      <input type="password" name="password" lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">重复输入:</label>
    <div class="layui-input-block">
      <input type="password" name="repeat_password" lay-verify="required" placeholder="请重新输入新密码" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即修改</button>
    </div>
  </div>
</form>

<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  //监听提交
  form.on('submit(demo1)', function(data){
    var url = 'edit_user';
    var password = data.field.password;
    var repeat_password = data.field.repeat_password;
    var phone = data.field.phone;
    if(password != repeat_password){
    	layer.msg('两次输入的密码不一样', {icon: 0});
    }else{
    	is_ok(url,{password:password,phone:phone},"result_edit_user_info");
    }
    return false;
  });
});
$(function(){
	get_user_info();
	reset();
});
function get_user_info(){
	var url = "edit_user_info";
	is_ok(url,{},'user_info');
}
function user_info(data){
	$(".user_name").val(data.data[0].user_name);
	$(".phone").val(data.data[0].phone);
}
function result_edit_user_info(data){
	if(data == 1){
		layer.msg('修改信息成功,跳转到登陆页面。。。', {icon: 1},function(){
		 	layer.closeAll('loading');
		 	quiet_login();
		 });	
	}else{
		layer.msg('修改信息失败', {icon: 2},function(){
		 	layer.closeAll('loading');
		 	quiet();
		 });	
	}
}
//关闭当iframe
function quiet(){
  var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
  window.parent.location.reload(true);
  parent.layer.close(index); //再执行关闭  
}
//关闭iframe跳转到登陆页面
function quiet_login(){
  var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
  window.parent.location.href = "../login/user_login.jsp";
  parent.layer.close(index); //再执行关闭  
}
</script>
