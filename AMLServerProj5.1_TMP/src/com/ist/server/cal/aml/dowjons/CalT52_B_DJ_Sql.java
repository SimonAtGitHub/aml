package com.ist.server.cal.aml.dowjons;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import org.apache.log4j.Logger;

import com.ist.common.LogUtils;
import com.ist.common.database.SQLExecute;
import com.ist.common.database.dbfunc.DBfunc;
import com.ist.common.database.dbfunc.DBfuncFactory;
import com.ist.server.cal.BaseCalTask;
import com.ist.server.cal.aml.dowjons.bo.PaseDowjonsBo;
import com.ist.server.cal.aml.dowjons.dao.T52_B_DefTempDAO;
import com.ist.server.cal.aml.dowjons.dto.T52_b_def_temp;
import com.ist.server.cal.aml.dowjons.dto.T52_module_typeEnum;
import com.ist.server.dto.T18_task_fact;

/**
 * 后台任务-生成名单查询信息
 * @author liuzp
 *
 */
public class CalT52_B_DJ_Sql extends BaseCalTask
{
	private static Logger logger = LogUtils.getLogger(CalT52_B_DJ_Sql.class
			.getName());

	private HashMap gs_dj_SqlHash 				= new HashMap();	// 计算对象sql
	private ArrayList gs_dj_templetList 		= new ArrayList();	// 名单模板基本信息
	private String statisticdate 				= "";
	private String granularity 					= "";				// 粒度
	private String ROSTER_TABLE 				= "";		// 查询表名
	
	DBfunc func = DBfuncFactory.getDBInstance();

	public CalT52_B_DJ_Sql(T18_task_fact _t18_task_fact)
	{
		super(_t18_task_fact);
	}

	public void init()
	{

	}

	@Override
	public boolean isCanExec(Connection _conn) throws Exception
	{
		boolean isSucc = true;

		return isSucc;
	}

	@Override
	public boolean preTask(Connection conn) throws Exception
	{

		boolean isSucc = true;
		try
		{
//			
			T52_B_DefTempDAO t52_B_DJTempDAO = new T52_B_DefTempDAO();
			statisticdate = this.t18_task_fact.getStatisticdate();
			granularity = this.t18_task_fact.getGranularity();
			
			logger.info("当前计算 " + granularity + " 粒度的评级规则...");

			// 按粒度查询名单模板基本信息
			gs_dj_templetList = t52_B_DJTempDAO.getT52_b_def_tmplListByGranularity(conn, "", "");		
			
			// 查询模板下的计算对象sql
			gs_dj_SqlHash = t52_B_DJTempDAO.getT52_b_def_tmplSqlHash(conn);
			

		} catch (Exception e)
		{
			isSucc = false;
			e.printStackTrace();
			throw e;
		}

		return isSucc;
	}

	public boolean delTask(Connection conn) throws Exception
	{
		boolean isSucc = true;
		try
		{
			granularity = this.t18_task_fact.getGranularity();
			statisticdate = this.t18_task_fact.getStatisticdate();
			Iterator dj_templetIter = gs_dj_templetList.iterator();

			while (dj_templetIter.hasNext())
			{
				T52_b_def_temp t52_b_def_temp = (T52_b_def_temp) dj_templetIter
						.next();

				String sqlgranularity = t52_b_def_temp.getSqlgranularity();			// sql执行粒度
				String tempgranularity = t52_b_def_temp.getDatagranularity();		// 数据执行粒度
				
				if("1".equalsIgnoreCase(t52_b_def_temp.getModuletype()))			// 回溯模板
				{
					ROSTER_TABLE = "T52_B_MID";
				} else {
					ROSTER_TABLE = "T52_B_SEARCH";
				}
				
				func.deleteTable(conn, ROSTER_TABLE);			
				
				

			}
		} catch (Exception e)
		{
			isSucc = false;
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}

	public boolean calTask(Connection conn) throws Exception
	{

		boolean isSucc = true;

		try
		{

			PaseDowjonsBo parseBo = new PaseDowjonsBo();
			Iterator gs_templetIter = gs_dj_templetList.iterator();
			while (gs_templetIter.hasNext())
			{
				T52_b_def_temp t52_b_def_temp = (T52_b_def_temp)gs_templetIter
						.next();
				String sqlkey = t52_b_def_temp.getSqlkey();
				String sqlgranularity = t52_b_def_temp.getSqlgranularity();
				
				if (t52_b_def_temp.getFlag().equalsIgnoreCase("1"))					
				{ 
					ArrayList list = (ArrayList) gs_dj_SqlHash.get(sqlkey);
					if(t52_b_def_temp.getModuletype().equalsIgnoreCase(T52_module_typeEnum.MODULE_TYPE_HS.getModule_type_code()))
					{
						ROSTER_TABLE = "T52_B_MID";
					} else {
						ROSTER_TABLE = "T52_B_SEARCH";
					}
//					
//					granularity = "1";
//					statisticdate = "2013-10-02";
					for (int i = 0; i < list.size(); i++)
					{
						T52_b_def_temp t52_b_def_temp2 = (T52_b_def_temp) list.get(i);
						String sql = t52_b_def_temp2.getSql_str();
						sql = parseBo.getSqlParse(sql, statisticdate, ROSTER_TABLE,
								granularity);
						logger.debug(sql);
						int count = SQLExecute.exeSql(conn, sql);
						
					}
					if (t52_b_def_temp.getModuletype().equalsIgnoreCase(T52_module_typeEnum.MODULE_TYPE_HS.getModule_type_code())) 	// 回溯模板
					{
						// 添加匹配条件
						String conditionSql = "UPDATE " + ROSTER_TABLE
								+ " SET MATCHCONDITION ='"+t52_b_def_temp.getMatchcondition()+"'"+ "WHERE 1=1";
						logger.info(conditionSql);
						SQLExecute.exeSql(conn, conditionSql);
					} 
					
				}
				conn.commit();

			}

		} catch (Exception ex)
		{
			isSucc = false;
			ex.printStackTrace();
			logger.error(ex.getMessage());
			throw ex;
		}
		return isSucc;
	}

	@Override
	public boolean finalTask(Connection _conn) throws Exception
	{
		boolean isSucc = true;

		return isSucc;
	}

	@Override
	public boolean finalSubTask(Connection arg0) throws Exception
	{
		
		return false;
	}

	@Override
	public boolean preSubTask(Connection arg0) throws Exception
	{
		
		return false;
	}

}
