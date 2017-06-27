package com.ist.aml.blacklist.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.blacklist.dto.T52_def_temp;
import com.ist.common.base.BaseDAO;

public class T52_def_tempDAO extends BaseDAO
{
	/**
	 * 取得列表（可分页）
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t52_def_temp
	 *            T31_def_temp
	 * @param iStartRec
	 *            int
	 * @param iPageSize
	 *            int
	 * @throws SQLException
	 * @return ArrayList
	 */
	public ArrayList getT52_def_tempList(SqlMapClient sqlMap,
			T52_def_temp t52_def_temp, int iStartRec, int iPageSize)
			throws SQLException
	{
		ArrayList list = (ArrayList) sqlMap.queryForList("getT52_def_tempList",
				t52_def_temp, iStartRec, iPageSize);

		LinkedHashMap granularitys = cm.getMapFromCache("risk_granularitys");
		LinkedHashMap clienttype = cm.getMapFromCache("temp_clienttype");
		LinkedHashMap flag = cm.getMapFromCache("flag");
		LinkedHashMap coverMap = cm.getMapFromCache("yesNo");
		LinkedHashMap category = cm.getMapFromCache("template_category");

		for (int i = 0; i < list.size(); i++)
		{
			T52_def_temp temp = (T52_def_temp) list.get(i);

			// 设置信息
			 if(temp.getGranularity()!=null){
			 temp.setGranularity_disp((String)
			 granularitys.get(temp.getGranularity()));
			 }
			 if(temp.getParty_class_cd()!=null){
			 temp.setParty_class_cd_disp((String)
			 clienttype.get(temp.getParty_class_cd()));
			 }
			 if(temp.getFlag()!=null){
			 temp.setFlag_disp((String) flag.get(temp.getFlag()));
			 }
			 if(temp.getCoverflag()!=null){
			 temp.setCoverflag_disp((String)
			 coverMap.get(temp.getCoverflag()));
			 }
		}
		return list;
	}

	/**
	 * 1 取得记录总数
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t52_def_temp
	 *            T52_def_temp
	 * @throws SQLException
	 * @return int
	 */
	public int getT52_def_tempListCount(SqlMapClient sqlMap,
			T52_def_temp t52DefTemp) throws SQLException
	{
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT52_def_tempListCount", t52DefTemp);
		return iCount.intValue();
	}
	
	/**
	 * 修改状态
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t52_def_temp
	 *            T31_def_temp
	 * @throws SQLException
	 * @return int
	 */
	public int modifyT52_def_temp_flag(SqlMapClient sqlMap, T52_def_temp t52_def_temp) throws SQLException {
		int i = sqlMap.update("modifyT52_def_temp_flag", t52_def_temp);
		return i;
	}
	
	
	/** 插入道琼斯模板表 */
	public int insertT52_b_def_temp(SqlMapClient sqlMap,
			T52_def_temp t52DefTemp) throws SQLException
	{
		return sqlMap.update("insertT52_b_def_temp", t52DefTemp);
	}
	
	
	/** 取单条明细操作 */
	public T52_def_temp getT52_def_tempDisp(SqlMapClient sqlMap, 
			String templatekey) throws SQLException 
	{
		T52_def_temp t52_def_temp = (T52_def_temp) sqlMap.queryForObject( "getT52_def_tempDisp", templatekey);
		if (t52_def_temp == null)
			t52_def_temp = new T52_def_temp();
		return t52_def_temp;
	}
	
	/** 基本信息修改 */
	public int modifyT52_def_temp(SqlMapClient sqlMap, 
			T52_def_temp t52_def_temp) throws SQLException 
	{
		int i = sqlMap.update("modifyT52_def_temp", t52_def_temp);
		return i;
	}
	
	
	/**
	 * 取得指定模板KEY的T52_B_DEF_TEMP_GRAN列表
	 */
	public ArrayList getT52_def_temp_granList(SqlMapClient sqlMap, 
			String key) throws SQLException 
	{
		ArrayList list = (ArrayList)sqlMap.queryForList("getT52_def_temp_granList", key);
		LinkedHashMap granularityMap = cm.getMapFromCache("data_granularity");
		for(int i=0;i<list.size();i++)
		{
			T52_def_temp temp=(T52_def_temp) list.get(i);
			if(temp.getGranularity()!=null){
				temp.setSqlgranularity_disp((String) granularityMap.get(temp.getSqlgranularity()));
			}
			if(temp.getDatagranularity()!=null){
				temp.setDatagranularity_disp((String) granularityMap.get(temp.getDatagranularity()));
			}
		}
		return list;
	}
	
	
	/**
	 * 插入模板执行粒度表T31_DEF_TEMP_GRAN
	 */
	public int insertT52_b_def_temp_gran(SqlMapClient sqlMap, 
			T52_def_temp t52_def_temp) throws SQLException 
	{
		int i = sqlMap.update("insertT52_b_def_temp_gran", t52_def_temp);
		return i;
	}
	
