package com.ist.aml.inves.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.inves.dto.T47_cp_deposit;
import com.ist.aml.inves.dto.T47_id_deposit;
import com.ist.common.base.BaseDAO;

public class T47_cp_depositDAO extends BaseDAO {
	public T47_cp_depositDAO() {
	}
	
	
	public T47_cp_deposit getT47_cp_depositDisp(SqlMapClient sqlMap,
			String acct_num) throws SQLException {
		T47_cp_deposit t47_cp_deposit = (T47_cp_deposit) sqlMap.queryForObject(
				"getT47_cp_depositDisp", acct_num);
		if (t47_cp_deposit == null)
			t47_cp_deposit = new T47_cp_deposit();
		return t47_cp_deposit;
	}

}
