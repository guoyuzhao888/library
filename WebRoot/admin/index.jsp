<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  
  if(session.getAttribute("admin_name") == null)  
  {  
      out.println("<script>window.location.href='login.jsp'</script>");  
      return;  
  }  
%> 
<!DOCTYPE html>
<html>
  <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
  <meta name="renderer" content="webkit|ie-comp|ie-stand">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>图书馆管理员后台</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<script src="../static/layui/layui.js" charset="utf-8"></script>
  <link rel="stylesheet" href="../static/css/sccl.css">
  <link rel="stylesheet" type="text/css" href="../static/skin/blue/skin.css" id="layout-skin"/>
  </head>
  <body>
  <div class="layout-admin">
    <header class="layout-header">
      <span class="header-logo">图书馆管理员后台</span> 
      <a class="header-menu-btn" href="javascript:;"><i class="icon-font">&#xe600;</i></a>
      <ul class="header-bar">
        <li class="header-bar-role"><a href="javascript:;">您好:<% out.println((String)session.getAttribute( "admin_name")); %></a></li>
        <li class="header-bar-nav">
          <a href="javascript:;"><i class="icon-font" style="margin-left:5px;">&#xe60c;</i></a>
          <ul class="header-dropdown-menu">
            <li><a href="unlogin">退出</a></li>
          </ul>
        </li>
		<li class="header-bar-nav"> 
          <a href="javascript:;" title="换肤"><i class="icon-font">&#xe608;</i></a>
          <ul class="header-dropdown-menu right dropdown-skin">
            <li><a href="javascript:;" data-val="qingxin" title="清新">清新</a></li>
            <li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
            <li><a href="javascript:;" data-val="molv" title="墨绿">墨绿</a></li>
          </ul>
        </li>	
      </ul>
    </header>
    <aside class="layout-side">
      <ul class="side-menu">
        
      </ul>
    </aside>
    
    <div class="layout-side-arrow"><div class="layout-side-arrow-icon"><i class="icon-font">&#xe60d;</i></div></div>
    
    <section class="layout-main">
      <div class="layout-main-tab">
        <button class="tab-btn btn-left"><i class="icon-font">&#xe60e;</i></button> 
                <nav class="tab-nav">
                    <div class="tab-nav-content">
                        <a href="javascript:;" class="content-tab active" data-id="">首页</a>
                    </div>
                </nav>
                <button class="tab-btn btn-right"><i class="icon-font">&#xe60f;</i></button>
      </div>
      <div class="layout-main-body">
        <iframe class="body-iframe" name="iframe0" width="100%" height="99%" src="home.jsp" frameborder="0" data-id="" seamless></iframe>
      </div>
    </section>
    <div class="layout-footer">2017 &copy; 秃子小组</div>
  </div>
  <script type="text/javascript" src="../static/js/jquery.min.js"></script>
  <script type="text/javascript" src="../static/js/sccl.js"></script>
  <script type="text/javascript" src="../static/js/sccl-util.js"></script>
  </body>
</html>
<script type="text/javascript">
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
});
  $(function(){
    var menu = [{"id":"1","name":"首页","parentId":"0","url":"","icon":"","order":"1","isHeader":"1","childMenus":[
            {"id":"10","name":"用户管理","parentId":"1","url":"","icon":"&#xe609;","order":"1","isHeader":"0","childMenus":[
            	{"id":"11","name":"用户列表","parentId":"20","url":"./user/user_list.jsp","icon":"","order":"1","isHeader":"0","childMenus":""},
            ]},
            {"id":"20","name":"图书管理","parentId":"1","url":"","icon":"&#xe609;","order":"1","isHeader":"0","childMenus":[
              {"id":"21","name":"图书类别","parentId":"20","url":"./cate/book_cate.jsp","icon":"","order":"1","isHeader":"0","childMenus":""},
              {"id":"22","name":"图书列表","parentId":"20","url":"./book/book_list.jsp","icon":"","order":"1","isHeader":"0","childMenus":""},
              {"id":"23","name":"借书记录","parentId":"20","url":"./book/borrow_record.jsp","icon":"","order":"1","isHeader":"0","childMenus":""},
            ]},
            {"id":"30","name":"<span style='margin:0;padding:0;' class='edit_password'>修改密码</span>","parentId":"1","url":"","icon":"&#xe609;","order":"1","isHeader":"0","childMenus":[
         
            ]},
          ]},
        ]
    init_menu(menu);//初始化菜单
    edit_password();//修改管理员密码
  });
  //修改管理员密码
  function edit_password(){
  	$(".edit_password").click(function(){
		layer.open({
		  type: 2,
		  title: '修改管理员密码',
		  shadeClose: true,
		  shade: 0.8,
		  area: ['33%', '40%'],
		  content: './common/edit_password.jsp'
		});
	});
  }
</script>


