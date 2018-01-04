package application.admin.servlet.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import application.admin.book.Book;
import common.api.CommonApi;;

 
@WebServlet("/BookListServlet")
public class BookListServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String site;
        // 如果不存在 session 会话，则创建一个 session 对象
        HttpSession session = request.getSession(true);
    	//设置编码
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        // 设置响应内容类型
        response.setContentType("text/html;charset=UTF-8");
        Book book = new Book();
		String json_data = null;
		try {
			JSONArray book_list = book.book_list();//获取所有图书
			int count_book = book.count_book();//统计图书分类个数
			json_data = CommonApi.return_json(book_list,count_book);//拼装返回数据
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.getOutputStream().write(json_data.getBytes("utf-8")); 

    }

}