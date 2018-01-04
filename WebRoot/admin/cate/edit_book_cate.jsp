<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%  
  if(session.getAttribute("admin_name") == null)  
  {  
      out.println("<script>window.location.href='login.jsp'</script>");  
      return;  
  }  
%>
<%@include file="../common/header.jsp"%>        
<form class="layui-form" action="" style="display:inline-block;width:70%;margin:0 auto;padding-top:5%;">
 
  <div class="layui-form-item">
    <label class="layui-form-label">类别名称:</label>
    <div class="layui-input-block">
      <input type="hidden" value="${param.cate_id}" name="cate_id">
      <input type="text" value="${param.cate_name}" name="cate_name" lay-verify="required" placeholder="" autocomplete="off"
       class="layui-input cate_name">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即修改</button>
      <span class="layui-btn layui-btn-primary reset" onclick="reset_book_cate();">重置</span>
    </div>
  </div>
</form>

<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;

  //自定义验证规则
  form.verify({
    title: function(value){
      if(value.length < 5){
        return '标题至少得5个字符啊';
      }
    }
    ,pass: [/(.+){6,12}$/, '密码必须6到12位']
    ,content: function(value){
      layedit.sync(editIndex);
    }
  });
  //监听提交
  form.on('submit(demo1)', function(data){
    var url = 'edit_book_cate';
    var data = data.field;
	is_ok(url,{cate_id:data.cate_id,cate_name:data.cate_name},"result_edit");
    return false;
  });
});
function result_edit(data){
	console.log(123);
	if(data == 1){
		layer.msg('修改图书类别成功', {icon: 1},function(){
		 	layer.closeAll('loading');
		 	quiet();
		 });	
	}else{
		layer.msg('修改图书类别失败', {icon: 2},function(){
		 	layer.closeAll('loading');
		 	quiet();
		 });	
	}
}

function reset_book_cate(){
	$(".cate_name").val("");
}
//关闭当iframe
function quiet(){
  var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
  window.parent.location.reload(true);
  parent.layer.close(index); //再执行关闭  
}
</script>
