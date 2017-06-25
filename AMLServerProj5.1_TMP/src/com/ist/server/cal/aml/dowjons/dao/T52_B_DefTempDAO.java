package com.ist.server.cal.aml.dowjons.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.ist.common.LogUtils;
import com.ist.common.database.SQLExecute;
import com.ist.server.cal.aml.dowjons.dto.T52_b_def_temp;
import com.ist.server.cal.aml.dowjons.dto.T52_b_midDTO;

/**
 * 生成名单查询表
 * @author liuzp
 *
 */
public class T52_B_DefTempDAO
{
	/**
	 * 日志
	 */
	private static Logger logger = LogUtils.getLogger(T52_B_DefTempDAO.class.getName());
	
	/**
	 * 按粒度查询模板基本信息
	 * @param conn
	 * @param granularity 粒度
	 * @param tempcategory	模板名称
	 * @return
	 * @throws Exception
	 */
	public ArrayList getT52_b_def_tmplListByGranularity(Connection conn, String granularity, String tempcategory) throws Exception 
	{
		ArrayList list = new ArrayList();
		String query = "SELECT B.*, A.SQLKEY, A.SQLGRANULARITY, A.ROSTER_TABLE, A.DATAGRANULARITY"
				+ " FROM T52_B_DEF_TEMP B, T52_B_DEF_TEMP_GRAN A WHERE A.TEMPLATEKEY = B.TEMPLATEKEY"
				+ " AND B.IS_BUILD = '0' ";
		if (!"".equalsIgnoreCase(granularity))
		{
			query=query+" AND B.TEMPCATEGORY='"+tempcategory+"'";
		}
		if (!"".equalsIgnoreCase(tempcategory))
		{
			query=query+" AND B.GRANULARITY='"+granularity+"'";	
		}
		query=query+ " ORDER BY b.CALCULATESEQ";
		logger.debug(query);
		list = SQLExecute.executeQuery(conn, query, null, new T52_b_def_temp());
		return list;
	}
	
