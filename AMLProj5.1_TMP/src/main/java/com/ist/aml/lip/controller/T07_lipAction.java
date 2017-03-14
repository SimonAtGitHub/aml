
package com.ist.aml.lip.controller;

/**
 * <p>
 * Title: INFO SENCE AUDIT SYSTEM
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2003 - 2006
 * </p>
 * <p>
 * Company: 北京银丰新融科技开发有限公司
 * </p>
 * 
 * @author 研发组
 * @version 1.0
 */

import java.io.File;
import java.io.FileReader;
import java.io.InputStream;
import java.io.LineNumberReader;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.upload.FormFile;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.lip.dao.T07_lipDAO;
import com.ist.aml.lip.dto.BaseDTO;
import com.ist.aml.lip.dto.T00_list_cols;
import com.ist.aml.lip.dto.T10_pr_audit;
import com.ist.common.Authorization;
import com.ist.common.FileUpload;
import com.ist.common.LogUtils;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.XMLProperties;
import com.ist.util.DateUtils;
import com.ist.util.FileUtils;
import com.ist.util.LipConstant;
import com.ist.util.StringUtils;
import com.ist.util.ZipUtils;
public class T07_lipAction extends lipBaseAction {
	private static Logger logger = LogUtils.getLogger(T07_lipAction.class
			.getName());

