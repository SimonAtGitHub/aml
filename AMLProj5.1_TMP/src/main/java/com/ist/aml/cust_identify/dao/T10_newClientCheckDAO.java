package com.ist.aml.cust_identify.dao;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.cust_identify.dto.T10_checkparty;
import com.ist.aml.cust_identify.dto.T10_newClientCheck;
import com.ist.common.base.BaseDAO;
import com.ist.util.DateUtils;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

public class T10_newClientCheckDAO extends BaseDAO
{
  public T10_newClientCheck getT47_clientDisp(SqlMapClient sqlMap, T10_newClientCheck t10_newClientCheck)
    throws SQLException
  {
    if ((t10_newClientCheck != null) && (t10_newClientCheck.getParty_class_cd() != null) && 
      (t10_newClientCheck.getParty_class_cd().trim().equalsIgnoreCase("I")))
      t10_newClientCheck = getT47_i_clientDisp(sqlMap, t10_newClientCheck.getParty_id());
    else {
      t10_newClientCheck = getT47_c_clientDisp(sqlMap, t10_newClientCheck.getParty_id());
    }
    return t10_newClientCheck;
  }

  private T10_newClientCheck getT47_i_clientDisp(SqlMapClient sqlMap, String party_id) throws SQLException {
    T10_newClientCheck t10_newClientCheck = (T10_newClientCheck)sqlMap.queryForObject("getT47_i_newClientDisp", party_id);
    if (t10_newClientCheck == null) {
      t10_newClientCheck = new T10_newClientCheck();
    }
    else {
      if (t10_newClientCheck.getCard_end_dt() != null) {
        t10_newClientCheck.setCard_end_dt_disp(DateUtils.dateToStringShort(t10_newClientCheck.getCard_end_dt()));
      }
      if ((t10_newClientCheck.getCard_type() != null) && (t10_newClientCheck.getCard_type().contains(";"))) {
        t10_newClientCheck.setCard_typeinfo(t10_newClientCheck.getCard_type().split(";")[1]);
        t10_newClientCheck.setCard_type(t10_newClientCheck.getCard_type().split(";")[0]);
      }
    }
    return t10_newClientCheck;
  }

  private T10_newClientCheck getT47_c_clientDisp(SqlMapClient sqlMap, String party_id) throws SQLException {
    T10_newClientCheck t10_newClientCheck = (T10_newClientCheck)sqlMap.queryForObject("getT47_c_newClientDisp", party_id);

    if (t10_newClientCheck == null) {
      t10_newClientCheck = new T10_newClientCheck();
    }
    else {
      if (t10_newClientCheck.getLegal_card_no_end_dt() != null) {
        t10_newClientCheck.setLegal_card_no_end_dt_disp(DateUtils.dateToStringShort(t10_newClientCheck.getLegal_card_no_end_dt()));
      }

      if (t10_newClientCheck.getStock_holder_card_no_end_dt() != null) {
        t10_newClientCheck.setStock_holder_card_no_end_dt_disp(DateUtils.dateToStringShort(t10_newClientCheck.getStock_holder_card_no_end_dt()));
      }

      if (t10_newClientCheck.getOrg_credit_vt() != null) {
        t10_newClientCheck.setOrg_credit_vt_disp(DateUtils.dateToStringShort(t10_newClientCheck.getOrg_credit_vt()));
      }
      if ((t10_newClientCheck.getCard_type_c() != null) && (t10_newClientCheck.getCard_type_c().contains(";"))) {
        t10_newClientCheck.setCard_type_cinfo(t10_newClientCheck.getCard_type_c().split(";")[1]);
        t10_newClientCheck.setCard_type_c(t10_newClientCheck.getCard_type_c().split(";")[0]);
      }
      if ((t10_newClientCheck.getLegal_card_type() != null) && (t10_newClientCheck.getLegal_card_type().contains(";"))) {
        t10_newClientCheck.setLegal_card_typeinfo(t10_newClientCheck.getLegal_card_type().split(";")[1]);
        t10_newClientCheck.setLegal_card_type(t10_newClientCheck.getLegal_card_type().split(";")[0]);
      }
      if (t10_newClientCheck.getLicence_end_dt() != null) {
    	  t10_newClientCheck.setLicence_end_dt_disp(DateUtils.dateToStringShort(t10_newClientCheck.getLicence_end_dt()));
      }
    }
    return t10_newClientCheck;
  }

