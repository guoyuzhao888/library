<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%  
  if(session.getAttribute("admin_name") == null)  
  {  
      out.println("<script>window.location.href='login.jsp'</script>");  
      return;  
  }  
%>
<!--使用include编译指定导入页面-->
<%@include file="../common/header.jsp"%>
<div style="display:inline-block;width:88%;margin:0 auto;margin:5% 0 10%;">
	<table class="layui-hide" id="test" lay-filter="user_list"></table>
</div>
<style>
 .common_handle{
 	line-height:30px;
 }
</style>
<script type="text/html" id="date_time">
  <span class="create_time">{{d.create_time}}</span>
</script>
<script>
layui.use('table', function(){
  var table = layui.table;
  
	table.render({
	  elem: '#test'
	  ,url:'user_list'
	  ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
	    layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
	    //,curr: 5 //设定初始在第 5 页
	    ,groups: 1 //只显示 1 个连续页码
	    ,first: false //不显示首页
	    ,last: false //不显示尾页
	    
	  }
	  ,cols: [[
	    {field:'user_id', width:80, title: '用户ID'}
	    ,{field:'user_name', width:150, title: '用户名'}
	    ,{field:'phone', width:150, title: '手机号'}
	    ,{field:'create_time', width:150, title: '创建时间',templet: '#date_time'}
	    ,{field:'create_time', width:300, title: '操作',toolbar: '#handle'}
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
		if(obj.event === 'book_record'){
			book_record(data.user_id);
		}else if(obj.event == 'booking'){
			booking(data.user_id);
		}else if(obj.event == 'del'){
			del_user(data.user_id);
			obj.del();
		}
	});
});
</script>
<script type="text/javascript">
	//借书记录
	function book_record(user_id){
		layer.open({
		  type: 2,
		  title: '借书记录',
		  shadeClose: true,
		  shade: 0.8,
		  area: ['55%', '70%'],
		  content: 'user_book_record.jsp?user_id='+user_id //iframe的url
		});
	}
	//在借图书
	function booking(user_id){
		layer.open({
		  type: 2,
		  title: '正在借阅图书',
		  shadeClose: true,
		  shade: 0.8,
		  area: ['45%', '70%'],
		  content: 'user_booking.jsp?user_id='+user_id //iframe的url
		});
	}
	//删除用户
	function del_user(user_id){
		del_data = {user_id:user_id};
		//询问框
		layer.confirm('您确定要删除吗，一旦删除无法恢复。', {
		  btn: ['确定','取消'] //按钮
		}, function(url,data){
			var url = 'user_del';
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
<!-- 模版的定义 -->
<script type="text/html" id="handle">
	<a class="layui-btn layui-btn-xs common_handle" lay-event="book_record">借书记录</a>
  	<a class="layui-btn layui-btn-xs common_handle" lay-event="booking">在借图书</a>
  	<a class="layui-btn layui-btn-danger layui-btn-xs common_handle" lay-event="del">删除</a>
</script>