	/**
	 * Action
	 * 
	 * @param mapping
	 *            ActionMapping
	 * @param form
	 *            ActionForm
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		ActionForward myforward = null;
		String myaction = mapping.getParameter();
		
		//更新服务名单导入页面
		if ("addTableData".equalsIgnoreCase(myaction)) {
			myforward = performImportListData(mapping, form, request,
					response);
		}
		 //更新服务名单导入动作
		else if ("addTableDataDO".equalsIgnoreCase(myaction)) {
			myforward = performAddTableDataDo(mapping, form, request,
					response);
		}
		else if ("searchT20_list_all".equalsIgnoreCase(myaction)) {
			myforward = performSearchT20_list_all(mapping, form, request, response);
		}
		// 分类检索
		else if ("searchT20_list_type".equalsIgnoreCase(myaction)) {
				myforward = performSearchT20_list_type(mapping, form, request, response);
		}
		else if ("getT20_list_details".equalsIgnoreCase(myaction)) {
			myforward = performGetT20_list_details(mapping, form, request, response);
		}
		return myforward;

	}


	
	public ActionForward performImportListData(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		try {
			LinkedHashMap tablemap = cm.getMapFromCache("t00_table_listForMap");
			request.setAttribute("tableMap",this.getOptionsListByMap(tablemap,null,false));
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		
		return actionMapping.findForward("success");
	}
	
	public ActionForward performAddTableDataDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		XMLProperties sysConfig = (XMLProperties) context.getBean("sysConfig");
		ActionErrors errors = new ActionErrors();
		FileUpload fileUpload = new FileUpload();
		fileUpload.setSysConfig(sysConfig);
		String result = "";
        String saveflag="0";
		try {
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			T00_list_tableActionForm form = (T00_list_tableActionForm) actionForm;
			FormFile filename=form.getFilename();
			String fname=filename.getFileName();
			
			String attachDir = sysConfig.getProperty("data.import");
			
			if (fname.equals("") || fname == null) {
				errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"error.common", "文件名为空"));
				saveMessages(request, errors);
				return actionMapping.findForward("failure");
			}else{
				if(!fname.substring(0, 5).equals(form.getTablecode())){
					errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
							"error.common", "导入的数据和选中的名单库不符"));
					saveMessages(request, errors);
					return actionMapping.findForward("failure");
				}
			}
			String tablecode=form.getTablecode();
			String newFilePathAndPath=this.uplodeFile(fname, filename, tablecode);
//			 取得当前用户
			Authorization auth = this.getAuthorization(request);
			String create_user = auth.getT00_user().getUsername();
			if (fname != null && fname.toUpperCase().endsWith(".ZIP")) {
				// 1.解开数据包，并把数据包中的报文放到该数据包相同的目录。
				ZipUtils zipUtils = new ZipUtils();
				String newFilePath = newFilePathAndPath.substring(0,
						newFilePathAndPath.indexOf(fname) - 1);
				String TXTPath = attachDir + newFilePath;
				File FDfile = new File(TXTPath);
				zipUtils.unzip(attachDir + newFilePathAndPath, TXTPath);
				// 2.遍历该目录下所有的XML报文，逐一解析。
				if (FDfile.isDirectory()){
					File[] FDXMLfiles = FDfile.listFiles();
					for (int m = 0; m < FDXMLfiles.length; m++) {
						// 取得该txt文件的绝对路径
						String TXTfileName = attachDir+newFilePath + File.separator
								+ FDXMLfiles[m].getName();
						if (TXTfileName.toUpperCase().endsWith(".TXT")) {
							String fileName = FDXMLfiles[m].getName();
							this.operatorFile(fileName, TXTfileName, form.getTablecode(), create_user);
						}
					}
					
				}
			} else if (fname != null && fname.toUpperCase().endsWith(".TXT")) {
				// 解析xml,如果解析正确，则返回回执号，否则，返回错误码
				String filepathname=attachDir+newFilePathAndPath;
				this.operatorFile(fname, filepathname, form.getTablecode(), create_user);
				
			} else {
				result = "该文件不是数据包或者文本，不能解析！";
			}

			// 如果result是负值，则抛出异常
			if (result.indexOf("-") == 0) {
				throw new Exception("");
			}
			saveflag="1";
			request.setAttribute("title_flag", "1");
			request.setAttribute("newsearchflag", "1");
			sqlMap.commitTransaction();
			
		} catch (Exception e) {
			saveflag="0";
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			
			return actionMapping.findForward("failure");

		}finally{
			try{
				sqlMap.endTransaction();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		request.setAttribute("saveflag", "1");
		return actionMapping.findForward("success");
	}
	
	public String  uplodeFile(String fname,FormFile file,String tablecode) throws Exception{
		InputStream streamIn = null;
		String newFilePathAndPath =""; 
		try{
			FileUpload fileUpload = (FileUpload)context.getBean("fileUpload");
			 streamIn = file.getInputStream();
			String path ="importtxt"+File.separator+ tablecode;
			// 保存文件的主目录
			 newFilePathAndPath = fileUpload.uploadFile(fname, streamIn,
					path, "day");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(streamIn!=null){
				streamIn.close();
			}
		}
		return  newFilePathAndPath;
	}
	
	public void operatorFile(String fileName,String TXTfileName,String tablecode,String create_user)throws Exception{
		T07_lipDAO t10_pr_auditDAO =(T07_lipDAO)context.getBean("t10_pr_auditDAO");
		String version=fileName.substring(0,17);//版本号
		String up_flag=fileName.substring(24,25);//更新标志
		String list_source=fileName.substring(5,7);//来源
		
		//查询该版本号数据是否已经导入
		T10_pr_audit t10_pr_audit=new T10_pr_audit();
		t10_pr_audit.setList_type(tablecode);
		t10_pr_audit.setList_source(String.valueOf(Integer.parseInt(list_source)));
		String maxversion=t10_pr_auditDAO.getT10_pr_auditVerson(sqlMap, t10_pr_audit);
		String flag="";
		if(maxversion==null || maxversion.equals(""))
			maxversion=tablecode+list_source+"0000000000";
		if(up_flag.equals("0")){
			if(Float.parseFloat(version.substring(7))==(Float.parseFloat(maxversion.substring(7))+1)){
				flag="1";
			}
		}else{
			if(Float.parseFloat(version.substring(7))>Float.parseFloat(maxversion.substring(7))){
				flag="1";
			}
		}
		if(flag.equals("1")){
			//插入版本信息
			String plots=fileName.substring(17,24);//笔数
			t10_pr_audit.setVersion(version);
			t10_pr_audit.setPlots(String.valueOf(Integer.parseInt(plots)));
			t10_pr_audit.setUp_flag(up_flag);
			t10_pr_audit.setIscheck("1");
			t10_pr_audit.setApp_dt(DateUtils.dateToStringShort(DateUtils.getCurrDateTime()));
			t10_pr_audit.setApp_user(create_user);
			t10_pr_audit.setUpload_user(create_user);
			t10_pr_audit.setUpload_dt(DateUtils.dateToStringShort(DateUtils.getCurrDateTime()));
			int count=t10_pr_auditDAO.insertT10_pr_audit(sqlMap, t10_pr_audit);
             //	将文件中的数据导入到临时表
			ArrayList list=this.getInsertT10_pr_auditSql(TXTfileName, tablecode, Integer.parseInt(plots), version);
			if(list.size()>0){
				this.bathExecSql(sqlMap, list,200);
			}
		}
	}
	
	public void bathExecSql(SqlMapClient sqlMap,ArrayList insertList,int length)throws Exception{
    		double totalpate=Math.ceil((double)insertList.size()/(double)length);
    		for(int i=0;i<totalpate;i++){
    			sqlMap.startBatch();
    			int n=(int)totalpate-1;
    			if(i!=n){
    			for(int j=0;j<length;j++){
    			String execsql=(String)insertList.get(i*length+j);
    			 sqlMap.update("getValueSQLInt", execsql); 
    			}}else{
    				for(int k=n*length;k<insertList.size();k++){
    					String execsql=(String)insertList.get(k);
    					System.out.println("sql:"+k+":;"+execsql);
    					 sqlMap.update("getValueSQLInt", execsql); 	
    				}
    			}
    			 sqlMap.executeBatch();
    			 sqlMap.commitTransaction();
    		}
    		
    	}
	
	public ArrayList getInsertT10_pr_auditSql(String filename,String tablecode,int recondcount,String version) throws Exception {
		ArrayList list=new ArrayList();
		 FileReader fr=null;
         LineNumberReader lr=null;
       try{
    	    fr=new FileReader(filename);
            lr=new LineNumberReader(fr,512);
         int i=0;
         String titlestr="";
         String valuestr="";
         while(i<=recondcount+1){
             String str=lr.readLine(); 
             if(str==null) break;
            	if(i==0){
            		String[] tstrs=str.split("#") ;
                	for(int j=0;j<tstrs.length;j++){
                	  if(i==0){
                		titlestr=titlestr+","+tstrs[j];
                	  }
                	}
            	}else{
            		valuestr=valuestr+str.trim();
            	}
            	if(i==0&&!titlestr.equals("")){
            		titlestr=titlestr.substring(1);
            		titlestr="insert into T20_"+tablecode+"_pr_list ("+titlestr+",party_id,version) values(";
            	   i++;
            	}else{
            	if(str.endsWith("';")){	
            		valuestr=valuestr.substring(0, valuestr.length()-1);
            	String party_id ="PR_LIST_"+ this.getSequenceNextVal("SEQ_T20_"+tablecode+ "_" + "PR_LIST");	
            	valuestr=titlestr+valuestr+",'"+party_id+"','"+version+"')";
                list.add(valuestr);
            	valuestr="";
            	 i++;
            	}
              }
            
             
         }
       }catch(Exception e){
    	   e.printStackTrace();
       }finally{
    	   if(lr!=null){
    		   lr.close();  
    	   }
    	   if(fr!=null){
    		   fr.close();
    	   }
       }
        
       
	   return list;   
	}
	
	public ActionForward performSearchT20_list_all(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		
		ActionErrors errors = new ActionErrors();
		T00_list_colsActionForm form = (T00_list_colsActionForm) actionForm;
		T07_lipDAO t00_list_colsDAO =(T07_lipDAO)context.getBean("t10_pr_auditDAO");
		String tablecode = request.getParameter("tablecode");
		String tablename = LipConstant.TABLE_PRE + tablecode + "_pr_list";
		
		List resultList = null;
		List showColList = null;

		try {
			/**取生产库所需的各种关于t00_list_cols的list*/
			Map listMap=(Map)this.getT00_list_colsMap(LipConstant.TABLE_EDN_LSE);
			
