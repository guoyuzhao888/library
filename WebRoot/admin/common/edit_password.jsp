<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%  
  if(session.getAttribute("admin_name") == null)  
  {  
      out.println("<script>window.location.href='login.jsp'</script>");  
      return;  
  }  
%>
<%@include file="../common/header.jsp"%>        
<form class="layui-form" action="" style="display:inline-block;width:70%;margin:0 auto;padding-top:5%;padding-left:5%;">

  <div class="layui-form-item">
    <label class="layui-form-label">新密码:</label>
    <div class="layui-input-block">
      <input type="password" name="new_password" lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input">
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
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
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
    var url = 'edit_password';
    var old_password = data.field.old_password;
    var new_password = data.field.new_password;
    var repeat_password = data.field.repeat_password;
    if(new_password != repeat_password){
    	layer.msg('两次输入的密码不一样', {icon: 0});
    }else{
    	is_ok(url,{password:new_password},"result_edit_password");
    }
    return false;
  });
});

function result_edit_password(data){
	if(data == 1){
		layer.msg('修改密码成功', {icon: 1},function(){
		 	layer.closeAll('loading');
		 	quiet();
		 });	
	}else{
		layer.msg('修改密码失败', {icon: 2},function(){
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

</script>
