package application.admin.book;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Date;

import org.json.JSONArray;

import common.api.CommonApi;
public class Book {

	/**
	 * 添加图书
	 */
	public int add_book(int cate_id,String book_name) throws Exception{
		String sql = "insert into book (book_name,cate_id,create_time,update_time) values('"+book_name+"',"+cate_id+','+new Date().getTime()+","+new Date().getTime()+")";
		int rs = CommonApi.operation_db_execute(sql);
		return rs;
	}
	
	/**
	 * 修改图书
	 */
	public int edit_book(int book_id,int cate_id,String book_name) throws Exception{
		String sql = "update book set book_name='"+book_name+"'"+",cate_id="+cate_id+",update_time="+new Date().getTime()+" where book_id="+book_id;
		int rs = CommonApi.operation_db_execute(sql);
		return rs;
	}
	
	/**
	 * 获取所有图书
	 */
	public JSONArray book_list() throws Exception{
		String sql = "select * from cate,book where cate.cate_id=book.cate_id";
		ResultSet rs = CommonApi.operation_db(sql);
		JSONArray book_cate_json = CommonApi.resultSetToJsonArry(rs);
		return book_cate_json;
	}
	/**
	 * 统计图书数量
	 */
	public int count_book() throws Exception{
		String sql = "select count(*) as count_book from book";
		ResultSet rs = CommonApi.operation_db(sql);
		if(rs.next()) {  
           return rs .getInt("count_book");
        } 
		return 0;
	}
	
	/**
	 * 删除图书
	 */
	public int del_book(int book_id) throws Exception{
		String sql = "delete from book where book_id="+book_id;
		int rs = CommonApi.operation_db_execute(sql);
		return rs;
	}
}