			/** 取得列显示列表 */
			 showColList = (List)listMap.get(tablecode+LipConstant.PAGE_SHOW);
			
			/** 取得数据列表 */
			StringBuffer sql = new StringBuffer();
			//sql select 后面的列 
			String colkeys = t00_list_colsDAO.getT00_list_cols_colkeys_t1(showColList);
			// 查询条件
			//String cond = t00_list_colsDAO.getWhereCondition(request);
			StringBuffer cond=new StringBuffer();
			cond.append(" and (");
			if("2".equals(request.getParameter("newsearchflag")))
			{
				cond.append(" 1<0) ");
			}else
			{
			String value=(StringUtils.null2String(request.getParameter("search_all"))).toUpperCase();
			value = URLDecoder.decode(value, "utf-8");

			Map colkeyMap= (Map)listMap.get(request.getParameter("tablecode")+LipConstant.KEY_NAME);
			
			Iterator iter= colkeyMap.keySet().iterator();
			while(iter.hasNext())
			{
				String colkey=(String)iter.next();
				
				cond.append(" upper(t1."+colkey+") like '%"+value+"%' or");
				
			}
			if(cond.toString().endsWith("or"))
			{
				cond.delete(cond.length()-2,cond.length());
			}
			cond.append(")");
			} 
			
