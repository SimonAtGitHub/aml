package com.ist.aml.report.controller;

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
import com.ist.aml.report.dao.T10_trans_analysisDAO;
import com.ist.aml.report.dto.CreditTask;
import com.ist.aml.report.dto.T07_post_operator;
import com.ist.aml.report.dto.T10_capital_chain;
import com.ist.aml.report.dto.T10_trans_analysis;
import com.ist.aml.report.dto.T10_trans_analysis_case;
import com.ist.aml.rule.dto.T21_rule;
import com.ist.common.LogUtils;
import com.ist.common.MyBeanUtils;
import com.ist.common.PageUtils;
import com.ist.common.base.BaseAction;
import com.ist.common.fusioncharts.ChartFactory;
import com.ist.common.fusioncharts.ChartPainter;
import com.ist.common.fusioncharts.Charts;
import com.ist.common.fusioncharts.MultiChartDataset;
import com.ist.common.fusioncharts.SingleChartDataset;
import com.ist.common.jcs.CatchManager;
import com.ist.util.*;

public class T10_trans_analysisAction extends BaseAction {
	private static final long serialVersionUID = -1149982059234005907L;
	private static Logger logger = LogUtils.getLogger(T10_trans_analysisAction.class.getName()).getLogger(Constans.LOGGERNAMEA);
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward myforward = null;
		String myaction = mapping.getParameter();
		// 预处理
		myforward = this.preExecute(mapping, form, request, response);
		// 如预处理中强行跳出
		if ("false".equals(request.getAttribute("goWayFlag")))
			return myforward;
		//分析一个客户的交易情况
		if ("t10_cust_trans_analysislist".equalsIgnoreCase(myaction)) {
			myforward = performGet_cust_trans_analysislist(mapping, form, request,
					response);
		}
		//查询一个客户的资金流入流出信息 
		else if("t10_cust_capital_chainlist".equalsIgnoreCase(myaction)){
			myforward = performGet_cust_capital_chainlist(mapping, form, request,
					response);	
		}
		else if("t10_cust_capital_chain_outlist".equalsIgnoreCase(myaction)){
			myforward = performGet_cust_capital_chain_outlist(mapping, form, request,
					response);	
		}
		return myforward;
	}
	
	//分析一个客户的交易情况
	private ActionForward performGet_cust_trans_analysislist(
			ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T10_trans_analysisDAO transdao = (T10_trans_analysisDAO)context.getBean("t10_trans_analysisDAO");
		T10_trans_analysis t10_trans_analysis = new T10_trans_analysis();
		ArrayList analysis_list = new ArrayList();
		HttpSession session = request.getSession();
		try{

			String flag =StringUtils.null2String(request.getParameter("flag"));
			request.setAttribute("flag", flag);
			String party_id= (String)request.getParameter("party_id");//客户ID
				
			t10_trans_analysis.setParty_id(party_id);
			//当分析下一个客户时 才更新session  避免对同一客户多次查询数据库统计交易
			String searchflag = request.getParameter("newsearchflag");
			if("1".equals(searchflag)){
				int rows = transdao.getCustTransCountById(sqlMap,t10_trans_analysis);
				double sum_amt = transdao.getCustTransSumAmtById(sqlMap,t10_trans_analysis);
				//放到session供别的页面用 
				session.setAttribute("trans_count1", String.valueOf(rows));
				session.setAttribute("total_amt1",MoneyUtils.formatToMoney(sum_amt));
				
				request.setAttribute("trans_count", String.valueOf(rows));
				request.setAttribute("total_amt",MoneyUtils.formatToMoney(sum_amt));
			}else{
				String trans_count = (String) session.getAttribute("trans_count1");
				String total_amt = (String) session.getAttribute("total_amt1");
				
				request.setAttribute("trans_count", trans_count);
				request.setAttribute("total_amt",total_amt);
			}
			
			//取得交易统计分析方式
			String analy_type_flag = request.getParameter("analy_type_flag");
			if(analy_type_flag==null&&"".equals(analy_type_flag)){
				throw new Exception("不支持该分析方式");
			}
			LinkedHashMap analy_type_map = cm.getMapFromCache("trans_analysis_type");//交易分析方式
			request.setAttribute("analy_type", analy_type_map.get(analy_type_flag));
			if("0".equals(analy_type_flag)){//按交易渠道
				analysis_list = transdao.getCustTransGroupByChannel(sqlMap,t10_trans_analysis);
			}else if("1".equals(analy_type_flag)){//按交易机构
				analysis_list = transdao.getCustTransGroupByOrgankey(sqlMap,t10_trans_analysis);
			}else if("2".equals(analy_type_flag)){//按交易去向
				analysis_list = transdao.getCustTransGroupByTxgoarea(sqlMap,t10_trans_analysis);
			}else if("3".equals(analy_type_flag)){//按结算方式
				analysis_list = transdao.getCustTransGroupBySettletype(sqlMap,t10_trans_analysis);
			}else if("4".equals(analy_type_flag)){//按交易对手
				analysis_list = transdao.getCustTransGroupByOppname(sqlMap,t10_trans_analysis);
			}
			
//			String dataxml1 = "<chart palette=\"2\" showValues=\"0\" formatNumberScale=\"0\" useRoundEdges=\"1\" baseFontSize=\"14\" caption=";
//			String dataxml2 = "<chart palette=\"2\" showValues=\"0\" formatNumberScale=\"0\" useRoundEdges=\"1\" caption=";
//			String dataxml2_category = "<categories>";
//			String dataxml2_set = "<dataset seriesName=\"笔数\" renderAs=\"Column\" parentYAxis=\"X\">";
//			
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
			painter.setLabelDisplay("1");
			
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
				painter.setCaption("交易渠道");
				
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
				T10_trans_analysis t10_temp = (T10_trans_analysis)iterator.next();
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
                 cd.addValue((String) entry.getKey(), (String) entry.getValue());
                 cd2.addValue((String) entry.getKey(),"笔数", (String) entry.getValue());
             } 
             while (iterator2.hasNext()) {
                 Map.Entry entry = (Map.Entry) iterator2.next();
                 cd3.addValue((String) entry.getKey(), (String) entry.getValue());
                 cd4.addValue((String) entry.getKey(),"金额", (String) entry.getValue());
             } 
			mychart = ChartFactory.createPie3D(cd);
			request.setAttribute("dataxml1", mychart.getChartData());
			mychart2 = ChartFactory.createMSCombiDY2D(cd2);
			request.setAttribute("dataxml2", mychart2.getChartData());
			mychart3 = ChartFactory.createPie3D(cd3);
			request.setAttribute("dataxml3", mychart3.getChartData());
			mychart4 = ChartFactory.createMSCombiDY2D(cd4);
			request.setAttribute("dataxml4", mychart4.getChartData());
			
//			Iterator iter = analysis_list.iterator();
//			while(iter.hasNext()){
//				T10_trans_analysis t10_temp = (T10_trans_analysis)iter.next();
//				String dataLabel =  t10_temp.getPattern();
//				if("".equals(t10_temp.getPattern())||t10_temp.getPattern()==null){
//					dataLabel = "未知";
//				}
//				dataxml1 += "<set label=\"" + dataLabel + "\" value=\"" + t10_temp.getCount_percent() + "\" />";
//                dataxml2_category += "<category label=\"" + dataLabel + "\" />";
//                dataxml2_set += "<set value=\"" + t10_temp.getCount_percent() + "\" />";
//                
//                dataxml3 += "<set label=\"" + dataLabel + "\" value=\"" + t10_temp.getAmt_percent() + "\" />";
//                dataxml4_category += "<category label=\"" + dataLabel + "\" />";
//                dataxml4_set += "<set value=\"" + t10_temp.getAmt_percent() + "\" />";
//			}  
//			
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
	//查询一个客户的资金链情况
	private ActionForward performGet_cust_capital_chainlist(
			ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T10_trans_analysisDAO transdao = (T10_trans_analysisDAO)context.getBean("t10_trans_analysisDAO");
		T10_capital_chain t10_capital_chain = new T10_capital_chain(); 
		ArrayList in_result = new ArrayList();
		Integer in_trans=Integer.valueOf("0");
		Double in_amt=Double.valueOf("0");
		String in_amt_str = "";
		ArrayList out_result = new ArrayList();
		Integer out_trans=Integer.valueOf("0");
		Double out_amt=Double.valueOf("0");
		String out_amt_str = "";
		HttpSession session = request.getSession();
		T10_capital_chainActionForm form = (T10_capital_chainActionForm) actionForm;
		
		String pageInfo = "";
		try{
			//先从session里面取待分析客户信息
			String party_id = StringUtils.null2String(request.getParameter("party_id"));//客户ID

			String analy_from = StringUtils.null2String(request.getParameter("analy_from"));
			request.setAttribute("analy_from", analy_from);
			String flag =StringUtils.null2String(request.getParameter("flag"));
			request.setAttribute("flag", flag);
			String application_num=""; String cast_type="";
			if("2".equals(analy_from)){
				CreditTask credittask = (CreditTask)session.getAttribute("credittask");
				application_num=StringUtils.null2String(credittask.getApplication_num());
				cast_type=StringUtils.null2String(credittask.getCast_type());
			} 
//			else if (party_id == null || "".equals(party_id)) {
//				throw new Exception("待分析客户的客户号不能为空");
//			}
			request.setAttribute("party_id", party_id);
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
		
			int intPage = PageUtils.intPage(request, newsearchflag);
			int intPage_out = PageUtils.intPage(request, newsearchflag);

			LinkedHashMap order_type_map = cm.getMapFromCache("chain_order");
			request.setAttribute("order_type_map", this.getOptionsListByMap(order_type_map, null, true));
			
			
			if (newsearchflag.equals("1")) {// 新的查询
				MyBeanUtils.copyBean2Bean(t10_capital_chain, form);
				t10_capital_chain.setParty_id(party_id);
				t10_capital_chain.setApplication_num(application_num);
				t10_capital_chain.setCast_type(cast_type);
				if(form.getStart_dt_display()!=null&&!"".equals(form.getStart_dt_display())){
					t10_capital_chain.setStart_dt(DateUtils.stringToDateShort(form.getStart_dt_display()));
				}
				if(form.getEnd_dt_display()!=null&&!"".equals(form.getEnd_dt_display())){
					t10_capital_chain.setEnd_dt(DateUtils.stringToDateShort(form.getEnd_dt_display()));
				}
				session.setAttribute("t10_capital_chain_SearchObj", t10_capital_chain);
			}else {// 翻页
				t10_capital_chain = (T10_capital_chain) session.getAttribute("t10_capital_chain_SearchObj");
			}
			
			if (!newsearchflag.equals("2")) {
				if (t10_capital_chain == null)
					t10_capital_chain = new T10_capital_chain();
				in_result = transdao.getInCustCapitalChain(sqlMap,t10_capital_chain,analy_from, this.getStartRec(intPage), this.getIntPageSize());
				in_trans = transdao.getInCustCapitalChainTransCount(sqlMap,t10_capital_chain,analy_from);
				String url_in = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
				pageInfo = this.getPageInfoStr(in_trans, intPage, url_in, "");
			}
			
			if(newsearchflag!=null && !newsearchflag.equals("2")){
				in_amt = transdao.getInCustCapitalChainAmt(sqlMap,t10_capital_chain,analy_from); //资金流入交易总金额
				in_amt_str = MoneyUtils.formatToMoney(in_amt);
				
				out_amt = transdao.getOutCustCapitalChainAmt(sqlMap,t10_capital_chain,analy_from); //资金流出总金额
				out_amt_str = MoneyUtils.formatToMoney(out_amt);
				}
			
		}catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("in_trans", in_trans);
		request.setAttribute("in_amt_str", in_amt_str);
		request.setAttribute("out_trans", out_trans);
		request.setAttribute("out_amt_str", out_amt_str);
		request.setAttribute("t10_in_result",in_result);
		request.setAttribute("t10_out_result",out_result);
		return actionMapping.findForward("success");
	}
	
	private ActionForward performGet_cust_capital_chain_outlist(
			ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T10_trans_analysisDAO transdao = (T10_trans_analysisDAO)context.getBean("t10_trans_analysisDAO");
		T10_capital_chain t10_capital_chain = new T10_capital_chain(); 
		ArrayList out_result = new ArrayList();
		Integer out_trans=Integer.valueOf("0");
		Double out_amt=Double.valueOf("0");
		String out_amt_str = "";
		HttpSession session = request.getSession();
		T10_capital_chainActionForm form = (T10_capital_chainActionForm) actionForm;
		
		String pageInfo = "";
		try{
			//先从session里面取待分析客户信息
			String party_id = StringUtils.null2String(request.getParameter("party_id"));//客户ID

			String analy_from = StringUtils.null2String(request.getParameter("analy_from"));
			request.setAttribute("analy_from", analy_from);
			String flag =StringUtils.null2String(request.getParameter("flag"));
			request.setAttribute("flag", flag);
			String application_num=""; String cast_type="";
			if("2".equals(analy_from)){
				CreditTask credittask = (CreditTask)session.getAttribute("credittask");
				application_num=StringUtils.null2String(credittask.getApplication_num());
				cast_type=StringUtils.null2String(credittask.getCast_type());
			}
//			else if(party_id==null||"".equals(party_id)){
//				throw new Exception("待分析客户的客户号不能为空");
//			}
			request.setAttribute("party_id", party_id);
		
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
		
			int intPage = PageUtils.intPage(request, newsearchflag);
			
			if (newsearchflag.equals("1")) {// 新的查询
				//MyBeanUtils.copyBean2Bean(t10_capital_chain, form);
				t10_capital_chain=(T10_capital_chain) session.getAttribute("t10_capital_chain_SearchObj");
				t10_capital_chain.setParty_id(party_id);
				t10_capital_chain.setApplication_num(application_num);
				t10_capital_chain.setCast_type(cast_type);
				
				session.setAttribute("t10_capital_chain_outSearchObj", t10_capital_chain);
			}else {// 翻页
				t10_capital_chain = (T10_capital_chain) session.getAttribute("t10_capital_chain_outSearchObj");
			}
			
			if (!newsearchflag.equals("2")) {
				if (t10_capital_chain == null)
					t10_capital_chain = new T10_capital_chain();
				
				out_result = transdao.getOutCustCapitalChain(sqlMap,t10_capital_chain,analy_from, this.getStartRec(intPage), this.getIntPageSize());//资金流出交易
				out_trans = transdao.getOutCustCapitalChainTransCount(sqlMap,t10_capital_chain,analy_from);
				String url_out = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
				pageInfo = this.getPageInfoStr(out_trans, intPage, url_out, "");
			}
			
			if(newsearchflag!=null && !newsearchflag.equals("2")){
				out_amt = transdao.getOutCustCapitalChainAmt(sqlMap,t10_capital_chain,analy_from); //资金流出总金额
				out_amt_str = MoneyUtils.formatToMoney(out_amt);
				}
			
		}catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("pageInfo", pageInfo);
		
		request.setAttribute("out_trans", out_trans);
		request.setAttribute("out_amt_str", out_amt_str);
		request.setAttribute("t10_out_result",out_result);
		return actionMapping.findForward("success");
	}
}
