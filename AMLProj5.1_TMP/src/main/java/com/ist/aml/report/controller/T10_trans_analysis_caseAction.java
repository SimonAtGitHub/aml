package com.ist.aml.report.controller;





import com.ist.common.dataintegrity.DataSupplement;
import com.ist.common.fusioncharts.*;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.TreeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.report.dao.T10_trans_analysis_caseDAO;
import com.ist.aml.report.dto.CreditTask;
import com.ist.aml.report.dto.T10_trans_analysis_case;
import com.ist.common.LogUtils;
import com.ist.common.MyBeanUtils;
import com.ist.common.PageUtils;
import com.ist.common.base.BaseAction;
import com.ist.common.jcs.CatchManager;
import com.ist.util.*;

public class T10_trans_analysis_caseAction extends BaseAction {
	private static final long serialVersionUID = -1149982059234005907L;
	private static Logger logger = LogUtils.getLogger(T10_trans_analysis_caseAction.class.getName()).getLogger(Constans.LOGGERNAMEA);
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward myforward = null;
		String myaction = mapping.getParameter();
		// 预处理
		myforward = this.preExecute(mapping, form, request, response);
		// 如预处理中强行跳出
		if ("false".equals(request.getAttribute("goWayFlag")))
			return myforward;
		//分析一个案例的交易情况
		if ("t10_trans_analysis_caselist".equalsIgnoreCase(myaction)) {
			myforward = performGet_trans_analysis_caselist(mapping, form, request,
					response);
		}
		else if ("analysis_main".equalsIgnoreCase(myaction)) {
			myforward = performGet_analysis_main(mapping, form, request,
					response);
		}
		return myforward;
	}
	
	private ActionForward performGet_analysis_main(
			ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		
		return actionMapping.findForward("success");
	}
	//分析一个案例的交易情况
	private ActionForward performGet_trans_analysis_caselist(
			ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		
		ActionErrors errors = new ActionErrors();
		T10_trans_analysis_caseDAO transdao = (T10_trans_analysis_caseDAO)context.getBean("t10_trans_analysis_caseDAO");
		T10_trans_analysis_case t10_trans_analysis_case = new T10_trans_analysis_case();
		ArrayList analysis_list = new ArrayList();
		HttpSession session = request.getSession();
		try{
			//先从session里取交易分析的案例号
			CreditTask credittask = (CreditTask)session.getAttribute("credittask");
			String application_num = credittask.getApplication_num();
				
			if(application_num == null || "".equals(application_num)){
				throw new Exception("待分析案例的案例号不能为空");
			}
           String cast_type=StringUtils.null2String(credittask.getCast_type());
			t10_trans_analysis_case.setApplication_num(application_num);
			t10_trans_analysis_case.setCast_type(cast_type);
			//当分析下一个案例时 才更新session  避免对同一案例多次查询数据库统计交易
			String searchflag = request.getParameter("newsearchflag");
			int rows;
			double sum_amt;
			if("1".equals(searchflag)){
				rows = transdao.getCaseTransCountById(sqlMap,t10_trans_analysis_case);
				sum_amt = transdao.getCaseTransSumAmtById(sqlMap,t10_trans_analysis_case);
				
				//放到session供别的页面用 
				session.setAttribute("trans_count", String.valueOf(rows));
				session.setAttribute("total_amt",MoneyUtils.formatToMoney(sum_amt));
				
				request.setAttribute("trans_count", String.valueOf(rows));
				request.setAttribute("total_amt",MoneyUtils.formatToMoney(sum_amt));
			}else{
				String trans_count = (String) session.getAttribute("trans_count");
				String total_amt = (String) session.getAttribute("total_amt");
				
				request.setAttribute("trans_count", trans_count);
				request.setAttribute("total_amt",total_amt);
			}
			//取得交易统计分析方式
			String analy_type_flag = request.getParameter("analy_type_flag");
			if(analy_type_flag==null&&"".equals(analy_type_flag)){
				throw new Exception("不支持该分析方式");
			}
			request.setAttribute("analy_type_flag",analy_type_flag);
			LinkedHashMap analy_type_map = cm.getMapFromCache("trans_analysis_type");//交易分析方式
			request.setAttribute("analy_type", analy_type_map.get(analy_type_flag));
			if("0".equals(analy_type_flag)){//按交易渠道
				analysis_list = transdao.getCaseTransGroupByChannel(sqlMap,t10_trans_analysis_case);
			}else if("1".equals(analy_type_flag)){//按交易机构
				analysis_list = transdao.getCaseTransGroupByOrgankey(sqlMap,t10_trans_analysis_case);
			}else if("2".equals(analy_type_flag)){//按交易去向
				analysis_list = transdao.getCaseTransGroupByTxgoarea(sqlMap,t10_trans_analysis_case);
			}else if("3".equals(analy_type_flag)){//按结算方式
				analysis_list = transdao.getCaseTransGroupBySettletype(sqlMap,t10_trans_analysis_case);
			}else if("4".equals(analy_type_flag)){//按交易对手
				String pageInfo="";
				String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
				int intPage = PageUtils.intPage(request, newsearchflag);
				analysis_list = transdao.getCaseTransGroupByOppname(sqlMap,t10_trans_analysis_case,this.getStartRec(intPage), this.getIntPageSize());
				int totalRow = transdao.getCaseTransGroupByOppnameCount(sqlMap, t10_trans_analysis_case);
				String url = request.getContextPath()+"/report" + actionMapping.getPath() + ".do";
	    		pageInfo = this.getPageInfoStr(totalRow,intPage,url,"");
	    		request.setAttribute("pageInfo", pageInfo);
			}
			
//			   var dataxml1 = '<chart palette="2" showValues="0" formatNumberScale="0" useRoundEdges="1" caption="交易渠道" baseFontSize="14"><set label="网银" value="30"/><set label="柜面" value="25"/><set label="面" value="25"/></chart>';
//			   var dataxml2 = '<chart palette="2" showValues="0" formatNumberScale="0" useRoundEdges="1" caption="交易渠道"><categories><category label="柜面"/><category label="网银"/></categories><dataset seriesName="笔数" renderAs="Column" parentYAxis="P"><set value="25"/><set value="30"/></dataset></chart>';
			
//			String dataxml1 = "<chart palette=\"2\" showValues=\"0\" formatNumberScale=\"0\" useRoundEdges=\"1\" baseFontSize=\"14\" caption=";
//			String dataxml2 = "<chart palette=\"2\" showValues=\"0\" formatNumberScale=\"0\" useRoundEdges=\"1\" caption=";
//			String dataxml2_category = "<categories>";
//			String dataxml2_set = "<dataset seriesName=\"笔数\" renderAs=\"Column\" parentYAxis=\"X\">";
			
//			String dataxml3 = "<chart palette=\"2\" showValues=\"0\" formatNumberScale=\"0\" useRoundEdges=\"1\" baseFontSize=\"14\" caption=";
//			String dataxml4 = "<chart palette=\"2\" showValues=\"0\" formatNumberScale=\"0\" useRoundEdges=\"1\" caption=";
//			String dataxml4_category = "<categories>";
//			String dataxml4_set = "<dataset seriesName=\"金额\" renderAs=\"Column\" parentYAxis=\"X\">";
			
			Charts mychart = null;
			Charts mychart2 = null;
			Charts mychart3 = null;
			Charts mychart4 = null;
			Iterator iterator = null;
			Iterator iterator2 = null;
			LinkedHashMap spplementMap = new LinkedHashMap();
			LinkedHashMap spplementMap2 = new LinkedHashMap();
			ChartPainter painter = new ChartPainter("0");
			painter.setShowNames("1");
			
			if("0".equals(analy_type_flag)){//按交易渠道
				painter.setCaption("交易渠道");
				
//				dataxml1 += "\"交易渠道\" >";
//				dataxml2 += "\"交易渠道\" >";
//				dataxml3 += "\"交易渠道\" >";
//				dataxml4 += "\"交易渠道\" >";
			}else if("1".equals(analy_type_flag)){//按交易机构
				painter.setCaption("交易机构");
//				dataxml1 += "\"交易机构\" >";
//				dataxml2 += "\"交易机构\" >";
//				dataxml3 += "\"交易机构\" >";
//				dataxml4 += "\"交易机构\" >";
			}else if("2".equals(analy_type_flag)){//按交易去向
				painter.setCaption("交易去向");
//				dataxml1 += "\"交易去向\" >";
//				dataxml2 += "\"交易去向\" >";
//				dataxml3 += "\"交易去向\" >";
//				dataxml4 += "\"交易去向\" >";
			}else if("3".equals(analy_type_flag)){//按结算方式
				painter.setCaption("结算方式");
//				dataxml1 += "\"结算方式\" >";
//				dataxml2 += "\"结算方式\" >";
//				dataxml3 += "\"结算方式\" >";
//				dataxml4 += "\"结算方式\" >";
			}else if("4".equals(analy_type_flag)){//按交易对手
				painter.setCaption("交易对手");
//				dataxml1 += "\"交易对手\" >";
//				dataxml2 += "\"交易对手\" >";
//				dataxml3 += "\"交易对手\" >";
//				dataxml4 += "\"交易对手\" >";
			}
			painter.setBaseFontSize("14");
			SingleChartDataset cd = new SingleChartDataset(painter);
			MultiChartDataset cd2 = new MultiChartDataset(painter);
			SingleChartDataset cd3 = new SingleChartDataset(painter);
			MultiChartDataset cd4 = new MultiChartDataset(painter);
			
			iterator = analysis_list.iterator();
			while(iterator.hasNext()){
				T10_trans_analysis_case t10_temp = (T10_trans_analysis_case)iterator.next();
				String dataLabel =  t10_temp.getPattern();
				if("".equals(t10_temp.getPattern())||t10_temp.getPattern()==null){
					dataLabel = "未知";
				}
				if(dataLabel.length()>5&&dataLabel.length()<13){
					painter.setBaseFontSize("10");
					dataLabel = dataLabel.substring(0,6)+"<br>"+dataLabel.substring(6);
					
				}else if(dataLabel.length()>12){
					painter.setBaseFontSize("10");
					dataLabel = dataLabel.substring(0,6)+"<br>"+dataLabel.substring(6,12)+"<br>"+dataLabel.substring(12,dataLabel.length());
				}
				spplementMap.put(dataLabel, t10_temp.getCount_percent());
				spplementMap2.put(dataLabel, t10_temp.getAmt_percent());
			}  
			 iterator = spplementMap.entrySet().iterator();
			 iterator2 = spplementMap2.entrySet().iterator();
             while (iterator.hasNext()) {
                 Map.Entry entry = (Map.Entry) iterator.next();
                 Double countpercent=(Double)entry.getValue();
                 String contp=countpercent.toString();
                 if(Double.parseDouble(contp)<0){
                	 contp="0"+contp;
                 }
                 cd.addValue((String) entry.getKey(), contp);
                 cd2.addValue((String) entry.getKey(),"笔数", contp);
             } 	//modify by 20130814
             while (iterator2.hasNext()) {
                 Map.Entry entry = (Map.Entry) iterator2.next();
                 Double amtpercent=(Double)entry.getValue();
                 String amtp=amtpercent.toString();
                 if(Double.parseDouble(amtp)<0){
                	amtp="0"+amtp;
                 }
      
                 cd3.addValue((String) entry.getKey(), amtp);
                 cd4.addValue((String) entry.getKey(),"金额",amtp);
             } 
			mychart = ChartFactory.createPie3D(cd);
			request.setAttribute("dataxml1", mychart.getChartData());
			mychart2 = ChartFactory.createMSCombiDY2D(cd2);
			request.setAttribute("dataxml2", mychart2.getChartData());
			mychart3 = ChartFactory.createPie3D(cd3);
			request.setAttribute("dataxml3", mychart3.getChartData());
			mychart4 = ChartFactory.createMSCombiDY2D(cd4);
			request.setAttribute("dataxml4", mychart4.getChartData());
//			ChartPainter painter2 = new ChartPainter("0");
//			LinkedHashMap spplementMap2 = new LinkedHashMap();
//			Iterator iterator2 = null;
//			
//			
//			MultiChartDataset cd2 = new MultiChartDataset(painter);
//			iterator2 = analysis_list.iterator();
//			
//			while (iterator2.hasNext()) {
//				T10_trans_analysis_case t10_temp = (T10_trans_analysis_case)iterator2.next();
//                spplementMap.put(t10_temp.getPattern(), t10_temp.getCount_percent());
//            }
//			 iterator2 = spplementMap.entrySet().iterator();
//             while (iterator2.hasNext()) {
//                 Map.Entry entry = (Map.Entry) iterator2.next();
//                 cd2.addValue((String) entry.getKey(),"笔数", (String) entry.getValue());
//             } 
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
//			Iterator iter = analysis_list.iterator();
//			while(iter.hasNext()){
//				T10_trans_analysis_case t10_temp = (T10_trans_analysis_case)iter.next();
//                dataxml1 += "<set label=\"" + t10_temp.getPattern() + "\" value=\"" + t10_temp.getCount_percent() + "\" />";
//                dataxml2_category += "<category label=\"" + t10_temp.getPattern() + "\" />";
//                dataxml2_set += "<set value=\"" + t10_temp.getCount_percent() + "\" />";
//                
//                dataxml3 += "<set label=\"" + t10_temp.getPattern() + "\" value=\"" + t10_temp.getAmt_percent() + "\" />";
//                dataxml4_category += "<category label=\"" + t10_temp.getPattern() + "\" />";
//                dataxml4_set += "<set value=\"" + t10_temp.getAmt_percent() + "\" />";
//			}  
			
//			dataxml1 += "</chart>";
//			dataxml2_category += "</categories>";
//			dataxml2_set += "</dataset>";
//			dataxml2 += dataxml2_category + dataxml2_set + "</chart>";
//			
//			dataxml3 += "</chart>";
//			dataxml4_category += "</categories>";
//			dataxml4_set += "</dataset>";
//			dataxml4 += dataxml4_category + dataxml4_set + "</chart>";
//			
//			request.setAttribute("dataxml1", dataxml1);
//			request.setAttribute("dataxml2", dataxml2);
//			request.setAttribute("dataxml3", dataxml3);
//			request.setAttribute("dataxml4", dataxml4);
		}catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("analysis_list",analysis_list);
		
		return actionMapping.findForward("success");
	}

}
