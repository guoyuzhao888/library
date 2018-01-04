package common.api;



import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import com.mysql.jdbc.PreparedStatement;
import common.db.Connect;
import common.model.Admin;
public class CommonApi {
	private static String json_data;
	/**
	 * jdbc转成json数组
	 */
	public static JSONArray resultSetToJsonArry(ResultSet rs) throws SQLException,JSONException 
    { 
       // json数组 
       JSONArray array = new JSONArray(); 
         
       // 获取列数 
       ResultSetMetaData metaData = rs.getMetaData(); 
       int columnCount = metaData.getColumnCount(); 
         
       // 遍历ResultSet中的每条数据 
        while (rs.next()) { 
            JSONObject jsonObj = new JSONObject(); 
              
            // 遍历每一列 
            for (int i = 1; i <= columnCount; i++) { 
                String columnName =metaData.getColumnLabel(i); 
                String value = rs.getString(columnName); 
                jsonObj.put(columnName, value); 
            }  
            array.put(jsonObj);  
        } 
         
       return array; 
    }
	//用于拼装返回数据
    public static String return_json(JSONArray data,int count){
    	json_data = "{\"code\":0,\"msg\":\"\",\"count\":"+count+",\"data\":"+data+"}";
    	return json_data;
    }
    //对数据库的操作，查找一类的操作
    public static ResultSet operation_db(String sql_data) throws Exception{
		Connection conn = Connect.getConnection();
		String sql = sql_data;
		PreparedStatement ptmt = (PreparedStatement) conn.prepareStatement(sql);
		ResultSet rs=ptmt.executeQuery();
		return rs;
	}
    //对数据库的操作
    public static int operation_db_execute(String sql_data) throws Exception{
		Connection conn = Connect.getConnection();
		String sql = sql_data;
		PreparedStatement ptmt = (PreparedStatement) conn.prepareStatement(sql);
		int rs=ptmt.executeUpdate();
		return rs;
	}
    /* 
     * 将时间戳转换为时间
     */
    public static String stampToDate(String s){
        String res;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        long lt = new Long(s);
        Date date = new Date(lt);
        res = simpleDateFormat.format(date);
        return res;
    }
}
