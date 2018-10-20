package com.ist.aml.cust_identify.controller;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.cust_identify.dao.T10_checkpartyDAO;
import com.ist.aml.cust_identify.dao.T10_newClientCheckDAO;
import com.ist.aml.cust_identify.dto.T10_checkparty;
import com.ist.aml.cust_identify.dto.T10_newClientCheck;
import com.ist.aml.report.dao.T07_ATTENTION_libDAO;
import com.ist.aml.report.dao.T07_BlacklistDAO;
import com.ist.aml.report.dao.T07_OBJ_RULEDAO;
import com.ist.aml.report.dao.T07_pbcruleDAO;
import com.ist.aml.report.dto.T07_ATTENTION_lib;
import com.ist.aml.report.dto.T07_ATTENTION_log;
import com.ist.aml.report.dto.T07_Blacklist;
import com.ist.aml.report.dto.T07_OBJ_RULE;
import com.ist.aml.report.dto.T07_pbcrule;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.MyBeanUtils;
import com.ist.common.base.BaseAction;
import com.ist.common.jcs.CatchManager;
import com.ist.impfile.bmp.platform.dto.T00_user;
import com.ist.util.DateUtils;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.springframework.context.ApplicationContext;

public class T10_newClientCheckAction extends BaseAction
{
  public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
  {
    ActionForward myforward = null;
    String myaction = mapping.getParameter();

    if ("false".equals(request.getAttribute("goWayFlag"))) {
      return myforward;
    }
    if ("modifyNewClientCheck".equalsIgnoreCase(myaction)) {
      myforward = modifyNewClientCheck(mapping, form, request, response);
    }
    else if ("modifyNewClientCheck_do".equalsIgnoreCase(myaction)) {
      myforward = modifyNewClientCheck_do(mapping, form, request, response);
    }
    else if ("exportClientCheckInfo".equalsIgnoreCase(myaction)) {
      myforward = exportClientCheckInfo(mapping, form, request, response);
    }
    return myforward;
  }

