package com.ist.aml.report.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.upload.FormFile;

import com.ist.aml.report.dao.T47_partyDAO;
import com.ist.aml.report.dto.T47_party;
import com.ist.aml.report.dto.T47_transaction;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.MyBeanUtils;
import com.ist.common.ObjectCompare;
import com.ist.common.PageUtils;
import com.ist.common.base.BaseAction;
import com.ist.platform.dto.T00_organ;
import com.ist.util.Constans;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

public class T47_partyAction extends BaseAction {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		ActionForward myforward = null;
		String myaction = mapping.getParameter();
		myforward = this.preExecute(mapping, form, request,response);//��Ԥ������ǿ������if("false".equals(request.getAttribute("goWayFlag")))
		if ("false".equals(request.getAttribute("goWayFlag")))
			return myforward;//��ѯ����
		 if ("getT47_party_uc_List".equalsIgnoreCase(myaction)) {
			myforward = performGetT47_party_uc_List(mapping, form, request,
					response);
		}
		// �ͻ���¼��Ϣҳ��
		else if ("modifyT47_party_uc".equalsIgnoreCase(myaction)) {
			myforward = performModifyT47_party_uc(mapping, form, request,
					response);
		}
		// �ͻ���¼��Ϣ����
		else if ("saveT47_party_ucmodify".equalsIgnoreCase(myaction)) {
			myforward = performSaveT47_party_uc(mapping, form, request,
					response);
		}
		// ������λ�ͻ���Ϣ
		else if ("getT47_partyComm".equalsIgnoreCase(myaction)) {
			myforward = performGetT47_partyComm(mapping, form, request,
					response);
		}
		//������λ�ͻ���Ϣ�����ش�party_class_cd
		else if ("getT47_partyComm1".equalsIgnoreCase(myaction)) {
			myforward = performGetT47_partyComm1(mapping, form, request,
					response);
		}
		 // ����������пͻ�ҳ��
		else if ("case_new_party_add".equalsIgnoreCase(myaction)) {
			myforward = performCase_new_party_add(mapping, form, request,
					response);
		}
		// ����������пͻ�����
		else if ("case_new_party_add_do".equalsIgnoreCase(myaction)) {
			myforward = performCase_new_party_add_do(mapping, form, request,
					response);
		}
		//�ͻ���ͼ�б� added by shanbh
		else if("getT47_party_list".equalsIgnoreCase(myaction)){
			myforward = performGetT47_party_list(mapping, form, request,
					response);
		}else if("finance_query".equalsIgnoreCase(myaction)){
			myforward = performFinance_query(mapping, form, request,
					response);
		}
		//上传文件
		else if("finance_query_upload".equalsIgnoreCase(myaction)){
			myforward = performFinance_query_upload(mapping, form, request,
					response);
		}
		 //匹配文件
		else if("finance_query_match".equalsIgnoreCase(myaction)){
			myforward = performFinance_query_match(mapping, form, request,
					response);
		}
		 //文件下载
		else if("finance_query_download".equalsIgnoreCase(myaction)){
			myforward = performFinance_query_download(mapping, form, request,
					response);
		}
		return myforward;

	}

	

	/**
	 * �ͻ���ͼ�б� added by shanbh
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performGetT47_party_list(ActionMapping mapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_partyList;
		String pageInfo = "";
	
		T47_partyDAO t47_partyDAO = (T47_partyDAO)context.getBean("t47_partyDAO");
		T47_party t47_party = new T47_party();

		try {
			T47_partyActionForm form = (T47_partyActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request.getParameter("intPage"), 0);
			// �ͻ�����
//			LinkedHashMap party_classMap = cm.getMapFromCache("clienttype");
//			request.setAttribute("party_classMap", this.getOptionsListByMap(party_classMap, null, true));
			// �ͻ�֤������
			LinkedHashMap card_typeMap = cm.getMapFromCache("card_type");
			request.setAttribute("card_typeMap", this.getOptionsListByMap(card_typeMap, null, true));
			//�ͻ���������
			LinkedHashMap organMap = cm.getMapFromCache("organ");	
			request.setAttribute("organMap",this.getOptionsListByMap(organMap, null, true));
			
			// �û���֤��
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String organkeys = auth.getOrganstr();
			// �����˵�����
			if ("0".equals(newsearchflag)) {
			
				if("".equals(form.getOrgankey())){
					form.setOrgankey(auth.getT00_user().getOrgankey());
				}
				session.removeAttribute("t47_partySearchObj");
				
			} else if ("1".equals(newsearchflag)) {// �µĲ�ѯ
				MyBeanUtils.copyBean2Bean(t47_party, form);
				t47_party.setOrgankeys(organkeys);
				t47_party.setIntPage("0");
				session.setAttribute("T47_partysearch", t47_party);
			} else {// ��ҳ
				t47_party = (T47_party) session.getAttribute("T47_partysearch");
				if(t47_party!=null){
					   MyBeanUtils.copyBean2Bean(form,t47_party);  
				}
				session.setAttribute("T47_partysearch", t47_party);
			}
			
			//�ͻ�����
			String party_class_str=cm.getMapFromCacheToStr("clienttype", "party_class_cd", form.getParty_class_cd(),"", true);
			request.setAttribute("party_class_str", party_class_str);
			if(!"0".equals(newsearchflag)){
				// ִ�в�ѯ����
				int totalRow;
				t47_partyList = t47_partyDAO.getT47_partyList(sqlMap,t47_party, this.getStartRec(intPage), this.getIntPageSize());
				totalRow = t47_partyDAO.getT47_partyListCount(sqlMap,t47_party);
				
				String url = request.getContextPath() + "/report"+ mapping.getPath() + ".do";
				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
				request.setAttribute("pageInfo", pageInfo);
				request.setAttribute("t47_partyList", t47_partyList);
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("�쳣",e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return mapping.findForward("failure");
		}
		return mapping.findForward("success");
	}

	private ActionForward performGetT47_party_uc_List(ActionMapping mapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {

		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_partyList;
		String pageInfo = "";

	
		T47_partyDAO t47_partyDAO = (T47_partyDAO)context.getBean("t47_partyDAO");
		T47_party t47_party = new T47_party();
		
		

		try {
			T47_partyActionForm form = (T47_partyActionForm) actionForm;

			
			
			// �ͻ�����
			LinkedHashMap party_classMap = cm.getMapFromCache("clienttype");
			request.setAttribute("party_classMap", this.getOptionsListByMap(
					party_classMap, null, true));
			// �ͻ�֤������
			LinkedHashMap card_typeMap = cm.getMapFromCache("card_type");
			request.setAttribute("card_typeMap", this.getOptionsListByMap(
					card_typeMap, null, true));

			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
		
			int intPage = PageUtils.intPage(request, newsearchflag);;

			// ���Ҳ�˵�����
			if ("0".equals(newsearchflag)) {
			
				return mapping.findForward("success");
				// �µĲ�ѯ
			} else if ("1".equals(newsearchflag)) {
				MyBeanUtils.copyBean2Bean(t47_party, form);
				// �û���֤��
				AuthBean authBean = (AuthBean) session.getAttribute("authBean");
				Authorization auth = authBean.getAuthToken();
				String organkeys = auth.getOrganstr();
				t47_party.setOrgankeys(organkeys);
				
				// ģ��ƥ��ͻ�������
				if (form.getParty_chn_name_s() != null) {
					t47_party
							.setParty_chn_name(t47_party.getParty_chn_name_s());
				}
				
				t47_party.setIntPage("0");
				// ���ð����¿ͻ���ѯ��־
				
				session.setAttribute("T47_partysearch", t47_party);
				// ��ҳ
			} else {
				t47_party = (T47_party) session
						.getAttribute("T47_partysearch");
			   if(t47_party!=null){
				   MyBeanUtils.copyBean2Bean(form,t47_party);  
			   }
				session.setAttribute("T47_partysearch", t47_party);
			}
			// ִ�в�ѯ����
			int totalRow;

			
				t47_partyList = t47_partyDAO.getT47_party_ucList(sqlMap,
						t47_party, this.getStartRec(intPage), this
								.getIntPageSize());
				totalRow = t47_partyDAO.getT47_party_ucListCount(sqlMap,
						t47_party);
		

			String url = request.getContextPath() + "/report"
					+ mapping.getPath() + ".do";
			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("�쳣",e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return mapping.findForward("failure");
		}

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t47_partyList", t47_partyList);
	

		return mapping.findForward("success");
	}
	private ActionForward performModifyT47_party_uc(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		ActionErrors errors = new ActionErrors();
		T47_partyDAO dao = (T47_partyDAO)context.getBean("t47_partyDAO");
		T47_party t47_party = new T47_party();
		
		// Ԥ����־λ
		String class_cd = "";

		String party_id = StringUtils.nullObject2String(request
				.getParameter("party_id"));
		try {
			// ���ò�ѯid�����ݴ�������id��ѯ���ÿͻ���Ϣ
			t47_party.setParty_id(party_id);
			t47_party = dao.getT47_party_ucByHostId(sqlMap, party_id);
			// ���öԹ���˽��־λ
			class_cd = t47_party.getParty_class_cd();
			// ����Ԥ������,�����������֤��δͨ��������Ϊ����δͨ��
			if (t47_party.getValidate_ind() != null
					&& "0".equals(t47_party.getValidate_ind())
					|| t47_party.getValidate_ind() != null
					&& "2".equals(t47_party.getValidate_ind())) {

				t47_party.setAlert_type("1");
			}
			if (t47_party.getValidate_ind2() != null
					&& "0".equals(t47_party.getValidate_ind2())
					|| t47_party.getValidate_ind2() != null
					&& "2".equals(t47_party.getValidate_ind2())) {

				t47_party.setAlert_type("2");
			}
			if (t47_party.getCard_type() != null
					&& !t47_party.getCard_type().equals("")) {
				String card_type08 = t47_party.getCard_type().substring(0, 2);
				String card_type_inf08 = t47_party.getCard_type().substring(2);
				t47_party.setCard_type(card_type08);
				t47_party.setCard_type_inf(card_type_inf08);
			}
			// ���˴������δ֪
			t47_party.setLegal_country_cd(t47_party.getCountry_cd());
			if (t47_party.getLegal_card_type() != null
					&& !t47_party.getLegal_card_type().equals("")) {
				String legal_card_type08 = t47_party.getLegal_card_type()
						.substring(0, 2);
				String legal_card_type_inf08 = t47_party.getLegal_card_type()
						.substring(2);
				t47_party.setLegal_card_type(legal_card_type08);
				t47_party.setLegal_card_type_inf(legal_card_type_inf08);
			}
			// ��ֵ������form��
			MyBeanUtils.copyBean2Bean(form, t47_party);
			t47_party.setCard_type(t47_party.getCard_type()+t47_party.getCard_type_inf());
			t47_party.setLegal_card_type(StringUtils.null2String(t47_party.getLegal_card_type())+StringUtils.null2String(t47_party.getLegal_card_type_inf()));
			String saveString = ObjectCompare.ObjectToFormatStr(t47_party, "#_#", "@_@");//�Ѷ���ת��Ϊ�ַ���
			request.setAttribute("saveString", saveString);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("�쳣",e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return mapping.findForward("failure");
		}

		LinkedHashMap legal_card_typeMap = cm.getMapFromCache("BITP");
		LinkedHashMap industrykeyMap;
		String industrykey = "";
		String pbc_cttp = "";
		String card_type = "";
		if ("c".equalsIgnoreCase(class_cd)) { // 
			industrykey = "pbc_ctvc_c";
			pbc_cttp = "pbc_cttp2";
			card_type = "card_type_c";
			class_cd = "1";
		} else {
			industrykey = "pbc_ctvc_i";
			class_cd = "0";
			card_type = "card_type_i";
			pbc_cttp = "pbc_cttp1";
		}
		t47_party.setIndustrykeymap(industrykey);
		LinkedHashMap clienttypeMap = cm.getMapFromCache(pbc_cttp);
		industrykeyMap = cm.getMapFromCache(industrykey);
		LinkedHashMap card_typeMap = cm.getMapFromCache(card_type);
		// ���׹���
		LinkedHashMap nationalityMap = cm.getMapFromCache("country");
		request.setAttribute("nationalityMap", this.getOptionsListByMap(
				nationalityMap, null, true));
		/** add by ZEW */
		LinkedHashMap countryMap = cm.getMapFromCache("country");
		//LinkedHashMap country_map = new LinkedHashMap(new CountryComparator(map));
		//country_map.putAll(map);
		/** end */
		//LinkedHashMap countryMap = country_map; // ������Ϣ

		request.setAttribute("industrykeyMap", this.getOptionsListByMap(
				industrykeyMap, null, true));
		request.setAttribute("country_cdMap", this.getOptionsListByMap(
				countryMap, null, true));
		request.setAttribute("card_typeMap", this.getOptionsListByMap(
				card_typeMap, null, true));
		request.setAttribute("legal_card_typeMap", this.getOptionsListByMap(
				legal_card_typeMap, null, true));
		request.setAttribute("legal_country_cdMap", this.getOptionsListByMap(
				countryMap, null, true));
		request.setAttribute("clienttypeMap", this.getOptionsListByMap(
				clienttypeMap, null, true));
		request.setAttribute("class_cd", class_cd);
		request.setAttribute("t47_party", t47_party);
		
		return mapping.findForward("success");
	}

	/**
	 * �ͻ���Ϣ����
	 * 
	 * @param mapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performSaveT47_party_uc(ActionMapping mapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {

		ActionErrors errors = new ActionErrors();
		T47_partyDAO t47_partyDAO = (T47_partyDAO)context.getBean("t47_partyDAO");
		
		T47_party t47_party_uc = new T47_party();

		
		try {

			T47_partyActionForm form = (T47_partyActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t47_party_uc, form);
			String saveString = request.getParameter("saveString");
			T47_party source = new T47_party();
			ObjectCompare.StrToFormatObject(source, saveString, "#_#", "@_@");
			//���ͻ����֤���ͺͷ������������֤������Ϊ����ʱ�����ϲ���ֵ
			if(form.getCard_type().equals("19") || form.getCard_type().equals("29")){
				t47_party_uc.setCard_type(t47_party_uc.getCard_type()+t47_party_uc.getCard_type_inf());
			}
			if(form.getLegal_card_type().equals("19") || form.getLegal_card_type().equals("29")){
				t47_party_uc.setLegal_card_type(t47_party_uc.getLegal_card_type()+t47_party_uc.getLegal_card_type_inf());
			}
			ObjectCompare.ObjCompare(t47_party_uc, source, "#");
			t47_party_uc.setParty_id(source.getParty_id());
			//20091211���޸Ŀͻ���ͬʱ�޸���֤״̬��־
			t47_partyDAO.saveModifyT47_partyUc(sqlMap, t47_party_uc);
		
		
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("�쳣",e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return mapping.findForward("failure");
		}

		return mapping.findForward("success");
	}
	public ActionForward performGetT47_partyComm(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_partyList = new ArrayList();
		String pageInfo = "";
		
		T47_partyDAO t47_partyDAO =(T47_partyDAO)context.getBean("t47_partyDAO");
		T47_party t47_party = new T47_party();
		try {
			T47_partyActionForm form = (T47_partyActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			//
			String input_name = StringUtils.nullObject2String(request
					.getParameter("input_name"));
			String input_name_disp = StringUtils.nullObject2String(request
					.getParameter("input_name_disp"));
			String type = StringUtils.nullObject2String(request
					.getParameter("type"));
			request.setAttribute("input_name", input_name);
			request.setAttribute("input_name_disp", input_name_disp);

			
			if ("I".equals(type)) {
				LinkedHashMap clienttypeMap = new LinkedHashMap();
				clienttypeMap.put("I", "��˽");
				request.setAttribute("clienttypeMap", this.getOptionsListByMap(
						clienttypeMap, null, false));
			} else {
				LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
				request.setAttribute("clienttypeMap", this.getOptionsListByMap(
						clienttypeMap, null, false));
			}

			if (newsearchflag.equals("1")) {// �µĲ�ѯ
				MyBeanUtils.copyBean2Bean(t47_party, form);
				if(form.getParty_id_s()!=null) {
					t47_party.setParty_id(form.getParty_id_s());
				}
				// ģ��ƥ�䣬��Ҫ���⴦��һ��
//				if (!form.getParty_chn_name_search().equals("")) {
//					t47_party.setParty_chn_name("%"
//							+ form.getParty_chn_name_search() + "%");
//				}
								
				 t47_party.setParty_chn_name(form.getParty_chn_name_search());
				
				session.setAttribute("t47_partySearchObj", t47_party);
			} else {// ��ҳ
				t47_party = (T47_party) session
						.getAttribute("t47_partySearchObj");
			}
			if (t47_party == null) {
				T47_party t47_party1 = new T47_party();
				t47_party = t47_party1;
			}

			// ������Χ
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			//String org_IDS = auth.getOrganstr();			
			//t47_party.setOrgankey(org_IDS);
			
			String organstr="";
			//�������ж�λ�ͻ���ֻ��λ���������е�
			LinkedHashMap t87_sysparaMap=cm.getMapFromCache("t87_syspara");
			if(t87_sysparaMap.containsKey("400")&&"1".equals(t87_sysparaMap.get("400")))
			{
				String user_org=auth.getT00_user().getOrgankey();//�û�����
				 LinkedHashMap organMap=cm.getMapFromCache("report_organ_map");
				String reportorggankey=StringUtils.null2String((String)organMap.get(user_org));
				
					 organstr=" select organkey from T07_REPORT_ORGAN_MAP where REPORT_ORGANKEY='"+reportorggankey+"'";
				
				
			}
			t47_party.setOrgankey(organstr);
			
			//end by qiuyun 
			String searchtype = request.getParameter("type");
			if (searchtype != null && searchtype.equals("search")
					|| intPage >= 1) {
				t47_partyList = t47_partyDAO.getT47_partyComm(sqlMap,
						t47_party, this.getStartRec(intPage), this
								.getIntPageSize(),context);
//				int totalRow = t47_partyDAO.getT47_partyCommCount(sqlMap,
//						t47_party);
				String url = request.getContextPath()
				// + "/common"
						+ actionMapping.getPath() + ".do";

				pageInfo = this.getPageInfoStr2(t47_partyList.size(), intPage, url, "");
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t47_partyList", t47_partyList);
		//
		return actionMapping.findForward("success");
	}

	public ActionForward performGetT47_partyComm1(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_partyList = new ArrayList();
		String pageInfo = "";
		
		T47_partyDAO t47_partyDAO =(T47_partyDAO)context.getBean("t47_partyDAO");
		T47_party t47_party = new T47_party();
		try {
			T47_partyActionForm form = (T47_partyActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			//
			String input_name = StringUtils.nullObject2String(request
					.getParameter("input_name"));
			String input_name_disp = StringUtils.nullObject2String(request
					.getParameter("input_name_disp"));
			String type = StringUtils.nullObject2String(request
					.getParameter("type"));
			String organ_temp = StringUtils.nullObject2String(request
					.getParameter("organ_temp"));
			String card_temp_t = StringUtils.nullObject2String(request
					.getParameter("card_temp_t"));
			String card_temp_n = StringUtils.nullObject2String(request
					.getParameter("card_temp_n"));
			String disp = StringUtils.nullObject2String(request
					.getParameter("dispatcher"));
			request.setAttribute("input_name", input_name);
			request.setAttribute("input_name_disp", input_name_disp);
			request.setAttribute("type", type);
			request.setAttribute("organ_temp", organ_temp);
			request.setAttribute("organ_temp", organ_temp);
			request.setAttribute("card_temp_t", card_temp_t);
			request.setAttribute("card_temp_n", card_temp_n);
			request.setAttribute("dispatcher", disp);
			if ("I".equals(type)) {
				LinkedHashMap clienttypeMap = new LinkedHashMap();
				clienttypeMap.put("I", "��˽");
				request.setAttribute("clienttypeMap", this.getOptionsListByMap(
						clienttypeMap, null, false));
			} else {
				LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
				request.setAttribute("clienttypeMap", this.getOptionsListByMap(
						clienttypeMap, null, false));
			}

			if (newsearchflag.equals("1")) {// �µĲ�ѯ
				MyBeanUtils.copyBean2Bean(t47_party, form);
				if(form.getParty_id_s()!=null) {
					t47_party.setParty_id(form.getParty_id_s());
				}
								
				 t47_party.setParty_chn_name(form.getParty_chn_name_search());
//				 intPage=1;
				session.setAttribute("t47_partySearchObj", t47_party);
			} else {// ��ҳ
				t47_party = (T47_party) session
						.getAttribute("t47_partySearchObj");
			}
			if (t47_party == null) {
				T47_party t47_party1 = new T47_party();
				t47_party = t47_party1;
			}

			// ������Χ
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			
			String organstr="";
			//�������ж�λ�ͻ���ֻ��λ���������е�
			LinkedHashMap t87_sysparaMap=cm.getMapFromCache("t87_syspara");
			if(t87_sysparaMap.containsKey("400")&&"1".equals(t87_sysparaMap.get("400")))
			{
				String user_org=auth.getT00_user().getOrgankey();//�û�����
				 LinkedHashMap organMap=cm.getMapFromCache("report_organ_map");
				String reportorggankey=StringUtils.null2String((String)organMap.get(user_org));
				
					 organstr=" select organkey from T07_REPORT_ORGAN_MAP where REPORT_ORGANKEY='"+reportorggankey+"'";
				
				
			}
			t47_party.setOrgankey(organstr);
			

			String searchtype = request.getParameter("searchtype");
			if (searchtype != null && searchtype.equals("search")
					|| intPage >= 1) {
				t47_partyList = t47_partyDAO.getT47_partyComm(sqlMap,
						t47_party, this.getStartRec(intPage), this
								.getIntPageSize(),context);
//				int totalRow = t47_partyDAO.getT47_partyCommCount(sqlMap,
//						t47_party);
				String url = request.getContextPath() + actionMapping.getPath() + ".do";

				pageInfo = this.getPageInfoStr2(t47_partyList.size(), intPage, url, "");
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t47_partyList", t47_partyList);
		//
		return actionMapping.findForward("success");
	}

	/**
	 * add by lijie 2013-8-6:����������Ϊ��ͻ����
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performCase_new_party_add(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		
		T47_partyDAO t47_partyDAO =(T47_partyDAO)context.getBean("t47_partyDAO");
		T47_party t47_party = new T47_party();
		try {
			T47_partyActionForm form = (T47_partyActionForm) actionForm;
			
			LinkedHashMap party_typeMap = cm.getMapFromCache("clienttype"); // ��˽�Թ��ͻ�����
			request.setAttribute("party_typeMap", this.getOptionsListByMap(
					party_typeMap, null, true));
			
			LinkedHashMap cardtypeMap = cm.getMapFromCache("card_type"); // ֤������
			request.setAttribute("cardtypeMap", this.getOptionsListByMap(
					cardtypeMap, null,true));
			
			Map countryMap = cm.getMapFromCache("country"); // ����
			request.setAttribute("countryMap", this.getOptionsListByMap(
					countryMap, null,true));
			
			LinkedHashMap partytypeMap = cm.getMapFromCache("pbc_cttp"); // �ͻ�����
			request.setAttribute("partytypeMap",partytypeMap);
			
			LinkedHashMap pbc_ctvc_iMap = cm.getMapFromCache("pbc_ctvc_i"); //��˽ְҵ
			request.setAttribute("pbc_ctvc_iMap", this.getOptionsListByMap(
					pbc_ctvc_iMap, null,true));
			
			LinkedHashMap pbc_ctvc_cMap = cm.getMapFromCache("pbc_ctvc_c"); //�Թ���ҵ
			request.setAttribute("pbc_ctvc_cMap", this.getOptionsListByMap(
					pbc_ctvc_cMap, null,true));
			
			LinkedHashMap bi_card_typeMap = cm.getMapFromCache("BITP");//����������֤������
			request.setAttribute("bi_card_typeMap", this.getOptionsListByMap(
					bi_card_typeMap, null,true));
			
			
			
            
			

		
			MyBeanUtils.copyBean2Bean(t47_party, form);
		
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

	
		return actionMapping.findForward("success");
	}
	
	private ActionForward performCase_new_party_add_do(ActionMapping mapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {

		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		
		T47_partyDAO t47_partyDAO =(T47_partyDAO)context.getBean("t47_partyDAO");
		T47_party t47_party = new T47_party();
		try {
			T47_partyActionForm form = (T47_partyActionForm) actionForm;
			
			Map partyMap=(Map) session.getAttribute("case_partyMap");
			if(partyMap==null)
			{
				partyMap=new HashMap();
			}
			
			
			t47_party.setIs_party(form.getIs_party());
			t47_party.setParty_chn_name(form.getCtnm());
			t47_party.setParty_id(form.getCsnm());
//			if(form.getIs_party().equals("1"))
//				t47_party.setParty_id(form.getCsnm());
//			else{
//				String comparty_id=form.getCsnm();
				if(form.getCsnm().equals("")){
				t47_party.setParty_id("YC"+DateUtils.FormatDate(new Date(), "yyyyMMddhhmmss"));
		     	}
				//else{
//					T47_party t47_party1=t47_partyDAO.getT47_partyDisp(sqlMap, comparty_id);
//					if(t47_party1!=null && !t47_party1.getParty_id().equals("")){
//						errors.add(errors.GLOBAL_ERROR, new ActionError("error.common","�û��Ѵ���"));
//				      saveErrors(request, errors);
//				      return mapping.findForward("failure");
//					}else{
//						t47_party.setParty_id(form.getCsnm());
//					}
//				}
//			}
			t47_party.setHost_cust_id(t47_party.getParty_id());
			t47_party.setAml2_type_cd(form.getCttp());
			if("02".equals(form.getCttp()))
			{
				t47_party.setParty_class_cd("I");	
			}else
			{
				t47_party.setParty_class_cd("C");	
			}
			if("19".equals(form.getCitp())||"29".equals(form.getCitp())){
				t47_party.setCard_type(form.getCitp()+form.getCard_type_inf());
			}else
			{
				t47_party.setCard_type(form.getCitp());
			}
			t47_party.setCard_no(form.getCtid());
			t47_party.setCountry_cd(form.getCtnt());
			t47_party.setAddr1(StringUtils.nullToStr(form.getAddr1()));
			t47_party.setTel_no(StringUtils.nullToStr(form.getTel_no()));
			t47_party.setIndustrykey(form.getCtvc());
			if(form.getEnrol_fund_amt()== null || (form.getEnrol_fund_amt()!= null&&"".equals(form.getEnrol_fund_amt()))) 
			{
				t47_party.setEnrol_fund_amt("0");
			}
			else
				t47_party.setEnrol_fund_amt((form.getEnrol_fund_amt()));
			t47_party.setLegal_obj(StringUtils.nullToStr((form.getLegal_obj())));
			if("19".equals(form.getLegal_card_type())||"29".equals(form.getLegal_card_type())){
				t47_party.setLegal_card_type(StringUtils.nullToStr(form.getLegal_card_type()+form.getLegal_card_type_inf()));
			}else
			{
				t47_party.setLegal_card_type(StringUtils.nullToStr(form.getLegal_card_type()));	
			}
			t47_party.setLegal_card_no(StringUtils.nullToStr(form.getLegal_card_no()));
			t47_party.setOccupation(StringUtils.nullToStr(form.getCtvc_i()));
			t47_party.setValidate_ind2("1");
			t47_party.setOrgankey(form.getOrgankey());
			
			partyMap.put(t47_party.getParty_id(), t47_party);				
			session.setAttribute("case_partyMap", partyMap);
			
            
			request.setAttribute("url", "t07_case_app_add_party.do");

		
//			MyBeanUtils.copyBean2Bean(t47_party, form);
		
		}  catch (Exception e) {
			e.printStackTrace();
			logger.error("�쳣",e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return mapping.findForward("failure");
		}

		return mapping.findForward("success");
	}
	
	/**
	 * 金融查询
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performFinance_query(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		
		request.setAttribute("lists", getFileName());
		
		return mapping.findForward("success");
	
	}
	/**
	 * 文件上传
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performFinance_query_upload(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("lists", getFileName());
		
		Finance_query_form actionForm = (Finance_query_form) form;
		
		FormFile formFile = actionForm.getFile_upload();
         
        // 通过FormFile我们可以获取关于用户上传文件的各种信息，比如大小，名字等
        String fileName = formFile.getFileName();
        int fileSize = formFile.getFileSize();
        

        if (fileSize > 10 * 1024 * 1024) {
            request.setAttribute("error", "文件大小不能超过10MB!");
            System.out.println("文件大小不能超过10MB!");
            return mapping.findForward("success"); //需要做前台显示
        }

        InputStream is = null;
        OutputStream os = null;
        try {
            is = formFile.getInputStream();
            String path = request.getSession().getServletContext().getRealPath("file");
            System.out.println(path);
            os = new FileOutputStream(path + "\\" + fileName);
            int len = 0;
            byte[] bytes = new byte[1024];
            while ((len = is.read(bytes)) > 0) {
                os.write(bytes, 0, len);
            }
            
            return mapping.findForward("success");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (os != null) {
                    os.close();
                }
                if (is != null) {
                    is.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        request.setAttribute("error", "注册出错！");
        return mapping.findForward("success");
    }
	
	/**
	 * 文件匹配
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performFinance_query_match(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		request.setAttribute("lists", getFileName());
		
		Finance_query_form actionForm = (Finance_query_form) form;
		String match = actionForm.getMatch_file();
		System.out.println(match);
		
		System.out.println("这是文件匹配");
		return mapping.findForward("success");
	}
	
	/**
	 * 文件下载
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performFinance_query_download(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		request.setAttribute("lists", getFileName());
		
		System.out.println("这是文件下载");
		return mapping.findForward("success");
	}

	public String getFileSuffix(String fileName) {
        return fileName.substring(fileName.lastIndexOf("."));
    }

    /**
     * 获得文件夹下所有文件名称
     */
    public List<String> getFileName() {
    	List<String> lists = new ArrayList<String>();
        String path = "C:\\"; // 路径
        File f = new File(path);
        if (!f.exists()) {
            System.out.println(path + " not exists");
            return null;
        }

        File fa[] = f.listFiles();
        for (int i = 0; i < fa.length; i++) {
            File fs = fa[i];
            
            System.out.println(fs.getName());
            lists.add(fs.getName());
            
        }
        
        return lists;
    }
}
