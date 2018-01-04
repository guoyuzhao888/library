package application.admin.servlet.cate;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.JSONArray;

import application.admin.cate.Cate;
import common.api.CommonApi;

 
@WebServlet("/DelBookCateServlet")
public class DelBookCateServlet extends HttpServlet {
   public void init() throws ServletException
   {
       
   }

   public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
             throws ServletException, IOException
   { 
	    int del_book_cate = 0;
	    PrintWriter out = response.getWriter();
		//设置编码
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 设置响应内容类型
		response.setContentType("text/html;charset=UTF-8");
		String cate_id = request.getParameter("cate_id");
		Cate cate = new Cate();
		System.out.println(cate_id);
		try {
			del_book_cate = cate.del_book_cate(Integer.valueOf(cate_id));//添加图书类别
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       // 设置响应内容类型
       response.setContentType("text/html");
       out.println(del_book_cate);
   }
   
   public void destroy()
   {
       // 什么也不做
   }
}