	/**
	 * 查询模板下的计算对象sql
	 * @param conn
	 */
	public HashMap getT52_b_def_tmplSqlHash(Connection conn)
	{
		HashMap indicMap = new HashMap();
		String query = "SELECT SQLKEY, SQL_STR FROM T52_B_DEF_TEMP_SQL ORDER BY SQLKEY, CALSQL";
		logger.debug(query);
		try
		{
			ArrayList list = SQLExecute.executeQuery(conn, query, null, new T52_b_def_temp());
			
			// 数据转map
			for(int i=0; i<list.size();i++)
			{
				T52_b_def_temp t52_b_def_temp = (T52_b_def_temp)list.get(i);
				String templatekey=t52_b_def_temp.getSqlkey();
				if(indicMap.get(templatekey)==null){
					ArrayList list1=new ArrayList();
					list1.add(t52_b_def_temp);
					indicMap.put(templatekey, list1);
				}else{
					ArrayList list1=(ArrayList)indicMap.get(templatekey);
					list1.add(t52_b_def_temp);
				}
			}
				
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return indicMap;
	}
	
	public HashMap<String, String> getT52_b_def_tempMatchCondition(Connection conn) throws Exception
	{
		String query = "select MATCHCONDITION from t52_b_mid where  1=1";
		String matchCondition = SQLExecute.queryString(conn, query);
		
		Gson gson = new Gson();
		HashMap<String, String> matchConditionMap = gson.fromJson(matchCondition, new TypeToken<HashMap<String, String>>() {
	        }.getType());
//		HashMap<String, String> matchConditionMap = JSON.parseObject(matchCondition, new TypeReference<HashMap<String, String>>(){} );
		
		/*for (Entry<String, String> entry : matchConditionMap.entrySet()) 
		{  
			 
		    logger.info("Key = " + entry.getKey() + ", Value = " + entry.getValue());  
		  
		} */ 
		return matchConditionMap;
	}
	
	
	/** 查询中间表数据 */
	public ArrayList<T52_b_midDTO> getT52_b_midList(Connection conn, int pageSize, int intPage) throws Exception 
	{
		ArrayList<T52_b_midDTO> list = new ArrayList<T52_b_midDTO>();
		String query = "SELECT ID, NAME, CARD_NO, COUNTRY_CD FROM T52_B_MID";
		logger.debug(query);
		ArrayList<Map<String,String>> sqlList = SQLExecute.executeQueryPage(conn, query, pageSize, intPage);
		for (Map<String, String> map : sqlList)
		{
			T52_b_midDTO t52_b_midDTO = new T52_b_midDTO();
			t52_b_midDTO.setCnnameindex(map.get("CNNAMEINDEX")); 
			t52_b_midDTO.setEnnamecontent(map.get("ENNAMECONTENT"));
			t52_b_midDTO.setId(map.get("ID"));
			list.add(t52_b_midDTO);
		}
		return list;
	}
	
	/** 查询名单数据 */
	public ArrayList<Map<String, String>> getT52_b_searchMapList(Connection conn, int pageSize, int intPage) throws Exception 
	{
		
		String query = "SELECT * FROM T52_B_SEARCH";
		logger.debug(query);
		ArrayList<Map<String,String>> sqlList = SQLExecute.executeQueryPage(conn, query, pageSize, intPage);
		return sqlList;
	}
	
	
	public ArrayList<Map<String, String>> getT52_b_midMapList(Connection conn, int pageSize, int intPage) throws Exception 
	{
		
		String query = "SELECT * FROM T52_B_MID";
		logger.debug(query);
		ArrayList<Map<String,String>> sqlList = SQLExecute.executeQueryPage(conn, query, pageSize, intPage);
		return sqlList;
	}
	
	/** 插入搜索结果表 */
	public void saveT52_b_remount(Connection conn, Map<String, List<Map<String, String>>> dataMap) throws Exception 
	{
		for (Entry<String, List<Map<String, String>>> entry : dataMap.entrySet())
		{
			
			for (Map<String, String> map : entry.getValue())
			{
				 String IDStr = map.get("ID");
				if(IDStr.contains("font"))
				{
					IDStr = IDStr.substring(IDStr.indexOf(">")+1, IDStr.lastIndexOf("<"));				
				} 
				String name = map.get("NAME");
				String remount = map.get("lastTime");
				
				String transactionkey = map.get("TRANSACTIONKEY");
				String query = "INSERT INTO T52_B_REMOUNT   (ID, PARTY_ID, NAME, REMOUNT, TRANSACTIONKEY) VALUES "
						+ "('"+IDStr+"','"+entry.getKey()+"', '"+name+"', to_date('"+remount+"' , 'YYYY-MM-DD HH24:MI:ss'), '"+transactionkey+"')";
				logger.debug(query);
				SQLExecute.exeSql(conn, query);
			}
		}
		/*for (Map<String, String> map : list)
		{
			for (Entry<String, String> entry : map.entrySet())
			{
				 for (Map<String, String> map : documentSearch.getRows())
				 {
					 String IDStr = map.get("ID");
					if(IDStr.contains("font"))
					{
						IDStr = IDStr.substring(IDStr.indexOf(">")+1, IDStr.lastIndexOf("<"));				
					} 
				 }
				String query = "INSERT INTO T52_B_REMOUNT   (ID, PARTY_ID) VALUES ('"+entry.getValue()+"','" +entry.getKey()+"')";
				logger.debug(query);
				SQLExecute.exeSql(conn, query);
			}
		}
		*/
	}
	
	public boolean deleteT52_b_remount(Connection conn) throws Exception
	{
		String query = "truncate table T52_B_REMOUNT ";
		logger.debug(query);
		int i = SQLExecute.exeSql(conn, query);
		if (i==0)
		{
			return false;
		} else 
		{
			return true;
		}
	}
}
