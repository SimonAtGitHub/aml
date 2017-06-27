package com.ist.server.cal.aml.dowjons;

import ibp.ioc.service.search.SearchProvider;
import ibp.ioc.service.search.es.EsProvider;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ist.server.cal.BaseCalTask;
import com.ist.server.cal.aml.dowjons.dao.T52_B_DefTempDAO;
import com.ist.server.dto.T18_task_fact;

/**
 * ´´½¨Ë÷Òý
 * @author liuzp
 *
 */
public class CreateDowjonsIndex extends BaseCalTask
{

	public CreateDowjonsIndex(T18_task_fact _t18_task_fact)
	{
		super(_t18_task_fact);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void init()
	{
		
		
	}

	@Override
	public boolean isCanExec(Connection _conn) throws Exception
	{
		
		return false;
	}

	@Override
	public boolean delTask(Connection _conn) throws Exception
	{
		
		return false;
	}

	@Override
	public boolean preTask(Connection _conn) throws Exception
	{
		
		return false;
	}

	@Override
	public boolean calTask(Connection _conn) throws Exception
	{
		
		SearchProvider searchProvider = new EsProvider();
		
		T52_B_DefTempDAO t52_b_defTempDao = new T52_B_DefTempDAO();
		int pageSize = 2000;
		int intPage = 1;
		List<Map<String, String>> paramIndexField = new ArrayList<Map<String, String>>();
		while(true)
		{
			List<Map<String, String>> list = t52_b_defTempDao.getT52_b_searchMapList(_conn, pageSize, intPage);
//			List<Map<String, String>> list = t52_b_defTempDao.getT52_b_midMapList(_conn, pageSize, intPage);
			
			if(list.size()==0)
			{
				break;
			} else {
				for (Map<String, String> map : list)
				{
					paramIndexField.add(map);					
				}
				intPage++;
			}
		}
		searchProvider.documentHandler("aml2", "test2", paramIndexField);
		
		

		
		return false;
	}

	@Override
	public boolean finalTask(Connection _conn) throws Exception
	{
		
		return false;
	}

	@Override
	public boolean preSubTask(Connection _conn) throws Exception
	{
		
		return false;
	}

	@Override
	public boolean finalSubTask(Connection _conn) throws Exception
	{
		
		return false;
	}
	
}
