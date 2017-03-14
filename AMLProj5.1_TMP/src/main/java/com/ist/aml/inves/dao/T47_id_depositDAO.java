package com.ist.aml.inves.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.inves.dto.T47_id_deposit;
import com.ist.common.base.BaseDAO;

public class T47_id_depositDAO extends BaseDAO {
	public T47_id_depositDAO() {
	}
	
	
	public T47_id_deposit getT47_id_depositDisp(SqlMapClient sqlMap,
			String acct_num) throws SQLException {
		T47_id_deposit t47_id_deposit = (T47_id_deposit) sqlMap.queryForObject(
				"getT47_id_depositDisp", acct_num);
		if (t47_id_deposit == null)
			t47_id_deposit = new T47_id_deposit();
		return t47_id_deposit;
	}
	public int modifyT47_acct_uc(SqlMapClient sqlMap,
			T47_id_deposit t47_id_deposit) throws SQLException {
		int i = sqlMap.update("modifyT47_acct_uc", t47_id_deposit);
		return i;
	}

}
