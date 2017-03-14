package com.ist.aml.lip.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import com.ist.aml.lip.dto.BaseDTO;
import com.ist.aml.lip.dto.T00_list_cols;
import com.ist.aml.lip.dto.T00_list_table;
import com.ist.common.base.BaseAction;

import com.ist.common.jcs.CatchManager;
import com.ist.util.LipConstant;

public class lipBaseAction extends BaseAction {

	public lipBaseAction() {
		// TODO Auto-generated constructor stub
	}
    /**
     * 取的库对应列字段的MAP
     * @param dbtype 名单系统的库类型（服务器（LIST）、自定义（PR_LIST）、纠错（ADUIT））
     * @return 类型所对应MAP （KEY 为tablecode+类型（SHOW,COND,SORT,ADD,MOD，CONDDISP，SYN，KEY_NAME，KEY_CATE））
     */
    public Map getT00_list_colsMap(String dbtype)
    {
    	
    	Map map=new LinkedHashMap();
    	if(dbtype==null)
    	{
    		return map;
    	}
    	
    	List colList=new ArrayList();
    	if(dbtype.equalsIgnoreCase(LipConstant.TABLE_EDN_CUL)){
    		 colList = cm.getListFromCache("t00_list_cols_listForPr_audit");
    	}else if(dbtype.equalsIgnoreCase(LipConstant.TABLE_EDN_LSE)){
    		 colList = cm.getListFromCache("t00_list_cols_listForList");
    	}else if(dbtype.equalsIgnoreCase(LipConstant.TABLE_EDN_SEL)){
    		colList = cm.getListFromCache("t00_list_cols_listForAudit");
    	}else{
    		return map;
    	}
    	List  tabList = cm.getListFromCache("t00_list_table_list");
    	Iterator tabIter=tabList.iterator();
    	
    	while(tabIter.hasNext())
    	{
    		T00_list_table table=(T00_list_table)tabIter.next();
    		String tablecode_tab=table.getTablecode();
    		Iterator colIter=colList.iterator();
    		List condList=new ArrayList();//查询条件
    		List showList=new ArrayList();//列表显示
    		List sortList=new ArrayList();//排序
    		List addList=new ArrayList();//添加
    		List adddispList=new ArrayList();//添加界面显示方式（下拉框和定位或多行文本框)
    		List modList=new ArrayList();//修改
    		List synList=new ArrayList();//同步
    		List conddispList=new ArrayList();//查询条件显示方式（下拉框和定位)   		
    		Map keyNameMap=new LinkedHashMap();//colkey 与 colname 的MAP
    		Map keyCateMap=new LinkedHashMap();//colkey 与 类别编码 的map 用于转码
    		while(colIter.hasNext())
    		{
    			T00_list_cols col=(T00_list_cols)colIter.next();
    			String tablecode_col=col.getTablecode();//表名
    			String cond=col.getIscond();//查询条件
    			String show=col.getIsshow();//列表显示
    			String sort=col.getIssort();//排序
    			String add=col.getIsaddinfo();//添加
    			String adddisp=col.getAdddisp();//添加界面显示方式
    			String mod=col.getIsupdinfo();//修改
    			String conddisp=col.getConddisp();//查询条件的显示方式 
    			String condtabkey=col.getCondtabkey();//码表的key值
    			String serverdb=col.getIsserverdb();//在服务器库，用于同步
    			if(tablecode_tab.equals(tablecode_col)){
    			
					if(cond.equals(LipConstant.STAUTS_YES)){
						condList.add(col);
					}
					if(show.equals(LipConstant.STAUTS_YES)){
						showList.add(col);
					}
					if(sort.equals(LipConstant.STAUTS_YES)){
						sortList.add(col);
					}
					if(add.equals(LipConstant.STAUTS_YES)){
						addList.add(col);
					}
					if(adddisp.equalsIgnoreCase(LipConstant.ADD_DISP2)||adddisp.equalsIgnoreCase(LipConstant.ADD_DISP3)||adddisp.equalsIgnoreCase(LipConstant.ADD_DISP5)){
						adddispList.add(col);
					}
					//修改时显示的字段 是建立在是添加字段的基础上
					if(add.equals(LipConstant.STAUTS_YES)&&mod.equals(LipConstant.STAUTS_YES)){
						modList.add(col);
					}
					if(serverdb.equals(LipConstant.STAUTS_YES)){
						synList.add(col);
					}
					//查询条件的显示方式为下拉框或定位
					if(conddisp.equalsIgnoreCase(LipConstant.ADD_DISP2)||conddisp.equalsIgnoreCase(LipConstant.ADD_DISP3)){
						conddispList.add(col);
					}
					if(condtabkey!=null&&!"".equals(condtabkey)){
						keyCateMap.put(col.getColkey().toUpperCase(), condtabkey.trim());
					}
					
					keyNameMap.put(col.getColkey().toUpperCase(), col.getColname());
					
					
    			}
    			
    			
    		}
    		map.put(tablecode_tab+LipConstant.PAGE_COND, condList);
    		map.put(tablecode_tab+LipConstant.PAGE_SHOW, showList);
    		map.put(tablecode_tab+LipConstant.PAGE_SORT, sortList);
    		map.put(tablecode_tab+LipConstant.PAGE_ADD, addList);
    		map.put(tablecode_tab+LipConstant.PAGE_ADDDISP, adddispList);
    		map.put(tablecode_tab+LipConstant.PAGE_MOD, modList);
    		map.put(tablecode_tab+LipConstant.PAGE_SYN, synList);
    		map.put(tablecode_tab+LipConstant.PAGE_CONDDISP, conddispList);
    		map.put(tablecode_tab+LipConstant.KEY_NAME, keyNameMap);
    		map.put(tablecode_tab+LipConstant.KEY_CATE, keyCateMap);
    	}
    	return map;
    }
    
    /**
     * 保存个性化查询条件
     *
     * @param searchObj
     *            搜索对象
     * @param request
     *            HttpServletRequest
     * @throws Exception
     */
    public void saveSearchObject(BaseDTO searchObj, HttpServletRequest request)
            throws Exception {
        HttpSession session = request.getSession();
        // 隐含产生
        String sessionID = searchObj.getClass().getName() + "_searchObj";
        session.setAttribute(sessionID, searchObj);
    }
}