  public LinkedHashMap getT10_newClientCheck_checkState(SqlMapClient sqlMap, String party_id)
    throws SQLException
  {
    LinkedHashMap checkStateMap = new LinkedHashMap();
    ArrayList checkStateList = (ArrayList)sqlMap.queryForList("getCheckStateList", party_id);
    int len = checkStateList.size();
    for (int i = 0; i < len; i++) {
      T10_newClientCheck tmp = (T10_newClientCheck)checkStateList.get(i);
      String upcode = tmp.getUpcode();
      if (checkStateMap.containsKey(upcode)) {
        ArrayList subList = (ArrayList)checkStateMap.get(upcode);
        subList.add(tmp);
      } else {
        tmp.setParty_id(party_id);
        ArrayList subList = new ArrayList();
        subList.add(tmp);
        checkStateMap.put(upcode, subList);
      }
    }
    return checkStateMap;
  }

  public void insertT10_newClientCheck_clientInfo(SqlMapClient sqlMap, T10_newClientCheck t10NewClientCheck)
    throws SQLException
  {
    if (t10NewClientCheck != null)
    {
      if ((t10NewClientCheck.getCard_end_dt_disp() != null) && (!"".equals(t10NewClientCheck.getCard_end_dt_disp()))) {
        t10NewClientCheck.setCard_end_dt(DateUtils.stringToDateShort(t10NewClientCheck.getCard_end_dt_disp()));
      }
      if ((t10NewClientCheck.getLicence_end_dt_disp() != null) && (!"".equals(t10NewClientCheck.getLicence_end_dt_disp()))) {
    	t10NewClientCheck.setLicence_end_dt(DateUtils.stringToDateShort(t10NewClientCheck.getLicence_end_dt_disp()));
      }
      if ((t10NewClientCheck.getLegal_card_no_end_dt_disp() != null) && (!"".equals(t10NewClientCheck.getLegal_card_no_end_dt_disp()))) {
        t10NewClientCheck.setLegal_card_no_end_dt(DateUtils.stringToDateShort(t10NewClientCheck.getLegal_card_no_end_dt_disp()));
      }

      if ((t10NewClientCheck.getStock_holder_card_no_end_dt_disp() != null) && (!"".equals(t10NewClientCheck.getStock_holder_card_no_end_dt_disp()))) {
        t10NewClientCheck.setStock_holder_card_no_end_dt(DateUtils.stringToDateShort(t10NewClientCheck.getStock_holder_card_no_end_dt_disp()));
      }

      if ((t10NewClientCheck.getOrg_credit_vt_disp() != null) && (!"".equals(t10NewClientCheck.getOrg_credit_vt_disp()))) {
        t10NewClientCheck.setOrg_credit_vt(DateUtils.stringToDateShort(t10NewClientCheck.getOrg_credit_vt_disp()));
      }
      if ((t10NewClientCheck.getParty_class_cd() != null) && (!"".equals(t10NewClientCheck.getParty_class_cd())))
        if ("C".equals(t10NewClientCheck.getParty_class_cd())) {
          if (!"".equals(t10NewClientCheck.getCard_type_cinfo())) {
            t10NewClientCheck.setCard_type_c(t10NewClientCheck.getCard_type_c() + ";" + t10NewClientCheck.getCard_type_cinfo());
          }
          if (!"".equals(t10NewClientCheck.getLegal_card_typeinfo())) {
            t10NewClientCheck.setLegal_card_type(t10NewClientCheck.getLegal_card_type() + ";" + t10NewClientCheck.getLegal_card_typeinfo());
          }
          sqlMap.update("modifyClientInfo_C_t47_PARTY", t10NewClientCheck);
          sqlMap.update("modifyClientInfo_C_t47_CORPORATION", t10NewClientCheck);
        } else {
          if (!"".equals(t10NewClientCheck.getCard_typeinfo())) {
            t10NewClientCheck.setCard_type(t10NewClientCheck.getCard_type() + ";" + t10NewClientCheck.getCard_typeinfo());
          }
          sqlMap.update("modifyClientInfo_I_t47_PARTY", t10NewClientCheck);
          sqlMap.update("modifyClientInfo_I_t47_INDIVIDUAL", t10NewClientCheck);
        }
    }
  }

