package com.ist.common;

/**
 * <p>Title: 杭州联合银行非现场稽核系统</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: 银丰新融</p>
 * @author 稽核项目组
 * @version 1.0
 */
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;


import org.apache.log4j.*;

import com.ibatis.sqlmap.client.SqlMapClient;

import com.ist.aml.report.dto.*;


import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.XMLProperties;
import com.ist.platform.dao.SequenceDAO;
import com.ist.util.DateUtils;
public class BMClient{
	
    /** 程序日志 */
    private static Logger logger = LogUtils.getLogger(BMClient.class.getName()).getLogger("platform");
    /** 系统记录日志 */
    private static Logger cal_logger = LogUtils.getLogger(BMClient.class.getName()).getLogger("alert_cal");

  

   
    /**
     * 说明:构造方法
     */
    public BMClient() {
    }
    
    public ArrayList getT18_OnlineServerList(SqlMapClient sqlMap)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT18_OnlineServerList","");
		if(list==null){
			list=new ArrayList();
		}
		return list;
    }
	 
	 /**
		 * 写入即时计算任务表
		 * @param authorization
		 * @param tasktype
		 * @return
		 */
		 public String insertT18_onlineServer(SqlMapClient sqlMap,Authorization auth,String tasktype,String taskkey,CatchManager cm,XMLProperties sysConfig) throws Exception{   
			 //写入计时计算任务表
				T18_OnlineServer t18_OnlineServer = new T18_OnlineServer();
		
			 try{   
					t18_OnlineServer.setTasktype(tasktype);
					t18_OnlineServer.setTaskkey(taskkey);
					t18_OnlineServer.setExecstatus("1");
					t18_OnlineServer.setCreator(auth.getT00_user().getUsername());
					t18_OnlineServer.setCreatdate(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
					t18_OnlineServer.setEndtime(DateUtils.stringToDateShort("3000-12-31"));
					t18_OnlineServer.setBegintime(DateUtils.stringToDate(DateUtils.getCurrTime()));
					t18_OnlineServer.setLastexecdate(DateUtils.stringToDateShort("3000-12-31"));
					int result = insertT18_onlineServer(sqlMap, t18_OnlineServer);
//					sqlMap.commitTransaction();
					if(result>0){
					  String cmdStr =this.gettask_cmdStr(auth, t18_OnlineServer.getTaskkey(), tasktype,cm);
	                  String str= this.socketConnection(auth,cmdStr,sysConfig);
	                  return str;
					}else {
						return "f";
					}
		        }catch(Exception e){
		            logger.error(e.getMessage());
		            e.printStackTrace();logger.error(e);
		            try{
		              t18_OnlineServer.setExecstatus("9");
		              updateT18_onlineServer(sqlMap, t18_OnlineServer);
		            }catch(Exception ex){
		            	ex.printStackTrace();
		            	logger.error(ex);
		            }
		            return "f";
		        }
		        
		    }
		   /**
			 * 获取taskkey
			 * @param authorization
			 * @param credittask
			 * @return
			 */
	     public String getTaskkey(SqlMapClient sqlMap,XMLProperties sysConfig) throws Exception{
			        String taskkey = "";    
			        try{ 
			        	 String databaseType = sysConfig.getProperty("database.dbtype");
		     		     SequenceDAO sequenceDAO = new SequenceDAO();
			        	 if("sequence".equals(databaseType)){		   
			        		 taskkey = sequenceDAO.getSequenceByDB(sqlMap,"T18_ONLINESERVER_SEQ",sysConfig);  
			        		 taskkey="T"+DateUtils.getDate10to8(DateUtils.dateToStringShort(DateUtils.getCurrDateTime()))+taskkey;
			        	    }else{
			        	    	taskkey = sequenceDAO.getTaskSeq(sqlMap);
			        	    }
			        }catch(Exception e){
			            logger.error(e.getMessage());
			            e.printStackTrace();logger.error(e);
			        }
			        return taskkey;
			    } 
	/**
	 * 根据tasktype获取命令字符串
	 * @param authorization
	 * @param taskkey
	 * @param tasktype
	 * @return
	 */
    public String  gettask_cmdStr(Authorization authorization,String taskkey,String tasktype,CatchManager cm){
    	String username   = authorization.getT00_user().getUsername();
		LinkedHashMap task_cmdMap = cm.getMapFromCache("task_cmd");
		String cmdStr ="<root><cmd>"+(String)task_cmdMap.get(tasktype)+"</cmd><taskkey>" +
		                taskkey+"</taskkey><username>" +
		                username+"</username></root>";
		return cmdStr;
    }
    /**
     * 说明:连接发送
     * @param authorization 认证信息
     * @param cmdStr 命令行
     * @return socketBackover socket服务器返回的信息
     * @throws java.net.SocketException
     * @throws java.net.UnknownHostException
     * @throws java.io.IOException
     * @throws Exception
     */
    public String socketConnection(Authorization authorization,String cmdStr,XMLProperties sysConfig)
            throws java.net.SocketException,java.net.UnknownHostException,java.io.IOException,Exception
    {
        String str="";
        if(cmdStr==null){
            return null;
        }
      String SERVERHOST = sysConfig.getProperty("bm.serverhost");
     int SERVERPORT = Integer.parseInt( sysConfig.getProperty("bm.serverport") );

        java.net.Socket skt = new java.net.Socket(SERVERHOST,SERVERPORT);
        //receive message
        java.io.BufferedReader in =
                new java.io.BufferedReader(
                new java.io.InputStreamReader(
                skt.getInputStream()));
        //output is automatically flushed
        java.io.PrintWriter out =
                new java.io.PrintWriter(
                new java.io.BufferedWriter(
                new java.io.OutputStreamWriter(
                skt.getOutputStream())),true);

        //输出字符串
        out.println(cmdStr);
        //接受字符串
        str = in.readLine();
        logger.debug(cmdStr);
        logger.debug(str);
        out.close();
        in.close();
        skt.close();
        //-----------------日志信息------------------------------------------
        String succStr = "成功提交";
//        if(str==null || str.equals("")){
//            succStr = "失败";
//        }
        String logdes = "";
        logdes+="描述：执行即时计算;"+
                "消息串："+cmdStr;
        String loginfo = " {"+authorization.getIpAddress()+"}"+
                         " {"+authorization.getT00_user().getUsername()+"("+authorization.getT00_user().getUsername()+")}"+
                         " {即时计算}"+
                         " {"+logdes+"}"+
                         " {"+succStr+"}";
        cal_logger.info(loginfo);
        //------------------------------------------------------------------

        return str;
    }
    
    public int insertT18_onlineServer(SqlMapClient sqlMap,
			T18_OnlineServer t18_OnlineServer) throws SQLException {
		int i = sqlMap.update("insertT18_onlineServer", t18_OnlineServer);
		return i;
	}
    
    public int updateT18_onlineServer(SqlMapClient sqlMap,
			T18_OnlineServer t18_OnlineServer) throws SQLException {
		int i = sqlMap.update("updateT18_onlineServer", t18_OnlineServer);
		return i;
	}


    /**
     * 说明:测试方法
     * @param args 参数
     * @throws Exception
     */
    public static void main(String[] args) throws Exception{
        //BMClient sc = new BMClient();
        //String retStr = sc.socketConnection("<root><cmd>TestCmd</cmd><username>hbq</username><param>abs</param></root>");
        //System.out.println(retStr);
    }
}