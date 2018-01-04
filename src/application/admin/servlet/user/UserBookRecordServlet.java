package application.admin.servlet.user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.JSONArray;

import application.admin.user.User;
import common.api.CommonApi;

 
@WebServlet("/UserBookRecordServlet")
public class UserBookRecordServlet extends HttpServlet {
   private String json_data;
   
   public void init() throws ServletException
   {
       
   }

   public void doGet(HttpServletRequest request,
                     HttpServletResponse response)
             throws ServletException, IOException
   {
	    JSONArray user_book_record_list;
		//设置编码
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 设置响应内容类型
		response.setContentType("text/html;charset=UTF-8");
		String user_id = request.getParameter("user_id");
		String state = request.getParameter("state");
		User user = new User();
		try {
			user_book_record_list = user.user_book_record(user_id,state);//获取用户借书记录
			json_data = CommonApi.return_json(user_book_record_list,1);//拼装返回数据
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