<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%  
  if(session.getAttribute("admin_name") == null)  
  {  
      out.println("<script>window.location.href='login.jsp'</script>");  
      return;  
  }  
%>
<%@include file="../common/header.jsp"%>        
<div lay-filter="form_cate">
	<form class="layui-form" action="" style="display:inline-block;width:70%;margin:0 auto;padding-top:5%;">
 
	  <div class="layui-form-item">
	  	<label class="layui-form-label">图书类别:</label>
	    <div class="layui-input-inline">
	      <select name="cate_id" id="book_cate">
	      </select>
	    </div>
	    <label class="layui-form-label">图书名称:</label>
	    <div class="layui-input-block">
	      <input type="text" name="book_name" lay-verify="required" placeholder="请输入图书名称" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <div class="layui-input-block">
	      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
	      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
	    </div>
	  </div>
	</form>
</div>


<script>
var form1;
layui.use(['form', 'layedit', 'laydate','layer'], function(){
	form1 = layui.form;
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  //监听提交
  form.on('submit(demo1)', function(data){
    var url = 'add_book';
    console.log(data.field);
	is_ok(url,{cate_id:data.field.cate_id,book_name:data.field.book_name},"result_add");
    return false;
  });
$(function(){
	get_book_cate();
});
function get_book_cate(){
	var url = '../cate/book_cate_list';
	is_ok(url,{},"result_book_cate");
}

});
function result_book_cate(data){
	for (cate in data.data)
	{  
		$("#book_cate").append("<option value='"+data.data[cate].cate_id+"'>"+data.data[cate].cate_name+"</option>");
	}
	console.log($("#book_cate").html());
	form1.render();
	layer.closeAll('loading');
}
function result_add(data){
	if(data == 1){
		layer.msg('添加图书成功', {icon: 1},function(){
		 	layer.closeAll('loading');
		 	quiet();
		 });	
	}else{
		layer.msg('添加图书失败', {icon: 2},function(){
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
