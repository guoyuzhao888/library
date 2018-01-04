package application.index.servlet.user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.JSONArray;

import application.index.user.User;
import common.api.CommonApi;

 
@WebServlet("/CheckLoginServlet")
public class CheckLoginServlet extends HttpServlet {
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
	   	// 如果不存在 session 会话，则创建一个 session 对象
        HttpSession session = request.getSession(true);
		//设置编码
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 设置响应内容类型
		response.setContentType("text/html;charset=UTF-8");
		String user_name = request.getParameter("user_name");
		String user_password = request.getParameter("user_password");
		User user = new User();
		int result_register=0;
		int check_login = 0;
		try {
			check_login = user.check_login(user_name,user_password);//验证用户登陆
			if(check_login == 1){
				String user_id = user.find_user(user_name, user_password);//查找user_id
				session.setAttribute( "user_id",user_id);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   
       // 设置响应内容类型
       response.setContentType("text/html");
       out.println(check_login); 
   }
   
   public void destroy()
   {
       // 什么也不做
   }
}