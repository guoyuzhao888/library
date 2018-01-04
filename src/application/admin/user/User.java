package application.admin.user;

import java.sql.Connection;
import java.sql.ResultSet;

import org.json.JSONArray;
import org.json.JSONObject;

import com.mysql.jdbc.PreparedStatement;

import common.db.Connect;
import common.model.Admin;
import common.api.CommonApi;
public class User {

	/**
	 * 获取所有用户
	 */
	public JSONArray  user_list() throws Exception{
		String sql = "select * from user";
		ResultSet rs = CommonApi.operation_db(sql);
		JSONArray user_list_json = CommonApi.resultSetToJsonArry(rs);
		return user_list_json;
	}
	
	/**
	 * 统计用户数量
	 */
	public int count_user() throws Exception{
		String sql = "select count(*) as count_user from user";
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
	 * 删除用户
	 */
	public int user_del(String user_id) throws Exception{
		String sql ="delete from user where user_id="+user_id;
		int rs = CommonApi.operation_db_execute(sql);
		return rs;
	}
}
