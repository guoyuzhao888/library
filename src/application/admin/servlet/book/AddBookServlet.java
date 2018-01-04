package application.admin.servlet.book;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.JSONArray;

import application.admin.book.Book;
import common.api.CommonApi;

 
@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {
   public void init() throws ServletException
   {
       
   }

   public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
             throws ServletException, IOException
   { 
	    int is_book = 0;
	    PrintWriter out = response.getWriter();
		//设置编码
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 设置响应内容类型
		response.setContentType("text/html;charset=UTF-8");
		String book_name = request.getParameter("book_name");
		String cate_id = request.getParameter("cate_id");
		Book book = new Book();
		
		try {
			is_book = book.add_book(Integer.valueOf(cate_id),book_name);//添加图书
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       // 设置响应内容类型
       response.setContentType("text/html");
       out.println(is_book);
   }
   
   public void destroy()
   {
       // 什么也不做
   }
}