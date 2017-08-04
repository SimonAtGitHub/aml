package com.ist.server.cal.aml.Case.bo;

import com.ist.common.LogUtils;
import com.ist.common.database.SQLExecute;
import com.ist.common.database.dbfunc.DBfunc;
import com.ist.common.database.dbfunc.DBfuncFactory;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.SysConfig;
import com.ist.common.util.DateUtils;
import com.ist.server.cal.aml.common.Constants;
import com.ist.server.cal.aml.common.IndicUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.TreeMap;
import org.apache.log4j.Logger;

public class CaseBO
{
  private static Logger logger = LogUtils.getLogger(CaseBO.class.getName());
  CatchManager cm = CatchManager.getInstance();

  DBfunc func = DBfuncFactory.getDBInstance();

  public String getMinDate(Connection conn, String alert_type)
    throws SQLException
  {
    String query = "select max(alert_dt) from t07_case_transaction_" + alert_type + "_temp" + 
      " where status_cd='1' ";
    String mindate = "";
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    pstmt = conn.prepareStatement(query);
    rs = pstmt.executeQuery();
    if (rs.next()) {
      mindate = rs.getString(1);
    }
    return mindate;
  }

  public String getValiddt(Connection conn, String statisticdate, String index) throws Exception
  {
    String validdt = "";

    IndicUtil indicBo = new IndicUtil();
    validdt = indicBo.getcpworkday(conn, statisticdate, Integer.parseInt(index));
    return validdt;
  }
  public int deleteT07_case_application(Connection conn, String statisticdate) throws Exception {
    String sql = "delete from t07_case_application  where CASE_DATE=" + 
      this.func.vch2dt(statisticdate, "yyyy-mm-dd") + 
      " AND DATE_STATUS_CD= '" + "2" + "' and case_kind='N'";
    int count = SQLExecute.exeSql(conn, sql);

    return count;
  }
  public int updateT07_case_module_score(Connection conn, String statisticdate, String tablename) throws Exception {
    String sql = "update  " + tablename + "  a set application_num='N' " + 
      " where exists(select 'x' from t07_case_application b where  b.application_num=a.application_num and b.CASE_DATE=" + this.func.vch2dt(statisticdate, "yyyy-mm-dd") + 
      " and b.case_kind='N')";
    int count = SQLExecute.exeSql(conn, sql);

    return count;
  }

  public int deleteT07_case_alert(Connection conn, String statisticdate) throws Exception {
    String sql = "delete from t07_case_net_alert  where CASE_DATE=" + 
      this.func.vch2dt(statisticdate, "yyyy-mm-dd");

    int count = SQLExecute.exeSql(conn, sql);

    return count;
  }

  public int deleteT07_case_transaction(Connection conn, String alert_type, String statisticdate)
    throws Exception
  {
    String sql = "delete from t07_case_transaction_" + alert_type + " a where exists(select 'x' from t07_case_application  b where b.application_num=a.application_num " + 
      " and b.CASE_DATE=" + this.func.vch2dt(statisticdate, "yyyy-mm-dd") + 
      " AND b.DATE_STATUS_CD= '" + "2" + "' and b.case_kind='N')" + 
      " and a.CASE_DATE=" + this.func.vch2dt(statisticdate, "yyyy-mm-dd");
    int count = SQLExecute.exeSql(conn, sql);

    return count;
  }

  public int deleteT07_case_table(Connection conn, String tablename, String statisticdate)
    throws Exception
  {
    String sql = "delete from " + tablename + "  " + 
      " where CASE_DATE=" + this.func.vch2dt(statisticdate, "yyyy-mm-dd");

    int count = SQLExecute.exeSql(conn, sql);

    return count;
  }

  public int deleteT07_case_stcr(Connection conn, String alert_type, String statisticdate) throws Exception
  {
    String sql = "delete from T07_CASE_STCR_" + alert_type + " a  where exists(select 'x' from t07_case_application b where a.application_num=b.application_num " + 
      " and  b.CASE_DATE=" + this.func.vch2dt(statisticdate, "yyyy-mm-dd") + 
      " AND b.DATE_STATUS_CD= '" + "2" + "' and b.case_kind='N')" + 
      "  and a.CASE_DATE=" + this.func.vch2dt(statisticdate, "yyyy-mm-dd");

    int count = SQLExecute.exeSql(conn, sql);

    return count;
  }

  public int deleteT07_CASE_APPMOVEFATE(Connection conn, String statisdate) throws Exception {
    String sql = "DELETE FROM T07_APP_MOVEFATE T1  WHERE EXISTS ( SELECT 'X' FROM T07_CASE_APPLICATION T2  WHERE T1.APPLICATION_NUM = T2.APPLICATION_NUM AND T2.CASE_DATE = " + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
      " AND T2.DATE_STATUS_CD= '" + "2" + 
      "' and t2.case_kind='N')";
    int count = SQLExecute.exeSql(conn, sql);

    return count;
  }

  public int getT07_CASE_Detrans_tempCount(Connection conn)
    throws Exception
  {
    String sql = "select count(0) from  T07_MID_ALERT_TRANS  WHERE STATUS_CD='0'";

    int count = SQLExecute.executeQueryTotal(conn, sql);

    return count;
  }

  public int insertT07_CASE_TransactionDE(Connection conn, String curr_cd, String alert_type, String statisdate) throws Exception {
    String curr_date = statisdate.replaceAll("-", "");
    String sql = "insert into t07_case_transaction_" + alert_type + "(APPLICATION_NUM," + 
      " TRANSACTIONKEY,STATUS_CD,STCR,PARTY_ID,ACCT_NUM,trans_amt,CASE_DATE)select distinct ";

    sql = sql + "'C'||'" + curr_date + "'||organkey||'DE'||'" + curr_cd + "',";

    sql = sql + "  TRANSACTIONKEY,STATUS_CD,STCR,PARTY_ID,ACCT_NUM,trans_amt," + this.func.vch2dt(statisdate, "yyyy-mm-dd") + " from T07_MID_ALERT_TRANS " + 
      " WHERE STATUS_CD='1' and alert_type='1' and TRANSACTIONKEY is not null  ";
    if (!curr_cd.equals("")) {
      sql = sql + " AND CURR_CD='" + curr_cd + "'";
    }
    int count = SQLExecute.exeSql(conn, sql);

    return count;
  }
  public int insertT07_CASE_StcrDE(Connection conn, String curr_cd, String alert_type, String statisdate) throws Exception {
    String curr_date = statisdate.replaceAll("-", "");
    String sql = "insert into t07_case_stcr_" + alert_type + "(APPLICATION_NUM," + 
      " STATUS,PARTY_STATUS,ACCT_STATUS,STCR,PARTY_ID,ACCT_NUM,PARTY_CLASS_CD,CASE_DATE)select distinct ";

    sql = sql + "'C'||'" + curr_date + "'||organkey||'DE'||'" + curr_cd + "',";

    sql = sql + "  '1','1','1',STCR,PARTY_ID,ACCT_NUM,PARTY_CLASS_CD," + this.func.vch2dt(statisdate, "yyyy-mm-dd") + " from T07_MID_ALERT_TRANS " + 
      " WHERE STATUS_CD='1' and alert_type='1' and TRANSACTIONKEY is not null  ";
    if (!curr_cd.equals("")) {
      sql = sql + " AND CURR_CD='" + curr_cd + "'";
    }
    int count = SQLExecute.exeSql(conn, sql);

    return count;
  }

  public int insertT07_CASE_TransactionKY(Connection conn, String curr_cd, String alert_type, String statisdate) throws Exception {
    String sql = "insert into t07_case_transaction_" + alert_type + "(APPLICATION_NUM," + 
      " TRANSACTIONKEY,STATUS_CD,STCR,party_id,ACCT_NUM,TRANS_AMT,CASE_DATE)select distinct ";

    sql = sql + "b.application_num,";

    sql = sql + "  a.TRANSACTIONKEY,a.STATUS_CD,a.STCR,a.party_id,a.ACCT_NUM,a.TRANS_AMT," + this.func.vch2dt(statisdate, "yyyy-mm-dd") + " from T07_MID_ALERT_TRANS a,t07_case_application b " + 
      "  WHERE a.objkey=b.objkey and a.organkey = b.app_org_id and a.objparty_id=b.party_id and a.instrtype=b.CASE_SOURCE and a.STATUS_CD='1' and a.alert_type='2' and  a.TRANSACTIONKEY is not null and b.cast_type='2' and b.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");
    if (!curr_cd.equals("")) {
      sql = sql + "  AND a.curr_cd=b.curr_cd AND a.CURR_CD='" + curr_cd + "'";
    }
    int count = SQLExecute.exeSql(conn, sql);

