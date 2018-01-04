package application.admin.servlet.cate;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.JSONArray;

import application.admin.cate.Cate;
import common.api.CommonApi;

 
@WebServlet("/CateListServlet")
public class CateListServlet extends HttpServlet {
   private String json_data;
   
   public void init() throws ServletException
   {
       
   }

   public void doGet(HttpServletRequest request,
                     HttpServletResponse response)
             throws ServletException, IOException
   {
	    request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setHeader("Content-Type", "text/html; charset=UTF-8");
	    JSONArray book_cate_list;
		Cate cate = new Cate();
		try {
			book_cate_list = cate.book_cate_list();//获取所有图书分类
			int count_cate = cate.count_cate();//统计图书分类个数
			json_data = CommonApi.return_json(book_cate_list,count_cate);//拼装返回数据
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.getOutputStream().write(json_data.getBytes("utf-8")); 
   }
   
   public void doPost(HttpServletRequest request,
           HttpServletResponse response)
   throws ServletException, IOException
   {
	    request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setHeader("Content-Type", "text/html; charset=UTF-8");
	    JSONArray book_cate_list;
		Cate cate = new Cate();
		try {
			book_cate_list = cate.book_cate_list();//获取所有图书分类
			int count_cate = cate.count_cate();//统计图书分类个数
			json_data = CommonApi.return_json(book_cate_list,count_cate);//拼装返回数据
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(json_data);
		response.getOutputStream().write(json_data.getBytes("utf-8")); 
   }
   
   public void destroy()
   {
       // 什么也不做
   }
}