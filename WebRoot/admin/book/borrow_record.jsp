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
	<form class="layui-form">
		<div class="layui-inline">
	      <label class="layui-form-label">日期范围:</label>
	      <div class="layui-input-inline">
	        <input name="start_end" type="text" style="width:200px;" class="layui-input" id="test6" placeholder=" - ">
	      </div>
	    </div>
	    <button class="layui-btn" lay-submit="" lay-filter="demo1">点击查询</button>
    </form>
	<table class="layui-hide" id="test" lay-filter="user_list" lay-data="{id:'test'}"></table>
</div>
<style>
 .common_handle{
 	line-height:30px;
 }
</style>
<script type="text/html" id="date_time">
  <span class="create_time">{{d.create_time}}</span>
</script>
<script type="text/html" id="update_time">
  <span class="update_time">{{d.update_time}}</span>
</script>
<script>
layui.use(['table','laydate','form'], function(){
  var table = layui.table,
  laydate = layui.laydate,
  form = layui.form;
  //日期范围
  laydate.render({
    elem: '#test6'
    ,range: true
  });
 
	table.render({
	  elem: '#test'
	  ,url:''
	  ,id:'borrow_record'
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
	    ,{field:'create_time', width:170, title: '借书日期',templet: '#date_time'}
	    ,{field:'update_time', width:170, title: '归还日期',templet: '#update_time'}
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
	//监听提交
  form.on('submit(demo1)', function(data){
  	var start_end = data.field.start_end;
    table.reload('borrow_record', {
	  url: 'borrow_record?start_end='+start_end
	});
    return false;
  });
});

</script>
