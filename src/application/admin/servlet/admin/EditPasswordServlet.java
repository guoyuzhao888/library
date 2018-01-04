package application.admin.servlet.admin;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.JSONArray;

import application.admin.admin.Admin;
import common.api.CommonApi;

 
@WebServlet("/EditPasswordServlet")
public class EditPasswordServlet extends HttpServlet {
   public void init() throws ServletException
   {
       
   }

   public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
             throws ServletException, IOException
   { 
	    int edit_password = 0;
	    PrintWriter out = response.getWriter();
	    // 如果不存在 session 会话，则创建一个 session 对象
        HttpSession session = request.getSession(true);
		//设置编码
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 设置响应内容类型
		response.setContentType("text/html;charset=UTF-8");
		String password = request.getParameter("password");
		String admin_name = (String)session.getAttribute("admin_name");
		System.out.println(admin_name);
		Admin admin = new Admin();
		try {
			edit_password = admin.edit_password(admin_name,password);//修改管理员密码
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       // 设置响应内容类型
       response.setContentType("text/html");
       out.println(edit_password);
   }
   
   public void destroy()
   {
       // 什么也不做
   }
}