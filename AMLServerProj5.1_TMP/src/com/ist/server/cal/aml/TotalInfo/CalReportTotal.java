package com.ist.server.cal.aml.TotalInfo;

import com.ist.common.LogUtils;
import com.ist.common.database.SQLExecute;
import com.ist.common.properties.SysConfig;
import com.ist.server.cal.BaseCalTask;
import com.ist.server.cal.aml.TotalInfo.bo.TotalReportBO;
import com.ist.server.dto.T18_task_fact;
import java.sql.CallableStatement;
import java.sql.Connection;
import org.apache.log4j.Logger;

public class CalReportTotal extends BaseCalTask
{
  private static Logger logger = LogUtils.getLogger(CalReportTotal.class.getName());
  TotalReportBO reportBo = new TotalReportBO();

  public CalReportTotal(T18_task_fact _t18_task_fact)
  {
    super(_t18_task_fact);
  }

  public void init()
  {
  }

  public boolean delTask(Connection conn) throws Exception
  {
    boolean isSucc = true;
    try {
      String statisticdate = this.t18_task_fact.getStatisticdate();

      int count = this.reportBo.del_T10_CHECKPARTY(conn, statisticdate, "T10_CHECKPARTY_NEW");
      count = this.reportBo.del_T10_CHECKPARTY(conn, statisticdate, "T10_CHECKPARTY_RE");
      count = this.reportBo.del_T10_CHECKPARTY(conn, statisticdate, "T10_CHECKPARTY_RELT");
      count = this.reportBo.del_T07_Table_MID(conn, statisticdate, "T07_USER_IDENTITY_D");
      count = this.reportBo.del_T07_Table_MID(conn, statisticdate, "T07_USER_REIDENTITY_D");
      count = this.reportBo.del_T07_Table_MID1(conn, statisticdate, "T10_PARTY_CRETAL_D");
    }
    catch (Exception e) {
      logger.error(e.getMessage());
      e.printStackTrace();
      isSucc = false;
      throw e;
    }

    return isSucc;
  }

  public boolean isCanExec(Connection _conn) throws Exception
  {
    boolean isSucc = true;

    return isSucc;
  }

  public boolean preTask(Connection _conn) throws Exception
  {
    boolean isSucc = true;

    return isSucc;
  }

