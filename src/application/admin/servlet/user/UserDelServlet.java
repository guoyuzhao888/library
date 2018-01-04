package application.admin.servlet.user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.JSONArray;

import application.admin.user.User;
import common.api.CommonApi;

 
@WebServlet("/UserDelServlet")
public class UserDelServlet extends HttpServlet {
   private String json_data;
   
   public void init() throws ServletException
   {
       
   }

   public void doGet(HttpServletRequest request,
                     HttpServletResponse response)
             throws ServletException, IOException
   {
	    
   }
   public void doPost(HttpServletRequest request,
           HttpServletResponse response)
   throws ServletException, IOException
		{
		System.out.println("我是删除用户操作");
		int is_del = 0;
		String del_json = null;
		PrintWriter out = response.getWriter();
		//设置编码
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 设置响应内容类型
		response.setContentType("text/html;charset=UTF-8");
		String user_id = request.getParameter("user_id");
		User user = new User();
		try {
			is_del = user.user_del(user_id);//删除用户信息
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 设置响应内容类型
		response.setContentType("text/html");
		out.println(is_del);
		}
   
   public void destroy()
   {
       // 什么也不做
   }
}