  public ActionForward exportClientCheckInfo(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
  {
    LinkedHashMap checkStateMap = new LinkedHashMap();
    T10_newClientCheckDAO t10_newClientCheckDAO = (T10_newClientCheckDAO)this.context.getBean("t10_newClientCheckDAO");

    T10_newClientCheck clientInfo = new T10_newClientCheck();

    T10_newClientCheck checkState = new T10_newClientCheck();

    T10_newClientCheck checkResult = new T10_newClientCheck();

    LinkedHashMap organMap = this.cm.getMapFromCache("organ");

    LinkedHashMap nationalityMap = this.cm.getMapFromCache("country");
    request.setAttribute("nationalityMap", getOptionsListByMap(nationalityMap, null, true));

    LinkedHashMap pbc_cttp2Map = this.cm.getMapFromCache("pbc_cttp2");
    request.setAttribute("pbc_cttp2Map", getOptionsListByMap(pbc_cttp2Map, null, true));

    LinkedHashMap card_type_cMap = this.cm.getMapFromCache("card_type_c");
    request.setAttribute("card_type_cMap", getOptionsListByMap(card_type_cMap, null, true));

    LinkedHashMap bitpMap = this.cm.getMapFromCache("BITP");
    request.setAttribute("bitpMap", getOptionsListByMap(bitpMap, null, true));

    LinkedHashMap industryMap = this.cm.getMapFromCache("industryMap");
    request.setAttribute("industryMap", getOptionsListByMap(industryMap, null, true));

    LinkedHashMap occupationMap = this.cm.getMapFromCache("pbc_ctvc_i");
    request.setAttribute("occupationMap", getOptionsListByMap(occupationMap, null, true));

    LinkedHashMap dutyMap = this.cm.getMapFromCache("duty");
    request.setAttribute("dutyMap", getOptionsListByMap(dutyMap, null, true));

    LinkedHashMap currencyMap = this.cm.getMapFromCache("currency");
    request.setAttribute("currencyMap", getOptionsListByMap(currencyMap, null, true));

    LinkedHashMap rule_typeMap = this.cm.getMapFromCache("rule_type");
    request.setAttribute("rule_typeMap", getOptionsListByMap(rule_typeMap, null, true));

    LinkedHashMap m_list_type_bMap = this.cm.getMapFromCache("m_list_type_b");
    request.setAttribute("m_list_type_bMap", getOptionsListByMap(m_list_type_bMap, null, true));

    LinkedHashMap yesNoMap = this.cm.getMapFromCache("yesNo");
    request.setAttribute("yesNoMap", getOptionsListByMap(yesNoMap, null, true));
    try {
      T10_newClientCheckActionForm t10_newClientCheckActionForm = (T10_newClientCheckActionForm)form;
      String party_id = (t10_newClientCheckActionForm.getParty_id() == null) ? "" : t10_newClientCheckActionForm.getParty_id();
      String party_class_cd = (t10_newClientCheckActionForm.getParty_class_cd() == null) ? "" : t10_newClientCheckActionForm.getParty_class_cd();
      clientInfo.setParty_id(party_id);
      clientInfo.setParty_class_cd(party_class_cd);
      checkState.setParty_id(party_id);
      checkState.setTable_name("0");
      checkResult.setParty_id(party_id);
      checkResult.setTable_name("0");
      this.sqlMap.endTransaction();
      this.sqlMap.startTransaction();

      clientInfo = t10_newClientCheckDAO.getT47_clientDisp(this.sqlMap, clientInfo);

      if ((clientInfo.getCountry_cd() != null) && (!("".equals(clientInfo.getCountry_cd())))) {
        clientInfo.setCountry_cd_disp((String)nationalityMap.get(clientInfo.getCountry_cd()));
      }

      if ((clientInfo.getIndustry() != null) && (!("".equals(clientInfo.getIndustry())))) {
        clientInfo.setIndustry_disp((String)industryMap.get(clientInfo.getIndustry()));
      }

      if ((clientInfo.getCard_type() != null) && (!("".equals(clientInfo.getCard_type())))) {
        clientInfo.setCard_type_disp((String)bitpMap.get(clientInfo.getCard_type()));
      }

      if ((clientInfo.getOccupation() != null) && (!("".equals(clientInfo.getOccupation())))) {
        clientInfo.setOccupation_disp((String)occupationMap.get(clientInfo.getOccupation()));
      }

      if ((clientInfo.getDuty() != null) && (!("".equals(clientInfo.getDuty())))) {
        clientInfo.setDuty_disp((String)dutyMap.get(clientInfo.getDuty()));
      }

      if ((clientInfo.getOrgankey() != null) && (!("".equals(clientInfo.getOrgankey())))) {
        clientInfo.setOrgan_name_disp((String)organMap.get(clientInfo.getOrgankey()));
      }

      if ((clientInfo.getCard_type_c() != null) && (!("".equals(clientInfo.getCard_type_c())))) {
        clientInfo.setCard_type_c_disp((String)card_type_cMap.get(clientInfo.getCard_type_c()));
      }

      if ((clientInfo.getAml2_type_cd() != null) && (!("".equals(clientInfo.getAml2_type_cd())))) {
        clientInfo.setAml2_type_cd_disp((String)pbc_cttp2Map.get(clientInfo.getAml2_type_cd()));
      }

      if ((clientInfo.getEnrol_fund_currency_cd() != null) && (!("".equals(clientInfo.getEnrol_fund_currency_cd())))) {
        clientInfo.setEnrol_fund_currency_cd_disp((String)currencyMap.get(clientInfo.getEnrol_fund_currency_cd()));
      }

      if ((clientInfo.getLegal_card_type() != null) && (!("".equals(clientInfo.getLegal_card_type())))) {
        clientInfo.setLegal_card_type_disp((String)bitpMap.get(clientInfo.getLegal_card_type()));
      }

      if ((clientInfo.getStock_holder_card_type() != null) && (!("".equals(clientInfo.getStock_holder_card_type())))) {
        clientInfo.setStock_holder_card_type_disp((String)bitpMap.get(clientInfo.getStock_holder_card_type()));
      }
      //begin zyd 2018-08-08 新乡营业执照
      if (clientInfo!=null&&(clientInfo.getLicence_end_dt() != null)) {
    	  clientInfo.setLicence_end_dtdisp(DateUtils.dateToStringShort(clientInfo.getLicence_end_dt()));
    	  t10_newClientCheckActionForm.setLicence_end_dtdisp(clientInfo.getLicence_end_dtdisp());
    	  t10_newClientCheckActionForm.setLicence_end_dt(clientInfo.getLicence_end_dt());
        }
      //clientInfo.setLicence_end_dtdisp("2018-08-02");
     // t10_newClientCheckActionForm.setLicence_end_dtdisp("2018-08-02");
      //end 
      MyBeanUtils.copyBean2Bean(form, clientInfo);

      T10_newClientCheck listType = t10_newClientCheckDAO.getT10_newClientCheck_listType(this.sqlMap, party_id);
      if ((listType.getRule_type() != null) && (!("".equals(listType.getRule_type())))) {
        listType.setRule_type_disp((String)rule_typeMap.get(listType.getRule_type()));
      }
      if ((listType.getList_type() != null) && (!("".equals(listType.getList_type())))) {
        listType.setList_type_disp((String)m_list_type_bMap.get(listType.getList_type()));
      }
      request.setAttribute("listType", listType);

      checkStateMap = t10_newClientCheckDAO.getT10_newClientCheck_checkedState(this.sqlMap, checkState);

      checkResult = t10_newClientCheckDAO.getT10_newClientCheck_checkResult(this.sqlMap, checkResult);
      this.sqlMap.commitTransaction();
      this.sqlMap.endTransaction();
    } catch (Exception e) {
      e.printStackTrace();
      this.logger.error("异常", e);
      return mapping.findForward("failure");
    }
    String downloadname = DateUtils.dateToStringShort(DateUtils.getCurrDateTime()) + "-客户调查信息";
    request.setAttribute("downloadname", downloadname);
    request.setAttribute("clientInfo", clientInfo);
    request.setAttribute("checkStateMap", checkStateMap);
    request.setAttribute("checkResult", checkResult);
    return mapping.findForward("success");
  }

  public ActionForward modifyNewClientCheck(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
  {
    LinkedHashMap checkStateMap = new LinkedHashMap();
    T10_newClientCheckDAO t10_newClientCheckDAO = (T10_newClientCheckDAO)this.context.getBean("t10_newClientCheckDAO");

    T10_newClientCheck clientInfo = new T10_newClientCheck();

    T10_newClientCheck checkState = new T10_newClientCheck();

    T10_newClientCheck checkResult = new T10_newClientCheck();

    String ischecked = (request.getParameter("ischecked") == null) ? "" : request.getParameter("ischecked");
    String url = request.getParameter("url");
    request.setAttribute("url", url);

    String table_name = (request.getParameter("table_name") == null) ? "" : request.getParameter("table_name");
    String check_no = (request.getParameter("check_no") == null) ? "" : request.getParameter("check_no");

    String check_exist = request.getParameter("check_exist");

    String showCheckReason = (request.getParameter("showCheckReason") == null) ? "" : request.getParameter("showCheckReason");

    LinkedHashMap organMap = this.cm.getMapFromCache("organ");

    LinkedHashMap nationalityMap = this.cm.getMapFromCache("country");
    request.setAttribute("nationalityMap", getOptionsListByMap(nationalityMap, null, true));

    LinkedHashMap pbc_cttp2Map = this.cm.getMapFromCache("pbc_cttp2");
    request.setAttribute("pbc_cttp2Map", getOptionsListByMap(pbc_cttp2Map, null, true));

    LinkedHashMap card_type_cMap = this.cm.getMapFromCache("card_type_c");
    request.setAttribute("card_type_cMap", getOptionsListByMap(card_type_cMap, null, true));

    LinkedHashMap bitpMap = this.cm.getMapFromCache("BITP");
    request.setAttribute("bitpMap", getOptionsListByMap(bitpMap, null, true));

    LinkedHashMap industryMap = this.cm.getMapFromCache("industryMap");
    request.setAttribute("industryMap", getOptionsListByMap(industryMap, null, true));

    LinkedHashMap occupationMap = this.cm.getMapFromCache("pbc_ctvc_i");
    request.setAttribute("occupationMap", getOptionsListByMap(occupationMap, null, true));

    LinkedHashMap dutyMap = this.cm.getMapFromCache("duty");
    request.setAttribute("dutyMap", getOptionsListByMap(dutyMap, null, true));

    LinkedHashMap currencyMap = this.cm.getMapFromCache("currency");
    request.setAttribute("currencyMap", getOptionsListByMap(currencyMap, null, true));

    LinkedHashMap rule_typeMap = this.cm.getMapFromCache("rule_type");
    request.setAttribute("rule_typeMap", getOptionsListByMap(rule_typeMap, null, true));

    LinkedHashMap m_list_type_bMap = this.cm.getMapFromCache("m_list_type_b");
    request.setAttribute("m_list_type_bMap", getOptionsListByMap(m_list_type_bMap, null, true));

    LinkedHashMap yesNoMap = this.cm.getMapFromCache("yesNo");
    request.setAttribute("yesNoMap", getOptionsListByMap(yesNoMap, null, true));
    try {
      T10_newClientCheckActionForm t10_newClientCheckActionForm = (T10_newClientCheckActionForm)form;
      String party_id = "";
      String party_class_cd = "";
      String check_type = request.getParameter("check_type");
      request.setAttribute("check_type", check_type);
      if ((request.getParameter("party_id") != null) && (!("".equals(request.getParameter("party_id"))))) {
        party_id = request.getParameter("party_id");
      }
      if ((request.getParameter("party_class_cd") != null) && (!("".equals(request.getParameter("party_class_cd"))))) {
        party_class_cd = request.getParameter("party_class_cd");
      }
      clientInfo.setParty_id(party_id);
      clientInfo.setParty_class_cd(party_class_cd);
      checkState.setParty_id(party_id);
      checkResult.setParty_id(party_id);
      if (table_name.equals("0")) {
        checkState.setTable_name("0");
        checkResult.setTable_name("0");
      } else if (table_name.equals("1")) {
        checkState.setTable_name("1");
        checkResult.setTable_name("1");
      }
      this.sqlMap.endTransaction();
      this.sqlMap.startTransaction();

      clientInfo = t10_newClientCheckDAO.getT47_clientDisp(this.sqlMap, clientInfo);

      if ((clientInfo.getCountry_cd() != null) && (!("".equals(clientInfo.getCountry_cd())))) {
        clientInfo.setCountry_cd_disp((String)nationalityMap.get(clientInfo.getCountry_cd()));
      }

      if ((clientInfo.getIndustry() != null) && (!("".equals(clientInfo.getIndustry())))) {
        clientInfo.setIndustry_disp((String)industryMap.get(clientInfo.getIndustry()));
      }

      if ((clientInfo.getCard_type() != null) && (!("".equals(clientInfo.getCard_type())))) {
        clientInfo.setCard_type_disp((String)bitpMap.get(clientInfo.getCard_type()));
      }

      if ((clientInfo.getOccupation() != null) && (!("".equals(clientInfo.getOccupation())))) {
        clientInfo.setOccupation_disp((String)occupationMap.get(clientInfo.getOccupation()));
      }

      if ((clientInfo.getDuty() != null) && (!("".equals(clientInfo.getDuty())))) {
        clientInfo.setDuty_disp((String)dutyMap.get(clientInfo.getDuty()));
      }

      if ((clientInfo.getOrgankey() != null) && (!("".equals(clientInfo.getOrgankey())))) {
        clientInfo.setOrgan_name_disp((String)organMap.get(clientInfo.getOrgankey()));
      }

      if ((clientInfo.getCard_type_c() != null) && (!("".equals(clientInfo.getCard_type_c())))) {
        clientInfo.setCard_type_c_disp((String)card_type_cMap.get(clientInfo.getCard_type_c()));
      }

      if ((clientInfo.getAml2_type_cd() != null) && (!("".equals(clientInfo.getAml2_type_cd())))) {
        clientInfo.setAml2_type_cd_disp((String)pbc_cttp2Map.get(clientInfo.getAml2_type_cd()));
      }

      if ((clientInfo.getEnrol_fund_currency_cd() != null) && (!("".equals(clientInfo.getEnrol_fund_currency_cd())))) {
        clientInfo.setEnrol_fund_currency_cd_disp((String)currencyMap.get(clientInfo.getEnrol_fund_currency_cd()));
      }

      if ((clientInfo.getLegal_card_type() != null) && (!("".equals(clientInfo.getLegal_card_type())))) {
        clientInfo.setLegal_card_type_disp((String)bitpMap.get(clientInfo.getLegal_card_type()));
      }

      if ((clientInfo.getStock_holder_card_type() != null) && (!("".equals(clientInfo.getStock_holder_card_type())))) {
        clientInfo.setStock_holder_card_type_disp((String)bitpMap.get(clientInfo.getStock_holder_card_type()));
      }
      //begin zyd 2018-08-08 新乡营业执照
      if (clientInfo!=null&&(clientInfo.getLicence_end_dt() != null)) {
    	  clientInfo.setLicence_end_dtdisp(DateUtils.dateToStringShort(clientInfo.getLicence_end_dt()));
    	  t10_newClientCheckActionForm.setLicence_end_dtdisp(clientInfo.getLicence_end_dtdisp());
    	  t10_newClientCheckActionForm.setLicence_end_dt(clientInfo.getLicence_end_dt());
        }
      //clientInfo.setLicence_end_dtdisp("2018-08-02");
     // t10_newClientCheckActionForm.setLicence_end_dtdisp("2018-08-02");
      //end 
      MyBeanUtils.copyBean2Bean(form, clientInfo);

      T10_newClientCheck listType = t10_newClientCheckDAO.getT10_newClientCheck_listType(this.sqlMap, party_id);
      if ((listType.getRule_type() != null) && (!("".equals(listType.getRule_type())))) {
        listType.setRule_type_disp((String)rule_typeMap.get(listType.getRule_type()));
      }
      if ((listType.getList_type() != null) && (!("".equals(listType.getList_type())))) {
        listType.setList_type_disp((String)m_list_type_bMap.get(listType.getList_type()));
      }
      request.setAttribute("listType", listType);

      if (ischecked.equals("newclient")) {
        checkStateMap = t10_newClientCheckDAO.getT10_newClientCheck_checkState(this.sqlMap, party_id);
      }
      else {
        checkState.setCheck_no(check_no);
        checkStateMap = t10_newClientCheckDAO.getT10_newClientCheck_checkedState(this.sqlMap, checkState);
      }
   
      checkResult.setCheck_no(check_no);
      checkResult = t10_newClientCheckDAO.getT10_newClientCheck_checkResult(this.sqlMap, checkResult);
      this.sqlMap.commitTransaction();
      this.sqlMap.endTransaction();
    }
    catch (Exception e)
    {
      e.printStackTrace();
      this.logger.error("异常", e);
      return mapping.findForward("failure");
    }
    request.setAttribute("clientInfo", clientInfo);
    request.setAttribute("checkStateMap", checkStateMap);
    request.setAttribute("checkResult", checkResult);
    request.setAttribute("ischecked", ischecked);
    request.setAttribute("showCheckReason", showCheckReason);
    if (ischecked.equals("already")) {
      return mapping.findForward("success_already");
    }
    request.setAttribute("check_exist", check_exist);
    return mapping.findForward("success");
  }

  public ActionForward modifyNewClientCheck_do(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
  {
    T10_newClientCheckDAO t10_newClientCheckDAO = (T10_newClientCheckDAO)this.context.getBean("t10_newClientCheckDAO");
    T10_newClientCheck t10_newClientCheck = new T10_newClientCheck();
    String check_type = request.getParameter("check_type");

    String check_exist = request.getParameter("check_exist");
    String url = request.getParameter("url");
    request.setAttribute("url", url);
    ActionMessages errors = new ActionMessages();
    try {
      T10_newClientCheckActionForm t10_newClientCheckActionForm = (T10_newClientCheckActionForm)form;
      MyBeanUtils.copyBean2Bean(t10_newClientCheck, t10_newClientCheckActionForm);
      HttpSession session = request.getSession();

      AuthBean authBean = (AuthBean)session.getAttribute("authBean");
      Authorization auth = authBean.getAuthToken();

      String party_id = "";
      String party_class_cd = "";
      String check_no = "";

      if ((request.getParameter("party_id") != null) && (!("".equals(request.getParameter("party_id"))))) {
        party_id = request.getParameter("party_id");
      }
      if ((request.getParameter("party_class_cd") != null) && (!("".equals(request.getParameter("party_class_cd"))))) {
        party_class_cd = request.getParameter("party_class_cd");
      }
      t10_newClientCheck.setParty_id(party_id);
      t10_newClientCheck.setParty_class_cd(party_class_cd);

      t10_newClientCheck.setCheck_org(auth.getT00_user().getOrgankey());
      t10_newClientCheck.setChecker(auth.getT00_user().getUsername());
      t10_newClientCheck.setCheck_dt(DateUtils.getCurrDateTime());
      this.sqlMap.endTransaction();
      this.sqlMap.startTransaction();
 //zyd 新乡营业执照到期日
      if ((t10_newClientCheck.getLicence_end_dtdisp() != null) && (!("".equals(t10_newClientCheck.getLicence_end_dtdisp())))) {
    	  t10_newClientCheck.setLicence_end_dt(DateUtils.stringToDateShort(t10_newClientCheck.getLicence_end_dtdisp()));
        } 
   //end
      //--执行更新操作
      t10_newClientCheckDAO.insertT10_newClientCheck_clientInfo(this.sqlMap, t10_newClientCheck);

      check_no = getSequenceNextVal("SEQ_T10_CHECKPARTY_RELT");
      t10_newClientCheck.setCheck_no(check_no);
     //执行插入到已识别客户表
      performAddT10_checkResult(t10_newClientCheck, check_type, check_exist);
   //执行插入到黑白名单表
      if (t10_newClientCheck.getAddwmenu_flag().equals("1")) {
        performAddT07_OBJ_RULEDo(t10_newClientCheck, request);
      }

      if (t10_newClientCheck.getAddbmenu_flag().equals("1")) {
        performAddT07_BlacklistDo(t10_newClientCheck, request);
      }
      String[] checkboxes = new String[16];
      if (request.getParameterValues("checkbox") != null) {
        checkboxes = request.getParameterValues("checkbox");
      }
//end 
      String[] elementids = request.getParameterValues("elementid");
      int len = elementids.length;
      ArrayList tmpList = new ArrayList();
      String elementid;
      for (int i = 0; i < len; ++i) {
        String upcode = elementids[i].split(",")[0];
        elementid = elementids[i].split(",")[1];
        String elementname = elementids[i].split(",")[2];
        T10_newClientCheck tt = new T10_newClientCheck();
        tt.setParty_id(party_id);
        tt.setCheck_no(check_no);
        tt.setUpcode(upcode);
        tt.setElementid(elementid);
        tt.setElementname(elementname);
        String checkuser = (request.getParameter("checkuser_" + elementid) == null) ? "" : request.getParameter("checkuser_" + elementid);
        String checkdate_disp = (request.getParameter("checkdate_disp_" + elementid) == null) ? "" : request.getParameter("checkdate_disp_" + elementid);
        String context = (request.getParameter("context_" + elementid) == null) ? "" : request.getParameter("context_" + elementid);
        //String boxelementid;
        if (upcode.equals("1")) {
          for (String boxelementid : checkboxes)
            if (elementid.equals(boxelementid)) {
              tt.setIstrue("1");
              tt.setCheckuser(checkuser);
              tt.setCheckdate_disp(checkdate_disp);
              tmpList.add(tt);
            }
        }
        else if (upcode.equals("2")) {
          if ((context != null) && (!("".equals(context)))) {
            tt.setContext(context);
            tmpList.add(tt);
          }
        } else if (upcode.equals("3")) {
          for (String boxelementid : checkboxes) {
            if (elementid.equals(boxelementid)) {
              tt.setIstrue("1");
              tt.setContext(context);
              tmpList.add(tt);
            }
          }
        }
        else if ((context != null) && (!("".equals(context)))) {
          tt.setContext(context);
          tmpList.add(tt);
        }

      }
     //跳过
      boolean flag = t10_newClientCheckDAO.getT10_newClientCheck_checkStateCount(this.sqlMap, party_id);
      if (flag)
      {
        int k = t10_newClientCheckDAO.insertT10_newClientCheck_checkState_uh(this.sqlMap, party_id);

        elementid = String.valueOf(t10_newClientCheckDAO.deleteT10_newClientCheck_checkState_single(this.sqlMap, party_id));
      }
   //end
      //插入到识别结论表
      int h = t10_newClientCheckDAO.insertT10_newClientCheck_checkState(this.sqlMap, tmpList);
      //end
      this.sqlMap.commitTransaction();
      this.sqlMap.endTransaction();
    }
    catch (Exception e) {
      e.printStackTrace();
      errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage("error.common", e.getMessage()));
      saveMessages(request, errors);
      return mapping.findForward("failure");
    }
    return mapping.findForward("success");
  }

  private void performAddT07_OBJ_RULEDo(T10_newClientCheck t10NewClientCheck, HttpServletRequest request)
    throws Exception
  {
    HttpSession session = request.getSession();
    T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO)this.context.getBean("t07_obj_ruleDAO");
    T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();
    T07_pbcruleDAO t07_tpbcruleDAO = (T07_pbcruleDAO)this.context.getBean("t07_tpbcruleDAO");
    T07_pbcrule t07_pbcrule = new T07_pbcrule();
    ArrayList t07_pbcruleList = new ArrayList();

    AuthBean authBean = (AuthBean)session.getAttribute("authBean");
    Authorization auth = authBean.getAuthToken();
    try
    {
      t07_obj_rule.setParty_id(t10NewClientCheck.getParty_id());
      t07_obj_rule.setIsuse("0");
      t07_obj_rule.setOrgankey(t10NewClientCheck.getOrgankey());
      t07_obj_rule.setParty_class_cd(t10NewClientCheck.getParty_class_cd());
      t07_obj_rule.setObj_name(t10NewClientCheck.getParty_chn_name());
      t07_obj_rule.setCreate_user(auth.getT00_user().getUsername());
      t07_obj_rule.setReason_create(t10NewClientCheck.getReason_create());
      t07_obj_rule.setCreate_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
      t07_obj_rule.setRule_type(t10NewClientCheck.getRule_type());
      t07_obj_rule.setModify_user(auth.getT00_user().getUsername());
      String check = "";
      if (auth.getT00_user().getOrganlevel().equals("0")) {
        check = "check";
      }
      if ("check".equals(check)) {
        t07_obj_rule.setIscheck("1");
        t07_obj_rule.setIsuse("0");
      } else {
        LinkedHashMap t87_sysparaMap = this.cm.getMapFromCache("t87_syspara");
        if ("1".equals(t87_sysparaMap.get("404")))
        {
          t07_obj_rule.setIscheck("2");
        }
        else
          t07_obj_rule.setIscheck("4");
      }
      int row = t07_obj_ruleDAO.insertT07_OBJ_RULE(this.sqlMap, t07_obj_rule);
      if (row <= 0) {
        throw new Exception("");
      }

      if (("check".equals(check)) && (t07_obj_rule.getIsuse().equals("0"))) {
        t07_obj_rule.setPbc_type_cd(t10NewClientCheck.getRule_type());
        if ("3".equals(t10NewClientCheck.getRule_type())) {
          t07_obj_rule.setPbc_type_cd("1");
          t07_obj_rule.setPbc_cd("2");
        }
        int i = t07_obj_ruleDAO.insertT07_OBJ_RULES(this.sqlMap, t07_obj_rule);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  private void performAddT07_BlacklistDo(T10_newClientCheck t10NewClientCheck, HttpServletRequest request)
    throws Exception
  {
    HttpSession session = request.getSession();
    T07_BlacklistDAO t07_blacklistDAO = (T07_BlacklistDAO)this.context.getBean("t07_blacklistDAO");
    T07_Blacklist t07_blacklist = new T07_Blacklist();
    AuthBean authBean = (AuthBean)session.getAttribute("authBean");
    Authorization auth = authBean.getAuthToken();
    t07_blacklist.setParty_id(t10NewClientCheck.getParty_id());
    t07_blacklist.setObjkey(t10NewClientCheck.getParty_id());
    t07_blacklist.setObj_name(t10NewClientCheck.getParty_chn_name());
    t07_blacklist.setList_type(t10NewClientCheck.getList_type());
    t07_blacklist.setIsuse("0");
    t07_blacklist.setReason_create(t10NewClientCheck.getB_reason_create());
    t07_blacklist.setCard_no(t10NewClientCheck.getCard_no());
    t07_blacklist.setCard_type(t10NewClientCheck.getCard_type());
    t07_blacklist.setOrgankey(auth.getT00_user().getOrgankey());
    t07_blacklist.setParty_class_cd(t10NewClientCheck.getParty_class_cd());
    t07_blacklist.setCreate_user(auth.getT00_user().getUsername());
    t07_blacklist.setCreate_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
    t07_blacklist.setModify_user(auth.getT00_user().getUsername());
    t07_blacklist.setModify_dt(new Date());
    String check = "";
    if (auth.getT00_user().getOrganlevel().equals("0")) {
      check = "check";
    }
    if ("check".equals(check)) {
      t07_blacklist.setIscheck("1");
    } else {
      LinkedHashMap t87_sysparaMap = this.cm.getMapFromCache("t87_syspara");
      if ("1".equals(t87_sysparaMap.get("404")))
      {
        t07_blacklist.setIscheck("2");
      }
      else
        t07_blacklist.setIscheck("4");
    }
    int rows = t07_blacklistDAO.insertT07_Blacklist(this.sqlMap, t07_blacklist);
  }

  private void performAddT10_checkResult(T10_newClientCheck t10NewClientCheck, String check_type, String check_exist) throws Exception
  {
    T10_newClientCheckDAO t10_newClientCheckDAO = (T10_newClientCheckDAO)this.context.getBean("t10_newClientCheckDAO");
    T07_ATTENTION_libDAO t07_attention_libDAO = (T07_ATTENTION_libDAO)this.context.getBean("t07_attention_libDAO");
    T10_checkpartyDAO t10_checkpartyDAO = (T10_checkpartyDAO)this.context.getBean("t10_checkpartyDAO");
    String party_id = t10NewClientCheck.getParty_id();
    
    T10_checkparty t10_checkparty = new T10_checkparty();
    t10_checkparty.setParty_id(party_id);
    t10_checkparty.setHost_cust_id(party_id);
    t10_checkparty.setParty_class_cd(t10NewClientCheck.getParty_class_cd());
    t10_checkparty.setParty_chn_name(t10NewClientCheck.getParty_chn_name());
    t10_checkparty.setCard_type(t10NewClientCheck.getCard_type());
    t10_checkparty.setCard_no(t10NewClientCheck.getCard_no());
    t10_checkparty.setOrgankey(t10NewClientCheck.getOrgankey());
    t10_checkparty.setCreate_dt(DateUtils.getCurrDateTime());
    t10_checkparty.setParty_status_cd("0");
    t10_checkparty.setAml1_type_cd(t10NewClientCheck.getAml1_type_cd());
    t10_checkparty.setCheck_status("1");

    if ((check_type != null) && (!("".equals(check_type)))) {
      t10NewClientCheck.setCheck_type(check_type);
      int i;
      boolean flag;
      if (check_type.equals("1"))
      {
        if ("0".equals(check_exist))
        {
          flag = t10_newClientCheckDAO.isExistT10_CHECKPARTY_NEW(this.sqlMap, t10NewClientCheck.getParty_id());
          if (flag)
          {
            i = t10_newClientCheckDAO.modifyStatusT10_CHECKPARTY_NEW(this.sqlMap, t10NewClientCheck.getParty_id());
          }
          else {
            t10_newClientCheckDAO.insertT10_CHECKPARTY_NEW(this.sqlMap, t10_checkparty);
          }
        }

        i = t10_newClientCheckDAO.modifyStatusT10_CHECKPARTY_NEW(this.sqlMap, t10NewClientCheck.getParty_id());
      }

      if (check_type.equals("2"))
      {
        if ("0".equals(check_exist))
        {
          flag = t10_newClientCheckDAO.isExistT10_CHECKPARTY_RE(this.sqlMap, t10NewClientCheck.getParty_id());
          if (flag)
          {
            i = t10_newClientCheckDAO.modifyStatusT10_CHECKPARTY_RE(this.sqlMap, t10NewClientCheck.getParty_id());
          }
          else
          {
            t10_checkparty.setRecheck_type("3");
            t10_checkparty.setCheck_reason(t10NewClientCheck.getCheck_reason());
            t10_checkpartyDAO.insertT10_checkparty_re(this.sqlMap, t10_checkparty);
          }
        }

        i = t10_newClientCheckDAO.modifyStatusT10_CHECKPARTY_RE(this.sqlMap, t10NewClientCheck.getParty_id());
      }

       flag = t10_newClientCheckDAO.isExistT10_CHECKPARTY_RELT(this.sqlMap, t10NewClientCheck.getParty_id());
      if (flag)
      {
        t10_newClientCheckDAO.insertT10_CHECKPARTY_RELT_UH(this.sqlMap, t10NewClientCheck.getParty_id());

        t10_newClientCheckDAO.deleteT10_CHECKPARTY_RELT(this.sqlMap, t10NewClientCheck.getParty_id());
      }

      t10_newClientCheckDAO.insertT10_CHECKPARTY_RELT(this.sqlMap, t10NewClientCheck);

      if ((t10NewClientCheck.getCheck_result() == null) || ("".equals(t10NewClientCheck.getCheck_result())) || ("0".equals(t10NewClientCheck.getCheck_result())))
        return;
      boolean isExist = t07_attention_libDAO.isExistParty_id(this.sqlMap, t10NewClientCheck.getParty_id());
      if (isExist)
        return;
      String atten_id = getSequenceNextVal("SEQ_T07_ATTENTION_LIB");

      T07_ATTENTION_lib t07_attention_lib = new T07_ATTENTION_lib();

      T07_ATTENTION_log t07_attention_log = new T07_ATTENTION_log();
      t07_attention_lib.setCreate_dt(DateUtils.dateToStringShort(new Date()));
      t07_attention_lib.setAtten_id(atten_id);
      t07_attention_lib.setParty_id(t10NewClientCheck.getParty_id());
      t07_attention_lib.setParty_chn_name(t10NewClientCheck.getParty_chn_name());
      t07_attention_lib.setParty_class_cd(t10NewClientCheck.getParty_class_cd());
      t07_attention_lib.setOrgankey(t10NewClientCheck.getOrgankey());
      t07_attention_lib.setAtten_type(t10NewClientCheck.getCheck_result());
      t07_attention_lib.setOp_result("1");
      t07_attention_lib.setInvalid_dt(t10NewClientCheck.getValid_dt_disp());
      if ("C".equals(t10NewClientCheck.getParty_class_cd()))
        t07_attention_lib.setCard_type(t10NewClientCheck.getCard_type_c());
      else {
        t07_attention_lib.setCard_type(t10NewClientCheck.getCard_type());
      }
      t07_attention_lib.setCard_no(t10NewClientCheck.getCard_no());
      t07_attention_lib.setAtten_source("4");
      t07_attention_lib.setTarget_post("P1");
      t07_attention_lib.setAdd_post("p");
      t07_attention_lib.setExtend_num(Integer.valueOf(0));
      int rows = t07_attention_libDAO.insertT07_ATTENTION_lib(this.sqlMap, t07_attention_lib);
      if (rows <= 0) {
        throw new Exception("");
      }
      t07_attention_log.setAtten_id("'" + atten_id + "'");
      t07_attention_log.setOp_time(DateUtils.getCurrTime());
      t07_attention_log.setOp_person(t10NewClientCheck.getChecker());
      t07_attention_log.setOp_type("1");
      t07_attention_log.setOp_reason("由新增调查结论添加");
      t07_attention_libDAO.insertT07_ATTENTION_log(this.sqlMap, t07_attention_log);
    }
  }
}