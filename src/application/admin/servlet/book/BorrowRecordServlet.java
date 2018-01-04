package application.admin.servlet.book;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import application.admin.borrow.BorrowRecord;
import common.api.CommonApi;;

 
@WebServlet("/BorrowRecordServlet")
public class BorrowRecordServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String site;
        // 如果不存在 session 会话，则创建一个 session 对象
        HttpSession session = request.getSession(true);
    	//设置编码
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        // 设置响应内容类型
        response.setContentType("text/html;charset=UTF-8");
        BorrowRecord borrow_record = new BorrowRecord();
        String start_end = request.getParameter("start_end");
        System.out.println(start_end);
        long start = 0;
        long end = 0;
		try {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			start = sdf.parse(start_end.substring(0,10)).getTime();
			end = sdf.parse(start_end.substring(13,23)).getTime()+86400000;
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println(start+"--"+end);
		String json_data = null;
		try {
			JSONArray book_list = borrow_record.select_borrow_record(start,end);//获取所有图书
			int count_book = borrow_record.count_borrow_record(start,end);//统计图书个数
			System.out.println(book_list);
			System.out.println(count_book);
			json_data = CommonApi.return_json(book_list,count_book);//拼装返回数据
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.getOutputStream().write(json_data.getBytes("utf-8"));
    }

}