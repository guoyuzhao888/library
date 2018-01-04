package common.db;
import java.sql.*;
public class Connect {
	private static final String driver = "com.mysql.jdbc.Driver";//数据库驱动
	//连接数据库的地址
	private static final String url="jdbc:mysql://127.0.0.1:3306/library?useUnicode=true&characterEncoding=utf8";
	private static final String username="root";//数据库账号
	private static final String password="guoyuzhao123";//数据库密码
	private static Connection conn=null;
	//静态代码块加载驱动
	static{
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//单例模式返回数据库连接对象
	public static Connection getConnection() throws Exception{
		if(conn==null){
			conn = (Connection) DriverManager.getConnection(url,username,password);
		}
		return conn;
	}
}
