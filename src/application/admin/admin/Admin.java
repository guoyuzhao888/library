package application.admin.admin;

import common.api.CommonApi;

public class Admin {

	/**
	 * 修改管理员密码
	 */
	public int edit_password(String admin_name,String password) throws Exception{
		String sql = "update admin set admin_password='"+password+"' where admin_name='"+admin_name+"'";
		int rs = CommonApi.operation_db_execute(sql);
		return rs;
	}

}
