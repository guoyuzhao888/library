<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
  if(session.getAttribute("user_id") == null)  
  {  
      out.println("<script>window.location.href='user_login.jsp'</script>");  
      return;  
  }  
%> 
<style>
	body{
		padding:0;
		margin:0;
		background:url('../../static/image/login-bg-9.jpg');
	}
	.box{
		width:100%;
		height:100%;
	}
	.moddile{
		width:88%;
		height:80%;
		margin:0 auto;
		margin-top:5%;
		background-color:rgba(255, 255, 255, 0.3);
	}
	.moddile .moddile-left{
		width:30%;
		height:100%;
		float:left;
	}
	.moddile .moddile-right{
		width:70%;
		height:100%;
		float:right;
	}
	
	.btn-box{
		width:70%;
		height:80%;
		margin:0 auto;
		padding-top:25%;
		border-right:1px #ccc solid;
	}
	.common-btn{	
		margin-bottom:50px;
		width:200px;
		height:50px;
	}
</style>
<!--使用include编译指定导入页面-->
<%@include file="../common/header.jsp"%>
<div class="box">
	<div class="moddile">
		<div class="moddile-left">
			<div class="btn-box">
				<button style="height:50px;" class="layui-btn layui-btn-lg common-btn add_book">图书借阅</button><br/>
				<button style="height:50px;" class="layui-btn layui-btn-lg common-btn del_book">归还图书</button><br/>
				<button style="height:50px;" class="layui-btn layui-btn-lg common-btn borrowing">当前借阅</button><br/>
				<button style="height:50px;" class="layui-btn layui-btn-lg common-btn edit_user_info">修改信息</button><br/>
			</div>
		</div>
		<div class="moddile-right">
			<div style="padding-top:50px;">
				<div class="layui-carousel" id="test10" style="width:60%;">
				  <div carousel-item="">
				    <div><img src="../../static/image/1.jpg"></div>
				    <div><img src="../../static/image/3.jpg"></div>
				    <div><img src="../../static/image/5.jpg"></div>
				  </div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
layui.use(['carousel', 'form'], function(){
  var carousel = layui.carousel
  ,form = layui.form;
  //图片轮播
  carousel.render({
    elem: '#test10'
    ,width: '778px'
    ,height: '440px'
    ,interval: 4000
  });
  $(function(){
  	add_book();
  	del_book();
  	borrowing();
  	edit_user_info();
  });
	//借阅图书
	function add_book(){
		$(".add_book").click(function(){
			layer.prompt({title: '请输入图书编号', formType: 3}, function(pass, index){
				var url = "add_borrow_record";
				var data = {book_id:pass};
				console.log(data);
				is_ok(url,data,result_add);
			});
		});
	}
	//归还图书
	function del_book(){
		$(".del_book").click(function(){
			layer.prompt({title: '请输入图书编号', formType: 3}, function(pass, index){
				var url = "del_borrow_record";
				var data = {book_id:pass};
				is_ok(url,data,result_del);
			});
		});
	}
	//正在借阅的图书
	function borrowing(){
		$(".borrowing").click(function(){
			layer.open({
			  type: 2,
			  title: '正在借阅图书',
			  shadeClose: true,
			  shade: 0.8,
			  area: ['45%', '70%'],
			  content: 'borrowing.jsp'
			});
		});
	}
});
//借阅的处理结果
function result_add(data){
	if(data == 1){
		layer.msg('借阅成功', {icon: 1},function(){
		 	layer.closeAll();
		 });
	}else if(data == -1){
		layer.msg('此图书已被借阅', {icon: 0},function(){
		 	layer.closeAll();
		 });
	}else{
		layer.msg('借阅失败', {icon: 2},function(){
		 	layer.closeAll();
		 });
	}
}
//还书的处理结果
function result_del(data){
	if(data == 1){
		layer.msg('归还图书成功', {icon: 1},function(){
		 	layer.closeAll();
		 });
	}else if(data == -1){
		layer.msg('您没有借阅这本书，无法归还', {icon: 0},function(){
		 	layer.closeAll();
		 });
	}else{
		layer.msg('归还图书失败', {icon: 2},function(){
		 	layer.closeAll();
		 });
	}
}
//修改用户信息
 function edit_user_info(){
 	$(".edit_user_info").click(function(){
	layer.open({
	  type: 2,
	  title: '修改信息',
	  shadeClose: true,
	  shade: 0.8,
	  area: ['33%', '55%'],
	  content: '../common/edit_user_info.jsp'
	});
});
 }
</script>

