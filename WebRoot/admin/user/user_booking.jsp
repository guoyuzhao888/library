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
<div style="padding-left:7%;display:inline-block;margin:0 auto;">
	<table style="width:90%;display:inline-block;margin:0 auto;" class="layui-hide" id="test" lay-filter="user_list"></table>
</div>
<style>
 .common_handle{
 	line-height:30px;
 }
</style>
<script>
layui.use('table', function(){
  var table = layui.table;
	table.render({
	  elem: '#test'
	  ,url:'user_book_record?user_id='+${param.user_id}+'&state=0'
	  ,cols: [[
	    {field:'book_id', width:80, title: '图书ID'}
	    ,{field:'book_name', width:100, title: '图书名'}
	    ,{field:'user_name', width:100, title: '用户名'}
	    ,{field:'create_time', width:150, title: '借阅时间',templet: '#date_time'}
	  ]]
	  ,done: function(res, curr, count){
	    $(".create_time").each(function(i){
	    	$(this).text($.myTime.UnixToDate($(this).text().substr(0,10),true));
		});
	  }
	});
});
</script>
<script type="text/html" id="date_time">
  <span class="create_time">{{d.create_time}}</span>
</script>

