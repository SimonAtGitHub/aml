package com.ist.aml.information.dao;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.TreeMap;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.common.LogUtils;
import com.ist.common.base.BaseDAO;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.XMLProperties;
import com.ist.aml.information.dto.T00_NOTICE;

public class T00_NOTICEDAO extends BaseDAO {
	private static Logger logger = LogUtils.getLogger(T00_NOTICEDAO.class
			.getName());

	/**
	 * 构造函数
	 */
	public T00_NOTICEDAO() {
	}

	/**
	 * 取得列表（可分页）
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t00_notice
	 *            T00_NOTICE
	 * @param iStartRec
	 *            int
	 * @param iPageSize
	 *            int
	 * @throws SQLException
	 * @return ArrayList
	 */
	public ArrayList getT00_NOTICEList(SqlMapClient sqlMap,
			T00_NOTICE t00_notice, int iStartRec, int iPageSize,ApplicationContext context)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT00_NOTICEList",
				t00_notice, iStartRec, iPageSize);
		ArrayList list1=new ArrayList();
		LinkedHashMap typeMap = cm.getMapFromCache("notice_style");

		LinkedHashMap flagMap = cm.getMapFromCache("notice_states");
		XMLProperties sysConfig=(XMLProperties)context.getBean("sysConfig");
		 String rootPath =sysConfig.getProperty("data.import");
		for(int i=0;i<list.size();i++){
			T00_NOTICE t00_notice1=(T00_NOTICE)list.get(i);
			t00_notice1.setFlag_disp((String)flagMap.get(t00_notice1.getFlag()));
			if(t00_notice1.getNotice_gory()!=null &&!t00_notice1.getNotice_gory().equals(""))
			t00_notice1.setNotice_gory_disp((String)typeMap.get(t00_notice1.getNotice_gory()));
			if(t00_notice1.getFilepath()!=null && !t00_notice1.getFilepath().equals("")){
				t00_notice1.setFilepath(rootPath+t00_notice1.getFilepath());
			}
		   list1.add(t00_notice1);
		}
		 
		return list1;
	}

	/**
	 * 取得记录总数
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t00_notice
	 *            T00_NOTICE
	 * @throws SQLException
	 * @return int
	 */
	public int getT00_NOTICEListCount(SqlMapClient sqlMap, T00_NOTICE t00_notice)
			throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT00_NOTICEListCount", t00_notice);
		return iCount.intValue();
	}

	/**
	 * 取单条明细操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Noteice_no
	 *            String
	 * @throws SQLException
	 * @return T00_NOTICE
	 */
	public T00_NOTICE getT00_NOTICEDisp(SqlMapClient sqlMap, String noteice_no,ApplicationContext context)
			throws SQLException {
		T00_NOTICE t00_notice = (T00_NOTICE) sqlMap.queryForObject(
				"getT00_NOTICEDisp", noteice_no);
		if (t00_notice == null)
			t00_notice = new T00_NOTICE();
		LinkedHashMap flagMap = cm.getMapFromCache("notice_states");
		t00_notice.setFlag_disp((String)flagMap.get(t00_notice.getFlag()));
		XMLProperties sysConfig=(XMLProperties)context.getBean("sysConfig");
		 String rootPath =sysConfig.getProperty("data.import");
		if(t00_notice.getFilepath()!=null &&!t00_notice.getFilepath().equals("")){
			t00_notice.setFilepath(java.net.URLEncoder.encode(rootPath+t00_notice.getFilepath()));
		}
		return t00_notice;
	}

	public T00_NOTICE getT00_NOTICEDisp(SqlMapClient sqlMap, String noteice_no)
			throws SQLException {
		T00_NOTICE t00_notice = (T00_NOTICE) sqlMap.queryForObject(
				"getT00_NOTICEDisp", noteice_no);
		if (t00_notice == null)
			t00_notice = new T00_NOTICE();
		return t00_notice;
	}
	/**
	 * 插入操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t00_notice
	 *            T00_NOTICE
	 * @throws SQLException
	 * @return int
	 */
	public int insertT00_NOTICE(SqlMapClient sqlMap, T00_NOTICE t00_notice)
			throws SQLException {
		int i = sqlMap.update("insertT00_NOTICE", t00_notice);
		return i;
	}

	/**
	 * 修改操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t00_notice
	 *            T00_NOTICE
	 * @throws SQLException
	 * @return int
	 */
	public int modifyT00_NOTICE(SqlMapClient sqlMap, T00_NOTICE t00_notice)
			throws SQLException {
		int i = sqlMap.update("modifyT00_NOTICE", t00_notice);
		return i;
	}

	/**
	 * 删除操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Noteice_no
	 *            String
	 * @throws SQLException
	 * @return int
	 */
	public int deleteT00_NOTICE(SqlMapClient sqlMap, String noteice_no)
			throws SQLException {
		int i = sqlMap.update("deleteT00_NOTICE", noteice_no);
		return i;
	}
	public int updateT00_NOTICEFlag(SqlMapClient sqlMap, T00_NOTICE t00_notice)
	throws SQLException {
     int i = sqlMap.update("updateT00_NOTICEFlag", t00_notice);
     return i;
   }
}