  public int insertT10_newClientCheck_checkState(SqlMapClient sqlMap, ArrayList<T10_newClientCheck> checkStateList)
    throws SQLException
  {
    Integer i = null;
    if ((checkStateList != null) && (checkStateList.size() > 0)) {
      for (T10_newClientCheck tt : checkStateList) {
        if ((tt.getCheckdate_disp() != null) && (!"".equals(tt.getCheckdate_disp()))) {
          tt.setCheckdate(DateUtils.stringToDateShort(tt.getCheckdate_disp()));
        }
        if (tt.getIstrue() == null) {
          tt.setIstrue("0");
        }
        i = (Integer)sqlMap.insert("insertT10_SURVEYPARTY_TEXT", tt);
      }
    }
    if (i != null) {
      return i.intValue();
    }
    return -1;
  }

  public boolean getT10_newClientCheck_checkStateCount(SqlMapClient sqlMap, String partyId)
    throws SQLException
  {
    Integer i = null;
    i = (Integer)sqlMap.queryForObject("getT10_newClientCheck_checkStateCount", partyId);
    if (i == null) {
      return false;
    }
    if (i.intValue() > 1) {
      return true;
    }
    return false;
  }

  public ArrayList<T10_newClientCheck> getT10_newClientCheck_checkState_singleList(SqlMapClient sqlMap, String partyId)
    throws SQLException
  {
    ArrayList tt = new ArrayList();
    tt = (ArrayList)sqlMap.queryForList("getT10_newClientCheck_checkState_singleList", partyId);
    if (tt == null)
      return new ArrayList();
    return tt;
  }

  public int deleteT10_newClientCheck_checkState_single(SqlMapClient sqlMap, String partyId)
    throws SQLException
  {
    Integer i = null;
    if ((partyId != null) && (!"".equals(partyId))) {
      i = Integer.valueOf(sqlMap.delete("deleteT10_newClientCheck_checkState_single", partyId));
    }
    if (i == null) {
      return -1;
    }
    return i.intValue();
  }

  public int insertT10_newClientCheck_checkState_uh(SqlMapClient sqlMap, String party_id)
    throws SQLException
  {
    Integer i = null;
    i = (Integer)sqlMap.insert("insertT10_SURVEYPARTY_TEXT_UH", party_id);
    if (i != null) {
      return i.intValue();
    }
    return -1;
  }

  public int insertT10_CHECKPARTY_RELT(SqlMapClient sqlMap, T10_newClientCheck t10NewClientCheck)
    throws SQLException
  {
    Integer i = null;
    if (t10NewClientCheck != null) {
      if ((t10NewClientCheck.getCheck_dt_disp() != null) && (!"".equals(t10NewClientCheck.getCheck_dt_disp()))) {
        t10NewClientCheck.setCheck_dt(DateUtils.stringToDateShort(t10NewClientCheck.getCheck_dt_disp()));
      }
      if ((t10NewClientCheck.getValid_dt_disp() != null) && (!"".equals(t10NewClientCheck.getValid_dt_disp()))) {
        t10NewClientCheck.setValid_dt(DateUtils.stringToDateShort(t10NewClientCheck.getValid_dt_disp()));
      }
      i = (Integer)sqlMap.insert("insertT10_CHECKPARTY_RELT", t10NewClientCheck);
    }
    if (i == null) {
      return 0;
    }
    return i.intValue();
  }

  public int modifyStatusT10_CHECKPARTY_NEW(SqlMapClient sqlMap, String partyId)
    throws SQLException
  {
    Integer i = null;
    i = Integer.valueOf(sqlMap.delete("modifyStatusT10_CHECKPARTY_NEW", partyId));
    if (i == null) {
      return 0;
    }
    return i.intValue();
  }

