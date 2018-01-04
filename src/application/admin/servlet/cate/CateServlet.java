package application.admin.servlet.cate;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.JSONArray;

import application.admin.cate.Cate;
import common.api.CommonApi;

 
@WebServlet("/CateServlet")
public class CateServlet extends HttpServlet {
   private String json_data;
   
   public void init() throws ServletException
   {
       
   }

   public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
             throws ServletException, IOException
   {
	   int is_add_cate = 0;
		PrintWriter out = response.getWriter();
		//设置编码
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 设置响应内容类型
		response.setContentType("text/html;charset=UTF-8");
		String cate_name = request.getParameter("cate_name");
		Cate cate = new Cate();
		
		try {
			is_add_cate = cate.add_book_cate(cate_name);//添加图书类别
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       // 设置响应内容类型
       response.setContentType("text/html");
       out.println(is_add_cate);
   }
   
   public void destroy()
   {
       // 什么也不做
   }
}