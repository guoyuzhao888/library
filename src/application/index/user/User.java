package application.index.user;

import java.sql.ResultSet;
import java.util.Date;

import org.json.JSONArray;

import common.api.CommonApi;

public class User {

	/**
	 * 查找有没有这个用户名
	 */
	public int find_user_name(String user_name) throws Exception{
		String sql = "select count(*) as count_user from user where user_name='"+user_name+"'";
		ResultSet rs = CommonApi.operation_db(sql);
		if(rs.next()) {  
           return rs .getInt("count_user");
        } 
		return 0;
	}
	//查找管理员id
	public String find_user(String user_name,String user_password) throws Exception{
		String user_id = null;
		String sql = "select * from user where  user_name='"+user_name+"'"+" and user_password='"+user_password+"'";
		ResultSet rs = CommonApi.operation_db(sql);
		while(rs.next()){
			user_id = rs.getString("user_id");
		}
		return user_id;
	}
	
	/**
	 * 注册用户
	 */
	public int register_user(String user_name,String phone,String user_password) throws Exception{
		String sql = "insert into user (user_name,user_password,phone,create_time,update_time) values('"+user_name+"','"+user_password+"','"+phone+"',"+new Date().getTime()+","+new Date().getTime()+")";
		System.out.println(sql);
		int rs = CommonApi.operation_db_execute(sql);
		return rs;
	}
	
	/**
	 * 验证用户登陆
	 */
	public int check_login(String user_name,String user_password) throws Exception{
		String sql = "select count(*) as count_user from user where user_name='"+user_name+"' and user_password='"+user_password+"'";
		ResultSet rs = CommonApi.operation_db(sql);
		if(rs.next()) {  
           return rs .getInt("count_user");
        } 
		return 0;
	}
	/**
	 * 根据条件统计用户借阅记录
	 */
	public JSONArray user_book_record(String user_id,String state) throws Exception{
		String sql = "select * from user,borrow_record,book where user.user_id=borrow_record.user_id and book.book_id=borrow_record.book_id and borrow_record.user_id="+user_id+" and borrow_record.state="+state;
		ResultSet rs = CommonApi.operation_db(sql);
		JSONArray user_list_json = CommonApi.resultSetToJsonArry(rs);
		return user_list_json;
	}
	
	/**
	 * 修改用户信息
	 */
	public int edit_user_info(int user_id,String password,String phone) throws Exception{
		String sql = "update user set user_password='"+password+"',phone='"+phone+"' where user_id="+user_id;
		int rs = CommonApi.operation_db_execute(sql);
		return rs;
	}
	
	/**
	 * 查找此用户的所有信息
	 */
	public JSONArray find_user_info(int user_id) throws Exception{
		String sql = "select * from user where user_id="+user_id;
		ResultSet rs = CommonApi.operation_db(sql);
		JSONArray user_json = CommonApi.resultSetToJsonArry(rs);
		return user_json;
	}
}
