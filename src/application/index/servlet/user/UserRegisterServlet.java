package application.index.servlet.user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.JSONArray;

import application.index.user.User;
import common.api.CommonApi;

 
@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
   public void init() throws ServletException
   {
       
   }

   public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
             throws ServletException, IOException
   {
	    int count_user;
	   	String url;
	   	JSONArray user_list = null;
	   	PrintWriter out = response.getWriter();
		//设置编码
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 设置响应内容类型
		response.setContentType("text/html;charset=UTF-8");
		String user_name = request.getParameter("user_name");
		String user_password = request.getParameter("user_password");
		String phone = request.getParameter("phone");
		System.out.println(user_name);
		System.out.println(user_password);
		System.out.println(phone);
		
		User user = new User();
		String json_data;
		int result_register=0;
		try {
			int find_user_name = user.find_user_name(user_name);//查询查找是否有这个用户
			if(find_user_name <= 0){
				result_register = user.register_user(user_name, phone, user_password);
			}else{
				result_register = 2;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   
       // 设置响应内容类型
       response.setContentType("text/html");
       out.println(result_register); 
   }
   
   public void destroy()
   {
       // 什么也不做
   }
}