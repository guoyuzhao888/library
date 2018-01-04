package application.index.servlet.user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.JSONArray;

import application.index.user.User;
import common.api.CommonApi;

 
@WebServlet("/FindUserInfoServlet")
public class FindUserInfoServlet extends HttpServlet {
   public void init() throws ServletException
   {
       
   }

   public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
             throws ServletException, IOException
   { 
	    // 如果不存在 session 会话，则创建一个 session 对象
        HttpSession session = request.getSession(true);
		//设置编码
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 设置响应内容类型
		response.setContentType("text/html;charset=UTF-8");
		String user_id = (String)session.getAttribute("user_id");
		User user = new User();
		JSONArray user_info = null;
		String json_data = null;
		try {
			user_info = user.find_user_info(Integer.valueOf(user_id));//修改用户信息
			json_data = CommonApi.return_json(user_info,1);//拼装返回数据
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       // 设置响应内容类型
       response.setContentType("text/html");
       request.setAttribute( "user_info",user_info);
       response.getOutputStream().write(json_data.getBytes("utf-8")); 
   }
   
   public void destroy()
   {
       // 什么也不做
   }
}