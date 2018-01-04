package application.admin.servlet.book;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.JSONArray;

import application.admin.book.Book;
import common.api.CommonApi;

 
@WebServlet("/DelBookServlet")
public class DelBookServlet extends HttpServlet {
   public void init() throws ServletException
   {
       
   }

   public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
             throws ServletException, IOException
   { 
	    int del_book = 0;
	    PrintWriter out = response.getWriter();
		//设置编码
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 设置响应内容类型
		response.setContentType("text/html;charset=UTF-8");
		String book_id = request.getParameter("book_id");
		Book book = new Book();
		try {
			del_book = book.del_book(Integer.valueOf(book_id));//删除图书
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       // 设置响应内容类型
       response.setContentType("text/html");
       out.println(del_book);
   }
   
   public void destroy()
   {
       // 什么也不做
   }
}