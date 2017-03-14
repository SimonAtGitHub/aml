package com.ist.aml.inves.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.inves.dto.T07_party_ganz;
import com.ist.common.base.BaseDAO;


public class T07_party_ganzDAO extends BaseDAO{
	public T07_party_ganzDAO(){
		
	}
	public List getT07_party_ganzlist(SqlMapClient sqlMap,
			T07_party_ganz t07PartyGanz, int startRec, int intPageSize) throws SQLException {
		return sqlMap.queryForList("getT07_party_ganzList",t07PartyGanz,startRec,intPageSize);
	}

	public int getT07_party_ganzCount(SqlMapClient sqlMap,
			T07_party_ganz t07PartyGanz) throws SQLException {
		Integer iCount = (Integer)sqlMap.queryForObject("getT07_party_ganzCount",t07PartyGanz);
		if(iCount==null){
			return 0;
		}
		return iCount.intValue();
	}
	
	public int insertT07_party_ganz(SqlMapClient sqlMap,
			T07_party_ganz t07PartyGanz) throws SQLException {
		return sqlMap.update("insertT07_party_ganz", t07PartyGanz);
	}
}
