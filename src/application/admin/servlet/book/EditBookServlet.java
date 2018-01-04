package application.admin.servlet.book;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.JSONArray;

import application.admin.book.Book;
import common.api.CommonApi;

 
@WebServlet("/EditBookServlet")
public class EditBookServlet extends HttpServlet {
   public void init() throws ServletException
   {
       
   }

   public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
             throws ServletException, IOException
   { 
	    int edit_book = 0;
	    PrintWriter out = response.getWriter();
		//设置编码
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 设置响应内容类型
		response.setContentType("text/html;charset=UTF-8");
		String book_name = request.getParameter("book_name");
		String cate_id = request.getParameter("cate_id");
		String book_id = request.getParameter("book_id");
		Book book = new Book();
		try {
			edit_book = book.edit_book(Integer.valueOf(book_id),Integer.valueOf(cate_id),book_name);//修改图书
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       // 设置响应内容类型
       response.setContentType("text/html");
       out.println(edit_book);
   }
   
   public void destroy()
   {
       // 什么也不做
   }
}