			sql.append("SELECT PARTY_ID,"+colkeys);
			sql.append( " FROM " + tablename+" t1 ");
			sql.append(" WHERE  1>0 " + cond);
			
			//分页中的记录总数
			String sql_count = "SELECT COUNT(*) FROM " + tablename+" t1 WHERE 1>0 " + cond;
			
			String url="";
			
			if("main".equals(request.getParameter("type")))
			{
				url = request.getContextPath() + "/list"
					+ actionMapping.getPath() + ".do?type=main&tablecode="+ form.getTablecode();
			}else
			{
				url = request.getContextPath() + "/list"
				+ actionMapping.getPath() + ".do?tablecode="+ form.getTablecode();
			}
			T00_list_cols t00_list_cols = new T00_list_cols();
			
			t00_list_cols.setSql(sql.toString());
			t00_list_cols.setSql_count(sql_count);
			t00_list_cols = (T00_list_cols) this.getSearchObjectForDSQL(t00_list_cols, request, form, sql_count, url);
			t00_list_cols.setSearch_all(form.getSearch_all());
			
			// 个性化的查询条件
			if (t00_list_cols.getNewsearchflag().equals("1")) {
				saveSearchObject(t00_list_cols, request);
				
			Map keyCateMap=(Map)listMap.get(tablecode+LipConstant.KEY_CATE);
			//分页取得列表 并且 转码
			resultList = t00_list_colsDAO.getT00_list_cols_resultList(sqlMap,
					sql.toString(), this.getStartRec(t00_list_cols.getIntPage()),
					this.getIntPageSize(),keyCateMap);
			}else
			{
				form.setSearch_all(t00_list_cols.getSearch_all());
				Map keyCateMap=(Map)listMap.get(tablecode+LipConstant.KEY_CATE);
				//分页取得列表 并且 转码
				resultList = t00_list_colsDAO.getT00_list_cols_resultList(sqlMap,
						t00_list_cols.getSql(), this.getStartRec(t00_list_cols.getIntPage()),
						this.getIntPageSize(),keyCateMap);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		
		if (resultList == null)
			resultList = new ArrayList();	
		if (showColList == null)
			showColList = new ArrayList();
		request.setAttribute("resultList", resultList);		
		request.setAttribute("showColList", showColList);	
		request.setAttribute("tablecode", form.getTablecode());	
		LinkedHashMap tableMap = cm.getMapFromCache("t00_table_listForMap");
		if(tableMap.containsKey(tablecode)){
			request.setAttribute("title", (String)tableMap.get(tablecode));
			}
		
		
		if("main".equals(request.getParameter("type")))
		{
			return actionMapping.findForward("success2");
		}
		return actionMapping.findForward("success");
	}
	
