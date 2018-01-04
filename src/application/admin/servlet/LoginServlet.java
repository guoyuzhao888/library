package application.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import application.admin.Login;

 
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String site;
        // 如果不存在 session 会话，则创建一个 session 对象
        HttpSession session = request.getSession(true);
    	//设置编码
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        // 设置响应内容类型
        response.setContentType("text/html;charset=UTF-8");
        //获取从页面中提交过来的数据
        String admin_name = request.getParameter("admin_name");
        String admin_password = request.getParameter("admin_password");
        Login login = new Login();
        boolean is_admin = false;
        String url;
		try {
			is_admin = login.checkLogin(admin_name, admin_password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        if(is_admin){
        	// 要重定向的新位置
        	url= "/admin/index.jsp";
            request.setAttribute( "is_login",1);//判断是否登陆
            session.setAttribute( "admin_name",admin_name);
        }else{
            // 要重定向的新位置
        	url= "/admin/login.jsp"; 
            request.setAttribute( "is_login",0);
        }
        request.getRequestDispatcher(url).forward(request,response); 
    }

}