package com.ist.aml.report.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.springframework.context.ApplicationContext;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.pbcreport.bo.T07_ReportBo;
import com.ist.aml.pbcreport.dao.T07_cbh_tsdtDAO;
import com.ist.aml.pbcreport.dao.T07_pbc_sequenceDAO;
import com.ist.aml.pbcreport.dao.T07_reportDAO;
import com.ist.aml.pbcreport.dto.T07_cbh_tsdt;
import com.ist.aml.pbcreport.dto.T07_nbh_tsdt;
import com.ist.aml.pbcreport.dto.T07_nbs_atif;
import com.ist.aml.pbcreport.dto.T07_nbs_ctif;
import com.ist.aml.pbcreport.dto.T07_nbs_rbif;
import com.ist.aml.pbcreport.dto.T07_nbs_rpdi;
import com.ist.aml.pbcreport.dto.T07_pbc_sequence;
import com.ist.aml.pbcreport.dto.T07_report;
import com.ist.aml.report.dao.T07_case_applicationDAO;
import com.ist.aml.report.dao.T07_cd_applyDAO;
import com.ist.aml.report.dto.T07_bh_tsdt_p;
import com.ist.aml.report.dto.T07_bs_report_p;
import com.ist.aml.report.dto.T07_case_application;
import com.ist.aml.report.dto.T07_cd_apply;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.FileUpload;
import com.ist.common.MyBeanUtils;
import com.ist.common.Template;
import com.ist.common.base.BaseAction;
import com.ist.common.util.DateUtils;
import com.ist.mfa.util.DateUtil;
import com.ist.util.Constans;
import com.ist.util.StringUtils;

public class T07_cd_applyAction extends BaseAction {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		ActionForward myforward = null;
		String myaction = mapping.getParameter();
		// 预处理
		myforward = this.preExecute(mapping, form, request, response);
		// 如预处理中强行跳出
		if ("false".equals(request.getAttribute("goWayFlag")))
			return myforward;

