package application.admin.cate;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Date;

import org.json.JSONArray;

import common.api.CommonApi;
public class Cate {

	/**
	 * 添加图书类别
	 */
	public int add_book_cate(String cate_name) throws Exception{
		String sql = "insert into cate (cate_name,create_time,update_time) values('"+cate_name+"',"+new Date().getTime()+","+new Date().getTime()+")";
		int rs = CommonApi.operation_db_execute(sql);
		return rs;
	}
	
	/**
	 * 修改图书类别
	 */
	public int edit_book_cate(int cate_id,String cate_name) throws Exception{
		String sql = "update cate set cate_name='"+cate_name+"' where cate_id="+cate_id;
		int rs = CommonApi.operation_db_execute(sql);
		return rs;
	}
	
	/**
	 * 获取所有图书分类
	 */
	public JSONArray book_cate_list() throws Exception{
		String sql = "select * from cate";
		ResultSet rs = CommonApi.operation_db(sql);
		JSONArray book_cate_json = CommonApi.resultSetToJsonArry(rs);
		return book_cate_json;
	}
	
	/**
	 * 统计图书分类个数
	 */
	public int count_cate() throws Exception{
		String sql = "select count(*) as count_cate from cate";
		ResultSet rs = CommonApi.operation_db(sql);
		if(rs.next()) {  
           return rs .getInt("count_cate");
        } 
		return 0;
	}
	
	/**
	 * 删除图书类别
	 */
	public int del_book_cate(int cate_id) throws Exception{
		String sql = "delete from cate where cate_id="+cate_id;
		int rs = CommonApi.operation_db_execute(sql);
		System.out.println(rs);
		return rs;
	}
}
