package application.index.index;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Date;

import org.json.JSONArray;

import common.api.CommonApi;
public class BorrowRecord {

	/**
	 * 添加借书记录
	 */
	public int add_borrow_record(String book_id,String user_id) throws Exception{
		String cate_name = null;
		String sql = "insert into borrow_record (book_id,user_id,create_time,update_time) values('"+book_id+"','"+user_id+"',"+new Date().getTime()+","+new Date().getTime()+")";
		int rs = CommonApi.operation_db_execute(sql);
		return rs;
	}
	
	/**
	 * 修改借书记录
	 */
	public int update_borrow_record(int book_id,int user_id,int state) throws Exception{
		String sql = "update borrow_record set state="+state+",update_time="+new Date().getTime()+" where book_id="+book_id+" and user_id="+user_id+" and state=0";
		int rs = CommonApi.operation_db_execute(sql);
		return rs;
	}
	
	/**
	 * 查找此图书是否被自己借阅
	 */
	public int count_borrow_record(int book_id,int user_id,int state) throws Exception{
		String sql = "select count(*) as count_borrow_record from borrow_record where book_id="+book_id+" and user_id="+user_id+" and state="+state;
		ResultSet rs = CommonApi.operation_db(sql);
		if(rs.next()) {  
           return rs .getInt("count_borrow_record");
        } 
		return 0;
	}
	/**
	 * 此书是否被别人借走
	 */
	public int is_borrow(int book_id,int state) throws Exception{
		String sql = "select count(*) as count_is_borrow from borrow_record where book_id="+book_id+" and state="+state;
		ResultSet rs = CommonApi.operation_db(sql);
		if(rs.next()) {  
           return rs .getInt("count_is_borrow");
        } 
		return 0;
	}
}