		if ("getT07_cd_applyList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_cp_applyList(mapping, form, request,
					response);
		}
		//导出数据
		else if ("exportT07_cd_applyWord".equalsIgnoreCase(myaction)) {
			myforward = performExportT07_cp_applyDoc(mapping, form, request,
					response);
		}
		//查看申请详情.Lee
		else if ("getT07_cd_apply_detail".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_cp_applyDetail(mapping, form, request,
					response);
		}
		//查看大额申请下的交易列表.Lee
		else if ("getT07_bh_tsdtList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_bh_tsdtList(mapping, form, request,
					response);
		}
		//查看可疑申请下的报告列表.Lee
		else if ("getT07_bs_reportList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_bs_reportList(mapping, form, request,
					response);
		}
		//查看大额申请下的单笔交易详情.Lee
		else if ("getTsdt_detail".equalsIgnoreCase(myaction)) {
			myforward = performGetTsdt_detail(mapping, form, request,
					response);
		}
		//新增申请页面
		else if ("addT07_cd_apply".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_cp_apply(mapping, form, request,
					response);
		}
		//新增申请-可疑：查询报告列表
		else if("getT07_cd_apply_reportList".equalsIgnoreCase(myaction)){
			myforward=performGetT07_cd_apply_reportList(mapping, form, request,
					response);
		}
		//新增申请-可疑：选中报告添加
		else if("addT07_cd_apply_report".equalsIgnoreCase(myaction)){
			myforward=performAddT07_cd_apply_report(mapping, form, request,
					response);
		}
		//新增申请-可疑：选中的报告结果列表
		else if("getT07_cd_apply_report_resultList".equals(myaction)){
			myforward=performGetT07_cd_apply_report_resultList(mapping, form, request,
					response);
		}
		//修改逾期理由
		else if("getT07_cd_apply_reason".equals(myaction)){
			myforward=performGetT07_cd_apply_reason(mapping, form, request,
					response);
		}
		//保存逾期理由
		else if("saveT07_cd_apply_reason".equals(myaction)){
			myforward=performSaveT07_cd_apply_reason(mapping, form, request,
					response);
		}
		//删除某条报告
		else if("deleteT07_cd_apply_item".equals(myaction)){
			myforward=performDeleteT07_cd_apply_item(mapping, form, request,
					response);
		}
		//保存可疑逾期申请
		else if("addT07_cd_apply_reportXX".equals(myaction)){
			myforward=performAddT07_cd_apply_reportXX(mapping, form, request,
					response);
		}
		//逾期申请-大额：查询交易列表
		else if("getT07_cd_apply_transList".equals(myaction)){
			myforward=performGetT07_cd_apply_transList(mapping, form, request,
					response);
		}
		//逾期申请-大额：添加交易
		else if("addT07_cd_apply_trans".equals(myaction)){
			myforward=performAddT07_cd_apply_trans(mapping, form, request,
					response);
		}
		//逾期申请-大额：查询交易结果列表
		else if("getT07_cd_apply_trans_resultList".equals(myaction)){
			myforward=performGetT07_cd_apply_trans_resultList(mapping, form, request,
					response);
		}
		//逾期申请-大额：保存交易
		else if("addT07_cd_apply_transDo".equals(myaction)){
			myforward=performAddT07_cd_apply_transDo(mapping, form, request,
					response);
		}
		//修改申请
		else if ("modifyT07_cd_apply".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_cp_apply(mapping, form, request,
					response);
		}
		
		//查看报告详情；查看可疑申请下的报告详情.Lee
		else if ("getT07_report_detail".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_reportDetail(mapping, form, request,
					response);
		}
		//查看报告客户详情.Lee
		else if ("getT07_report_partyList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_report_partyList(mapping, form, request,
					response);
		}
		//查看报告交易详情.Lee
		else if ("getT07_report_transList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_report_transList(mapping, form, request,
					response);
		}
		//查看报告账户详情.Lee
		else if ("getT07_report_acctList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_report_acctList(mapping, form, request,
					response);
		}
		//删除申请.Lee
		else if ("delT07_cd_applyDo".equalsIgnoreCase(myaction)) {
			myforward = performDelT07_cd_applyDo(mapping, form, request,
					response);
		}
		//修改申请的状态
		else if("submitT07_cd_apply".equalsIgnoreCase(myaction)){
			myforward = performSubmitT07_cd_apply(mapping, form, request,
					response);
		}
		//创建案例
		else if("createT07_cd_apply_case".equals(myaction)){
			myforward=performCreateT07_cd_apply_case(mapping, form, request,
					response);
		}
		return myforward;
	}
	
	public ActionForward performGetT07_cp_applyList(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		HttpSession session=request.getSession();
		T07_cd_applyDAO t07_cd_applyDAO = (T07_cd_applyDAO) context.getBean("t07_cd_applyDAO");
		T07_cd_apply t07_cd_apply = new T07_cd_apply();
		ArrayList t07_cd_applyList=new ArrayList();
		try{
			T07_cd_applyActionForm form = (T07_cd_applyActionForm) actionForm;
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			form.setOrgankeyStr(auth.getOrganstr());
			if(form.getStatus_cd()!=null && !"".equals(form.getStatus_cd())){
				form.setStatus_cd1(surroundSymbol(form.getStatus_cd(),",","'"));
			}else{
				form.setStatus_cd1("");
			}
			if(form.getStart_dt_disp()!=null || !"".equals(form.getStart_dt_disp())){
				form.setStart_dt(DateUtils.stringToDateShort(form.getStart_dt_disp()));
			}
			if(form.getEnd_dt_disp()!=null || !"".equals(form.getEnd_dt_disp())){
				form.setEnd_dt(DateUtils.stringToDateShort(form.getEnd_dt_disp()));
			}
			String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
			t07_cd_apply=(T07_cd_apply)this.getSearchObject(t07_cd_apply,request, form, "getT07_cd_applyListCount", url);
			if (t07_cd_apply.getNewsearchflag().equals("1")) {
				saveSearchObject(t07_cd_apply, request);
			}
			else{
				MyBeanUtils.copyBean2Bean(form, t07_cd_apply);
			}
			t07_cd_applyList = t07_cd_applyDAO.getT07_cd_applyList(sqlMap,t07_cd_apply, 
					this.getStartRec(t07_cd_apply.getIntPage()), this.getIntPageSize());
			LinkedHashMap msg_typeMap = cm .getMapFromCache("cd_msg_type");
			request.setAttribute("msg_typeMap", this.getOptionsListByMap(msg_typeMap, null, true));
			LinkedHashMap apply_typeMap = cm .getMapFromCache("cd_apply_type");
			request.setAttribute("apply_typeMap", this.getOptionsListByMap(apply_typeMap, null, true));
			
			LinkedHashMap status_cdMap=cm.getMapFromCache("cd_status_cd");
			request.setAttribute("status_cdMap", this.getOptionsListByMap(status_cdMap, null, true));
			
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_cd_applyList", t07_cd_applyList);
		return actionMapping.findForward("success");
	}
	 /**
     * 符号环绕
     * 将例如string=a,b,c regex=，symbol=‘  返回形式为'a','b','c'
     * @param string  要换换的字符串
     * @param regex   分隔符
     * @param symbol  需要环绕的符号
     * @return
     */
    public static String surroundSymbol(String string ,String regex,String symbol){
        String[] array = string.split(regex);
        StringBuilder stringBuilder = new StringBuilder();
        for(String s:array){
            stringBuilder.append(symbol).append(s).append(symbol).append(regex);
        }
        if(stringBuilder.indexOf(",")!=-1)
            stringBuilder.deleteCharAt(stringBuilder.length()-1);
        return stringBuilder.toString();
    }
    /**
     * 导出word文档
     * @param actionMapping
     * @param actionForm
     * @param request
     * @param response
     * @return
     */
   /* public ActionForward performExportT07_cp_applyWord(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		T07_cd_applyDAO t07_cd_applyDAO = (T07_cd_applyDAO) context.getBean("t07_cd_applyDAO");
		T07_cd_apply t07_cd_apply = new T07_cd_apply();
		try{
			T07_cd_applyActionForm form = (T07_cd_applyActionForm) actionForm;
			String apply_no = form.getApply_no();
			String msg_typeStr="BS";
			if("1".equals(form.getMsg_type())){
				msg_typeStr="BH";
			}
			//输出文档路径及名称
			String fileDate=DateUtils.dateToStringShort(DateUtils.getCurrDateTime());
			String file8Date=fileDate.replace("-", "");
			FileUpload fileUpload = (FileUpload)context.getBean("fileUpload");
			String parth=fileUpload.createDir(file8Date,"amlreport", "month")[0];
			File outFile = new File(parth+apply_no + "_" + msg_typeStr + ".doc");
            if(!outFile.exists()){//判断文件是否存在
            	t07_cd_apply=t07_cd_applyDAO.getT07_cd_applypDetail(sqlMap, apply_no);
    			ArrayList list = new ArrayList();
    			String template="t07_bs_report.flt";
    			if("2".equals(form.getMsg_type())){//可疑
    				list = t07_cd_applyDAO.getT07_bs_reportList(sqlMap, t07_cd_apply, 0, 10000);
    			}else{
    				template="t07_bh_tsdt.flt";
    				list= t07_cd_applyDAO.getT07_bh_tsdtList(sqlMap, t07_cd_apply, 0, 10000);
    			}
    			Map<String,Object> dataMap=new HashMap<String,Object>();
    			dataMap.put("list", list);
    			dataMap.put("rinm", t07_cd_apply.getRinm());
    			dataMap.put("ricd", t07_cd_apply.getRicd());
    			dataMap.put("fillDate", fileDate);
    			String seq_no=getNextSeq(msg_typeStr+"CpApplySeq","T07_CD_APPLY_SEQUENCE",sqlMap,context);
    			String number=t07_cd_apply.getRicd()+file8Date+seq_no;
    			dataMap.put("number", number);
    			Configuration configuration = new Configuration();
    			configuration.setDefaultEncoding("GBK");
    			//设置模本装置方法和路径,FreeMarker支持多种模板装载方法。可以重servlet，classpath，数据库装载，
    			//这里我们的模板是放在com.ist.aml.report.bo包下面
    			configuration.setClassForTemplateLoading(this.getClass(), "/com/ist/aml/report/bo");
    			//freemarker.template.Template.Template t=null;
    			//要装载的模板
    			freemarker.template.Template t = configuration.getTemplate(template);
    			Writer out = null;
    			FileOutputStream fos=null;
    			fos = new FileOutputStream(outFile);  
    		    OutputStreamWriter oWriter;
    		    oWriter = new OutputStreamWriter(fos,"UTF-8");
    			out = new BufferedWriter(oWriter);
    			t.process(dataMap, out);
            }
			// 跳转到下载页面
			String backurl = "/common/download_user.jsp?downloadtype=attach&url=" + outFile + "";
			response.sendRedirect(request.getContextPath() + backurl);
			return null;
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		
	}*/
    /**
     * 导出word文档
     * @param actionMapping
     * @param actionForm
     * @param request
     * @param response
     * @return
     */
    public ActionForward performExportT07_cp_applyDoc(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		T07_cd_applyDAO t07_cd_applyDAO = (T07_cd_applyDAO) context.getBean("t07_cd_applyDAO");
		T07_cd_apply t07_cd_apply = new T07_cd_apply();
		Template templateBean = (Template) context.getBean("template");
        String targetFileName="";
        String downLoadFile ="";
        HashMap beans = new HashMap();
		try{
			T07_cd_applyActionForm form = (T07_cd_applyActionForm) actionForm;
			String apply_no = form.getApply_no();
			String msg_typeStr="BS";
			if("1".equals(form.getMsg_type())){
				msg_typeStr="BH";
			}
			//输出文档路径及名称
			String fileDate=DateUtils.dateToStringShort(DateUtils.getCurrDateTime());
			String file8Date=fileDate.replace("-", "");
			FileUpload fileUpload = (FileUpload)context.getBean("fileUpload");
			targetFileName=file8Date+apply_no + "_" + msg_typeStr + ".doc";
			File outFile = new File(templateBean.getTargetDirRelativeFilePath()+targetFileName);
            if(!outFile.exists()){//判断文件是否存在
            	t07_cd_apply=t07_cd_applyDAO.getT07_cd_applypDetail(sqlMap, apply_no);
    			ArrayList t07_cd_applyList = new ArrayList();
    			T07_cd_apply apply = new T07_cd_apply();
    			apply.setApply_no(t07_cd_apply.getApply_no());
    			String templateFileName="T07_BH_TSDT.htm";
    			if("2".equals(form.getMsg_type())){//可疑
    				templateFileName="T07_BS_REPORT.htm";
    				t07_cd_applyList = t07_cd_applyDAO.getT07_bs_reportList(sqlMap, apply, 0, 10000);
    			}else{
    				t07_cd_applyList= t07_cd_applyDAO.getT07_bh_tsdtList(sqlMap, apply, 0, 10000);
    			}
    			
    			String seq_no=getNextSeq(msg_typeStr+"CpApplySeq","T07_CD_APPLY_SEQUENCE",sqlMap,context);
    			String number=t07_cd_apply.getRicd()+file8Date+seq_no;
    			beans.put("t07_cd_applyList", t07_cd_applyList);
    			beans.put("t07_cd_apply", t07_cd_apply);
    			beans.put("fillDate", fileDate);
    			beans.put("number", number);
    			downLoadFile = templateBean.makeFileByTemplate(templateFileName,beans,targetFileName);
    			 // 设置为下载application/x-download
    			apply.setStatus_cd("7");
    			t07_cd_applyDAO.updateT07_cd_apply(sqlMap, apply);
                File file = new File(downLoadFile);
                FileInputStream fileIn = new FileInputStream(file);
                response.setContentType("application/x-download");
                String realName=targetFileName;
                realName = URLEncoder.encode(realName, "UTF-8");
                response.addHeader("Content-Disposition", "attachment;filename="
                        + realName);
                OutputStream output = response.getOutputStream();
                int len = 0;
                byte[] b = new byte[1024];
                while ((len = fileIn.read(b)) > 0) {
                    output.write(b, 0, len);
                }
                fileIn.close();
                output.flush();
                output.close();
            }else{
            	// 跳转到下载页面
    			String backurl = "/common/download_user.jsp?downloadtype=attach&url=" + outFile + "";
    			response.sendRedirect(request.getContextPath() + backurl);
    			return null;
            }
			
			return null;
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		
	}
 /**
  * 取的序列号
  * @param Seqname
  * @param tablename
  * @param sqlMap
  * @param context
  * @return
  * @throws Exception
  */
    public synchronized String getNextSeq(String Seqname,
			String tablename,SqlMapClient sqlMap,ApplicationContext context)throws Exception  {
		// String nextSeq = this.getSequenceNextVal(Seqname);
		String SeqString = "0"; // 从数据库中取出的seq的当前值
		String nextSeqString = "1"; // 加1后的seq值
		int nextSeq = 0; // int型加1后的seq值
		
		// 得到下一个序列号
		T07_pbc_sequenceDAO t07_pbc_sequenceDAO =(T07_pbc_sequenceDAO)context.getBean("t07_pbc_sequenceDAO");

			T07_pbc_sequence t07_pbc_sequence = new T07_pbc_sequence();
			t07_pbc_sequence = (T07_pbc_sequence) t07_pbc_sequenceDAO
					.getT07_pbc_sequenceDisp(sqlMap, Seqname,tablename);
			t07_pbc_sequence.setTablename(tablename);
			if (t07_pbc_sequence.getSequensename().equals("")) {
				System.out.println("数据库中没有此序列号，请确保数据库中有此序列号！");
				return "-1"; // "no sequence error";
			}
			Date sequenceDate = t07_pbc_sequence.getSequensedate();
			Date today = DateUtils.getCurrDateTime();
			int row = 0;
			// 查询数据库中的序列号是不是今天的，则重置数据库序列号值
			if ((sequenceDate.getYear() != today.getYear())
					|| (sequenceDate.getMonth() != today.getMonth())
					|| (sequenceDate.getDay() != today.getDay())) {
				t07_pbc_sequence.setSequensedate(today);
				t07_pbc_sequence.setSequensevalue(Constans.PACKET_INIT_SEQ);
				
				row = t07_pbc_sequenceDAO.modifyT07_pbc_sequence(sqlMap,
						t07_pbc_sequence);
				nextSeq = Integer.parseInt(Constans.PACKET_INIT_SEQ);
			} else {
				SeqString = t07_pbc_sequence.getSequensevalue();

				nextSeq = Integer.valueOf(SeqString).intValue() + 1;
				// 序列号加一更新到数据库中
				t07_pbc_sequence.setSequensevalue("" + nextSeq);

				 row = t07_pbc_sequenceDAO.modifyT07_pbc_sequence(sqlMap,
						t07_pbc_sequence);
			}
			if (row == 0) {
				System.out.println("序列号更新数据库失败！");
				return "-2"; // "can't modify error";
			}
			nextSeqString = new Integer(nextSeq).toString();

		
		String newNextSeq = "";
		for (int m = 0; m < (4 - nextSeqString.length()); m++) {
			newNextSeq += "0";
		}
		newNextSeq = newNextSeq + nextSeqString;
		return newNextSeq;
	}
	/**
	 * @author Lee
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetT07_cp_applyDetail(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		T07_cd_applyDAO t07_cd_applyDAO = (T07_cd_applyDAO) context.getBean("t07_cd_applyDAO");
		T07_cd_apply t07_cd_apply = new T07_cd_apply();
		
		try{
			T07_cd_applyActionForm form = (T07_cd_applyActionForm) actionForm;
			String apply_no = form.getApply_no();
			
			t07_cd_apply = t07_cd_applyDAO.getT07_cd_applypDetail(sqlMap,apply_no);
			String return_type=request.getParameter("return_type");//1 返回申请列表，2 返回查询列表 ，3 返回逾期案例列表
			String backUrl="";
			if("1".equals(return_type)){
				backUrl="t07_cd_apply_list.do";
			}else if("2".equals(return_type)){
				backUrl="t07_cd_apply_search_list.do";
			}else if("3".equals(return_type)){
				backUrl="t07_cd_apply_case_list.do";
			}
			request.setAttribute("backUrl", backUrl);
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		
		request.setAttribute("t07_cd_apply", t07_cd_apply);
		
		return actionMapping.findForward("success");
	}
	
	/**
	 * @author Lee
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetT07_bh_tsdtList(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		T07_cd_applyDAO t07_cd_applyDAO = (T07_cd_applyDAO) context.getBean("t07_cd_applyDAO");
		T07_cd_apply t07_cd_apply = new T07_cd_apply();
		ArrayList t07_bh_tsdtList=new ArrayList();
		
		try{
			T07_cd_applyActionForm form = (T07_cd_applyActionForm) actionForm;
			String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
			t07_cd_apply=(T07_cd_apply)this.getSearchObject(t07_cd_apply,request, form, "getT07_bh_tsdtListCount", url);
			if (t07_cd_apply.getNewsearchflag().equals("1")) {
				saveSearchObject(t07_cd_apply, request);
			}
			else{
				MyBeanUtils.copyBean2Bean(form, t07_cd_apply);
			}
			t07_bh_tsdtList = t07_cd_applyDAO.getT07_bh_tsdtList(sqlMap, t07_cd_apply, this.getStartRec(t07_cd_apply.getIntPage()), this.getIntPageSize());
			
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		
		request.setAttribute("t07_bh_tsdtList", t07_bh_tsdtList);
		return actionMapping.findForward("success");
	}
	/**
	 * @author Lee
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetT07_bs_reportList(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		T07_cd_applyDAO t07_cd_applyDAO = (T07_cd_applyDAO) context.getBean("t07_cd_applyDAO");
		T07_cd_apply t07_cd_apply = new T07_cd_apply();
		T07_bs_report_p T07_bs_report = new T07_bs_report_p();
		ArrayList t07_bs_reportList=new ArrayList();
		
		try{
			T07_cd_applyActionForm form = (T07_cd_applyActionForm) actionForm;
			String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
			t07_cd_apply=(T07_cd_apply)this.getSearchObject(t07_cd_apply,request, form, "getT07_bs_reportListCount", url);
			if (t07_cd_apply.getNewsearchflag().equals("1")) {
				saveSearchObject(t07_cd_apply, request);
			}
			else{
				MyBeanUtils.copyBean2Bean(form, t07_cd_apply);
			}
			t07_bs_reportList = t07_cd_applyDAO.getT07_bs_reportList(sqlMap, t07_cd_apply, this.getStartRec(t07_cd_apply.getIntPage()), this.getIntPageSize());
			
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		
		request.setAttribute("t07_bs_reportList", t07_bs_reportList);
		return actionMapping.findForward("success");
	}
	/**
	 * @author Lee
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetTsdt_detail(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		T07_cd_applyDAO t07_cd_applyDAO = (T07_cd_applyDAO) context.getBean("t07_cd_applyDAO");
		T07_cd_apply t07_cd_apply = new T07_cd_apply();
		
		T07_bh_tsdt_p tsdt = new T07_bh_tsdt_p();
		
		try{
			T07_bh_tsdt_pActinoForm form = (T07_bh_tsdt_pActinoForm) actionForm;
			String reportkey = form.getReportkey();
			String status_cd = request.getParameter("status_cd");
			String apply_type = form.getApply_type();
			/**	大额已生成的纠错案例*/
			if("C".equals(apply_type)&&"5".equals(status_cd))
			{
				T07_cbh_tsdtDAO cbh_tsdtDAO =(T07_cbh_tsdtDAO)context.getBean("t07_cbh_tsdtDAO");
				T07_cbh_tsdt t07_cbh_tsdt = new T07_cbh_tsdt();
				t07_cbh_tsdt.setReportkey(reportkey);
				t07_cbh_tsdt.setTsdt_seqno(form.getTsdt_seqno());
				t07_cbh_tsdt.setTicd(form.getTicd());
				t07_cbh_tsdt = cbh_tsdtDAO.getValidateTransDisp(sqlMap,t07_cbh_tsdt);
				request.setAttribute("tsdt", t07_cbh_tsdt);
			}
			/**	其它：大额未生成的纠错案例+可疑所有状态的案例*/
			else
			{
				T07_nbh_tsdt t07_nbh_tsdt = new T07_nbh_tsdt();
				t07_nbh_tsdt.setReportkey(reportkey);
				t07_nbh_tsdt.setTsdt_seqno(form.getTsdt_seqno());
				t07_nbh_tsdt.setTicd(form.getTicd());
				
				t07_nbh_tsdt.setReported("0");//先从当前表里查找
				int i = t07_cd_applyDAO.getT07_nbh_tsdtCount(sqlMap, t07_nbh_tsdt);
				if(i>0)
					t07_nbh_tsdt.setReported("0");
				else
					t07_nbh_tsdt.setReported("1");
				t07_nbh_tsdt = t07_cd_applyDAO.getT07_nbh_tsdtDetail(sqlMap, t07_nbh_tsdt);
				request.setAttribute("tsdt", t07_nbh_tsdt);
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		
		
		return actionMapping.findForward("success");
	}
	
	public ActionForward performAddT07_cp_apply(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		HttpSession session=request.getSession();
		T07_cd_apply t07_cd_apply=new T07_cd_apply();
		try{
			String initflag=request.getParameter("initflag");
			String msg_type=request.getParameter("msg_type");
			String newApply_no="";
			if("1".equals(initflag)){
				session.removeAttribute("t07_cd_apply_add_session");
				newApply_no=this.getSequenceNextVal("T07_CD_APPLY_SEQ");
				t07_cd_apply.setApply_no(newApply_no);
				t07_cd_apply.setApply_type("C");//纠错
				t07_cd_apply.setMsg_type(msg_type);
				session.setAttribute("newT07_cd_apply", t07_cd_apply);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		String msg_type=request.getParameter("msg_type");
		String modflag=request.getParameter("modflag");
		if("1".equals(msg_type)){
			LinkedHashMap  curr_cdMap=cm.getMapFromCache("curr_cd");//币种
			request.setAttribute("curr_cdMap", this.getOptionsListByMap(
					curr_cdMap, null, true));
			if("1".equals(modflag)){
				return actionMapping.findForward("success3");
			}else return actionMapping.findForward("success1");
		}else{
			if("1".equals(modflag)){
				return actionMapping.findForward("success4");
			}else return actionMapping.findForward("success2");
		}
	}
	
	public ActionForward performGetT07_cd_apply_reportList(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		HttpSession session=request.getSession();
		T07_cd_apply t07_cd_apply=new T07_cd_apply();
		T07_cd_applyDAO t07_cd_applyDAO = (T07_cd_applyDAO) context.getBean("t07_cd_applyDAO");
		ArrayList reportList=new ArrayList();
		try{
			T07_cd_applyActionForm form = (T07_cd_applyActionForm) actionForm;
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			form.setOrgankeyStr(auth.getOrganstr());
			
			Map t87_sysparaMap=cm.getMapFromCache("t87_syspara");
			int cd_date_count=0-Integer.parseInt(t87_sysparaMap.get("901").toString()); 
			Date temp_date = getCddate(DateUtil.getCurrentDateTime(),cd_date_count);    
			form.setCreate_dt(temp_date);
			
			if(form.getStart_dt_disp()!=null || !"".equals(form.getStart_dt_disp())){
				form.setStart_dt(DateUtils.stringToDateShort(form.getStart_dt_disp()));
			}
			if(form.getEnd_dt_disp()!=null || !"".equals(form.getEnd_dt_disp())){
				form.setEnd_dt(DateUtils.stringToDateShort(form.getEnd_dt_disp()));
			}
			String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
			t07_cd_apply=(T07_cd_apply)this.getSearchObject(t07_cd_apply,request, form, "getT07_cd_apply_reportListCount", url);
			if (t07_cd_apply.getNewsearchflag().equals("1")) {
				saveSearchObject(t07_cd_apply, request);
			}
			else{
				MyBeanUtils.copyBean2Bean(form, t07_cd_apply);
			}
			reportList = t07_cd_applyDAO.getT07_cd_apply_reportList(sqlMap,t07_cd_apply, 
					this.getStartRec(t07_cd_apply.getIntPage()), this.getIntPageSize());
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("reportList", reportList);
		String modflag=request.getParameter("modflag");
		if("1".equals(modflag)){
			return actionMapping.findForward("success1");
		}else 
		return actionMapping.findForward("success");
	}
	public Date getCddate(Date date,int cd_count){
		Calendar c = Calendar.getInstance();  
		c.setTime(date);
		c.add(c.DATE, cd_count);   
		Date temp_date = c.getTime();    
		return temp_date;
	}
	
	public ActionForward performAddT07_cd_apply_report(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		HttpSession session=request.getSession();
		T07_cd_applyDAO t07_cd_applyDAO = (T07_cd_applyDAO) context.getBean("t07_cd_applyDAO");
		T07_cd_apply t07_cd_apply=new T07_cd_apply();
		try{
			Map map=(Map) session.getAttribute("t07_cd_apply_add_session");
			if(map==null)map=new HashMap();
			String[] reportkeys=request.getParameterValues("reportkeys");
			String reportkeyStr="";
			for(int i=0;i<reportkeys.length;i++){
				reportkeyStr+=",'"+reportkeys[i]+"'";
			}
			if(reportkeyStr.length()>0){
				reportkeyStr=reportkeyStr.substring(1);
			}
			t07_cd_apply.setReportkeyStr(reportkeyStr);
			ArrayList list=t07_cd_applyDAO.getT07_cd_apply_reportList1(sqlMap, t07_cd_apply);
			for(int j=0;j<list.size();j++){
				T07_nbs_rbif rbif=(T07_nbs_rbif) list.get(j);
				String reportkey=rbif.getReportkey();
				if(!map.containsKey(reportkey)){
					map.put(reportkey, rbif);
				}
			}
			session.setAttribute("t07_cd_apply_add_session", map);
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}
	
	public ActionForward performGetT07_cd_apply_report_resultList(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		HttpSession session=request.getSession();
		T07_cd_apply t07_cd_apply=new T07_cd_apply();
		ArrayList reportList=new ArrayList();
		String modflag=request.getParameter("modflag");
		try{
			if("1".equals(modflag)){
				t07_cd_apply=(T07_cd_apply) session.getAttribute("modT07_cd_apply");
			}else{
				t07_cd_apply=(T07_cd_apply) session.getAttribute("newT07_cd_apply");
			}
			if(t07_cd_apply==null)t07_cd_apply=new T07_cd_apply();
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			t07_cd_apply.setRinm(auth.getT00_user().getOrganname());
			
			T07_cd_applyActionForm form=(T07_cd_applyActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(form, t07_cd_apply);
			
			Map map=(Map) session.getAttribute("t07_cd_apply_add_session");
			if(map==null)map=new HashMap();
			reportList=new ArrayList(map.values());
			
			LinkedHashMap apply_typeMap = cm .getMapFromCache("cd_apply_type_ky");
			request.setAttribute("apply_typeMap", this.getOptionsListByMap(apply_typeMap, null, false));
			
			LinkedHashMap apply_typeMap1 = cm .getMapFromCache("cd_apply_type_ky_short");
			request.setAttribute("apply_typeMap1", this.getOptionsListByMap(apply_typeMap1, null, false));
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_cd_apply", t07_cd_apply);
		request.setAttribute("reportList", reportList);
		if("1".equals(modflag)){
			return actionMapping.findForward("success1");
		}else return actionMapping.findForward("success");
	}
	
	public ActionForward performGetT07_cd_apply_reason(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		HttpSession session=request.getSession();
		try{
			String reportkey=request.getParameter("reportkey");
			String msg_type=request.getParameter("msg_type");
			
			T07_cd_applyActionForm form=(T07_cd_applyActionForm) actionForm;
			form.setReportkey(reportkey);
			form.setMsg_type(msg_type);
			Map map=(Map) session.getAttribute("t07_cd_apply_add_session");
			if("2".equals(msg_type)){
				T07_nbs_rbif rbif=(T07_nbs_rbif) map.get(reportkey);
				form.setApply_reason(rbif.getSsds());
			}else{
				T07_nbh_tsdt tsdt=(T07_nbh_tsdt) map.get(reportkey);
				form.setApply_reason(tsdt.getArea());
			}
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}
	
	public ActionForward performSaveT07_cd_apply_reason(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		HttpSession session=request.getSession();
		try{
			T07_cd_applyActionForm form=(T07_cd_applyActionForm) actionForm;
			String reportkey=request.getParameter("reportkey");
			String msg_type=request.getParameter("msg_type");
			String apply_reason=form.getApply_reason();
			Map map=(Map) session.getAttribute("t07_cd_apply_add_session");
			if("2".equals(msg_type)){
				T07_nbs_rbif rbif=(T07_nbs_rbif) map.get(reportkey);
				rbif.setSsds(apply_reason);
			}else{
				T07_nbh_tsdt tsdt=(T07_nbh_tsdt) map.get(reportkey);
				tsdt.setArea(apply_reason);
			}
			
			session.setAttribute("t07_cd_apply_add_session",map);
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}
	
	public ActionForward performDeleteT07_cd_apply_item(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		HttpSession session=request.getSession();
		try{
			String reportkey=request.getParameter("reportkey");
			Map map=(Map) session.getAttribute("t07_cd_apply_add_session");
			map.remove(reportkey);
			session.setAttribute("t07_cd_apply_add_session",map);
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		String msg_type=request.getParameter("msg_type");
		if("1".equals(msg_type)){
			return actionMapping.findForward("success1");
		}else
			return actionMapping.findForward("success2");
	}
	
	public ActionForward performAddT07_cd_apply_reportXX(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		HttpSession session=request.getSession();
		T07_cd_applyDAO t07_cd_applyDAO = (T07_cd_applyDAO) context.getBean("t07_cd_applyDAO");
		T07_cd_apply t07_cd_apply=new T07_cd_apply();
		try{
			T07_cd_applyActionForm form=(T07_cd_applyActionForm) actionForm;
			String apply_type=request.getParameter("apply_type");
			String[] apply_types=request.getParameterValues("validate_ind");
			Map map=(Map) session.getAttribute("t07_cd_apply_add_session");
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			Map report_organMap=cm.getMapFromCache("report_organ_map");
			String organkey=auth.getT00_user().getOrgankey();
			
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			String modflag=request.getParameter("modflag");
			if("1".equals(modflag)){
				t07_cd_apply=(T07_cd_apply) session.getAttribute("modT07_cd_apply" );
				t07_cd_apply.setApply_type(apply_type);
				t07_cd_apply.setTrans_num(map.values().size());
				t07_cd_applyDAO.updateT07_cd_apply(sqlMap,t07_cd_apply);
				t07_cd_applyDAO.deleteT07_bs_report_p(sqlMap,t07_cd_apply);
			}else{
				t07_cd_apply=(T07_cd_apply) session.getAttribute("newT07_cd_apply");
				t07_cd_apply.setApply_type(apply_type);
				t07_cd_apply.setRicd((String)report_organMap.get(organkey));
				t07_cd_apply.setRinm(auth.getT00_user().getOrganname());
				t07_cd_apply.setTrans_num(map.values().size());
				t07_cd_apply.setStatus_cd("1");
				t07_cd_apply.setCreate_user(auth.getT00_user().getUsername());
				t07_cd_apply.setCreate_dt(DateUtils.stringToDateShort(DateUtils.getCurrDate()));
				t07_cd_apply.setCreate_org(organkey);
				t07_cd_applyDAO.insertT07_cd_apply(sqlMap,t07_cd_apply);
			}
			
			String apply_no=t07_cd_apply.getApply_no();
			ArrayList reportList=new ArrayList(map.values());
			T07_bs_report_p t07_bs_report_p;
			for(int i=0;i<reportList.size();i++){
				T07_nbs_rbif rbif=(T07_nbs_rbif) reportList.get(i);
				t07_bs_report_p=new T07_bs_report_p();
				t07_bs_report_p.setApply_no(apply_no);
				t07_bs_report_p.setReportkey(rbif.getReportkey());
				t07_bs_report_p.setMsg_key(rbif.getReportkey());
				if("A".equals(apply_type)){//操作类型是“不限”，逐条修改报告操作类型
					t07_bs_report_p.setApply_type(apply_types[i]);
				}else{
					t07_bs_report_p.setApply_type(apply_type);
				}
				t07_bs_report_p.setTrans_num(rbif.getTtnm().intValue());
				t07_bs_report_p.setApply_reason(StringUtils.null2String(rbif.getSsds()));
				t07_cd_applyDAO.insertT07_bs_report_p(sqlMap,t07_bs_report_p);
			}
			sqlMap.commitTransaction();
			session.removeAttribute("newT07_cd_apply");
			session.removeAttribute("t07_cd_apply_add_session");
		}catch (Exception e) {
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
				errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"error.common", e.getMessage()));
				saveMessages(request, errors);
				return actionMapping.findForward("failure");
			}
		}
		return actionMapping.findForward("success");
	}
	
	public ActionForward performGetT07_cd_apply_transList(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		HttpSession session=request.getSession();
		T07_cd_apply t07_cd_apply=new T07_cd_apply();
		T07_cd_applyDAO t07_cd_applyDAO = (T07_cd_applyDAO) context.getBean("t07_cd_applyDAO");
		ArrayList transList=new ArrayList();
		try{
			T07_cd_applyActionForm form = (T07_cd_applyActionForm) actionForm;
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			form.setOrgankeyStr(auth.getOrganstr());
			
			Map t87_sysparaMap=cm.getMapFromCache("t87_syspara");
			int cd_date_count=0-Integer.parseInt(t87_sysparaMap.get("901").toString());
			Date temp_date = getCddate(DateUtil.getCurrentDateTime(),cd_date_count);    
			form.setCreate_dt(temp_date);
			
			if(form.getStart_dt_disp()!=null || !"".equals(form.getStart_dt_disp())){
				form.setStart_dt(DateUtils.stringToDateShort(form.getStart_dt_disp()));
			}
			if(form.getEnd_dt_disp()!=null || !"".equals(form.getEnd_dt_disp())){
				form.setEnd_dt(DateUtils.stringToDateShort(form.getEnd_dt_disp()));
			}
			String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
			t07_cd_apply=(T07_cd_apply)this.getSearchObject(t07_cd_apply,request, form, "getT07_cd_apply_transListCount", url);
			if (t07_cd_apply.getNewsearchflag().equals("1")) {
				saveSearchObject(t07_cd_apply, request);
			}
			else{
				MyBeanUtils.copyBean2Bean(form, t07_cd_apply);
			}
			transList = t07_cd_applyDAO.getT07_cd_apply_transList(sqlMap,t07_cd_apply, 
					this.getStartRec(t07_cd_apply.getIntPage()), this.getIntPageSize());
			
			session.removeAttribute("transMap");
			Map transMap=new HashMap();
			for(int i=0;i<transList.size();i++){
				T07_nbh_tsdt t07_nbh_tsdt=(T07_nbh_tsdt) transList.get(i);
				String reportkey1=t07_nbh_tsdt.getReportkey()+t07_nbh_tsdt.getCati_seqno()+t07_nbh_tsdt.getCrcd()+t07_nbh_tsdt.getTsdt_seqno();
				transMap.put(reportkey1, t07_nbh_tsdt);
			}
			session.setAttribute("transMap", transMap);
			
			LinkedHashMap  curr_cdMap=cm.getMapFromCache("curr_cd");//币种
			request.setAttribute("curr_cdMap", this.getOptionsListByMap(
					curr_cdMap, null, true));
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		String modflag=request.getParameter("modflag");
		request.setAttribute("transList", transList);
		if("1".equals(modflag)){
			return actionMapping.findForward("success1");
		}else return actionMapping.findForward("success");
	}
	
	public ActionForward performAddT07_cd_apply_trans(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		HttpSession session=request.getSession();
		try{
			Map map=(Map) session.getAttribute("t07_cd_apply_add_session");//逾期申请交易列表
			if(map==null)map=new HashMap();
			String[] reportkeys=request.getParameterValues("reportkeys");
			Map transMap=(Map) session.getAttribute("transMap");//查询出的交易列表
			
			for(int j=0;j<reportkeys.length;j++){
				String reportkey=reportkeys[j];
				T07_nbh_tsdt tsdt=(T07_nbh_tsdt) transMap.get(reportkey);
				if(!map.containsKey(reportkey)){
					map.put(reportkey, tsdt);
				}
			}
			session.setAttribute("t07_cd_apply_add_session", map);
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}
	
	public ActionForward performGetT07_cd_apply_trans_resultList(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		HttpSession session=request.getSession();
		T07_cd_apply t07_cd_apply = new T07_cd_apply();
		List transList=new ArrayList();
		String modflag=request.getParameter("modflag");
		try{
			if("1".equals(modflag)){
				t07_cd_apply=(T07_cd_apply) session.getAttribute("modT07_cd_apply");
			}else{
				t07_cd_apply=(T07_cd_apply) session.getAttribute("newT07_cd_apply");
			}
			if(t07_cd_apply==null)t07_cd_apply=new T07_cd_apply();
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			t07_cd_apply.setRinm(auth.getT00_user().getOrganname());
			T07_cd_applyActionForm form=(T07_cd_applyActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(form, t07_cd_apply);
			
			Map map=(Map) session.getAttribute("t07_cd_apply_add_session");
			if(map==null)map=new HashMap();
			transList=new ArrayList(map.values());
			
			LinkedHashMap apply_typeMap = cm .getMapFromCache("cd_apply_type_de");
			request.setAttribute("apply_typeMap", this.getOptionsListByMap(apply_typeMap, null, false));
			
			LinkedHashMap apply_typeMap1 = cm .getMapFromCache("cd_apply_type_de_short");
			request.setAttribute("apply_typeMap1", this.getOptionsListByMap(apply_typeMap1, null, false));
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_cd_apply",t07_cd_apply);
		request.setAttribute("transList", transList);
		if("1".equals(modflag)){
			return actionMapping.findForward("success1");
		}else{
			return actionMapping.findForward("success");
		}
	}
	
	public ActionForward performAddT07_cd_apply_transDo(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		HttpSession session=request.getSession();
		T07_cd_applyDAO t07_cd_applyDAO = (T07_cd_applyDAO) context.getBean("t07_cd_applyDAO");
		T07_cd_apply t07_cd_apply=new T07_cd_apply();
		try{
			T07_cd_applyActionForm form=(T07_cd_applyActionForm) actionForm;
			String apply_type=request.getParameter("apply_type");
			String[] apply_types=request.getParameterValues("validate_ind");
			Map map=(Map) session.getAttribute("t07_cd_apply_add_session");
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			Map report_organMap=cm.getMapFromCache("report_organ_map");
			String organkey=auth.getT00_user().getOrgankey();
			String modflag=request.getParameter("modflag");
			
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			if("1".equals(modflag)){
				t07_cd_apply=(T07_cd_apply) session.getAttribute("modT07_cd_apply");
				t07_cd_apply.setApply_type(apply_type);
				t07_cd_apply.setTrans_num(map.values().size());
				t07_cd_applyDAO.updateT07_cd_apply(sqlMap, t07_cd_apply);
				t07_cd_applyDAO.deleteT07_bh_tsdt_p(sqlMap, t07_cd_apply);
			}else{
				t07_cd_apply=(T07_cd_apply) session.getAttribute("newT07_cd_apply");
				t07_cd_apply.setApply_type(apply_type);
				t07_cd_apply.setRicd((String)report_organMap.get(organkey));
				t07_cd_apply.setRinm(auth.getT00_user().getOrganname());
				t07_cd_apply.setTrans_num(map.values().size());
				t07_cd_apply.setStatus_cd("1");
				t07_cd_apply.setCreate_user(auth.getT00_user().getUsername());
				t07_cd_apply.setCreate_dt(DateUtils.stringToDateShort(DateUtils.getCurrDate()));
				t07_cd_apply.setCreate_org(organkey);
				t07_cd_applyDAO.insertT07_cd_apply(sqlMap,t07_cd_apply);
			}
			String apply_no=t07_cd_apply.getApply_no();
			ArrayList transList=new ArrayList(map.values());
			
			T07_bh_tsdt_p t07_bh_tsdt_p;
			for(int i=0;i<transList.size();i++){
				T07_nbh_tsdt tsdt=(T07_nbh_tsdt) transList.get(i);
				t07_bh_tsdt_p=new T07_bh_tsdt_p();
			  t07_bh_tsdt_p.setApply_no(apply_no);     
			  t07_bh_tsdt_p.setReportkey(tsdt.getReportkey());   
			  t07_bh_tsdt_p.setTsdt_seqno(tsdt.getTsdt_seqno()); 
			  t07_bh_tsdt_p.setParty_id(StringUtils.null2String(tsdt.getParty_id()));    
			  t07_bh_tsdt_p.setTx_dt(tsdt.getTstm());
			  t07_bh_tsdt_p.setStcrkey(StringUtils.null2String(tsdt.getCrcd()));
			  t07_bh_tsdt_p.setTicd(tsdt.getTicd());
			  if("A".equals(apply_type)){//操作类型是“不限”，逐条修改报告操作类型
				  t07_bh_tsdt_p.setApply_type(apply_types[i]);
			  }else{
				  t07_bh_tsdt_p.setApply_type(apply_type);
			  }
			  t07_bh_tsdt_p.setApply_reason(StringUtils.null2String(tsdt.getArea()));
				t07_cd_applyDAO.insertT07_bh_tsdt_p(sqlMap,t07_bh_tsdt_p);
			}
			sqlMap.commitTransaction();
			session.removeAttribute("newT07_cd_apply");
			session.removeAttribute("t07_cd_apply_add_session");
		}catch (Exception e) {
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
				errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"error.common", e.getMessage()));
				saveMessages(request, errors);
				return actionMapping.findForward("failure");
			}
		}
		return actionMapping.findForward("success");
	}
	
	public ActionForward performModifyT07_cp_apply(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		T07_cd_applyDAO t07_cd_applyDAO = (T07_cd_applyDAO) context.getBean("t07_cd_applyDAO");
		HttpSession session=request.getSession();
		T07_cd_apply t07_cd_apply=new T07_cd_apply();
		String msg_type="";
		try{
			T07_cd_applyActionForm form=(T07_cd_applyActionForm)actionForm;
			String apply_no=request.getParameter("apply_no");
			t07_cd_apply.setApply_no(apply_no);
			t07_cd_apply=t07_cd_applyDAO.getT07_cd_applyDisp(sqlMap,t07_cd_apply);
			msg_type=t07_cd_apply.getMsg_type();
			MyBeanUtils.copyBean2Bean(form, t07_cd_apply);
			session.setAttribute("modT07_cd_apply", t07_cd_apply);
			
			session.removeAttribute("t07_cd_apply_add_session");
			Map map=new HashMap();
			if("1".equals(t07_cd_apply.getMsg_type())){
				ArrayList transList=t07_cd_applyDAO.getT07_cd_apply_transListByApply_no(sqlMap,apply_no);
				for(int i=0;i<transList.size();i++){
					T07_nbh_tsdt t07_nbh_tsdt=(T07_nbh_tsdt) transList.get(i);
					String reportkey1=t07_nbh_tsdt.getReportkey()+t07_nbh_tsdt.getCati_seqno()+t07_nbh_tsdt.getCrcd()+t07_nbh_tsdt.getTsdt_seqno();
					if(!map.containsKey(reportkey1)){
						map.put(reportkey1, t07_nbh_tsdt);
					}
				}
				request.setAttribute("transList",transList);
				LinkedHashMap apply_typeMap = cm .getMapFromCache("cd_apply_type_de");
				request.setAttribute("apply_typeMap", this.getOptionsListByMap(apply_typeMap, null, false));
				
				LinkedHashMap apply_typeMap1 = cm .getMapFromCache("cd_apply_type_de_short");
				request.setAttribute("apply_typeMap1", this.getOptionsListByMap(apply_typeMap1, null, false));
			}else{
				ArrayList reportList=t07_cd_applyDAO.getT07_cd_apply_reportListByApply_no(sqlMap,apply_no);
				for(int j=0;j<reportList.size();j++){
					T07_nbs_rbif rbif=(T07_nbs_rbif) reportList.get(j);
					String reportkey=rbif.getReportkey();
					if(!map.containsKey(reportkey)){
						map.put(reportkey, rbif);
					}
				}
				request.setAttribute("reportList", reportList);
				LinkedHashMap apply_typeMap = cm .getMapFromCache("cd_apply_type_ky");
				request.setAttribute("apply_typeMap", this.getOptionsListByMap(apply_typeMap, null, false));
				
				LinkedHashMap apply_typeMap1 = cm .getMapFromCache("cd_apply_type_ky_short");
				request.setAttribute("apply_typeMap1", this.getOptionsListByMap(apply_typeMap1, null, false));
			}
			session.setAttribute("t07_cd_apply_add_session",map);
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_cd_apply", t07_cd_apply);
		if("1".equals(msg_type)){
			return actionMapping.findForward("success1");
		}else{
			return actionMapping.findForward("success2");
		}
	}
	
	/**
	 * @author Lee
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetT07_reportDetail(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		T07_cd_applyDAO t07_cd_applyDAO = (T07_cd_applyDAO) context.getBean("t07_cd_applyDAO");
		T07_cd_apply t07_cd_apply = new T07_cd_apply();
		T07_nbs_rbif t07_nbs_rbif = new T07_nbs_rbif();
		
		try{
			T07_cd_applyActionForm form = (T07_cd_applyActionForm) actionForm;
			String reportkey = form.getReportkey();
			String time = form.getCasesearchtime();
			
			String flag = request.getParameter("flag");
			if(flag.equals("yes"))
			{
				t07_cd_apply.setCasesearchtime(time);
				int i = t07_cd_applyDAO.getT07_reportCount(sqlMap, reportkey);
				if(i>0)
				{
					t07_cd_apply.setCasesearchtime("0");
					request.setAttribute("casesearchtime", "0");
				}
					
				else
				{
					t07_cd_apply.setCasesearchtime("1");
					request.setAttribute("casesearchtime", "1");
				}
			}
			else
			{
				t07_cd_apply.setCasesearchtime(time);
				request.setAttribute("casesearchtime", time);
			}
			
			t07_cd_apply.setReportkey(reportkey);
			t07_nbs_rbif = t07_cd_applyDAO.getT07_reportDetail(sqlMap,t07_cd_apply);
			
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		
		request.setAttribute("t07_report", t07_nbs_rbif);
		return actionMapping.findForward("success");
	}
	
	/**
	 * @author Lee
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetT07_report_partyList(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		T07_cd_applyDAO t07_cd_applyDAO = (T07_cd_applyDAO) context.getBean("t07_cd_applyDAO");
		T07_cd_apply t07_cd_apply = new T07_cd_apply();
		T07_nbs_ctif t07_nbs_ctif = new T07_nbs_ctif();
		ArrayList t07_report_partyList=new ArrayList();
		
		try{
			T07_cd_applyActionForm form = (T07_cd_applyActionForm) actionForm;
			String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
			t07_cd_apply=(T07_cd_apply)this.getSearchObject(t07_cd_apply,request, form, "getT07_report_partyListCount", url);
			if (t07_cd_apply.getNewsearchflag().equals("1")) {
				saveSearchObject(t07_cd_apply, request);
			}
			else{
				MyBeanUtils.copyBean2Bean(form, t07_cd_apply);
			}
			t07_report_partyList = t07_cd_applyDAO.getT07_report_partyList(sqlMap, t07_cd_apply, this.getStartRec(t07_cd_apply.getIntPage()), this.getIntPageSize());
			
			
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		
		request.setAttribute("t07_report_partyList", t07_report_partyList);
		return actionMapping.findForward("success");
	}
	/**
	 * @author Lee
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetT07_report_transList(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		T07_cd_applyDAO t07_cd_applyDAO = (T07_cd_applyDAO) context.getBean("t07_cd_applyDAO");
		T07_cd_apply t07_cd_apply = new T07_cd_apply();
		T07_nbs_rpdi T07_nbs_rpdi = new T07_nbs_rpdi();
		ArrayList t07_report_transList=new ArrayList();
		
		try{
			T07_cd_applyActionForm form = (T07_cd_applyActionForm) actionForm;
			String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
			t07_cd_apply=(T07_cd_apply)this.getSearchObject(t07_cd_apply,request, form, "getT07_report_transListCount", url);
			if (t07_cd_apply.getNewsearchflag().equals("1")) {
				saveSearchObject(t07_cd_apply, request);
			}
			else{
				MyBeanUtils.copyBean2Bean(form, t07_cd_apply);
			}
			t07_report_transList = t07_cd_applyDAO.getT07_report_transList(sqlMap, t07_cd_apply, this.getStartRec(t07_cd_apply.getIntPage()), this.getIntPageSize());
			
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		
		request.setAttribute("t07_report_transList", t07_report_transList);
		return actionMapping.findForward("success");
	}
	/**
	 * @author Lee
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetT07_report_acctList(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		T07_cd_applyDAO t07_cd_applyDAO = (T07_cd_applyDAO) context.getBean("t07_cd_applyDAO");
		T07_cd_apply t07_cd_apply = new T07_cd_apply();
		T07_nbs_atif T07_nbs_atif = new T07_nbs_atif();
		ArrayList t07_report_acctList=new ArrayList();
		
		try{
			T07_cd_applyActionForm form = (T07_cd_applyActionForm) actionForm;
			String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
			t07_cd_apply=(T07_cd_apply)this.getSearchObject(t07_cd_apply,request, form, "getT07_report_acctListCount", url);
			if (t07_cd_apply.getNewsearchflag().equals("1")) {
				saveSearchObject(t07_cd_apply, request);
			}
			else{
				MyBeanUtils.copyBean2Bean(form, t07_cd_apply);
			}
			t07_report_acctList = t07_cd_applyDAO.getT07_report_acctList(sqlMap, t07_cd_apply, this.getStartRec(t07_cd_apply.getIntPage()), this.getIntPageSize());
			
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		
		request.setAttribute("t07_report_acctList", t07_report_acctList);
		return actionMapping.findForward("success");
	}
	
	public ActionForward performDelT07_cd_applyDo(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		T07_cd_applyDAO t07_cd_applyDAO = (T07_cd_applyDAO) context.getBean("t07_cd_applyDAO");
		T07_cd_apply t07_cd_apply = new T07_cd_apply();
		try{
			T07_cd_applyActionForm form = (T07_cd_applyActionForm) actionForm;
			String[] applyNos=request.getParameterValues("apply_no");
			String apply_noStr="";
			for(int i=0;i<applyNos.length;i++){
				apply_noStr+=",'"+applyNos[i]+"'";
			}
			if(apply_noStr.length()>0){
				apply_noStr=apply_noStr.substring(1);
			}
			t07_cd_apply.setApply_noStr(apply_noStr);
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			t07_cd_applyDAO.deleteT07_cd_apply(sqlMap,t07_cd_apply);
			t07_cd_applyDAO.deleteT07_bh_tsdt_p(sqlMap, t07_cd_apply);
			t07_cd_applyDAO.deleteT07_bs_report_p(sqlMap, t07_cd_apply);
			sqlMap.commitTransaction();
			
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}finally{
			try{
				sqlMap.endTransaction();
			}catch (Exception e) {
				e.printStackTrace();
				errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"error.common", e.getMessage()));
				saveMessages(request, errors);
				return actionMapping.findForward("failure");
			}
		}
		return actionMapping.findForward("success");
	}
	
	public ActionForward performSubmitT07_cd_apply(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		HttpSession session=request.getSession();
		T07_cd_applyDAO t07_cd_applyDAO = (T07_cd_applyDAO) context.getBean("t07_cd_applyDAO");
		T07_cd_apply t07_cd_apply=new T07_cd_apply();
		
		String status=request.getParameter("status");//2 提交 3 退回 4 审核通过 5 同意 6 失效
		String opertype=request.getParameter("opertype");//1 申请页面 2 审核页面  3查询页面
		try{
			String[] applyNos=request.getParameterValues("apply_no");
			String apply_noStr="";
			for(int i=0;i<applyNos.length;i++){
				apply_noStr+=",'"+applyNos[i]+"'";
			}
			if(apply_noStr.length()>0){
				apply_noStr=apply_noStr.substring(1);
			}
			t07_cd_apply.setApply_noStr(apply_noStr);
			
			if("2".equals(status)){//提交的时候，如果不需要审核，状态改为审核通过
				Map t87_sysparaMap=cm.getMapFromCache("t87_syspara");
				String isCheck=t87_sysparaMap.get("902").toString(); 
				if("0".equals(isCheck)){
					status="4";
				}
			}
			t07_cd_apply.setStatus_cd(status);
			if("2".equals(opertype)){//审核页面，增加审核人和审核时间
				AuthBean authBean = (AuthBean) session.getAttribute("authBean");
				Authorization auth = authBean.getAuthToken();
				t07_cd_apply.setCheck_dt(DateUtils.stringToDateShort(DateUtils.getCurrDate()));
				t07_cd_apply.setCheck_user(auth.getT00_user().getUsername());
			}
			t07_cd_applyDAO.updateT07_cd_apply(sqlMap, t07_cd_apply);
			if("5".equals(status)){//失效
				t07_cd_apply.setStatus_cd("8");//报告状态失效
				t07_cd_apply.setApply_type("W");//申请报告无效
				t07_cd_applyDAO.updateT07_reportStatus(sqlMap,t07_cd_apply);
			}
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		if("1".equals(opertype)){
			return actionMapping.findForward("success1");
		}else if("2".equals(opertype)){
			return actionMapping.findForward("success2");
		}else{
			return actionMapping.findForward("success3");
		}
		
	}
	public ActionForward performCreateT07_cd_apply_case(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		HttpSession session=request.getSession();
		T07_cd_applyDAO t07_cd_applyDAO = (T07_cd_applyDAO) context.getBean("t07_cd_applyDAO");
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_reportDAO t07_reportDAO=(T07_reportDAO)context.getBean("t07_reportDAO");
		T07_ReportBo t07_ReportBo=(T07_ReportBo)context.getBean("t07_ReportBo");
		T07_cd_apply t07_cd_apply=new T07_cd_apply();
		try{
			String apply_no=request.getParameter("apply_no");
			String msg_type=request.getParameter("msg_type");
			t07_cd_apply.setApply_no(apply_no);
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			if("1".equals(msg_type)){
				t07_cd_apply.setApply_type("D");
				ArrayList transList_d=t07_cd_applyDAO.getT07_cd_apply_transListByApply(sqlMap, t07_cd_apply);
				if(transList_d.size()>0){
					HashMap tsdtHash = new HashMap();
					for (int i = 0; i < transList_d.size(); i++) {
						T07_nbh_tsdt t07_nbh_tsdt1 = (T07_nbh_tsdt) transList_d.get(i);
						tsdtHash.put(t07_nbh_tsdt1.getReportkey()
								+ t07_nbh_tsdt1.getCati_seqno()
								+ t07_nbh_tsdt1.getCrcd()
								+ t07_nbh_tsdt1.getTsdt_seqno(), t07_nbh_tsdt1);
					}
					addT07_case_de_d(tsdtHash,t07_case_applicationDAO,
							t07_reportDAO,t07_ReportBo,session);
				}
				t07_cd_apply.setApply_type("C");
				ArrayList transList_c=t07_cd_applyDAO.getT07_cd_apply_transListByApply(sqlMap, t07_cd_apply);
				if(transList_c.size()>0){
					HashMap tsdtHash = new HashMap();
					for (int i = 0; i < transList_c.size(); i++) {
						T07_nbh_tsdt t07_nbh_tsdt1 = (T07_nbh_tsdt) transList_c.get(i);
						tsdtHash.put(t07_nbh_tsdt1.getReportkey()
								+ t07_nbh_tsdt1.getCati_seqno()
								+ t07_nbh_tsdt1.getCrcd()
								+ t07_nbh_tsdt1.getTsdt_seqno(), t07_nbh_tsdt1);
					}
					addT07_case_de_c(tsdtHash,t07_case_applicationDAO,
							t07_reportDAO,t07_ReportBo,session);
				}
			}else{
				t07_cd_apply.setApply_type("C");
				ArrayList reportList_c=t07_cd_applyDAO.getT07_bs_reportList1(sqlMap, t07_cd_apply);
				for(int i=0;i<reportList_c.size();i++){
					T07_bs_report_p report=(T07_bs_report_p) reportList_c.get(i);
					String reportkey=report.getReportkey();
					addT07_case_ky_c(reportkey,t07_case_applicationDAO,t07_reportDAO,t07_ReportBo,session);
				}
			}
			t07_cd_apply=new T07_cd_apply();
			t07_cd_apply.setApply_no(apply_no);
			t07_cd_apply.setStatus_cd("8");
			t07_cd_applyDAO.updateT07_cd_apply(sqlMap, t07_cd_apply);
			sqlMap.commitTransaction();
		}catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}finally{
			try{
				sqlMap.endTransaction();
			}catch (Exception e) {
				e.printStackTrace();
				errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"error.common", e.getMessage()));
				saveMessages(request, errors);
				return actionMapping.findForward("failure");
			}
		}
		return actionMapping.findForward("success");
	}
	public void addT07_case_ky_c(String reportkey,T07_case_applicationDAO t07_case_applicationDAO,
			T07_reportDAO t07_reportDAO,T07_ReportBo t07_ReportBo,HttpSession session)throws Exception{
		T07_report t07_report=new T07_report();
		T07_case_application t07_case_application = new T07_case_application();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
		//获取源案例信息
		t07_report = t07_reportDAO.getT07_reportDisp1(sqlMap,reportkey);
		T07_case_application t07_case_application1 = t07_case_applicationDAO.getT07_case_applicationDisp1(sqlMap,
				t07_report.getApplication_num());
		t07_case_application.setParty_id(t07_case_application1.getParty_id());
		t07_case_application.setParty_name(t07_case_application1.getParty_name());
		t07_case_application.setCurr_cd(t07_case_application1.getCurr_cd());
		t07_case_application.setParty_class_cd(t07_case_application1.getParty_class_cd());
		t07_case_application.setAlert_level(t07_case_application1.getAlert_level());
		t07_case_application.setTran_count(t07_case_application1.getTran_count());
		t07_case_application.setTran_amt(t07_case_application1.getTran_amt());
		t07_case_application.setAcct_count(t07_case_application1.getAcct_count());
		t07_case_application.setParty_count(t07_case_application1.getParty_count());
		t07_case_application.setObjkey(StringUtils.null2String(t07_case_application1.getObjkey()));
				
		// 案例信息
		String caseId = "C"	+ DateUtils.FormatDate(DateUtils.getCurrDateTime(),	"yyyymmdd")
							+ this.getSequenceNextVal("t07_case_application_app");
		t07_case_application.setApplication_num(caseId);
		t07_case_application.setFlow_id("10");
		t07_case_application.setCase_name(caseId+"_KY");
		t07_case_application.setCast_type("2");
		t07_case_application.setCase_kind("C");
		t07_case_application.setApp_org_id(auth.getT00_user().getOrgankey());
		t07_case_application.setApp_org_name(auth.getT00_user().getOrganname());
		t07_case_application.setNode_id("N1001");
		t07_case_application.setPost_id("P0102");
		// 取该用户的信息
		String username = auth.getT00_user().getUsername();
		t07_case_application.setApp_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
		t07_case_application.setCase_date(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
		t07_case_application.setCase_end_date(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
		t07_case_application.setApp_state_cd("1");
		t07_case_application.setDate_status_cd("1");
		t07_case_application.setLast_upd_user(username);			
		t07_case_application.setRecheck_num(Long.valueOf("0"));
		t07_case_application.setValidate_ind("1");
		
		//写入可疑纠错报告信息
		
		boolean issuss=t07_ReportBo.addReportErrorK(sqlMap, reportkey, t07_case_application, auth,context);
		if(!issuss){
			throw new Exception("写入大额纠错报告信息失败！");
		}
		if(t07_case_application.getTran_amt()==null){
		t07_case_application.setTran_amt(Double.valueOf("0"));
		}
		if(t07_case_application.getTran_count()==null){
			t07_case_application.setTran_count(Long.valueOf("0"));
			}
		//写入案例基本信息
		//人工新增案例，案例来源均为"规则"
		t07_case_application.setCase_source("1");
		int rows = t07_case_applicationDAO.insertT07_case_application_all_field(
					sqlMap, t07_case_application);
		if(rows<1){
			throw new Exception("写入大额纠错案例信息失败！");
		}
	}
	
	public void addT07_case_de_c(HashMap tsdtHash,T07_case_applicationDAO t07_case_applicationDAO,
			T07_reportDAO t07_reportDAO,T07_ReportBo t07_ReportBo,HttpSession session)throws Exception{
		T07_case_application t07_case_application = new T07_case_application();
		T07_report t07_report=new T07_report();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();	
			// 案例信息
			String caseId = "C"	+ DateUtils.FormatDate(DateUtils.getCurrDateTime(),	"yyyymmdd")
								+ this.getSequenceNextVal("t07_case_application_app");
			t07_case_application.setApplication_num(caseId);
			t07_case_application.setFlow_id("10");
			t07_case_application.setCase_name(caseId+"_DE");
			t07_case_application.setCast_type("1");
			t07_case_application.setCase_kind("C");
			t07_case_application.setApp_org_id(auth.getT00_user().getOrgankey());
			t07_case_application.setApp_org_name(auth.getT00_user().getOrganname());
			t07_case_application.setPost_id("P0102");
			t07_case_application.setNode_id("N1001");
//			t07_case_application.setParty_class_cd(StringUtils.null2String(request.getParameter("party_class_cd")));//客户类型
//			t07_case_application.setCurr_cd(StringUtils.null2String(request.getParameter("curr_cd")));//币种
			
			// 取该用户的信息
			
			String username = auth.getT00_user().getUsername();
			t07_case_application.setApp_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
			t07_case_application.setCase_date(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
			t07_case_application.setCase_end_date(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
			t07_case_application.setApp_state_cd("1");
			t07_case_application.setDate_status_cd("1");
			t07_case_application.setLast_upd_user(username);
			t07_case_application.setCase_date(DateUtils.getCurrDateTime());
			t07_case_application.setRecheck_num(Long.valueOf("0"));
			t07_case_application.setValidate_ind("1");

			//取得大额纠错报告信息
			t07_report=t07_ReportBo.getErrorReportD(tsdtHash, t07_case_application);
			//写入大额纠错报告信息
			boolean issuss=t07_ReportBo.addReportError(sqlMap, t07_report, t07_case_application, auth, context);
			if(!issuss){
				throw new Exception("写入大额纠错报告信息失败！");
			}
			//写入案例基本信息
			//人工新增案例，案例来源均为"规则"
			t07_case_application.setCase_source("1");
			int rows = t07_case_applicationDAO.insertT07_case_application(
						sqlMap, t07_case_application);
			if(rows<1){
				throw new Exception("写入大额纠错案例信息失败！");
			}
	}
	
	public void addT07_case_de_d(HashMap tsdtHash,T07_case_applicationDAO t07_case_applicationDAO,
			T07_reportDAO t07_reportDAO,T07_ReportBo t07_ReportBo,HttpSession session)throws Exception{
		T07_case_application t07_case_application = new T07_case_application();
		T07_report t07_report=new T07_report();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
		
		// 案例信息			
		String caseId = "C"	+ DateUtils.FormatDate(DateUtils.getCurrDateTime(),	"yyyymmdd")
							+ this.getSequenceNextVal("t07_case_application_app");
		t07_case_application.setApplication_num(caseId);
		t07_case_application.setFlow_id("11");
		t07_case_application.setCase_name(caseId+"_DE");
		t07_case_application.setCast_type("1");
		t07_case_application.setCase_kind("D");
		t07_case_application.setApp_org_id(auth.getT00_user().getOrgankey());
		t07_case_application.setApp_org_name(auth.getT00_user().getOrganname());
		t07_case_application.setNode_id("N1101");
		t07_case_application.setPost_id("P0102");
//		t07_case_application.setParty_class_cd(StringUtils.null2String(request.getParameter("party_class_cd")));//客户类型
//		t07_case_application.setCurr_cd(StringUtils.null2String(request.getParameter("curr_cd")));//币种
		// 取该用户的信息
		String username = auth.getT00_user().getUsername();
		t07_case_application.setApp_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
		t07_case_application.setCase_date(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
		t07_case_application.setCase_end_date(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
		t07_case_application.setApp_state_cd("1");
		t07_case_application.setDate_status_cd("1");
		t07_case_application.setLast_upd_user(username);
		t07_case_application.setCase_date(DateUtils.getCurrDateTime());
		t07_case_application.setRecheck_num(Long.valueOf("0"));
		t07_case_application.setValidate_ind("1");
		
		//写入大额纠错报告信息
		boolean issuss=t07_ReportBo.addReportDelete(sqlMap, "1", tsdtHash, t07_case_application, auth,context);
		if(!issuss){
			throw new Exception("写入大额删除报告信息失败！");
		}
		//写入案例基本信息
		//人工新增案例，案例来源均为"规则"
		t07_case_application.setCase_source("1");
		int rows = t07_case_applicationDAO.insertT07_case_application(
					sqlMap, t07_case_application);
		if(rows<1){
			throw new Exception("写入大额删除案例信息失败！");
		}
	}
}
