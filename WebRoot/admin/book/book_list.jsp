<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
  if(session.getAttribute("admin_name") == null)  
  {  
      out.println("<script>window.location.href='login.jsp'</script>");  
      return;  
  }  
%>
<!--使用include编译指定导入页面-->
<%@include file="../common/header.jsp"%>
<div style="display:inline-block;width:90%;margin:0 auto;margin:5% 0 10%;">
	 <button class="layui-btn" id="add_book">添加图书</button>
	<table class="layui-hide" id="test" lay-filter="user_list" lay-data="{id: 'test'}"></table>
</div>
<style>
 .common_handle{
 	line-height:30px;
 }
</style>
<!-- 模版的定义 -->
<script type="text/html" id="handle">
	<a class="layui-btn layui-btn-xs common_handle" lay-event="edit_book">修改</a>
  	<a class="layui-btn layui-btn-danger layui-btn-xs common_handle" lay-event="del_book">删除</a>
</script>
<script type="text/html" id="date_time">
  <span class="create_time">{{d.create_time}}</span>
</script>
<script type="text/html" id="update_time">
  <span class="update_time">{{d.update_time}}</span>
</script>
<script type="text/html" id="cate_id">
  <span hidden>{{d.cate_id}}</span>
</script>

<script>
layui.use('table', function(){
  var table = layui.table;
 
	table.render({
	  elem: '#test'
	  ,url:'book_list'
	  ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
	    layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
	    //,curr: 5 //设定初始在第 5 页
	    ,groups: 1 //只显示 1 个连续页码
	    ,first: false //不显示首页
	    ,last: false //不显示尾页
	    
	  }
	  ,cols: [[
	    {field:'book_id', width:80, title: '图书ID'}
	    ,{field:'book_name', width:200, title: '图书名称'}
	    ,{field:'cate_name', width:200, title: '图书类别'}
	    ,{field:'create_time', width:170, title: '创建时间',templet: '#date_time'}
	    ,{field:'update_time', width:170, title: '更新时间',templet: '#update_time'}
	    ,{field:'', width:200, title: '操作',toolbar: '#handle'}
	    ,{field:'cate_id',templet: '#cate_id'}
	  ]]
	  ,done: function(res, curr, count){
	    $(".create_time").each(function(i){
	    	$(this).text($.myTime.UnixToDate($(this).text().substr(0,10),true));
		});
		$(".update_time").each(function(i){
	    	$(this).text($.myTime.UnixToDate($(this).text().substr(0,10),true));
		});
	  }
	});
  	//监听工具条
	table.on('tool(user_list)', function(obj){
		var data = obj.data;
		if(obj.event === 'edit_book'){
			edit_book(data);
		}else if(obj.event === 'del_book'){
			del_book(data.book_id);
			obj.del();
		}
	});
});
</script>
<script type="text/javascript">
	$(function(){
		add_book();//添加图书
	});
	
	//添加图书
	function add_book(){
		$("#add_book").click(function(){
			layer.open({
			  type: 2,
			  title: '添加图书',
			  shadeClose: true,
			  shade: 0.8,
			  area: ['38%', '40%'],
			  content: 'add_book.jsp'
			});
		});
	}
	//修改图书类别
	function edit_book(data){
		layer.open({
		  type: 2,
		  title: '修改图书信息',
		  shadeClose: true,
		  shade: 0.8,
		  area: ['38%', '40%'],
		  content: 'edit_book.jsp?cate_id='+data.cate_id+'&book_name='+data.book_name+'&book_id='+data.book_id
		});
	}
	//删除用户
	function del_book(book_id){
		del_data = {book_id:book_id};
		//询问框
		layer.confirm('您确定要删除吗，一旦删除无法恢复。', {
		  btn: ['确定','取消'] //按钮
		}, function(url,data){
			var url = 'del_book';
			is_ok(url,del_data);
		});
		
	}
	//删除用户回调函数
	function result(data){
		console.log(data);
		if(data == 1){
			 layer.msg('删除成功', {icon: 1},function(){
			 	layer.closeAll('loading');
			 });
		}else{
			layer.msg('删除失败', {icon: 2},function(){
			 	layer.closeAll('loading');
			 });
		}
	}
</script>