  public int insertT10_CHECKPARTY_UH(SqlMapClient sqlMap, T10_newClientCheck tt)
    throws SQLException
  {
    Integer i = null;
    if (tt != null) {
      if ((tt.getCheck_dt_disp() != null) && (!"".equals(tt.getCheck_dt_disp()))) {
        tt.setCheck_dt(DateUtils.stringToDateShort(tt.getCheck_dt_disp()));
      }
      if ((tt.getValid_dt_disp() != null) && (!"".equals(tt.getValid_dt_disp()))) {
        tt.setValid_dt(DateUtils.stringToDateShort(tt.getValid_dt_disp()));
      }
      i = (Integer)sqlMap.insert("insertT10_CHECKPARTY_UH", tt);
    }
    if (i == null) {
      return 0;
    }
    return i.intValue();
  }

  public int modifyStatusT10_CHECKPARTY_RE(SqlMapClient sqlMap, String partyId)
    throws SQLException
  {
    Integer i = null;
    i = Integer.valueOf(sqlMap.delete("modifyStatusT10_CHECKPARTY_RE", partyId));
    if (i == null) {
      return 0;
    }
    return i.intValue();
  }

  public LinkedHashMap getT10_newClientCheck_checkedState(SqlMapClient sqlMap, T10_newClientCheck tt)
    throws SQLException
  {
    LinkedHashMap checkStateMap = new LinkedHashMap();
    ArrayList checkStateList = (ArrayList)sqlMap.queryForList("getCheckedStateList", tt);
    int len = checkStateList.size();
    for (int i = 0; i < len; i++) {
      T10_newClientCheck tmp = (T10_newClientCheck)checkStateList.get(i);
      String upcode = tmp.getUpcode();

      if ((tmp.getIstrue() != null) && (!"".equals(tmp.getIstrue()))) {
        if ("0".equals(tmp.getIstrue()))
          tmp.setIstrue_disp("否");
        else
          tmp.setIstrue_disp("是");
      }
      else {
        tmp.setIstrue_disp("否");
      }

      if ((tmp.getCheckdate() != null) && (!"".equals(tmp.getCheckdate()))) {
        tmp.setCheckdate_disp(DateUtils.dateToStringShort(tmp.getCheckdate()));
      }

      if (tmp.getContext() == null) {
        tmp.setContext("");
      }
      if (checkStateMap.containsKey(upcode)) {
        ArrayList subList = (ArrayList)checkStateMap.get(upcode);
        subList.add(tmp);
      } else {
        tmp.setParty_id(tt.getParty_id());
        ArrayList subList = new ArrayList();
        subList.add(tmp);
        checkStateMap.put(upcode, subList);
      }
    }
    return checkStateMap;
  }

  public T10_newClientCheck getT10_newClientCheck_checkResult(SqlMapClient sqlMap, T10_newClientCheck t)
    throws SQLException
  {
    T10_newClientCheck tt = (T10_newClientCheck)sqlMap.queryForObject("getT10_CHECKPARTY_RELT", t);
    String check_reason = (String)sqlMap.queryForObject("getCheck_reason", t.getParty_id());
    if (tt != null) {
      if ((tt.getCheck_dt() != null) && (!"".equals(tt.getCheck_dt()))) {
        tt.setCheck_dt_disp(DateUtils.dateToStringShort(tt.getCheck_dt()));
      }
      if ((tt.getValid_dt() != null) && (!"".equals(tt.getValid_dt()))) {
        tt.setValid_dt_disp(DateUtils.dateToStringShort(tt.getValid_dt()));
      }
      if ((tt.getCheck_result() != null) && (!"".equals(tt.getCheck_result()))) {
        if ("0".equals(tt.getCheck_result()))
          tt.setCheck_result_disp("无需关注");
        else if ("1".equals(tt.getCheck_result()))
          tt.setCheck_result_disp("一般关注");
        else if ("2".equals(tt.getCheck_result()))
          tt.setCheck_result_disp("持续关注");
        else if ("3".equals(tt.getCheck_result())) {
          tt.setCheck_result_disp("重点关注");
        }
      }
      tt.setCheck_reason(check_reason == null ? "" : check_reason);
      return tt;
    }
    tt = new T10_newClientCheck();
    tt.setCheck_reason(check_reason == null ? "" : check_reason);

    return tt;
  }