	public BaseDTO getSearchObjectForDSQL(BaseDTO searchObj,
			HttpServletRequest request, ActionForm form, String sql_count,
			String url) throws Exception {
		HttpSession session = request.getSession();
		String newsearchflag = StringUtils
				.null2String(request.getParameter("newsearchflag"));
		searchObj.setNewsearchflag(newsearchflag);
		//
		int intPage = 1;
		// 隐含产生
		String sessionID = searchObj.getClass().getName() + "_searchObj";

		String wherefrom = StringUtils.null2String(request
				.getParameter("wherefrom"));

		if (newsearchflag.equals("1")) {// 新的查询
			// if(!wherefrom.equals("trunpage")){//新的查询
			PropertyUtils.copyProperties(searchObj, form);
			// 本次查询总页数
			Integer iCount = (Integer) sqlMap.queryForObject("getValueSQLInt",
					sql_count);
			int totalRow = iCount.intValue();
			searchObj.setTotalRow(totalRow);
			// =====

			// =====
			//不查询
			} else if (newsearchflag.equals("2")){
			
			}
			
			else {// 翻页
			searchObj = (BaseDTO) session.getAttribute(sessionID);
			String intPageStr = request.getParameter("intPage");
			//
			if (intPageStr == null)
				intPage = searchObj.getIntPage();
			else {
				try {
					intPage = Integer.parseInt(intPageStr);
				} catch (Exception e) {
				}
				searchObj.setIntPage(intPage);
			}

			if (!wherefrom.equals("trunpage")) {
				Integer iCount = (Integer) sqlMap.queryForObject("getValueSQLInt",
						((T00_list_cols)searchObj).getSql_count());
				int totalRow = iCount.intValue();
				searchObj.setTotalRow(totalRow);
			}

		}

		searchObj.setNewsearchflag(newsearchflag);
		session.setAttribute(sessionID, searchObj);

		String pageInfo = this.getPageInfoStr(searchObj.getTotalRow(), intPage,
				url, "");

		request.setAttribute("pageInfo", pageInfo);

		return searchObj;
	}
	
