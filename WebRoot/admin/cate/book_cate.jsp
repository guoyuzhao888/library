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
<div style="display:inline-block;width:65%;margin:0 auto;margin:5% 0 10%;">
	 <button class="layui-btn" id="add_book_cate">添加图书类别</button>
	<table class="layui-hide" id="test" lay-filter="user_list" lay-data="{id: 'test'}"></table>
</div>
<style>
 .common_handle{
 	line-height:30px;
 }
</style>
<!-- 模版的定义 -->
<script type="text/html" id="handle">
	<a class="layui-btn layui-btn-xs common_handle" lay-event="edit_book_cate">修改</a>
  	<a class="layui-btn layui-btn-danger layui-btn-xs common_handle" lay-event="del_book_cate">删除</a>
</script>
<script type="text/html" id="date_time">
  <span class="create_time">{{d.create_time}}</span>
</script>

<script>
layui.use('table', function(){
  var table = layui.table;
 
	table.render({
	  elem: '#test'
	  ,url:'book_cate_list'
	  ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
	    layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
	    //,curr: 5 //设定初始在第 5 页
	    ,groups: 1 //只显示 1 个连续页码
	    ,first: false //不显示首页
	    ,last: false //不显示尾页
	    
	  }
	  ,cols: [[
	    {field:'cate_id', width:80, title: '类别ID'}
	    ,{field:'cate_name', width:200, title: '类别名称'}
	    ,{field:'create_time', width:170, title: '创建时间',templet: '#date_time'}
	    ,{field:'', width:300, title: '操作',toolbar: '#handle'}
	  ]]
	  ,done: function(res, curr, count){
	    $(".create_time").each(function(i){
	    	$(this).text($.myTime.UnixToDate($(this).text().substr(0,10),true));
		});
	  }
	});
  	//监听工具条
	table.on('tool(user_list)', function(obj){
		var data = obj.data;
		if(obj.event === 'edit_book_cate'){
			edit_book_cate(data);
		}else if(obj.event === 'del_book_cate'){
			del_book_cate(data.cate_id);
			obj.del();
		}
		
	});
});
</script>
<script type="text/javascript">
	$(function(){
		add_book_cate();//添加图书类别
	});
	
	//添加图书类别
	function add_book_cate(){
		$("#add_book_cate").click(function(){
			layer.open({
			  type: 2,
			  title: '添加图书类别',
			  shadeClose: true,
			  shade: 0.8,
			  area: ['38%', '40%'],
			  content: 'add_book_cate.jsp'
			});
		});
	}
	//修改图书类别
	function edit_book_cate(data){
		layer.open({
		  type: 2,
		  title: '修改图书类别',
		  shadeClose: true,
		  shade: 0.8,
		  area: ['38%', '40%'],
		  content: 'edit_book_cate.jsp?cate_id='+data.cate_id+'&cate_name='+data.cate_name
		});
	}
	//删除用户
	function del_book_cate(cate_id){
		del_data = {cate_id:cate_id};
		//询问框
		layer.confirm('您确定要删除吗，一旦删除无法恢复。', {
		  btn: ['确定','取消'] //按钮
		}, function(url,data){
			var url = 'del_book_cate';
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
