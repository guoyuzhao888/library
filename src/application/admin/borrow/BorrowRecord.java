package application.admin.borrow;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Date;

import org.json.JSONArray;

import common.api.CommonApi;
public class BorrowRecord {

	/**
	 * 根据时间段查询借书记录
	 */
	public JSONArray select_borrow_record(long start,long end) throws Exception{
		String sql = "select * from borrow_record,book,cate"
				+ " where borrow_record.book_id=book.book_id"
				+ " and book.cate_id=cate.cate_id"
				+ " and borrow_record.create_time>="+start
				+ " and borrow_record.create_time<="+end;
		System.out.println(sql);
		ResultSet rs = CommonApi.operation_db(sql);
		JSONArray book_json = CommonApi.resultSetToJsonArry(rs);
		System.out.println(book_json);
		return book_json;
	}
	
	/**
	 * 统计借阅图书的数量
	 */
	public int count_borrow_record(long start,long end) throws Exception{
		String sql = "select count(*) count_borrow_record from borrow_record"
				+ " where create_time>="+start
				+ " and create_time<="+end;
		ResultSet rs = CommonApi.operation_db(sql);
		if(rs.next()) {  
           return rs .getInt("count_borrow_record");
        } 
		return 0;
	} 
	
}