  public T10_newClientCheck getT10_newClientCheck_listType(SqlMapClient sqlMap, String partyId)
    throws SQLException
  {
    int w = ((Integer)sqlMap.queryForObject("getWhiteCount", partyId)).intValue();
    int b = ((Integer)sqlMap.queryForObject("getBlackCount", partyId)).intValue();
    if (w > 0) {
      return getT07_WHITELIST_INFO_single(sqlMap, partyId);
    }
    if (b > 0) {
      return getT07_BLACKLIST_single(sqlMap, partyId);
    }
    if ((w < 1) && (b < 1)) {
      T10_newClientCheck tt = new T10_newClientCheck();
      tt.setAddbmenu_flag_disp("否");
      tt.setAddwmenu_flag_disp("否");
      return tt;
    }
    return new T10_newClientCheck();
  }

  private T10_newClientCheck getT07_WHITELIST_INFO_single(SqlMapClient sqlMap, String partyId) throws SQLException {
    T10_newClientCheck tt = (T10_newClientCheck)sqlMap.queryForObject("getT07_WHITELIST_INFO_single", partyId);
    tt.setAddwmenu_flag("1");
    tt.setAddwmenu_flag_disp("是");
    tt.setAddbmenu_flag("0");
    tt.setAddbmenu_flag_disp("否");
    return tt;
  }

  private T10_newClientCheck getT07_BLACKLIST_single(SqlMapClient sqlMap, String partyId) throws SQLException {
    T10_newClientCheck tt = (T10_newClientCheck)sqlMap.queryForObject("getT07_BLACKLIST_single", partyId);
    tt.setAddwmenu_flag("0");
    tt.setAddwmenu_flag_disp("否");
    tt.setAddbmenu_flag("1");
    tt.setAddbmenu_flag_disp("是");
    return tt;
  }

  public boolean isExistT10_CHECKPARTY_RELT(SqlMapClient sqlMap, String partyId) throws SQLException {
    Integer i = null;
    i = (Integer)sqlMap.queryForObject("isExistT10_CHECKPARTY_RELT", partyId);
    if ((i != null) && (i.intValue() > 0)) {
      return true;
    }
    return false;
  }

  public void insertT10_CHECKPARTY_RELT_UH(SqlMapClient sqlMap, String partyId)
    throws SQLException
  {
    if ((partyId != null) && (!"".equals(partyId)))
    {
      sqlMap.insert("insertT10_CHECKPARTY_RELT_UH", partyId);
    }
  }

  public void deleteT10_CHECKPARTY_RELT(SqlMapClient sqlMap, String partyId) throws SQLException {
    sqlMap.delete("deleteT10_CHECKPARTY_RELT", partyId);
  }

  public boolean isExistT10_CHECKPARTY_NEW(SqlMapClient sqlMap, String partyId) throws SQLException {
    Integer i = null;
    i = (Integer)sqlMap.queryForObject("isExistT10_CHECKPARTY_NEW", partyId);
    if ((i == null) || (i.intValue() < 1)) {
      return false;
    }
    return true;
  }

  public void insertT10_CHECKPARTY_NEW(SqlMapClient sqlMap, T10_checkparty t10_checkparty) throws SQLException {
    sqlMap.insert("insertT10_CHECKPARTY_NEW", t10_checkparty);
  }

  public boolean isExistT10_CHECKPARTY_RE(SqlMapClient sqlMap, String partyId) throws SQLException {
    Integer i = null;
    i = (Integer)sqlMap.queryForObject("isExistT10_CHECKPARTY_RE", partyId);
    if ((i == null) || (i.intValue() < 1)) {
      return false;
    }
    return true;
  }
}