	/**
	 *  分类检索
	 * @param mapping
	 *            ActionMapping
	 * @param form
	 *            ActionForm
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return ActionForward
	 */
	public ActionForward performSearchT20_list_type(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		
		ActionErrors errors = new ActionErrors();
		T00_list_colsActionForm form = (T00_list_colsActionForm) actionForm;
		T07_lipDAO t00_list_colsDAO =(T07_lipDAO)context.getBean("t10_pr_auditDAO");
		String tablecode = form.getTablecode();
		String tablename = "T20_" + tablecode + "_pr_list";
		
		List condList = null;
		List orderList = null;
		
		List showColList = null;
		List condTabKeyList = null;
		Map condTabKeyMap =new LinkedHashMap();
		Map condValueMap = new LinkedHashMap();	
		List resultList = null;

		try {
			/**取生产库所需的各种关于t00_list_cols的list*/
			Map listMap=(Map)this.getT00_list_colsMap(LipConstant.TABLE_EDN_LSE);
			
			/** 取得查询条件列表 */			
			condList = (List)listMap.get(tablecode+LipConstant.PAGE_COND);
			if (condList == null)condList = new ArrayList();
			// 设置排序
			T00_list_cols order = new T00_list_cols();
			order.setColkey("ORDER_BY");
			order.setColname("排序");
			condList.add(order);
			
			/** 保存设置查询条件值 */
			condValueMap = t00_list_colsDAO.getWhereConditionMap(request);

			/** 取得查询条件为下拉框或定位类型所对应的码表值 */
			condTabKeyList = (List)listMap.get(tablecode+LipConstant.PAGE_CONDDISP);			
			condTabKeyMap = this.getCondMap(condTabKeyList);

			/** 取得排序列列表 */
			orderList =(List)listMap.get(tablecode+LipConstant.PAGE_SORT); 
			Map sortColumnMap = new LinkedHashMap();
			if (orderList == null)
				orderList = new ArrayList();
			for (int i = 0; i < orderList.size(); i++) {
				T00_list_cols temp = (T00_list_cols) orderList.get(i);
				if (temp == null)
					continue;
				sortColumnMap.put(temp.getColkey(), temp.getColname());
			}
			orderList = this.getOptionsListByMap(sortColumnMap, null, true);

			/** 取得列显示列表 */
			showColList = (List)listMap.get(tablecode+LipConstant.PAGE_SHOW);
			
			
			
			/** 取得数据列表 */
			
			StringBuffer sql = new StringBuffer();
			//sql select 后面的列 
			String colkeys = t00_list_colsDAO.getT00_list_cols_colkeys(showColList);
			// 查询条件
			
			String cond = t00_list_colsDAO.getWhereCondition(request);
			
			//不是新的查询 
			if("2".equals(request.getParameter("newsearchflag"))){
				cond=" and 1<0 ";
			}
			
			// 排序列情况 
			String order_by = "";
			if (!StringUtils.null2String(form.getSort_type()).equals("")) {// 排序类型不为空
				if (!StringUtils.null2String(form.getSort_column()).equals("")) {// 排序列不为空
					order_by = " order by " + form.getSort_column() + " "+ form.getSort_type();
				}
			}
			sql.append("SELECT PARTY_ID,"+colkeys);
			sql.append( " FROM " + tablename);
			sql.append(" WHERE  1>0 " + cond);	
			sql.append(order_by);
			//分页中的记录总数
			String sql_count = "SELECT COUNT(*) FROM " + tablename+ " WHERE 1>0 " + cond;
			String url = request.getContextPath() + "/list"
					+ actionMapping.getPath() + ".do?tablecode="+ form.getTablecode();
			
			T00_list_cols t00_list_cols = new T00_list_cols();
			t00_list_cols.setSql(sql.toString());
			t00_list_cols.setSql_count(sql_count);
			t00_list_cols.setCondValueMap(condValueMap);
			t00_list_cols = (T00_list_cols) this.getSearchObjectForDSQL(t00_list_cols, request, form, sql_count, url);
			
			// 个性化的查询条件
			if (t00_list_cols.getNewsearchflag().equals("1")) {
				saveSearchObject(t00_list_cols, request);
			
				Map keyCateMap=(Map)listMap.get(tablecode+LipConstant.KEY_CATE);
				//分页取得列表 并且 转码
				resultList = t00_list_colsDAO.getT00_list_cols_resultList(sqlMap,
						sql.toString(), this.getStartRec(t00_list_cols.getIntPage()),
						this.getIntPageSize(),keyCateMap);
			}
			else
			{
				Map keyCateMap=(Map)listMap.get(tablecode+LipConstant.KEY_CATE);
				condValueMap=t00_list_cols.getCondValueMap();
				//分页取得列表 并且 转码
				resultList = t00_list_colsDAO.getT00_list_cols_resultList(sqlMap,
						t00_list_cols.getSql(), this.getStartRec(t00_list_cols.getIntPage()),
						this.getIntPageSize(),keyCateMap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		if (showColList == null)
			showColList = new ArrayList();
		if (resultList == null)
			resultList = new ArrayList();
		if (orderList == null)
			orderList = new ArrayList();
		if (condList == null)
			condList = new ArrayList();
		
		request.setAttribute("sortColumnList", orderList);
		request.setAttribute("showColList", showColList);
		request.setAttribute("condList", condList);
		request.setAttribute("resultList", resultList);
		request.setAttribute("condValueMap", condValueMap);
		request.setAttribute("condTabKeyMap", condTabKeyMap);
		request.setAttribute("tablecode", form.getTablecode());
		LinkedHashMap tableMap = cm.getMapFromCache("t00_table_listForMap");
		if(tableMap.containsKey(tablecode)){
			request.setAttribute("title", (String)tableMap.get(tablecode));
			}
		
		return actionMapping.findForward("success");
	}
	
	/**
	 * 取得查询条件为下拉框或定位类型所对应的码表值-用于页面
	 * 
	 * @param t00_list_cols_list
	 * @return
	 */
	public Map getCondMap(List t00_list_cols_list) {
		Map map = new LinkedHashMap();
		if (t00_list_cols_list == null)
			t00_list_cols_list = new ArrayList();
		for (int i = 0; i < t00_list_cols_list.size(); i++) {
			Object obj = null;
			T00_list_cols temp = (T00_list_cols) t00_list_cols_list.get(i);
			if (temp == null)
				continue;
			if (temp.getConddisp().equals(LipConstant.ADD_DISP2)) {
				try {
					
					obj = cm.getMapFromCache(temp.getCondtabkey());
				} catch (Exception e) {
					continue;
				}
			} else 
				if (temp.getConddisp().equals(LipConstant.ADD_DISP3)) {
				obj = "CATEGORYTYPE=\\'" + temp.getCondtabkey() + "\\'";
			}

			map.put(temp.getColkey(), obj);

		}
		return map;
	}
	
	/**
	 * 查看详细信息-其他（除名单纠错以外）
	 * @param mapping
	 *            ActionMapping
	 * @param form
	 *            ActionForm
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return ActionForward
	 */
	public ActionForward performGetT20_list_details(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_lipDAO t00_list_colsDAO =(T07_lipDAO)context.getBean("t10_pr_auditDAO");
		T00_list_colsActionForm form = (T00_list_colsActionForm) actionForm;
		String tablecode = form.getTablecode();
		HashMap dispMap=new LinkedHashMap();
		try {
			//纠错库所需的各种List和MAP
			Map auditMap=(Map)this.getT00_list_colsMap(LipConstant.TABLE_EDN_LSE);
			//列字段与列名的map			
			Map keyMap=(Map)auditMap.get(tablecode+LipConstant.KEY_NAME);
			//取得详细信息的显示列的List
			List addCol=(List)auditMap.get(tablecode+LipConstant.PAGE_ADD);
			String cols=t00_list_colsDAO.getT00_list_cols_colkeys(addCol);//转换成字符串
			String party_id = form.getParty_id();
			String tablename = LipConstant.TABLE_PRE + tablecode + "_"+LipConstant.TABLE_EDN_PRL ;
			StringBuffer sql_data =new StringBuffer("select "+cols +" from "+tablename+" where party_id='"+party_id +"'");
			List temp=(List)sqlMap.queryForList("getT00_list_cols_resultList", sql_data.toString());
			Map dataMap=null;
			//列字段与数据的Map
			if(temp.size()>0){
				dataMap=(Map)temp.get(0);
			}else
			{
				errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"error.common", "查询详细信息失败！"));
				saveMessages(request, errors);
				return actionMapping.findForward("failure");
			}
			
			//取得所有需要转码的字段
			Map valMap=(Map)auditMap.get(tablecode+LipConstant.KEY_CATE);
			
			
			Iterator iter=dataMap.keySet().iterator();
			while(iter.hasNext())
			{
				String key=(String)iter.next();
				String value=(String)dataMap.get(key)==null?"":(String)dataMap.get(key);
				//把数据MAP的VALUE转码
				if(valMap.containsKey(key))					
				{
					String dicttype=(String)valMap.get(key);
					LinkedHashMap categoryMap = cm.getMapFromCache(dicttype);
					value=(String)categoryMap.get(value)==null?value:(String)categoryMap.get(value);
					
				}
				//把数据MAP的key转换成列名（中文）
				if(keyMap.containsKey(key))
				{
					key=(String)keyMap.get(key);
				}
				
				
				dispMap.put(key, value);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		
		request.setAttribute("dispMap", dispMap);
		return actionMapping.findForward("success");
	}
}
