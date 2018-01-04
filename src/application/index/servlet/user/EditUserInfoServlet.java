package application.index.servlet.user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.JSONArray;

import application.index.user.User;
import common.api.CommonApi;

 
@WebServlet("/EditUserInfoServlet")
public class EditUserInfoServlet extends HttpServlet {
   public void init() throws ServletException
   {
       
   }

   public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
             throws ServletException, IOException
   { 
	    int edit_user_info = 0;
	    PrintWriter out = response.getWriter();
	    // 如果不存在 session 会话，则创建一个 session 对象
        HttpSession session = request.getSession(true);
		//设置编码
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 设置响应内容类型
		response.setContentType("text/html;charset=UTF-8");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String user_id = (String)session.getAttribute("user_id");
		User user = new User();
		try {
			edit_user_info = user.edit_user_info(Integer.valueOf(user_id),password,phone);//修改用户信息
			System.out.println(edit_user_info+"哈哈");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       // 设置响应内容类型
       response.setContentType("text/html");
       out.println(edit_user_info);
   }
   
   public void destroy()
   {
       // 什么也不做
   }
}