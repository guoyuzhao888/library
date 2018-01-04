package application.admin.servlet.user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.JSONArray;

import application.admin.user.User;
import common.api.CommonApi;

 
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
   private String json_data;
   
   public void init() throws ServletException
   {
       
   }

   public void doGet(HttpServletRequest request,
                     HttpServletResponse response)
             throws ServletException, IOException
   {
	    int count_user;
	   	String url;
	   	JSONArray user_list = null;
		//设置编码
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 设置响应内容类型
		response.setContentType("text/html;charset=UTF-8");
		
		User user = new User();
		try {
			user_list = user.user_list();//查询所有用户
			count_user = user.count_user();//统计用户个数
			json_data = CommonApi.return_json(user_list,count_user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   
       // 设置响应内容类型
       response.setContentType("text/html");
       response.getOutputStream().write(json_data.getBytes("utf-8"));
   }
   
   public void destroy()
   {
       // 什么也不做
   }
}