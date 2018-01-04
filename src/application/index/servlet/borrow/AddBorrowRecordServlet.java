package application.index.servlet.borrow;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.JSONArray;

import application.index.index.BorrowRecord;
import common.api.CommonApi;

 
@WebServlet("/AddBorrowRecordServlet")
public class AddBorrowRecordServlet extends HttpServlet {
   public void init() throws ServletException
   {
       
   }

   public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
             throws ServletException, IOException
   { 
	    int is_add_borrow_record = 0;
	    int is_borrow = 0;
	    // 如果不存在 session 会话，则创建一个 session 对象
        HttpSession session = request.getSession(true);
	    PrintWriter out = response.getWriter();
		//设置编码
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 设置响应内容类型
		response.setContentType("text/html;charset=UTF-8");
		// 设置响应内容类型
	    response.setContentType("text/html");
		String book_id = request.getParameter("book_id");
		String user_id = (String) session.getAttribute("user_id");
		BorrowRecord borrow_record = new BorrowRecord();
		try {
			is_borrow = borrow_record.is_borrow(Integer.valueOf(book_id),0);
			System.out.println(is_borrow);
			if(is_borrow > 0){
				is_add_borrow_record = -1;
			}else{
				is_add_borrow_record = borrow_record.add_borrow_record(book_id,user_id);//添加图书记录
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
       out.println(is_add_borrow_record);
   }
   
   public void destroy()
   {
       // 什么也不做
   }
}