    return count;
  }

  public int insertT07_CASE_StcrKY(Connection conn, String curr_cd, String alert_type, String statisdate) throws Exception
  {
    String sql = "insert into t07_case_stcr_" + alert_type + "(APPLICATION_NUM," + 
      "  STATUS,PARTY_STATUS,ACCT_STATUS,STCR,party_id,ACCT_NUM,PARTY_CLASS_CD,CASE_DATE)select distinct ";

    sql = sql + "b.application_num,";

    sql = sql + "  '1','1','1',a.STCR,a.party_id,a.ACCT_NUM,a.PARTY_CLASS_CD," + this.func.vch2dt(statisdate, "yyyy-mm-dd") + " from T07_MID_ALERT_TRANS a,t07_case_application b " + 
      " WHERE a.objkey=b.objkey and a.organkey = b.app_org_id  and a.objparty_id=b.party_id  and a.instrtype=b.CASE_SOURCE and a.STATUS_CD='1' and a.alert_type='2' and b.cast_type='2' and b.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");
    if (!curr_cd.equals("")) {
      sql = sql + "  AND a.curr_cd=b.curr_cd AND a.CURR_CD='" + curr_cd + "'";
    }

    int count = SQLExecute.exeSql(conn, sql);

    return count;
  }

  public int insertT07_CASE_TransactionDE1(Connection conn, String curr_cd, String statisdate) throws Exception {
    String sql = "insert into t07_case_transaction_de(APPLICATION_NUM, TRANSACTIONKEY,STATUS_CD,STCR,PARTY_ID,ACCT_NUM,TRANS_AMT,CASE_DATE)select distinct ";

    sql = sql + " b.application_num, a.TRANSACTIONKEY,'1' as status,a.STCR,a.PARTY_ID,a.ACCT_NUM,a.TRANS_AMT," + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd") + "from T07_MID_ALERT_TRANS a,t07_case_application b " + 
      " WHERE a.objkey=b.objkey  and a.organkey = b.app_org_id  and a.objparty_id=b.party_id  and a.instrtype=b.CASE_SOURCE and a.STATUS_CD='0' and a.alert_type='1' and b.cast_type='1' and a.TRANSACTIONKEY is not null  and b.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");
    if (!curr_cd.equals("")) {
      sql = sql + " AND a.curr_cd=b.curr_cd AND a.CURR_CD='" + curr_cd + "'";
    }
    int count = SQLExecute.exeSql(conn, sql);

    return count;
  }

  public int insertT07_CASE_stcrDE1(Connection conn, String curr_cd, String statisdate) throws Exception {
    String sql = "insert into t07_case_stcr_de(APPLICATION_NUM, STATUS,STCR,PARTY_ID,ACCT_NUM,ACCT_STATUS,PARTY_STATUS,PARTY_CLASS_CD,CASE_DATE)select distinct ";

    sql = sql + " b.application_num, '1' as status,a.STCR,a.PARTY_ID,a.ACCT_NUM,'1','1',a.PARTY_CLASS_CD," + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd") + "from T07_MID_ALERT_TRANS a,t07_case_application b " + 
      "  WHERE a.objkey=b.objkey and a.organkey = b.app_org_id and a.objparty_id=b.party_id  and a.instrtype=b.CASE_SOURCE and a.STATUS_CD='0' and a.alert_type='1' and b.cast_type='1' and  b.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");
    if (!curr_cd.equals("")) {
      sql = sql + " AND a.curr_cd=b.curr_cd AND a.CURR_CD='" + curr_cd + "'";
    }
    int count = SQLExecute.exeSql(conn, sql);

    return count;
  }

  public int updateT07_CASE_Amt(Connection conn, String statisdate, String alert_type, String type, String orgflag, String tag) throws Exception
  {
    String delsql = this.func.deleteTable("T47_MID_CASETRANS_D");
    int count = SQLExecute.exeSql(conn, delsql);
    String sql = "INSERT INTO T47_MID_CASETRANS_D(APPLICATION_NUM,TRANSACTIONKEY,ORGANKEY,ACCT_NUM,RECEIVE_PAY_CD,AMT,CNY_AMT,TX_DT) SELECT distinct B.APPLICATION_NUM, A.TRANSACTIONKEY,A.ORGANKEY,A.ACCT_NUM,A.RECEIVE_PAY_CD,A.AMT,A.CNY_AMT,A.TX_DT  FROM T47_TRANSACTION_UC A ,T07_CASE_TRANSACTION_" + 
      alert_type + " B" + 
      " WHERE A.transactionkey=b.transactionkey and B.case_date=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");
    count = SQLExecute.exeSql(conn, sql);

    conn.commit();

    sql = "UPDATE T07_CASE_APPLICATION A SET A.TRAN_AMT=(SELECT SUM(d.CNY_AMT) from T47_MID_CASETRANS_D d where  d.APPLICATION_NUM=A.APPLICATION_NUM  ) WHERE A.CAST_TYPE='" + 
      type + "'" + 
      " AND A.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");

    count = SQLExecute.exeSql(conn, sql);
    conn.commit();

    CatchManager cm = CatchManager.getInstance();
    LinkedHashMap hash = cm.getMapFromCache("t87_syspara");
    String sdfalg = (String)hash.get("800");
    String sqlfalg = (String)hash.get("804");
    if ((sdfalg != null) && (sdfalg.equals("0")) && (sqlfalg != null) && (sqlfalg.equals("0")) && (type.equals("2")))
    {
      sql = "UPDATE T07_CASE_TRANSACTION_" + alert_type + " B SET (TRANS_AMT,ACCT_NUM)=(SELECT distinct  A.AMT,A.ACCT_NUM FROM " + 
        " T47_MID_CASETRANS_D A WHERE A.TRANSACTIONKEY=B.TRANSACTIONKEY )" + 
        " WHERE EXISTS(SELECT 'X' FROM T47_MID_CASETRANS_D C WHERE C.TRANSACTIONKEY=B.TRANSACTIONKEY )" + 
        " AND B.TRANS_AMT=0 AND B.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");
      count = SQLExecute.exeSql(conn, sql);
      conn.commit();

      sql = " DELETE FROM T07_CASE_STCR_" + alert_type + " B" + 
        " WHERE B.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");
      count = SQLExecute.exeSql(conn, sql);
      conn.commit();

      sql = "insert into t07_case_stcr_" + alert_type + "(APPLICATION_NUM," + 
        "  STATUS,PARTY_STATUS,ACCT_STATUS,STCR,party_id,ACCT_NUM,CASE_DATE)" + 
        "  select distinct b.application_num,'1','1','1',B.STCR,B.PARTY_ID,B.ACCT_NUM,B.CASE_DATE" + 
        " FROM  T07_CASE_TRANSACTION_" + alert_type + " B WHERE B.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");
      count = SQLExecute.exeSql(conn, sql);
      conn.commit();
    }

    sql = " INSERT INTO T07_CASE_FEATURE(APPLICATION_NUM,TOTALAMT_IN,TOTALCOUNT_IN,TOTALAMT_OUT,TOTALCOUNT_OUT,DIRECTION,NETAMT,AVGAMT_IN,AVGAMT_OUT,AVGAMT,SPEED_IN,SPEED_OUT,SPEED,CASE_DATE)                                                          SELECT  n.application_num,                                                                                                                                                          SUM(CASE n.receive_pay_cd WHEN '01' THEN n.cny_amt ELSE 0 END) TOTALAMT_IN,                                                                                                                                                         SUM(CASE n.receive_pay_cd WHEN '01' THEN 1 ELSE 0 END) TOTALCOUNT_IN,                                                                                                                                                               SUM(CASE n.receive_pay_cd WHEN '02' THEN n.cny_amt ELSE 0 END) TOTALAMT_OUT,                                                                                                                                                        SUM(CASE n.receive_pay_cd WHEN '02' THEN 1 ELSE 0 END) TOTALCOUNT_OUT,                                                                                                                                                              (CASE WHEN SUM(CASE n.receive_pay_cd WHEN '01' THEN n.cny_amt ELSE 0 END)> SUM(CASE n.receive_pay_cd WHEN '02' THEN n.cny_amt ELSE 0 END) THEN '1' ELSE '2' END) DIRECTION,                                                         (SUM(CASE n.receive_pay_cd WHEN '01' THEN n.cny_amt ELSE 0 END) - SUM(CASE n.receive_pay_cd WHEN '02' THEN n.cny_amt ELSE 0 END)) NETAMT,                                                                                           (CASE WHEN SUM(CASE n.receive_pay_cd WHEN '01' THEN 1 ELSE 0 END)>0 THEN SUM(CASE n.receive_pay_cd WHEN '01' THEN n.cny_amt ELSE 0 END)/SUM(CASE n.receive_pay_cd WHEN '01' THEN 1 ELSE 0 END) ELSE 0 END) AVGAMT_IN,               (CASE WHEN SUM(CASE n.receive_pay_cd WHEN '02' THEN 1 ELSE 0 END)>0 THEN SUM(CASE n.receive_pay_cd WHEN '02' THEN n.cny_amt ELSE 0 END)/SUM(CASE n.receive_pay_cd WHEN '02' THEN 1 ELSE 0 END) ELSE 0 END) AVGAMT_OUT,              SUM(n.cny_amt)/COUNT(*) AVGAMT,                                                                                                                                                                                                     SUM(CASE n.receive_pay_cd WHEN '01' THEN n.cny_amt ELSE 0 END)/(MAX(n.tx_dt) - MIN(n.tx_dt) +1 ) SPEED_IN,                                                                                                                          SUM(CASE n.receive_pay_cd WHEN '02' THEN n.cny_amt ELSE 0 END)/(MAX(n.tx_dt) - MIN(n.tx_dt) +1 ) SPEED_OUT,                                                                                                                         (SUM(CASE n.receive_pay_cd WHEN '01' THEN n.cny_amt ELSE 0 END) + SUM(CASE n.receive_pay_cd WHEN '02' THEN n.cny_amt ELSE 0 END))/(MAX(n.tx_dt) - MIN(n.tx_dt) +1 ) SPEED                                                  ," + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
      "  from  T47_MID_CASETRANS_D n" + 
      "     GROUP BY n.application_num ";

    count = SQLExecute.exeSql(conn, sql);
    conn.commit();

    if ((orgflag != null) && (
      ((tag != null) && (!tag.equals("1"))) || (type.equals("2")))) {
      if (orgflag.equals("2")) {
        sql = "UPDATE T07_CASE_APPLICATION A SET A.app_org_id=( select c.organkey from(  select b.application_num,b.organkey,b.sumamt,row_number()over(partition by b.application_num order by b.sumamt desc) as pk  from( select e.application_num,e.organkey,sum(e.cny_amt) as sumamt from  T47_MID_CASETRANS_D e group by e.application_num,e.organkey)b )c where c.pk=1 and c.application_num=a.application_num) where exists(select 'x' from T47_MID_CASETRANS_D d where d.application_num=a.application_num)  and a.CAST_TYPE='" + 
          type + "'" + 
          " AND A.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");
        count = SQLExecute.exeSql(conn, sql);
        conn.commit();
      }

      if (orgflag.equals("3"))
      {
        this.func.deleteTable(conn, "T07_MID_CASE_ORGAN");
        sql = "INSERT INTO T07_MID_CASE_ORGAN(APPLICATION_NUM,PARTY_ID,ORGANKEY )  select c.application_num,c.party_id,c.organkey from(  select b.application_num, f.party_id,f.OP_ORG_NUM  as organkey,row_number()over(partition by b.application_num order by b.sumamt desc) as pk  from( select e.application_num,e.acct_num,sum(e.cny_amt) as sumamt from  T47_MID_CASETRANS_D e group by e.application_num,e.acct_num)b  left join t47_acct_uc f on b.acct_num=f.acct_num)c where c.pk=1 ";

        count = SQLExecute.exeSql(conn, sql);

        sql = "UPDATE T07_CASE_APPLICATION A SET (A.app_org_id,a.party_id)=( select c.organkey,c.party_id from  T07_MID_CASE_ORGAN c where  c.application_num=a.application_num) where exists(select 'x' from T07_MID_CASE_ORGAN d where d.application_num=a.application_num)  and a.CAST_TYPE='" + 
          type + "'" + 
          " AND A.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");
        count = SQLExecute.exeSql(conn, sql);
        conn.commit();

        sql = " UPDATE  T07_CASE_APPLICATION A SET PARTY_NAME=(SELECT PARTY_CHN_NAME  FROM T47_PARTY B WHERE B.PARTY_ID=A.PARTY_ID) WHERE  A.CAST_TYPE='" + 
          type + "' AND A.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");
        count = SQLExecute.exeSql(conn, sql);
        conn.commit();
      }

    }

    return count;
  }

  public int updateT07_ALERT_DE(Connection conn, String statisdate, String case_curr_type)
    throws Exception
  {
    String sql = "UPDATE T07_ALERT_DE A  SET ALERT_STATUS_CD='1', A.APPLICATION_NUM=(SELECT  B.APPLICATION_NUM FROM T07_CASE_APPLICATION B WHERE B.APP_ORG_ID=A.ORGANKEY  ";

    if ("1".equals(case_curr_type)) {
      sql = sql + " AND B.CURR_CD=A.CURR_CD ";
    }
    sql = sql + "   AND B.CASE_KIND='N' AND B.DATE_STATUS_CD='2' AND B.CAST_TYPE='1'" + 
      " AND B.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd") + ")" + 
      " WHERE A.APPLICATION_NUM='N' AND A.ALERT_DT=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");

    int count = SQLExecute.exeSql(conn, sql);
    logger.info("修改大额预警案例编号（机构）数" + count + "个");

    return count;
  }

  public int updateT27_ALERT_DE(Connection conn, String statisdate, String case_curr_type) throws Exception
  {
    String sql = "UPDATE T27_ALERT A  SET ALERT_STATUS_CD='2', A.APPLICATION_NUM=(SELECT  B.APPLICATION_NUM FROM T07_CASE_APPLICATION B WHERE B.APP_ORG_ID=A.ORGANKEY  ";

    if ("1".equals(case_curr_type)) {
      sql = sql + " AND B.CURR_CD=A.CURR_CD ";
    }
    sql = sql + "   AND B.CASE_KIND='N' AND B.DATE_STATUS_CD='2' AND B.CAST_TYPE='1'" + 
      " AND B.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd") + ")" + 
      " WHERE A.APPLICATION_NUM='N' AND  ALERT_STATUS_CD='2' AND A.ALERTTYPE='1' ";

    int count = SQLExecute.exeSql(conn, sql);
    logger.info("修改大额预警案例编号（机构）数" + count + "个");

    return count;
  }

  public int InsertCaseALERT_DE(Connection conn, String statisdate, String case_curr_type) throws Exception {
    String sql = "INSERT INTO  T07_CASE_NET_ALERT(APPLICATION_NUM,NET_ID,ALERTKEY,DATATYPE,CASE_DATE) SELECT  distinct a.APPLICATION_NUM,'N',b.alertkey,'1',a.case_date FROM T07_MID_ALERT_TRANS B ,T07_CASE_APPLICATION A WHERE B.organkey=a.app_org_id  ";

    if ("1".equals(case_curr_type)) {
      sql = sql + " AND B.CURR_CD=A.CURR_CD ";
    }
    sql = sql + "  and b.ALERT_TYPE='1' and b.INSTRTYPE='1'  AND a.CASE_KIND='N' AND a.DATE_STATUS_CD='2' AND a.CAST_TYPE='1'" + 
      " AND a.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");

    int count = SQLExecute.exeSql(conn, sql);

    return count;
  }

  public int updateT07_ALERT_DE1(Connection conn, String statisdate, String case_curr_type) throws Exception {
    String sql = "UPDATE T07_ALERT_DE A  SET ALERT_STATUS_CD='1', A.APPLICATION_NUM=(SELECT  B.APPLICATION_NUM FROM T07_CASE_APPLICATION B WHERE B.OBJKEY=A.OBJKEY  and B.APP_ORG_ID=A.ORGANKEY  and b.party_id=a.objkey ";

    if ("1".equals(case_curr_type)) {
      sql = sql + " AND B.CURR_CD=A.CURR_CD ";
    }
    sql = sql + "   AND B.CASE_KIND='N' AND B.DATE_STATUS_CD='2' AND B.CAST_TYPE='1'" + 
      " AND B.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd") + ")" + 
      " WHERE  A.APPLICATION_NUM='N' AND A.ALERT_DT=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");

    int count = SQLExecute.exeSql(conn, sql);
    logger.info("修改大额预警案例编号（客户）数" + count + "个");
    return count;
  }

  public int updateT27_ALERT(Connection conn, String statisdate, String case_curr_type, String alerttype) throws Exception
  {
    String sql = "UPDATE T27_ALERT A  SET ALERT_STATUS_CD='3', A.APPLICATION_NUM=(SELECT  B.APPLICATION_NUM FROM T07_CASE_APPLICATION B WHERE  b.party_id=a.party_id ";

    if ("1".equals(case_curr_type)) {
      sql = sql + " AND B.CURR_CD=A.CURR_CD ";
    }
    sql = sql + "  AND B.CASE_KIND='N' AND B.DATE_STATUS_CD='2' and b.case_source='1' AND B.CAST_TYPE='" + alerttype + "'" + 
      " AND B.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd") + ")" + 
      " WHERE  A.APPLICATION_NUM='N' AND A.ALERT_STATUS_CD='2' AND A.ALERTTYPE='" + alerttype + "' and a.alert_dt<=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");

    int count = SQLExecute.exeSql(conn, sql);
    logger.info("修改大额预警案例编号（客户）数" + count + "个");
    return count;
  }

  public int InsertCaseALERT(Connection conn, String statisdate, String case_curr_type, String alerttype) throws Exception
  {
    String sql = "INSERT INTO  T07_CASE_NET_ALERT(APPLICATION_NUM,NET_ID,ALERTKEY,DATATYPE,CASE_DATE) SELECT  distinct a.APPLICATION_NUM,b.objkey,b.alertkey,'1',a.case_date FROM T07_MID_ALERT_TRANS B ,T07_CASE_APPLICATION A WHERE B.objparty_id=a.party_id  and b.objkey=a.objkey ";

    if ("1".equals(case_curr_type)) {
      sql = sql + " AND B.CURR_CD=A.CURR_CD ";
    }
    sql = sql + " and b.INSTRTYPE=a.case_source  and b.ALERT_TYPE=a.cast_type  AND a.CASE_KIND='N' AND a.DATE_STATUS_CD='2' " + 
      " and  a.cast_type='" + alerttype + "'" + 
      " AND a.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");

    int count = SQLExecute.exeSql(conn, sql);
    conn.commit();
    if (alerttype.equals("2"))
    {
      sql = "update T07_CASE_MODULE_SCORE b set application_num =(select c.application_num from(select a.application_num,a.objkey,a.case_source,  ROW_NUMBER() OVER(PARTITION BY a.case_source,a.objkey ORDER BY a.application_num DESC) pk from T07_CASE_APPLICATION A  where a.CASE_KIND='N' AND a.DATE_STATUS_CD='2'  and  a.cast_type='" + 
        alerttype + "'" + 
        " AND a.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd") + ") c where c.pk=1 and c.objkey=b.objkey and c.case_source=b.MODULETYPE) " + 
        " where (application_num is null or application_num='N') and  case_date<=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");

      count = SQLExecute.exeSql(conn, sql);
      conn.commit();
    }

    return count;
  }

  public int updateT13_MFA_INFO(Connection conn, String statisdate, String case_curr_type, String alerttype) throws Exception {
    String sql = "UPDATE T13_MFA_INFO A  SET STATUS='3', A.APPLICATION_NUM=(SELECT  B.APPLICATION_NUM FROM T07_CASE_APPLICATION B WHERE   b.objkey=a.net_id";

    sql = sql + "  AND B.CASE_KIND='N' AND B.DATE_STATUS_CD='2' and b.case_source='2' AND B.CAST_TYPE='" + alerttype + "'" + 
      " AND B.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd") + ")" + 
      " WHERE  A.APPLICATION_NUM='N' AND A.STATUS='2' ";

    int count = SQLExecute.exeSql(conn, sql);
    logger.info("修改网络表中案例编号数" + count + "个");

    return count;
  }

  public int updateT07_ALERT_KY(Connection conn, String statisdate, String case_curr_type)
    throws Exception
  {
    String sql = "UPDATE T07_ALERT_KY A  SET ALERT_STATUS_CD='1', A.APPLICATION_NUM=(SELECT  B.APPLICATION_NUM FROM T07_CASE_APPLICATION B WHERE  B.APP_ORG_ID=A.ORGANKEY and b.party_id=a.objkey ";

    if ("1".equals(case_curr_type)) {
      sql = sql + " AND B.CURR_CD=A.CURR_CD ";
    }
    sql = sql + " AND B.CASE_KIND='N' AND B.DATE_STATUS_CD='2' AND B.CAST_TYPE='2' and b.case_source='1'  " + 
      " AND B.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd") + ")" + 
      " WHERE   A.APPLICATION_NUM='N' and exists(select 'x' from t07_case_transaction_ky_temp c where c.alertkey=a.alertkey and  c.STATUS_CD='1')";

    int count = SQLExecute.exeSql(conn, sql);
    logger.info("修改可疑预警案例编号（客户）数" + count + "个");
    return count;
  }

  public int insertT07_case_app(Connection conn, String curr_cd, String alert_type, String case_curr_type, String statisdate)
    throws Exception
  {
    String flow_id = "";
    String post_id = "";
    String node_id = "";
    String n_flow_id = "";
    String n_post_id = "";
    String n_node_id = "";
    Date cuudate = DateUtils.stringToDateShort(statisdate);
    String curr_date = DateUtils.getYear(cuudate) + 
      DateUtils.getMonth(cuudate) + DateUtils.getDay(cuudate) + DateUtils.getMinute(DateUtils.getCurrDateTime());

    if ("1".equals(case_curr_type))
    {
      if (alert_type.equals("DE")) {
        if (Constants.WAI_CURR.equals(curr_cd)) {
          flow_id = "03";
          post_id = "P0302";
          node_id = "N0302";
        } else {
          flow_id = "01";
          post_id = "P0102";
          node_id = "N0102";
        }
      }
      else if (Constants.WAI_CURR.equals(curr_cd)) {
        flow_id = "04";
        post_id = "P0302";
        node_id = "N0402";
      } else {
        flow_id = "02";
        post_id = "P0102";
        node_id = "N0202";
        n_flow_id = "05";
        n_post_id = "P0502";
        n_node_id = "N0502";
      }
    }
    else {
      if (alert_type.equals("DE")) {
        flow_id = "01";
        node_id = "N0102";
      } else {
        flow_id = "02";
        node_id = "N0202";
        n_flow_id = "05";
        n_post_id = "P0502";
        n_node_id = "N0502";
      }
      post_id = "P0102";
    }

    String selectsql = ""; String insertsql = "";
    insertsql = "insert into t07_case_application(application_num,case_source, recheck_num,flow_id,post_id,node_id,app_dt,app_org_id,case_name, cast_type,case_kind,case_level,case_date,party_id,party_name,party_class_cd,app_state_cd,date_status_cd,validate_ind,";

    insertsql = insertsql + "curr_cd,";

    insertsql = insertsql + " alert_level,take_action,action_descrip,CASE_TRAN_MAXDATE,TRAN_COUNT,acct_count,party_count,TRAN_AMT,case_end_date,OBJKEY,IS_MENU)";

    if (alert_type.equals("DE")) {
      curr_date = statisdate.replaceAll("-", "");
      selectsql = "select 'C'||'" + curr_date + "'||a.organkey||'DE'||'" + curr_cd + "','1'," + 
        " 0,'" + flow_id + "','" + post_id + "','" + node_id + "'," + this.func.vch2dt(DateUtils.getCurrShortDateStr(), "yyyy-mm-dd") + ",a.organkey,'" + curr_date + "DE'||b.organname," + 
        " '1','N','0'," + this.func.vch2dt(statisdate, "yyyy-mm-dd") + ",'','','C','1' as status,'2','0',";
      if ("1".equals(case_curr_type))
        selectsql = selectsql + "curr_cd,";
      else {
        selectsql = selectsql + "'1',";
      }
      selectsql = selectsql + " '','','',MAX(A.ALERT_DT),count( distinct a.transactionkey),count(distinct a.acct_num),count(distinct a.party_id),sum(a.trans_amt),max(a.invalidate_dt),a.organkey,'0' " + 
        " from (select  distinct organkey,objkey,objname,objparty_id,party_chn_name,objparty_class_cd,curr_cd,party_id,acct_num,ALERT_DT,invalidate_dt,transactionkey,STATUS_CD,alert_type,trans_amt, 0" + 
        " from T07_MID_ALERT_TRANS ) a,t00_organ b" + 
        " where a.organkey=b.organkey and a.STATUS_CD='1' and a.alert_type='1'  ";
      if ("1".equals(case_curr_type)) {
        selectsql = selectsql + "  and a.curr_cd='" + curr_cd + "'";
      }
      selectsql = selectsql + " group by a.organkey,b.organname";
      if ("1".equals(case_curr_type))
        selectsql = selectsql + ",a.curr_cd";
    }
    else
    {
      selectsql = "select  'C'||'" + curr_date + "'||replace(b.objparty_id,'#','')||" + this.func.rownum() + "||'KY'||'" + curr_cd + "',INSTRTYPE," + 
        " 0, CASE WHEN INSTRTYPE='1' THEN '" + flow_id + "' else '" + n_flow_id + "' end ,'" + post_id + "',CASE WHEN INSTRTYPE='1' THEN '" + node_id + "' else '" + n_node_id + "' end," + this.func.vch2dt(DateUtils.getCurrShortDateStr(), "yyyy-mm-dd") + ",b.organkey,'" + curr_date + "KY'||b.objname," + 
        " '2','N','0'," + this.func.vch2dt(statisdate, "yyyy-mm-dd") + ",b.objparty_id,b.party_chn_name,b.objparty_class_cd,'1','2','0',";

      if ("1".equals(case_curr_type))
        selectsql = selectsql + "b.curr_cd,";
      else {
        selectsql = selectsql + "'1',";
      }

      selectsql = selectsql + " '01','继续关注','',b.maxdt,b.trans_count,b.acct_count,b.party_count,b.sumamt,b.invalidate_dt,b.OBJKEY,'0'" + 
        " from ( select INSTRTYPE, organkey,objkey,objname,objparty_id,party_chn_name,objparty_class_cd ";
      if ("1".equals(case_curr_type)) {
        selectsql = selectsql + ",curr_cd";
      }
      selectsql = selectsql + " ,MAX(A.ALERT_DT) as maxdt,max(invalidate_dt) as invalidate_dt, count(distinct transactionkey) as trans_count,count(distinct acct_num) as acct_count,count(distinct party_id) as party_count,0 as sumamt from(" + 
        " select distinct INSTRTYPE , organkey,objkey,objname,objparty_id,party_chn_name,objparty_class_cd,curr_cd,party_id,acct_num,invalidate_dt,ALERT_DT,transactionkey,STATUS_CD,alert_type, 0" + 
        " from T07_MID_ALERT_TRANS  ) a" + 
        " where a.STATUS_CD='1' and a.alert_type='2'";
      if ("1".equals(case_curr_type)) {
        selectsql = selectsql + "  and a.curr_cd='" + curr_cd + "'";
      }
      selectsql = selectsql + " group by a.organkey,a.objkey,a.objname,a.objparty_id,a.objparty_class_cd,a.party_chn_name,a.INSTRTYPE";
      if ("1".equals(case_curr_type)) {
        selectsql = selectsql + ",a.curr_cd";
      }
      selectsql = selectsql + ") b";
    }
    int count = SQLExecute.exeSql(conn, insertsql + selectsql);

    return count;
  }

  public int insertT07_case_appDE1(Connection conn, String curr_cd, String case_curr_type, String statisdate) throws Exception
  {
    String flow_id = "";
    String post_id = "";
    String node_id = "";
    Date cuudate = DateUtils.stringToDateShort(statisdate);
    String curr_date = DateUtils.getYear(cuudate) + 
      DateUtils.getMonth(cuudate) + DateUtils.getDay(cuudate) + DateUtils.getMinute(DateUtils.getCurrDateTime());

    if ("1".equals(case_curr_type))
    {
      if (Constants.WAI_CURR.equals(curr_cd)) {
        flow_id = "03";
        post_id = "P0302";
        node_id = "N0302";
      } else {
        flow_id = "01";
        post_id = "P0102";
        node_id = "N0102";
      }
    }
    else
    {
      flow_id = "01";
      node_id = "N0102";
      post_id = "P0102";
    }

    String selectsql = ""; String insertsql = "";
    insertsql = "insert into t07_case_application(application_num,case_source, recheck_num,flow_id,post_id,node_id,app_dt,app_org_id,case_name, cast_type,case_kind,case_level,case_date,party_id,party_class_cd,party_name,app_state_cd,date_status_cd,validate_ind,";

    insertsql = insertsql + "curr_cd,";

    insertsql = insertsql + "alert_level,take_action,action_descrip,CASE_TRAN_MAXDATE,TRAN_COUNT,acct_count,party_count,TRAN_AMT,case_end_date,OBJKEY,IS_MENU)";

    selectsql = "select  'C'||'" + curr_date + "'||b.organkey||" + this.func.rownum() + "||'DE'||'" + curr_cd + "','1'," + 
      " 0,'" + flow_id + "','" + post_id + "','" + node_id + "'," + this.func.vch2dt(DateUtils.getCurrShortDateStr(), "yyyy-mm-dd") + ",b.organkey,'" + curr_date + "DE'||b.objname," + 
      " '1','N','0'," + this.func.vch2dt(statisdate, "yyyy-mm-dd") + ",b.objparty_id,b.objparty_class_cd,b.party_chn_name,'1','2','0',";

    if ("1".equals(case_curr_type))
      selectsql = selectsql + "b.curr_cd,";
    else {
      selectsql = selectsql + "'1',";
    }

    selectsql = selectsql + " '01','继续关注','',b.maxdt,b.trans_count,b.acct_count,b.party_count,b.sumamt,b.invalidate_dt,b.OBJKEY,'0'" + 
      " from ( select organkey,objkey,objname,objparty_id,party_chn_name,objparty_class_cd";
    if ("1".equals(case_curr_type)) {
      selectsql = selectsql + ",curr_cd";
    }
    selectsql = selectsql + ",max(alert_dt) as maxdt,max(invalidate_dt) as invalidate_dt, count(distinct transactionkey) as trans_count,count(distinct acct_num) as acct_count,count(distinct party_id) as party_count,sum(trans_amt) as sumamt from(" + 
      " select  distinct organkey,objkey,objname,objparty_id,party_chn_name,objparty_class_cd,curr_cd,party_id,acct_num,alert_dt,invalidate_dt,transactionkey,STATUS_CD,alert_type, trans_amt" + 
      " from T07_MID_ALERT_TRANS  ) a" + 
      " where a.STATUS_CD='0' and a.alert_type='1'";
    if ("1".equals(case_curr_type)) {
      selectsql = selectsql + "  and a.curr_cd='" + curr_cd + "'";
    }

    selectsql = selectsql + " group by a.organkey,a.objkey,a.objname,a.objparty_id,a.objparty_class_cd,a.party_chn_name";
    if ("1".equals(case_curr_type)) {
      selectsql = selectsql + ",a.curr_cd";
    }
    selectsql = selectsql + ") b";

    int count = SQLExecute.exeSql(conn, insertsql + selectsql);

    return count;
  }

  public String getInsertT07_app_movefateSql(String statisdate)
  {
    String insertsql = "INSERT INTO T07_APP_MOVEFATE(FLOW_ID,APPLICATION_NUM,RECHECK_NUM,CURR_ORG,SEQ_NUM,CURR_NODE,CURR_POST,ORIG_NODE,OPER_ID,CURRENT_IND,STATUS_CD,CREATE_DT,LAST_UPD_DT,LAST_UPD_USER,INIT_IND,BEHIND_IND,ORIG_STATUS_CD,OPER_TYPE,CURR_OPER_ID,CURR_OPERATOR)";

    String selectsql = "SELECT A.FLOW_ID,A.APPLICATION_NUM,A.RECHECK_NUM,A.APP_ORG_ID,0,t.TARGET_NODE,N.POST_ID,'','','1','0'," + 
      this.func.vch2dt(DateUtils.getCurrShortDateStr(), "yyyy-mm-dd") + 
      "," + 
      this.func.vch2dt(DateUtils.getCurrShortDateStr(), "yyyy-mm-dd") + 
      ",'admin','0','0','1','','',''" + 
      " FROM T07_CASE_APPLICATION A, T07_NODE N, T07_SWITH T " + 
      " WHERE 1 > 0 AND T.FLOW_ID = A.FLOW_ID  AND N.FLOW_ID = A.FLOW_ID " + 
      " AND N.NODE_ID = T.TARGET_NODE " + 
      " AND T.ORIG_NODE='N0000'" + 
      " AND A.CASE_DATE =" + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
      " AND A.CASE_KIND = '" + 
      "N" + 
      "'" + 
      " AND A.DATE_STATUS_CD = '" + "2" + "'";
    return insertsql + selectsql;
  }

  public String getUpdateT07_case_appDateSql(String statisdate, String datetype)
  {
    String sql = "UPDATE T07_CASE_APPLICATION A SET CASE_TRAN_" + datetype + 
      "DATE=(" + "SELECT " + datetype + "(T.TX_DT)" + 
      " FROM T47_TRANSACTION T,T07_CASE_TRANSACTION C" + 
      " WHERE  C.TRANSACTIONKEY = T.TRANSACTIONKEY " + 
      " AND A.APPLICATION_NUM = C.APPLICATION_NUM " + 
      " GROUP BY C.APPLICATION_NUM )" + " WHERE A.CASE_DATE=" + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd") + " AND A.CASE_TRAN_" + 
      datetype + "DATE IS NULL";
    return sql;
  }

  public void UpdateActionDes(Connection conn, String statisdate)
    throws Exception
  {
    UpdateActionDes(conn, statisdate, "1");

    UpdateActionDes(conn, statisdate, "2");
  }

  public void UpdateAlertLevel(Connection conn, String statisdate, String flag) throws Exception
  {
    if ((flag != null) && (flag.equals("1"))) {
      String sql = "UPDATE T07_CASE_APPLICATION A SET A.ALERT_LEVEL='02' WHERE    A.CASE_DATE=" + 
        this.func.vch2dt(statisdate, "yyyy-mm-dd");
      SQLExecute.exeSql(conn, sql);
    }

    String sql = "UPDATE T07_CASE_APPLICATION A SET A.ALERT_LEVEL='03' WHERE EXISTS( SELECT 'X' FROM V07_BLACKLIST B WHERE B.PARTY_ID=A.PARTY_ID AND B.ISUSE='0' AND B.ISCHECK='1'  ) AND  A.CASE_DATE=" + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd");
    SQLExecute.exeSql(conn, sql);
  }

  public boolean UpdateActionDes(Connection conn, String statisdate, String flag) throws Exception {
    ArrayList list = new ArrayList();
    String sql = "";
    try
    {
      sql = this.func.deleteTable("T07_CASE_STCR_TEMP");

      SQLExecute.exeSql(conn, sql);
      if (flag.equals("1"))
        sql = " INSERT INTO T07_CASE_STCR_TEMP     (APPLICATION_NUM,PBCKEY,PBC_DES)  SELECT DISTINCT T.APPLICATION_NUM,T3.PBCKEY,T3.PBCKEY||T3.PBC_DES     FROM T07_CASE_STCR_KY T,T07_PBCRULE T3   WHERE  T.STCR = T3.PBCKEY AND T.CASE_DATE= " + 
          this.func.vch2dt(statisdate, "yyyy-mm-dd");
      else {
        sql = " INSERT INTO T07_CASE_STCR_TEMP     (APPLICATION_NUM,PBCKEY,PBC_DES)  SELECT DISTINCT T.APPLICATION_NUM,T3.ACTIONCODE,T3.ACTIONCODE||T4.ACTIONNAME     FROM T07_CASE_STCR_KY T,T21_PBCRULE T3,T21_ACTIONCODE T4   WHERE  T.STCR = T3.PBCKEY AND T3.ACTIONCODE=T4.ACTIONCODE AND T.CASE_DATE= " + 
          this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
          " UNION SELECT a.APPLICATION_NUM,b.ACTIONCODE,b.ACTIONCODE||c.ACTIONNAME " + 
          "    FROM T07_CASE_MODEL a,t23_rule_module b,T21_ACTIONCODE c " + 
          "  WHERE  a.model_no=b.module_no and b.actioncode=c.actioncode AND a.CASE_DATE= " + this.func.vch2dt(statisdate, "yyyy-mm-dd");
      }

      SQLExecute.exeSql(conn, sql);
      conn.commit();

      sql = this.func.deleteTable("T07_CASE_APP_TEMP");
      SQLExecute.exeSql(conn, sql);

      sql = " INSERT INTO T07_CASE_APP_TEMP     (APPLICATION_NUM,ACTION_DESCRIP)  SELECT T.APPLICATION_NUM,''    FROM T07_CASE_APPLICATION T   WHERE T.CASE_DATE= " + 
        this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
        "    AND T.CAST_TYPE = '2'" + 
        "    AND T.CASE_KIND = '" + "N" + "'";

      if (flag.equals("2")) {
        sql = sql + " AND EXISTS(SELECT 'X' FROM T07_CASE_STCR_TEMP B WHERE B.APPLICATION_NUM=T.APPLICATION_NUM)";
      }
      SQLExecute.exeSql(conn, sql);

      String selsql = "SELECT DISTINCT PBCKEY FROM T07_CASE_STCR_TEMP";
      ArrayList pbckeyList = SQLExecute.executeQuery(conn, selsql);
      for (int j = 0; j < pbckeyList.size(); j++) {
        TreeMap map = (TreeMap)pbckeyList.get(j);
        String key = (String)map.get("PBCKEY");

        String i = key;

        sql = "  UPDATE T07_CASE_APP_TEMP T1    SET T1.ACTION_DESCRIP = (SELECT DISTINCT ( (CASE WHEN T1.ACTION_DESCRIP IS NULL THEN '' ELSE T1.ACTION_DESCRIP END)||(CASE WHEN A.PBC_DES IS NULL THEN '' ELSE A.PBC_DES||';' END))  FROM T07_CASE_STCR_TEMP A   WHERE A.APPLICATION_NUM=T1.APPLICATION_NUM   AND A.PBCKEY=  '" + 
          i + "' )" + 
          "  WHERE EXISTS (SELECT 'X' FROM T07_CASE_STCR_TEMP B WHERE   B.APPLICATION_NUM = T1.APPLICATION_NUM " + 
          " AND B.PBCKEY = '" + i + "' and lengthb(t1.ACTION_DESCRIP)+lengthb(B.PBC_DES)<=2000 ) "
          ;

        SQLExecute.exeSql(conn, sql);
      }
      conn.commit();

      if (!flag.equals("1")) {
        sql = "update T07_CASE_APP_TEMP a set a.ACTION_DESCRIP =(select T.ACTION_DESCRIP||chr(13)||chr(10)||'3.经我行分析，初步判断该报告所涉主体或行为的涉罪可疑行为代码为：'|| a.ACTION_DESCRIP from T07_CASE_APPLICATION T  WHERE t.application_num=a.application_num and T.CASE_DATE= " + 
          this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
          "   AND T.CAST_TYPE = '2'" + 
          "   AND T.CASE_KIND = '" + "N" + "')";
        SQLExecute.exeSql(conn, sql);
      }
      else {
        HashMap hash = this.cm.getMapFromCache("t87_syspara");
        String des = "2.该可疑报告符合我行自主监测规则：";
        String sdfalg = (String)hash.get("800");
        if ((sdfalg != null) && (sdfalg.equals("0"))) {
          des = "2.该可疑报告符合规则：";
        }
        sql = "update T07_CASE_APP_TEMP a set a.ACTION_DESCRIP ='" + des + 
          "'|| a.ACTION_DESCRIP ";
        SQLExecute.exeSql(conn, sql);
      }
      update07_case_actiondes(conn);

      sql = "UPDATE T07_CASE_APPLICATION T    SET T.ACTION_DESCRIP = ";

      sql = sql + "(SELECT TT.ACTION_DESCRIP " + 
        "                             FROM T07_CASE_APP_TEMP TT " + 
        "                            WHERE T.APPLICATION_NUM = TT.APPLICATION_NUM ) " + 
        " WHERE T.CASE_DATE= " + this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
        "   AND T.CAST_TYPE = '2'" + 
        "   AND T.CASE_KIND = '" + "N" + "'" + 
        "   AND EXISTS (SELECT 'X' FROM T07_CASE_APP_TEMP TTT " + 
        "                WHERE T.APPLICATION_NUM = TTT.APPLICATION_NUM)";
      SQLExecute.exeSql(conn, sql);
    }
    catch (SQLException e)
    {
      logger.error("[生成案例] 可疑案例的可疑行为描述处理失败!" + e.getNextException());
      logger.error(e.getMessage());
      e.printStackTrace();
      throw e;
    }
    return true;
  }

  public int deleteT47_transaction(Connection conn, String alert_type, String statisdate)
    throws Exception
  {
    String sql = "DELETE FROM T47_TRANSACTION_UC T                                           WHERE EXISTS (SELECT 'X'                                                           FROM (SELECT A.TRANSACTIONKEY                                                     FROM (SELECT DISTINCT TRANSACTIONKEY                                              FROM T07_CASE_TRANSACTION_" + 
      alert_type + 
      "                         WHERE CASE_DATE = " + this.func.vch2dt(statisdate, "yyyy-mm-dd") + " ) A           " + 
      "                  LEFT JOIN (SELECT DISTINCT TRANSACTIONKEY               " + 
      "                              FROM T07_CASE_TRANSACTION                   " + 
      "                             WHERE CASE_DATE <> " + this.func.vch2dt(statisdate, "yyyy-mm-dd") + ") B      " + 
      "                    ON A.TRANSACTIONKEY = B.TRANSACTIONKEY                " + 
      "                 WHERE B.TRANSACTIONKEY IS NULL) S                        " + 
      "         WHERE S.TRANSACTIONKEY = T.TRANSACTIONKEY                        " + 
      "        )                                                                ";

    int count = SQLExecute.exeSql(conn, sql);

    return count;
  }

  public int deleteT47_acct_uc(Connection conn, String statisdate)
    throws Exception
  {
    String sql = " DELETE FROM T47_ACCT_UC T                   WHERE EXISTS (                                SELECT 'X'                                  FROM (                                        SELECT A.ACCT_NUM                           FROM                                          (                                             SELECT DISTINCT ACCT_NUM                    FROM T47_TRANSACTION_UC                     WHERE TX_DT = " + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
      "        ) A                                 " + 
      "     LEFT JOIN                              " + 
      "        (                                   " + 
      "         SELECT DISTINCT ACCT_NUM           " + 
      "         FROM T47_TRANSACTION_UC            " + 
      "         WHERE TX_DT <> " + this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
      "        ) B                                 " + 
      "     ON A.ACCT_NUM = B.ACCT_NUM             " + 
      "     WHERE B.ACCT_NUM IS NULL               " + 
      "     ) S                                    " + 
      "   WHERE S.ACCT_NUM = T.ACCT_NUM)           ";
    int count = SQLExecute.exeSql(conn, sql);

    return count;
  }

  public int deleteT47_party_uc(Connection conn, String statisdate)
    throws Exception
  {
    String sql = " DELETE FROM T47_PARTY_UC T                 WHERE EXISTS (                               SELECT 'X'                                 FROM (                                       SELECT A.PARTY_ID                          FROM                                         (                                            SELECT DISTINCT PARTY_ID                   FROM T07_CASE_PARTY                        WHERE CASE_DATE =" + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
      "        ) A                                " + 
      "     LEFT JOIN                             " + 
      "        (                                  " + 
      "         SELECT DISTINCT PARTY_ID          " + 
      "         FROM T07_CASE_PARTY               " + 
      "         WHERE CASE_DATE <> " + this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
      "        ) B                                " + 
      "     ON A.PARTY_ID = B.PARTY_ID            " + 
      "     WHERE B.PARTY_ID IS NULL              " + 
      "     ) S                                   " + 
      "   WHERE S.PARTY_ID = T.PARTY_ID)        ";
    int count = SQLExecute.exeSql(conn, sql);

    return count;
  }
  public int deleteT07_CASE_PARTY(Connection conn, String statisdate) throws Exception {
    String sql = "DELETE FROM T07_CASE_PARTY T2 where  CASE_DATE = " + this.func.vch2dt(statisdate, "yyyy-mm-dd");

    int count = SQLExecute.exeSql(conn, sql);

    return count;
  }

  public int insertT47_transaction_uc(Connection conn, String statisdate, String alert_type) throws Exception {
    this.func.deleteTable(conn, "T07_MID_TRANS_ENDDATE");
    String casttype = "1";
    if (alert_type.equals("KY")) {
      casttype = "2";
    }
    String sql = "insert into T07_MID_TRANS_ENDDATE(ENDDATE,transactionkey) SELECT  MIN(B.CASE_END_DATE),C.TRANSACTIONKEY FROM (select application_num ,transactionkey from  T07_CASE_TRANSACTION where CASE_DATE=" + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd") + ") C, T07_CASE_APPLICATION B " + 
      " WHERE B.APPLICATION_NUM=C.APPLICATION_NUM AND B.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
      " AND B.cast_type='" + casttype + "'   GROUP BY C.TRANSACTIONKEY";
    int count = SQLExecute.exeSql(conn, sql);

    this.func.deleteTable(conn, "T47_TRANS_MID1");
    String str = "insert into T47_TRANS_MID1(transactionkey,ENDDATE) SELECT   E.TRANSACTIONKEY,E.ENDDATE  FROM T07_MID_TRANS_ENDDATE E    left join  t47_trans_valiste_mid D on D.TRANSACTIONKEY = E.TRANSACTIONKEY             where  D.TRANSACTIONKEY is null  ";

    int count1 = SQLExecute.exeSql(conn, str);
    conn.commit();

    sql = "INSERT INTO T47_TRANSACTION_UC  (TRANSACTIONKEY,CB_PK,TX_NO,VOUCHER_NO,ORGANKEY,TX_DT,                                      DT_TIME,ACCT_NUM,PARTY_ID,PARTY_CLASS_CD,TX_CD,CB_TX_CD,                              BUS_TYPE_CD,TX_TYPE_CD,DEBIT_CREDIT,RECEIVE_PAY_CD,                                   SUBJECTNO,CURRENCY_CD,CURR_CD,AMT,CNY_AMT,USD_AMT,AMT_VAL,                            CASH_TRANS_FLAG,REMIT_TYPE_CD,DES,OVERAREA_IND,SETTLE_TYPE_CD,                        USE_DES,OPP_SYS_ID,OPP_ISPARTY,OPP_AREA,OPP_ORGAN_TYPE,                               OPP_ORGANKEY,OPP_ORGANNAME,OPP_PARTY_ID,OPP_NAME,OPP_ACCT_NUM,                        OPP_TX_DT,OPP_ACCT_TYPE_CD,OPP_CARD_TYPE,OPP_CARD_NO,                                 OPP_PARTY_CLASS_CD,CANCEL_IND,AMT_CD,BATCH_IND,TELLER,RE_IND,                         HANDLE_STATUS_CD,PARTY_CHN_NAME,ADDTIONAL,RE_DT,TX_DIRECT,                            TOKEN_NO,HOST_CUST_ID,CHANNEL,CAL_IND,RULE_IND,TEMP1,                                 OPP_COUNTRY,TSCTKEY,TX_GO_COUNTRY,TX_GO_AREA,TX_OCCUR_COUNTRY,                        TX_OCCUR_AREA,AGENT_NAME,AGENT_CARD_TYPE,AGENT_CARD_NO,                               AGENT_COUNTRY,ORG_TRANS_RELA,CASH_IND,OPP_PBC_PARTY_CLASS_CD,                         CHECK_TELLER,LAST_UPD_USR,OPP_OFF_SHORE_IND,BIZ_TYPE_CD,MERCHANT_TYPE_CD,MERCHANT_ID,ACCT_STYLE,OPP_ACCT_STYLE,TRANS_IP,RECORD_ENDDATE,         VALIDATE_IND,VALIDATE_IND2)                                                       SELECT C.TRANSACTIONKEY,C.CB_PK,C.TX_NO,C.VOUCHER_NO,C.ORGANKEY,C.TX_DT,                  C.DT_TIME,C.ACCT_NUM,C.PARTY_ID,C.PARTY_CLASS_CD,C.TX_CD,C.CB_TX_CD,                  C.BUS_TYPE_CD,C.TX_TYPE_CD,C.DEBIT_CREDIT,C.RECEIVE_PAY_CD,C.SUBJECTNO,               C.CURRENCY_CD,C.CURR_CD,C.AMT,C.CNY_AMT,C.USD_AMT,C.AMT_VAL,                          C.CASH_TRANS_FLAG,C.REMIT_TYPE_CD,C.DES,C.OVERAREA_IND,C.SETTLE_TYPE_CD,              C.USE_DES,C.OPP_SYS_ID,C.OPP_ISPARTY,C.OPP_AREA,C.OPP_ORGAN_TYPE,                     C.OPP_ORGANKEY,C.OPP_ORGANNAME,C.OPP_PARTY_ID,C.OPP_NAME,C.OPP_ACCT_NUM,              C.OPP_TX_DT,C.OPP_ACCT_TYPE_CD,C.OPP_CARD_TYPE,C.OPP_CARD_NO,                         C.OPP_PARTY_CLASS_CD,C.CANCEL_IND,C.AMT_CD,C.BATCH_IND,C.TELLER,C.RE_IND,             '1',C.PARTY_CHN_NAME,C.ADDTIONAL,C.RE_DT,C.TX_DIRECT,                                 C.TOKEN_NO,C.HOST_CUST_ID,C.CHANNEL,C.CAL_IND,C.RULE_IND,C.TEMP1,                     C.OPP_COUNTRY,C.TSCTKEY,C.TX_GO_COUNTRY,C.TX_GO_AREA,C.TX_OCCUR_COUNTRY,              C.TX_OCCUR_AREA,C.AGENT_NAME,C.AGENT_CARD_TYPE,C.AGENT_CARD_NO,                       C.AGENT_COUNTRY,C.ORG_TRANS_RELA,C.CASH_IND,C.OPP_PBC_PARTY_CLASS_CD,                 C.CHECK_TELLER,C.LAST_UPD_USR,C.OPP_OFF_SHORE_IND,C.BIZ_TYPE_CD,MERCHANT_TYPE_CD,MERCHANT_ID,ACCT_STYLE,OPP_ACCT_STYLE,TRANS_IP,B.ENDDATE,   ";

    if (alert_type.equals("DE"))
      sql = sql + " '2','' ";
    else {
      sql = sql + " '','2' ";
    }
    sql = sql + "  FROM T47_TRANSACTION C, T47_TRANS_MID1 B " + 
      "  WHERE C.TRANSACTIONKEY =B.TRANSACTIONKEY    " + 
      "   UNION " + 
      "   SELECT C.TRANSACTIONKEY,C.CB_PK,C.TX_NO,C.VOUCHER_NO,C.ORGANKEY,C.TX_DT,           " + 
      "       C.DT_TIME,C.ACCT_NUM,C.PARTY_ID,C.PARTY_CLASS_CD,C.TX_CD,C.CB_TX_CD,           " + 
      "       C.BUS_TYPE_CD,C.TX_TYPE_CD,C.DEBIT_CREDIT,C.RECEIVE_PAY_CD,C.SUBJECTNO,        " + 
      "       C.CURRENCY_CD,C.CURR_CD,C.AMT,C.CNY_AMT,C.USD_AMT,C.AMT_VAL,                   " + 
      "       C.CASH_TRANS_FLAG,C.REMIT_TYPE_CD,C.DES,C.OVERAREA_IND,C.SETTLE_TYPE_CD,       " + 
      "       C.USE_DES,C.OPP_SYS_ID,C.OPP_ISPARTY,C.OPP_AREA,C.OPP_ORGAN_TYPE,              " + 
      "       C.OPP_ORGANKEY,C.OPP_ORGANNAME,C.OPP_PARTY_ID,C.OPP_NAME,C.OPP_ACCT_NUM,       " + 
      "       C.OPP_TX_DT,C.OPP_ACCT_TYPE_CD,C.OPP_CARD_TYPE,C.OPP_CARD_NO,                  " + 
      "       C.OPP_PARTY_CLASS_CD,C.CANCEL_IND,C.AMT_CD,C.BATCH_IND,C.TELLER,C.RE_IND,      " + 
      "       '1',C.PARTY_CHN_NAME,C.ADDTIONAL,C.RE_DT,C.TX_DIRECT,                          " + 
      "       C.TOKEN_NO,C.HOST_CUST_ID,C.CHANNEL,C.CAL_IND,C.RULE_IND,C.TEMP1,              " + 
      "       C.OPP_COUNTRY,C.TSCTKEY,C.TX_GO_COUNTRY,C.TX_GO_AREA,C.TX_OCCUR_COUNTRY,       " + 
      "       C.TX_OCCUR_AREA,C.AGENT_NAME,C.AGENT_CARD_TYPE,C.AGENT_CARD_NO,                " + 
      "       C.AGENT_COUNTRY,C.ORG_TRANS_RELA,C.CASH_IND,C.OPP_PBC_PARTY_CLASS_CD,          " + 
      "       C.CHECK_TELLER,C.LAST_UPD_USR,C.OPP_OFF_SHORE_IND,C.BIZ_TYPE_CD,MERCHANT_TYPE_CD,MERCHANT_ID,ACCT_STYLE,OPP_ACCT_STYLE,TRANS_IP,B.ENDDATE,   ";
    if (alert_type.equals("DE"))
      sql = sql + " '2','' ";
    else {
      sql = sql + " '','2' ";
    }
    sql = sql + "  FROM T47_TRANSACTION_UH C, T47_TRANS_MID1 B " + 
      "  WHERE C.TRANSACTIONKEY =B.TRANSACTIONKEY    ";

    count = SQLExecute.exeSql(conn, sql);
    logger.info("插入T47_transaction_uc表记录" + count + "个");

    conn.commit();

    sql = " UPDATE T47_TRANSACTION_UC C SET ";
    if (alert_type.equals("DE"))
      sql = sql + " C.VALIDATE_IND='2'";
    else {
      sql = sql + " C.VALIDATE_IND2='2'";
    }
    sql = sql + "  WHERE C.TRANSACTIONKEY IN(SELECT B.TRANSACTIONKEY  " + 
      "          FROM t47_trans_valiste_mid B)          ";

    if (alert_type.equals("DE"))
      sql = sql + " AND (C.VALIDATE_IND IS NULL OR C.VALIDATE_IND='')";
    else {
      sql = sql + " AND (C.VALIDATE_IND2 IS NULL OR C.VALIDATE_IND2='')";
    }
    count = SQLExecute.exeSql(conn, sql);
    logger.info("更新T47_transaction_uc表VALIDATE_IND记录" + count + "个");

    sql = " UPDATE T47_TRANSACTION_UC C SET C.HANDLE_STATUS_CD='1'";
    sql = sql + "  WHERE C.TRANSACTIONKEY IN(SELECT B.TRANSACTIONKEY  " + 
      "          FROM t47_trans_valiste_mid B)    AND   C.HANDLE_STATUS_CD='4'    ";

    count = SQLExecute.exeSql(conn, sql);
    logger.info("更新T47_transaction_uc表HANDLE_STATUS_CD记录" + count + "个");
    return count;
  }

  public int insertT47_party_uc(Connection conn, String statisdate) throws Exception {
    String sql = "INSERT INTO T47_PARTY_UC (PARTY_ID,HOST_CUST_ID,PARTY_CLASS_CD,AML2_TYPE_CD,PARTY_CHN_NAME, CARD_TYPE,CARD_NO,COUNTRY_CD,ADDR1,TEL_NO,CELL_NO,EMAIL_ADDR,ORGANKEY) SELECT DISTINCT T.PARTY_ID,T.HOST_CUST_ID,T.PARTY_CLASS_CD,T.AML2_TYPE_CD, T.PARTY_CHN_NAME,T.CARD_TYPE,T.CARD_NO,T.COUNTRY_CD,T.ADDR1, T.TEL_NO,T.CELL_NO,T.EMAIL_ADDR,T.ORGANKEY FROM T47_PARTY T, (select PARTY_ID from (SELECT distinct PARTY_ID from T07_CASE_PARTY where CASE_DATE = " + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd") + " ) M " + 
      "where NOT EXISTS (SELECT 'A' FROM T47_PARTY_UC C  WHERE M.PARTY_ID = C.PARTY_ID) ) B " + 
      "WHERE T.PARTY_ID = B.PARTY_ID ";

    int count = SQLExecute.exeSql(conn, sql);
    logger.info("插入T47_party_uc表记录" + count + "个");
    return count;
  }
  public int updateT47_party_uc_ky(Connection conn, String statisdate) throws Exception {
    String sql = "UPDATE T47_PARTY_UC T    SET T.VALIDATE_IND2 = '2'  WHERE EXISTS (SELECT 'X'                  FROM T07_CASE_PARTY B                 WHERE B.PARTY_ID = T.PARTY_ID  AND B.CASE_TYPE='2'                  AND B.CASE_DATE = " + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
      "                  ) " + 
      "   AND (T.VALIDATE_IND2 IS NULL OR T.VALIDATE_IND2 = '') ";
    int count = SQLExecute.exeSql(conn, sql);
    logger.info("更新T47_party_uc表可疑记录" + count + "个");
    return count;
  }
  public int updateT47_party_uc_de(Connection conn, String statisdate) throws Exception {
    String sql = "UPDATE T47_PARTY_UC T    SET T.VALIDATE_IND = '2'  WHERE EXISTS (SELECT 'X'                  FROM T07_CASE_PARTY B                 WHERE B.PARTY_ID = T.PARTY_ID AND B.CASE_TYPE='1'                   AND B.CASE_DATE = " + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
      "                  ) " + 
      "   AND (T.VALIDATE_IND IS NULL OR T.VALIDATE_IND = '') ";
    int count = SQLExecute.exeSql(conn, sql);
    logger.info("插入T47_party_uc表记录" + count + "个");
    return count;
  }
  public int insertT07_case_party(Connection conn, String statisdate) throws Exception {
    String sql = "INSERT INTO T07_CASE_PARTY  (APPLICATION_NUM,PARTY_ID,STATUS_CD,CASE_DATE,CASE_TYPE)  (SELECT A.APPLICATION_NUM,A.PARTY_ID,'0',A.CASE_DATE,'1'  FROM T07_CASE_STCR_DE A WHERE A.CASE_DATE=" + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
      " UNION " + 
      " SELECT A.APPLICATION_NUM,A.PARTY_ID,'0',A.CASE_DATE ,'2'" + 
      " FROM T07_CASE_STCR_KY A" + 
      " WHERE A.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd") + ")";
    int count = SQLExecute.exeSql(conn, sql);
    logger.info("插入T47_case_party表记录" + count + "个");
    return count;
  }

  public int insertT47_trans_valiste_mid(Connection conn, String alerttype, String statisdate) throws Exception {
    String sql = "insert into t47_trans_valiste_mid(transactionkey,VALIDATE_IND,VALIDATE_IND2)  SELECT distinct B.TRANSACTIONKEY,'','' FROM  T07_CASE_TRANSACTION_" + 
      alerttype + " B" + 
      "  WHERE exists (select 1 from t47_transaction_uc U where B.Transactionkey=U.Transactionkey) " + 
      " AND B.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");

    int count = SQLExecute.exeSql(conn, sql);
    logger.info("插入T47_trans_valiste_mid表记录" + count + "个");
    return count;
  }

  public int updateT07_DECase_Status(Connection conn, String flag, String statisdate) throws Exception
  {
    int count = 0;
    if (!flag.equals("1")) {
      String sql = "UPDATE T07_CASE_APPLICATION SET APP_STATE_CD='2' WHERE CAST_TYPE='1' AND IS_MENU='0'  AND CASE_DATE=" + 
        this.func.vch2dt(statisdate, "yyyy-mm-dd");
      count = SQLExecute.exeSql(conn, sql);
    }

    return count;
  }

  public int updateT07_IsStaff(Connection conn, String flag, String statisdate) throws Exception
  {
    int count = 0;
    if (flag.equals("1"))
    {
      String sql = "UPDATE T07_CASE_APPLICATION A SET A.ISSTAFF='1' WHERE EXISTS (SELECT 'X' FROM T07_STAFFLIST_INFO B WHERE B.PARTY_ID=A.PARTY_ID AND B.ISCHECK='1'  AND B.ISUSE='0') AND   A.CASE_DATE=" + 
        this.func.vch2dt(statisdate, "yyyy-mm-dd");
      count = SQLExecute.exeSql(conn, sql);
      logger.debug("更新是否员工案例标志1::" + count);
      sql = "UPDATE T07_CASE_APPLICATION A SET A.ISSTAFF='0' WHERE  A.ISSTAFF IS NULL AND   A.CASE_DATE=" + 
        this.func.vch2dt(statisdate, "yyyy-mm-dd");
      count = SQLExecute.exeSql(conn, sql);
      logger.debug("更新是否员工案例标志0::" + count);
    }

    return count;
  }

  public int updateT07_IsGrey(Connection conn, String flag, String statisdate) throws Exception
  {
    int count = 0;

    String sql = "UPDATE T07_CASE_APPLICATION A SET A.is_grey='1' WHERE EXISTS (SELECT 'X' FROM T07_GREYLIST_INFO B WHERE B.PARTY_ID=A.PARTY_ID AND B.ISCHECK='1' AND B.ISUSE='0') AND   A.CASE_DATE=" + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd");
    count = SQLExecute.exeSql(conn, sql);
    logger.debug("更新是否员工案例标志1::" + count);
    sql = "UPDATE T07_CASE_APPLICATION A SET A.is_grey='0' WHERE  A.is_grey IS NULL AND  A.CASE_DATE=" + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd");
    count = SQLExecute.exeSql(conn, sql);
    logger.debug("更新是否灰名单案例标志::" + count);

    return count;
  }

  public int updateT07_IsWrite(Connection conn, String flag, String statisdate) throws Exception {
    int count = 0;
    if (flag.equals("1"))
    {
      String sql = "UPDATE T07_CASE_APPLICATION A SET A.IS_MENU='1' WHERE EXISTS (SELECT 'X' FROM t07_whitelist_info B WHERE B.PARTY_ID=A.PARTY_ID AND B.ISCHECK='1' AND B.ISUSE='0' )   AND   A.CASE_DATE=" + 
        this.func.vch2dt(statisdate, "yyyy-mm-dd");
      count = SQLExecute.exeSql(conn, sql);

      sql = "UPDATE T07_CASE_APPLICATION A SET A.APP_STATE_CD='4',A.IS_DELFLAG='1'  WHERE A.IS_MENU='1' AND A.CAST_TYPE='1' AND DATE_STATUS_CD='2'  AND EXISTS (SELECT 'X' FROM t07_whitelist_info B WHERE B.PARTY_ID=A.PARTY_ID AND B.ISCHECK='1' AND B.ISUSE='0' and b.RULE_TYPE in('1','3') )   AND   A.CASE_DATE=" + 
        this.func.vch2dt(statisdate, "yyyy-mm-dd");
      count = SQLExecute.exeSql(conn, sql);
    }

    return count;
  }

  public int delT07_mid_alert_trans(Connection conn, String type) throws Exception {
    String sql = "delete  from  T07_MID_ALERT_TRANS a where a.type='" + type + "' ";

    int count = SQLExecute.exeSql(conn, sql);

    return count;
  }

  public int insertT07_mid_alert_trans(Connection conn, String statisticdate) throws Exception
  {
    String sql = "insert into T07_MID_ALERT_TRANS(alertkey,INSTRTYPE,ALERT_TYPE, OBJKEY,OBJPARTY_ID, ORGANKEY, PARTY_ID,ACCT_NUM, STCR,TRANSACTIONKEY,CURR_CD,STATUS_CD,ALERT_DT,INVALIDATE_DT,TRANS_AMT)  select alertkey, '2', A.ALERTTYPE,A.OBJPARTY_ID,A.OBJPARTY_ID,'N',A.PARTY_ID,A.ACCT_NUM,A.STCR,A.TRANSACTIONKEY,'1','1',a.alert_dt,a.alert_dt,a.trans_amt from  T07_MALERTTRAN_KY_TEMP A  where a.STATUS_CD='1' and a.alert_dt<=" + 
      this.func.vch2dt(statisticdate, "yyyy-mm-dd");

    int count = SQLExecute.exeSql(conn, sql);

    return count;
  }

  public int updateT07_mid_alert_trans(Connection conn, String transcount, String flag) throws Exception
  {
    int count = 0;
    if (flag.equals("1")) {
      String sql = this.func.deleteTable("t07_mid_case_trans_ky_temp");
      count = SQLExecute.exeSql(conn, sql);
      sql = " insert into t07_mid_case_trans_ky_temp(organkey)  select b.organkey from T07_MID_ALERT_TRANS b where b.INSTRTYPE='1' and b.alert_type='1' group by b.organkey having count(b.transactionkey)<=" + 
        transcount;

      count = SQLExecute.exeSql(conn, sql);

      sql = "update T07_MID_ALERT_TRANS a set a.STATUS_CD='1'  where exists (select 'X' from t07_mid_case_trans_ky_temp b where b.organkey=a.organkey  ) and a.INSTRTYPE='1' and a.alert_type='1'";

      count = SQLExecute.exeSql(conn, sql);
    }

    return count;
  }

  public int insertT07_mid_alert_trans1(Connection conn, String statisticdate) throws Exception
  {
    String sql = "insert into T07_MID_ALERT_TRANS(alertkey,INSTRTYPE,ALERT_TYPE, OBJKEY,OBJPARTY_ID, ORGANKEY, PARTY_ID,ACCT_NUM, STCR,TRANSACTIONKEY,CURR_CD,STATUS_CD,ALERT_DT,INVALIDATE_DT,TRANS_AMT)  select alertkey, '3', A.ALERTTYPE,A.OBJKEY,A.OBJPARTY_ID,'N',A.PARTY_ID,A.ACCT_NUM,A.STCR,A.TRANSACTIONKEY,'1','1',a.alert_dt,a.alert_dt,a.trans_amt from  T07_MALERTTRAN_KY_TEMP2 A  where STATUS_CD='1' and a.alert_dt<=" + 
      this.func.vch2dt(statisticdate, "yyyy-mm-dd");

    int count = SQLExecute.exeSql(conn, sql);

    return count;
  }

  public void updateApplicationEndDate(Connection conn, String statisdate) throws Exception {
    HashMap mapvalue = new HashMap();
    CaseBO caseBo = new CaseBO();

    mapvalue = getT07_InterfaceList(conn);
    ArrayList list = new ArrayList();

    String sql = "SELECT  distinct CAST_TYPE, CASE_TRAN_MAXDATE from t07_case_application where DATE_STATUS_CD='2' and case_date=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");
    ArrayList list1 = SQLExecute.executeQuery(conn, sql);

    for (int i = 0; i < list1.size(); i++) {
      TreeMap map = (TreeMap)list1.get(i);
      String alert_type = (String)map.get("CAST_TYPE");
      String alert_dt = (String)map.get("CASE_TRAN_MAXDATE");
      if (alert_dt.length() > 10) alert_dt = alert_dt.substring(0, 10);
      String intertype = "BS";
      if (alert_type.equals("1")) intertype = "BH";
      String validate_k = caseBo.getValiddt(conn, alert_dt, (String)mapvalue.get(intertype));
      sql = "UPDATE T07_case_application T             SET T.CASE_END_DATE= " + 
        this.func.vch2dt(validate_k, "yyyy-mm-dd") + 
        " WHERE T.CASE_TRAN_MAXDATE=" + this.func.vch2dt(alert_dt, "yyyy-mm-dd") + " and T.CAST_TYPE='" + alert_type + "'" + 
        "  AND T.case_date=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");
      list.add(sql);
    }

    SQLExecute.exeStatementBatch(conn, list);
  }

  public HashMap getT07_InterfaceList(Connection conn)
    throws SQLException
  {
    String query = "SELECT INTER.INTERFACEKEY,INTER.VALID_TERM FROM T07_INTERFACE INTER";
    logger.debug(query);
    HashMap map;
    try {
      map = SQLExecute.executeQueryHash(conn, query);
    }
    catch (SQLException sqle)
    {
      sqle.printStackTrace();
      throw sqle;
    }
    return map;
  }

  public void insertT07_case_module(Connection conn, String alert_type, String statisdate) throws Exception
  {
    String sql = "update  T07_CASE_NET_INDIC a set stcr=(select b.pbckey from t21_rule b where b.rulekey=a.rulekey )where A.CASE_DATE=" + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd");
    int count = SQLExecute.exeSql(conn, sql);

    sql = "update  T07_CASE_NET_INDIC A set A.application_num=(select b.APPLICATION_NUM from T07_CASE_APPLICATION B where b.OBJKEY=a.objkey AND  B.CASE_DATE=" + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
      ")  WHERE exists(select 'x' from T07_CASE_APPLICATION c where c.objkey=a.objkey and c.CASE_DATE = " + this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
      " ) and A.application_num='N' and  A.CASE_DATE<=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");
    count = SQLExecute.exeSql(conn, sql);

    sql = " insert into T07_CASE_MODEL(APPLICATION_NUM,MODEL_NO,MATCHING,case_date)   select  e.application_num,e.module_no,sum(e.stcrscore) as stcrcount," + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
      " from( select  a.application_num,b.module_no,a.stcr,b.stcrscore" + 
      " from t07_case_stcr_" + alert_type + "  a,T23_MODULE_STCR b               " + 
      " where a.stcr=b.keystcr    AND A.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
      " union select  a.application_num,b.module_no,a.stcr,b.stcrscore" + 
      " from  T07_CASE_NET_INDIC  a,T23_MODULE_STCR b               " + 
      " where a.stcr=b.keystcr and a.application_num!='N'   AND A.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
      " ) e   group by e.application_num,e.module_no            ";

    count = SQLExecute.exeSql(conn, sql);
    conn.commit();

    sql = "update t47_transaction_uc t set t.handle_status_cd='4'  where not exists(select 'x' from t07_case_transaction t1 where t1.transactionkey=t.transactionkey   and t1.status_cd='1' and t1.case_date=" + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
      ") and  exists(select 'x' from t07_case_transaction_de t1 where t1.transactionkey=t.transactionkey" + 
      "             and t1.status_cd='4'  and t1.case_date=" + this.func.vch2dt(statisdate, "yyyy-mm-dd") + ")";
    count = SQLExecute.exeSql(conn, sql);

    conn.commit();
  }

  public void update07_case_actiondes(Connection conn) throws Exception
  {
    String dbtype = SysConfig.getProperty("database.dbtype");
    String substr = "substr(action_descrip,1,250)";
    String wherestr = " lengthb(action_descrip)>500";
    if ((dbtype != null) && (dbtype.toLowerCase().equals("db2"))) {
      substr = "substr(action_descrip,1,500)";
      wherestr = " length(action_descrip)>500";
    }

    String sql = "update  T07_CASE_APP_TEMP a set action_descrip=" + substr + 
      " where " + wherestr;
    int count = SQLExecute.exeSql(conn, sql);
  }

  public boolean huifCase(Connection conn) throws Exception
  {
    ArrayList list = new ArrayList();
    String sql = "";
    sql = this.func.deleteTable("T07_MID_CASE_PC");
    list.add(sql);

    sql = "INSERT INTO T07_MID_CASE_PC(application_num,transactionkey,party_id,acct_num,case_type) select a.application_num ,B.transactionkey,A.party_id, A.acct_num,'2' from T07_CASE_STCR_KY_UH a left join t07_case_transaction_ky_UH b on (a.application_num=b.application_num AND A.PARTY_ID=B.PARTY_ID AND A.ACCT_NUM=B.ACCT_NUM ) where EXISTS(SELECT 'X' FROM T07_CASE_APPLICATION_UH C  WHERE C.APPLICATION_NUM = A.APPLICATION_NUM AND C.CAST_TYPE='2' AND C.APP_STATE_CD = '8') union  select a.application_num ,b.transactionkey,A.party_id, A.acct_num,'1' from T07_CASE_STCR_DE_UH a left join t07_case_transaction_de_UH b on (a.application_num=b.application_num AND A.PARTY_ID=B.PARTY_ID AND A.ACCT_NUM=B.ACCT_NUM ) where EXISTS(SELECT 'X' FROM T07_CASE_APPLICATION_UH C  WHERE C.APPLICATION_NUM = A.APPLICATION_NUM AND C.CAST_TYPE='1' AND C.APP_STATE_CD = '8')";

    list.add(sql);

    sql = "INSERT INTO T07_CASE_APPLICATION     (APPLICATION_NUM,RECHECK_NUM,FLOW_ID,APP_DT,APP_ORG_ID,             CASE_NAME,CAST_TYPE,CASE_KIND,CASE_LEVEL,CASE_DATE,                PARTY_ID,PARTY_NAME,APP_STATE_CD,DATE_STATUS_CD,                   LAST_UPD_DT,LAST_UPD_USER,APP_CASE_REASON,CASE_TRAN_MINDATE,       CASE_TRAN_MAXDATE,CASE_END_DATE,CURR_CD,PARTY_CLASS_CD,            TAKE_ACTION,ACTION_DESCRIP,ALERT_LEVEL,VALIDATE_IND,POST_ID,NODE_ID,IS_MENU,ISSTAFF,IS_GREY,TRAN_COUNT,TRAN_AMT,APPLICATION_ADVICE,OBJKEY)            SELECT       R.APPLICATION_NUM,R.RECHECK_NUM,R.FLOW_ID,R.APP_DT,R.APP_ORG_ID,          R.CASE_NAME,R.CAST_TYPE,R.CASE_KIND,R.CASE_LEVEL,R.CASE_DATE,             R.PARTY_ID,R.PARTY_NAME,'1','1',                  R.LAST_UPD_DT,R.LAST_UPD_USER,R.APP_CASE_REASON,R.CASE_TRAN_MINDATE,      R.CASE_TRAN_MAXDATE,R.CASE_END_DATE,R.CURR_CD,R.PARTY_CLASS_CD,           R.TAKE_ACTION,R.ACTION_DESCRIP,R.ALERT_LEVEL,R.VALIDATE_IND,R.POST_ID,R.NODE_ID,R.IS_MENU,ISSTAFF,IS_GREY,R.TRAN_COUNT,R.TRAN_AMT,R.APPLICATION_ADVICE,R.OBJKEY     FROM T07_CASE_APPLICATION_UH R       WHERE EXISTS   (SELECT 'X' FROM T07_MID_CASE_PC TT                       WHERE R.APPLICATION_NUM = TT.APPLICATION_NUM ) ";

    list.add(sql);

    sql = "DELETE FROM T07_APP_MOVEFATE_UH R       WHERE EXISTS   (SELECT 'X' FROM T07_MID_CASE_PC TT                       WHERE R.APPLICATION_NUM = TT.APPLICATION_NUM ) ";

    list.add(sql);

    sql = " INSERT INTO T07_CASE_TRANSACTION_KY(APPLICATION_NUM,TRANSACTIONKEY,STATUS_CD,STCR,PARTY_ID,ACCT_NUM,CASE_DATE,DEALADVISE)  SELECT R.APPLICATION_NUM,R.TRANSACTIONKEY,'1',R.STCR,R.PARTY_ID,R.ACCT_NUM,R.CASE_DATE,DEALADVISE  FROM T07_CASE_TRANSACTION_KY_UH R        WHERE EXISTS   (SELECT 'X' FROM T07_MID_CASE_PC TT                       WHERE R.APPLICATION_NUM = TT.APPLICATION_NUM AND TT.CASE_TYPE='2' ) ";

    list.add(sql);

    sql = " INSERT INTO T07_CASE_TRANSACTION_DE(APPLICATION_NUM,TRANSACTIONKEY,STATUS_CD,STCR,PARTY_ID,ACCT_NUM,CASE_DATE,DEALADVISE)  SELECT R.APPLICATION_NUM,R.TRANSACTIONKEY,'1',R.STCR,R.PARTY_ID,R.ACCT_NUM,R.CASE_DATE,DEALADVISE  FROM T07_CASE_TRANSACTION_DE_UH R        WHERE EXISTS   (SELECT 'X' FROM T07_MID_CASE_PC TT                       WHERE R.APPLICATION_NUM = TT.APPLICATION_NUM AND TT.CASE_TYPE='1' ) ";

    list.add(sql);

    sql = " DELETE FROM  T07_CASE_TRANSACTION_KY_UH R      WHERE EXISTS   (SELECT 'X' FROM T07_MID_CASE_PC TT                       WHERE R.APPLICATION_NUM = TT.APPLICATION_NUM AND TT.CASE_TYPE='2' )  ";

    list.add(sql);

    sql = " DELETE FROM  T07_CASE_TRANSACTION_DE_UH R      WHERE EXISTS   (SELECT 'X' FROM T07_MID_CASE_PC TT                       WHERE R.APPLICATION_NUM = TT.APPLICATION_NUM AND TT.CASE_TYPE='1' )  ";

    list.add(sql);

    sql = " INSERT INTO T07_CASE_STCR_KY(APPLICATION_NUM,PARTY_ID,ACCT_NUM,STCR,STATUS,CASE_DATE) SELECT R.APPLICATION_NUM,R.PARTY_ID,R.ACCT_NUM,R.STCR,'1',R.CASE_DATE FROM T07_CASE_STCR_KY_UH R      WHERE EXISTS   (SELECT 'X' FROM T07_MID_CASE_PC TT                       WHERE R.APPLICATION_NUM = TT.APPLICATION_NUM AND TT.CASE_TYPE='2' ) ";

    list.add(sql);

    sql = " INSERT INTO T07_CASE_STCR_DE(APPLICATION_NUM,PARTY_ID,ACCT_NUM,STCR,STATUS,CASE_DATE) SELECT R.APPLICATION_NUM,R.PARTY_ID,R.ACCT_NUM,R.STCR,'1',R.CASE_DATE FROM T07_CASE_STCR_DE_UH R      WHERE EXISTS   (SELECT 'X' FROM T07_MID_CASE_PC TT                       WHERE R.APPLICATION_NUM = TT.APPLICATION_NUM AND TT.CASE_TYPE='1' ) ";

    list.add(sql);

    sql = " DELETE FROM T07_CASE_STCR_KY_UH  R        WHERE EXISTS   (SELECT 'X' FROM T07_MID_CASE_PC TT                       WHERE R.APPLICATION_NUM = TT.APPLICATION_NUM   AND TT.CASE_TYPE='2') ";

    list.add(sql);

    sql = " DELETE FROM T07_CASE_STCR_DE_UH  R        WHERE EXISTS   (SELECT 'X' FROM T07_MID_CASE_PC TT                       WHERE R.APPLICATION_NUM = TT.APPLICATION_NUM   AND TT.CASE_TYPE='1') ";

    list.add(sql);

    sql = "DELETE FROM T07_CASE_APPLICATION_UH R       WHERE EXISTS   (SELECT 'X' FROM T07_MID_CASE_PC TT                       WHERE R.APPLICATION_NUM = TT.APPLICATION_NUM ) ";

    list.add(sql);

    sql = "INSERT INTO T47_TRANSACTION_UC (TRANSACTIONKEY,CB_PK,TX_NO,VOUCHER_NO,ORGANKEY,TX_DT,DT_TIME,ACCT_NUM, PARTY_ID,PARTY_CLASS_CD,TX_CD,CB_TX_CD,BUS_TYPE_CD,TX_TYPE_CD,DEBIT_CREDIT,RECEIVE_PAY_CD, SUBJECTNO,CURRENCY_CD,CURR_CD,AMT,CNY_AMT,USD_AMT,AMT_VAL,CASH_TRANS_FLAG,REMIT_TYPE_CD,DES, OVERAREA_IND,SETTLE_TYPE_CD,USE_DES,OPP_SYS_ID,OPP_ISPARTY,OPP_AREA,OPP_ORGAN_TYPE,OPP_ORGANKEY, OPP_ORGANNAME,OPP_PARTY_ID,OPP_NAME,OPP_ACCT_NUM,OPP_TX_DT,OPP_ACCT_TYPE_CD,OPP_CARD_TYPE, OPP_CARD_NO,OPP_PARTY_CLASS_CD,CANCEL_IND,AMT_CD,BATCH_IND,TELLER,RE_IND,HANDLE_STATUS_CD, PARTY_CHN_NAME,ADDTIONAL,RE_DT,TX_DIRECT,TOKEN_NO,HOST_CUST_ID,CHANNEL,CAL_IND,RULE_IND,TEMP1, OPP_COUNTRY,TSCTKEY,TX_GO_COUNTRY,TX_GO_AREA,TX_OCCUR_COUNTRY,TX_OCCUR_AREA,AGENT_NAME, AGENT_CARD_TYPE,AGENT_CARD_NO,AGENT_COUNTRY,ORG_TRANS_RELA,CASH_IND,OPP_PBC_PARTY_CLASS_CD, CHECK_TELLER,LAST_UPD_USR,OPP_OFF_SHORE_IND,BIZ_TYPE_CD,VALIDATE_IND,VALIDATE_IND2) SELECT   R.TRANSACTIONKEY,R.CB_PK,R.TX_NO,R.VOUCHER_NO,R.ORGANKEY,R.TX_DT,R.DT_TIME,R.ACCT_NUM, R.PARTY_ID,R.PARTY_CLASS_CD,R.TX_CD,R.CB_TX_CD,R.BUS_TYPE_CD,R.TX_TYPE_CD,R.DEBIT_CREDIT,R.RECEIVE_PAY_CD, R.SUBJECTNO,R.CURRENCY_CD,R.CURR_CD,R.AMT,R.CNY_AMT,R.USD_AMT,R.AMT_VAL,R.CASH_TRANS_FLAG,R.REMIT_TYPE_CD,R.DES, R.OVERAREA_IND,R.SETTLE_TYPE_CD,R.USE_DES,R.OPP_SYS_ID,R.OPP_ISPARTY,R.OPP_AREA,R.OPP_ORGAN_TYPE,R.OPP_ORGANKEY, R.OPP_ORGANNAME,R.OPP_PARTY_ID,R.OPP_NAME,R.OPP_ACCT_NUM,R.OPP_TX_DT,R.OPP_ACCT_TYPE_CD,R.OPP_CARD_TYPE, R.OPP_CARD_NO,R.OPP_PARTY_CLASS_CD,R.CANCEL_IND,R.AMT_CD,R.BATCH_IND,R.TELLER,R.RE_IND,'1', R.PARTY_CHN_NAME,R.ADDTIONAL,R.RE_DT,R.TX_DIRECT,R.TOKEN_NO,R.HOST_CUST_ID,R.CHANNEL,R.CAL_IND,R.RULE_IND,R.TEMP1, R.OPP_COUNTRY,R.TSCTKEY,R.TX_GO_COUNTRY,R.TX_GO_AREA,R.TX_OCCUR_COUNTRY,R.TX_OCCUR_AREA,R.AGENT_NAME,  AGENT_CARD_TYPE,R.AGENT_CARD_NO,R.AGENT_COUNTRY,R.ORG_TRANS_RELA,R.CASH_IND,R.OPP_PBC_PARTY_CLASS_CD, R.CHECK_TELLER,R.LAST_UPD_USR,R.OPP_OFF_SHORE_IND,R.BIZ_TYPE_CD,R.VALIDATE_IND,R.VALIDATE_IND2  FROM T47_TRANSACTION R    WHERE NOT EXISTS(SELECT 'X' FROM T47_TRANSACTION_UC T WHERE T.TRANSACTIONKEY=R.TRANSACTIONKEY)     AND   EXISTS   (SELECT 'X' FROM T07_MID_CASE_PC TT                       WHERE R.TRANSACTIONKEY = TT.TRANSACTIONKEY )  UNION SELECT   R.TRANSACTIONKEY,R.CB_PK,R.TX_NO,R.VOUCHER_NO,R.ORGANKEY,R.TX_DT,R.DT_TIME,R.ACCT_NUM, R.PARTY_ID,R.PARTY_CLASS_CD,R.TX_CD,R.CB_TX_CD,R.BUS_TYPE_CD,R.TX_TYPE_CD,R.DEBIT_CREDIT,R.RECEIVE_PAY_CD, R.SUBJECTNO,R.CURRENCY_CD,R.CURR_CD,R.AMT,R.CNY_AMT,R.USD_AMT,R.AMT_VAL,R.CASH_TRANS_FLAG,R.REMIT_TYPE_CD,R.DES, R.OVERAREA_IND,R.SETTLE_TYPE_CD,R.USE_DES,R.OPP_SYS_ID,R.OPP_ISPARTY,R.OPP_AREA,R.OPP_ORGAN_TYPE,R.OPP_ORGANKEY, R.OPP_ORGANNAME,R.OPP_PARTY_ID,R.OPP_NAME,R.OPP_ACCT_NUM,R.OPP_TX_DT,R.OPP_ACCT_TYPE_CD,R.OPP_CARD_TYPE, R.OPP_CARD_NO,R.OPP_PARTY_CLASS_CD,R.CANCEL_IND,R.AMT_CD,R.BATCH_IND,R.TELLER,R.RE_IND,'1', R.PARTY_CHN_NAME,R.ADDTIONAL,R.RE_DT,R.TX_DIRECT,R.TOKEN_NO,R.HOST_CUST_ID,R.CHANNEL,R.CAL_IND,R.RULE_IND,R.TEMP1, R.OPP_COUNTRY,R.TSCTKEY,R.TX_GO_COUNTRY,R.TX_GO_AREA,R.TX_OCCUR_COUNTRY,R.TX_OCCUR_AREA,R.AGENT_NAME,  AGENT_CARD_TYPE,R.AGENT_CARD_NO,R.AGENT_COUNTRY,R.ORG_TRANS_RELA,R.CASH_IND,R.OPP_PBC_PARTY_CLASS_CD, R.CHECK_TELLER,R.LAST_UPD_USR,R.OPP_OFF_SHORE_IND,R.BIZ_TYPE_CD,R.VALIDATE_IND,R.VALIDATE_IND2  FROM T47_TRANSACTION_UH R    WHERE NOT EXISTS(SELECT 'X' FROM T47_TRANSACTION_UC T WHERE T.TRANSACTIONKEY=R.TRANSACTIONKEY)     AND   EXISTS   (SELECT 'X' FROM T07_MID_CASE_PC TT                       WHERE R.TRANSACTIONKEY = TT.TRANSACTIONKEY ) ";

    list.add(sql);

    sql = "  UPDATE T47_TRANSACTION_UC R SET  R.VALIDATE_IND2='2' WHERE R.VALIDATE_IND2 IS NULL      AND   EXISTS   (SELECT 'X' FROM T07_MID_CASE_PC TT                       WHERE R.TRANSACTIONKEY = TT.TRANSACTIONKEY  AND TT.CASE_TYPE='2' ) ";

    list.add(sql);

    sql = "  UPDATE T47_TRANSACTION_UC R SET  R.VALIDATE_IND='2' WHERE R.VALIDATE_IND IS NULL      AND   EXISTS   (SELECT 'X' FROM T07_MID_CASE_PC TT                       WHERE R.TRANSACTIONKEY = TT.TRANSACTIONKEY  AND TT.CASE_TYPE='1' ) ";

    list.add(sql);

    sql = "  UPDATE T47_TRANSACTION_UC R SET  R.HANDLE_STATUS_CD='1' WHERE R.HANDLE_STATUS_CD='4'      AND   EXISTS   (SELECT 'X' FROM T07_MID_CASE_PC TT                       WHERE R.TRANSACTIONKEY = TT.TRANSACTIONKEY ) ";

    list.add(sql);

    sql = "INSERT INTO T47_PARTY_UC (PARTY_ID,HOST_CUST_ID,PARTY_CLASS_CD,AML2_TYPE_CD,PARTY_CHN_NAME, CARD_TYPE,CARD_NO,COUNTRY_CD,ADDR1,TEL_NO,CELL_NO,EMAIL_ADDR,ORGANKEY,VALIDATE_IND2) SELECT  T.PARTY_ID,T.HOST_CUST_ID,T.PARTY_CLASS_CD,T.AML2_TYPE_CD, T.PARTY_CHN_NAME,T.CARD_TYPE,T.CARD_NO,T.COUNTRY_CD,T.ADDR1, T.TEL_NO,T.CELL_NO,T.EMAIL_ADDR,T.ORGANKEY,'2' FROM T47_PARTY T   WHERE NOT EXISTS(SELECT 'X' FROM T47_PARTY_UC T1 WHERE T1.PARTY_ID=T.PARTY_ID)     AND   EXISTS   (SELECT 'X' FROM T07_MID_CASE_PC TT                       WHERE T.PARTY_ID = TT.PARTY_ID ) ";

    list.add(sql);

    sql = "  UPDATE T47_PARTY_UC R SET  R.VALIDATE_IND2='2' WHERE R.VALIDATE_IND2 IS NULL      AND   EXISTS   (SELECT 'X' FROM T07_MID_CASE_PC TT                       WHERE R.PARTY_ID = TT.PARTY_ID AND TT.CASE_TYPE='2' ) ";

    list.add(sql);

    sql = "  UPDATE T47_PARTY_UC R SET  R.VALIDATE_IND='2' WHERE R.VALIDATE_IND IS NULL      AND   EXISTS   (SELECT 'X' FROM T07_MID_CASE_PC TT                       WHERE R.PARTY_ID = TT.PARTY_ID AND TT.CASE_TYPE='1' ) ";

    list.add(sql);

    sql = " INSERT INTO T47_ACCT_UC  (ACCT_NUM, PARTY_ID, AML_ACCT_TYPE_CD, OPEN_DT, CLOSE_DT ,ACCT_FROM ,OP_ORG_NUM )  SELECT DISTINCT A.ACCT_NUM,A.CUSTOMER_ID,A.AML_ACCT_TYPE_CD,A.OPEN_DT,A.CLOSE_DT ,A.ACCT_FROM,A.OP_ORG_NUM   FROM T47_AGREEMENT A  WHERE  NOT EXISTS (SELECT 'A' FROM T47_ACCT_UC UC WHERE UC.ACCT_NUM=A.ACCT_NUM)  AND   EXISTS   (SELECT 'X' FROM T07_MID_CASE_PC TT  WHERE A.ACCT_NUM = TT.ACCT_NUM ) ";

    list.add(sql);
    try
    {
      SQLExecute.exeStatementBatch(conn, list);
    } catch (SQLException e) {
      logger.error("[恢复案例数据] 恢复案例失败!");
      logger.error(e.getMessage());
      e.printStackTrace();
      throw e;
    }
    return true;
  }

  public int updateT47_TRANSACTION(Connection conn, String statisdate)
    throws Exception
  {
    this.func.deleteTable(conn, "t47_trans_valiste_mid");
    String sql = "insert into t47_trans_valiste_mid(transactionkey)  SELECT  DISTINCT B.TRANSACTIONKEY  FROM  T07_CASE_TRANSACTION B WHERE B.STATUS_CD='4' AND  B.CASE_DATE=" + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd");
    int count = SQLExecute.exeSql(conn, sql);

    sql = "UPDATE T47_TRANSACTION_UC A SET  A.HANDLE_STATUS_CD='4'  WHERE EXISTS(SELECT 'X' FROM  (SELECT C.TRANSACTIONKEY  FROM T47_TRANS_VALISTE_MID C LEFT JOIN (SELECT DISTINCT B.TRANSACTIONKEY  FROM  T07_CASE_TRANSACTION B WHERE B.STATUS_CD='1' AND  B.CASE_DATE<>" + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
      ") D ON C.TRANSACTIONKEY=D.TRANSACTIONKEY WHERE D.TRANSACTIONKEY IS NULL)E WHERE E.TRANSACTIONKEY=A.TRANSACTIONKEY)" + 
      " AND (A.VALIDATE_IND IN('0','2') OR A.VALIDATE_IND2 IN('0','2')) AND  A.HANDLE_STATUS_CD='1'";
    count = SQLExecute.exeSql(conn, sql);

    return count;
  }

  public void DealT07_attention_lib(Connection conn, String statisdate) throws Exception
  {
    String sql = "UPDATE T07_CASE_APPLICATION A SET A.APP_STATE_CD='4',A.IS_DELFLAG='1'  WHERE  EXISTS(SELECT 'X' FROM T07_ATTENTION_LIB B WHERE B.PARTY_ID=A.PARTY_ID AND B.STATUS='8'  and B.INVALID_DT>'" + 
      statisdate + "' )" + 
      " AND A.DATE_STATUS_CD='2' AND A.CAST_TYPE='2' AND A.CASE_DATE=" + this.func.vch2dt(statisdate, "yyyy-mm-dd");
    int count = SQLExecute.exeSql(conn, sql);

    this.func.deleteTable(conn, "T07_CASE_APP_MID");
    sql = " INSERT INTO T07_CASE_APP_MID(APPLICATION_NUM) SELECT APPLICATION_NUM FROM ( SELECT APPLICATION_NUM,ROW_NUMBER() OVER(PARTITION BY PARTY_ID ORDER BY CASE_DATE DESC) PK    FROM T07_CASE_APPLICATION T  WHERE EXISTS(SELECT 'X' FROM T07_ATTENTION_LIB B  WHERE B.PARTY_ID=T.PARTY_ID AND B.STATUS='8' AND T.CASE_DATE>B.CREATE_DT  and INVALID_DT='" + 
      statisdate + "' )" + 
      " AND T.DATE_STATUS_CD='2' AND T.CAST_TYPE='2' AND T.APP_STATE_CD='4' AND T.IS_DELFLAG='1' " + 
      " )A  WHERE A.PK=1";
    count = SQLExecute.exeSql(conn, sql);

    sql = "UPDATE T07_CASE_APPLICATION A SET A.APP_STATE_CD='1',A.IS_DELFLAG='0'  WHERE  EXISTS (SELECT 'X' FROM T07_CASE_APP_MID T  WHERE T.APPLICATION_NUM=A.APPLICATION_NUM) ";

    count = SQLExecute.exeSql(conn, sql);

    sql = "UPDATE T07_CASE_STCR_DE A SET A.STATUS='1',A.ACCT_STATUS='1' ,A.PARTY_STATUS='1' WHERE  EXISTS (SELECT 'X' FROM T07_CASE_APP_MID T  WHERE T.APPLICATION_NUM=A.APPLICATION_NUM) ";

    sql = "UPDATE T07_CASE_STCR_KY A SET A.STATUS='1',A.ACCT_STATUS='1' ,A.PARTY_STATUS='1'  WHERE  EXISTS (SELECT 'X' FROM T07_CASE_APP_MID T  WHERE T.APPLICATION_NUM=A.APPLICATION_NUM) ";

    count = SQLExecute.exeSql(conn, sql);

    sql = "UPDATE T07_CASE_TRANSACTION_DE A SET A.STATUS_CD='1' WHERE  EXISTS (SELECT 'X' FROM T07_CASE_APP_MID T  WHERE T.APPLICATION_NUM=A.APPLICATION_NUM) ";

    sql = "UPDATE T07_CASE_TRANSACTION_KY A SET A.STATUS_CD='1' WHERE  EXISTS (SELECT 'X' FROM T07_CASE_APP_MID T  WHERE T.APPLICATION_NUM=A.APPLICATION_NUM) ";

    count = SQLExecute.exeSql(conn, sql);

    this.func.deleteTable(conn, "T47_TRANS_MID1");
    sql = "INSERT INTO T47_TRANS_MID1(TRANSACTIONKEY)SELECT DISTINCT B.TRANSACTIONKEY FROM T07_CASE_TRANSACTION B WHERE                       EXISTS(SELECT 'X' FROM T07_CASE_APP_MID T  WHERE T.APPLICATION_NUM=B.APPLICATION_NUM) ";

    count = SQLExecute.exeSql(conn, sql);

    sql = "UPDATE T47_TRANSACTION_UC A SET A.HANDLE_STATUS_CD='1' WHERE  EXISTS (SELECT 'X' FROM T47_TRANS_MID1 C WHERE C.TRANSACTIONKEY=A.TRANSACTIONKEY)  AND A.HANDLE_STATUS_CD='4'";

    count = SQLExecute.exeSql(conn, sql);
  }

  public void DelStatus(Connection conn, String statisdate)
    throws Exception
  {
    String sql = "UPDATE T07_CASE_STCR_DE A SET A.STATUS='4',A.ACCT_STATUS='4' ,A.PARTY_STATUS='4' WHERE EXISTS (SELECT 'X' FROM T07_CASE_APPLICATION B WHERE B.APPLICATION_NUM=A.APPLICATION_NUM  AND B.APP_STATE_CD='4'   AND B.CAST_TYPE='1' AND A.CASE_DATE=" + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
      " )";
    int count = SQLExecute.exeSql(conn, sql);

    sql = "UPDATE T07_CASE_STCR_KY A SET A.STATUS='4',A.ACCT_STATUS='4' ,A.PARTY_STATUS='4'  WHERE EXISTS (SELECT 'X' FROM T07_CASE_APPLICATION B WHERE B.APPLICATION_NUM=A.APPLICATION_NUM  AND B.APP_STATE_CD='4'   AND B.CAST_TYPE='2' AND A.CASE_DATE=" + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
      " )";
    count = SQLExecute.exeSql(conn, sql);

    sql = "UPDATE T07_CASE_TRANSACTION_DE A SET A.STATUS_CD='4' WHERE EXISTS (SELECT 'X' FROM T07_CASE_APPLICATION B WHERE B.APPLICATION_NUM=A.APPLICATION_NUM  AND B.APP_STATE_CD='4'   AND B.CAST_TYPE='1' AND A.CASE_DATE=" + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
      " )";
    count = SQLExecute.exeSql(conn, sql);

    sql = "UPDATE T07_CASE_TRANSACTION_KY A SET A.STATUS_CD='4' WHERE EXISTS (SELECT 'X' FROM T07_CASE_APPLICATION B WHERE B.APPLICATION_NUM=A.APPLICATION_NUM  AND B.APP_STATE_CD='4'   AND B.CAST_TYPE='2' AND A.CASE_DATE=" + 
      this.func.vch2dt(statisdate, "yyyy-mm-dd") + 
      " )";
    count = SQLExecute.exeSql(conn, sql);
  }
}