	/**
	 * 删除操作
	 */
	public int delT52_b_def_temp_sql(SqlMapClient sqlMap, 
			String key) throws SQLException 
	{
		int i = sqlMap.update("delT52_b_def_temp_sql", key);
		return i;
	}
	
	
	/**
	 * 删除操作模板
	 */
	public int deleteT52_def_temp(SqlMapClient sqlMap, String calculateseq) throws SQLException {
		int i = sqlMap.update("deleteT52_def_temp", calculateseq);
		return i;
	}
	
	/**
	 * 删除模板执行粒度表T52_B_DEF_TEMP_GRAN
	 */
	public int deleteT52_b_def_temp_gran(SqlMapClient sqlMap, String sqlkey) throws SQLException {
		int i = sqlMap.update("deleteT52_b_def_temp_gran", sqlkey);
		return i;
	}
	
	
	/**
	 * 插入操作sql
	 */
	public int t52_b_def_temp_sql(SqlMapClient sqlMap, 
			T52_def_temp t52_def_temp) throws SQLException 
	{
		int i = sqlMap.update("t52_b_def_temp_sql", t52_def_temp);
		return i;
	}
	
	/**
	 * 更新操作sql
	 */
	public int updateT52_b_def_temp_sql(SqlMapClient sqlMap, 
			T52_def_temp t52_def_temp) throws SQLException 
	{
		int i = sqlMap.update("updateT52_b_def_temp_sql", t52_def_temp);
		return i;
	}
	
	
	/**
	 * 获得模板执行粒度表详情
	 */
	public T52_def_temp getT52_def_temp_granDisp(SqlMapClient sqlMap, 
			String sqlkey) throws SQLException 
	{
		T52_def_temp t52_def_temp = (T52_def_temp) sqlMap.queryForObject( "getT52_def_temp_granDisp", sqlkey);
		if (t52_def_temp == null)
			t52_def_temp = new T52_def_temp();
		return t52_def_temp;
	}
	
	
	/**
	 * 取得列表
	 */
	public ArrayList getT52_def_temp_sqlList(SqlMapClient sqlMap, 
			String key) throws SQLException 
	{
		ArrayList list = (ArrayList)sqlMap.queryForList("getT52_def_temp_sqlList", key);
		
		return list;
	}
	
	/** 校验sql是否正确 */
	public boolean validateSql(SqlMapClient sqlMap, String validateSql)  
	{
		try
		{
			validateSql = validateSql.toLowerCase();
			validateSql = validateSql.substring(validateSql.indexOf("select"), validateSql.indexOf("where"));
			
			T52_def_temp t52_def_temp = new T52_def_temp();
			t52_def_temp.setValidateSql("("+validateSql+")");
			
			sqlMap.queryForObject("validateSql", t52_def_temp);
		} catch (SQLException e)
		{
			return false;
		}
		return true;
	}
	
	/**
	 * 修改模板执行粒度表T52_DEF_TEMP_GRAN
	 * @param sqlMap
	 * @param t52DefTemp
	 * @return
	 * @throws SQLException
	 */
	public int modifyT52_def_temp_gran(SqlMapClient sqlMap, 
			T52_def_temp t52DefTemp) throws SQLException 
	{
		int i = sqlMap.update("modifyT52_def_temp_gran", t52DefTemp);
		return i;
	}
	
	/**
	 * 插入操作：表T52_B_DEF_TEMP_GRAN
	 * @return int
	 */
	public int copyT52_b_def_temp_gran(SqlMapClient sqlMap, T52_def_temp temp) throws SQLException {
		int i = sqlMap.update("copyT52_b_def_temp_gran", temp);
		return i;
	}
	
	/**
	 * 插入操作：
	 * @return int
	 */
	public int copyT52_b_def_temp_sql(SqlMapClient sqlMap, T52_def_temp temp) throws SQLException {
		int i = sqlMap.update("copyT52_b_def_temp_sql", temp);
		return i;
	}
	
	
	
}