  public boolean calTask(Connection conn) throws Exception {
    boolean rs = true;
    try {
      String statisticdate = this.t18_task_fact.getStatisticdate();

      int count = this.reportBo.insert_T10_CHECKPARTY_NEW(conn, statisticdate);

      count = this.reportBo.insert_T10_CHECKPARTY_RE1(conn, statisticdate);
      count = this.reportBo.insert_T10_CHECKPARTY_RE2(conn, statisticdate);
      count = this.reportBo.insert_T10_CHECKPARTY_RE3(conn, statisticdate);
      //by zyd 20181017  ������ʶ����� �����ʶ��Ŀͻ�
        deleteT10_CHECKPARTY_RE_XH(conn,statisticdate);
      //end 
      count = this.reportBo.insert_T07_USER_IDENTITY_D(conn, statisticdate);

      count = this.reportBo.insert_T07_USER_REIDENTITY_D(conn, statisticdate);

      insertTotalData(conn, statisticdate);
    }
    catch (Exception e)
    {
      logger.error(e.getMessage());
      e.printStackTrace();
      rs = false;
      throw e;
    }
    return rs;
  }
  //by zyd 2018-10-17  �ͻ�����ʶ���޳�����
  //����޳��������쳣�������ִ��
 public void deleteT10_CHECKPARTY_RE_XH(Connection conn,String statisticdate){
     	try{
     	logger.info("ִ�пͻ�����ʶ���ȥ�������ͻ�...");
     	String sqlxh="insert into T10_CHECKPARTY_RE_BK(PARTY_ID, RECHECK_TYPE, HOST_CUST_ID, PARTY_CLASS_CD, PARTY_CHN_NAME,"+
     	" CARD_TYPE, CARD_NO, ORGANKEY, PARTY_STATUS_CD, AML1_TYPE_CD, CREATE_DT, CHECK_STATUS, CHECK_REASON)  "+
     	"SELECT PARTY_ID, RECHECK_TYPE, HOST_CUST_ID, PARTY_CLASS_CD, PARTY_CHN_NAME,"+
     	" CARD_TYPE, CARD_NO, ORGANKEY, PARTY_STATUS_CD, AML1_TYPE_CD, CREATE_DT, CHECK_STATUS, CHECK_REASON FROM T10_CHECKPARTY_RE S WHERE" +
     	" EXISTS  (SELECT 1 FROM V47_PARTY_XH H WHERE H.PARTY_ID =S.PARTY_ID ) ";
     	int countTep2=SQLExecute.exeSql(conn, sqlxh);
     	logger.debug("���뱸�ݱ�"+countTep2+"��");    
     	String sqldelxh="DELETE FROM T10_CHECKPARTY_RE S WHERE  " +
     	"EXISTS  (SELECT 1 FROM V47_PARTY_XH H WHERE H.PARTY_ID =S.PARTY_ID )  ";
       	int countTep3=SQLExecute.exeSql(conn, sqldelxh);
       	logger.debug("ɾ���ͻ�����ʶ���"+countTep3+"��");
       	logger.info("ִ�пͻ�����ʶ���ȥ�������ͻ��ɹ�");
     	}catch(Exception e){
     		logger.info("�޳������쳣,�������ִ��");
     		logger.error(e.getMessage());
     	}
     	
     	}
  public boolean insertTotalData(Connection conn, String statisticdate) throws Exception
  {
    boolean isSucc = false;

    CallableStatement calstmt = null;
    try {
      String dbtype = SysConfig.getProperty("database.dbtype");
      String packagecal = "call PKG_AML_REPORT.PROC_AML_REPORT_MAIN(?) ";
      if ((dbtype != null) && (dbtype.toLowerCase().equals("db2"))) {
        packagecal = "call  PROC_AML_REPORT_MAIN(?) ";
      }
      calstmt = conn.prepareCall(packagecal);
      calstmt.setString(1, statisticdate);

      logger.debug("sql:" + packagecal);

      calstmt.executeUpdate();
      conn.commit();

      isSucc = true;
    } catch (Exception e) {
      e.printStackTrace();
      logger.error(e.getMessage());
      throw e;
    } finally {
      try {
        calstmt.close();
      }
      catch (Exception localException1)
      {
      }
    }
    return isSucc; }

  public boolean insertTotalData_138(Connection conn, String statisticdate) throws Exception {
    boolean isSucc = false;

    CallableStatement calstmt = null;
    try {
      String dbtype = SysConfig.getProperty("database.dbtype");
      String packagecal = "call PKG_AML_138.PROC_AML_138_MAIN(?) ";
      if ((dbtype != null) && (dbtype.toLowerCase().equals("db2"))) {
        packagecal = "call  PROC_AML_138_MAIN(?) ";
      }
      calstmt = conn.prepareCall(packagecal);
      calstmt.setString(1, statisticdate);

      logger.debug("sql:" + packagecal);

      calstmt.executeUpdate();
      conn.commit();

      isSucc = true;
    } catch (Exception e) {
      e.printStackTrace();
      logger.error(e.getMessage());
      throw e;
    } finally {
      try {
        calstmt.close();
      }
      catch (Exception localException1)
      {
      }
    }
    return isSucc;
  }

  public boolean finalTask(Connection _conn)
    throws Exception
  {
    boolean isSucc = true;

    return isSucc;
  }

  public boolean finalSubTask(Connection arg0)
    throws Exception
  {
    return false;
  }

  public boolean preSubTask(Connection arg0)
    throws Exception
  {
    return false;
  }

  public static void main(String[] args)
  {
  }
}