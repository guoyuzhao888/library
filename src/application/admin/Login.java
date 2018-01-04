package application.admin;
import java.sql.*;
import com.mysql.jdbc.PreparedStatement;
import common.db.*;
import common.model.*;
public class Login{
	//验证管理员登陆
	public Boolean checkLogin(String admin_name,String admin_password) throws Exception {
		Connection conn = Connect.getConnection();
		Admin admin = null;
		String sql = "select * from admin where  admin_name=? and admin_password=?";
		PreparedStatement ptmt = (PreparedStatement) conn.prepareStatement(sql);
		ptmt.setString(1, admin_name);
		ptmt.setString(2, admin_password);
		ResultSet rs=ptmt.executeQuery();
		rs.last();
		System.out.println(rs.getRow()+"guo");
		if(rs.getRow() > 0){
			return true;
		}
		return false;
	}
}
