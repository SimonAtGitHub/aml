<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.ist.util.StringUtils"%>
<jsp:useBean id="authBean" scope="session" class="com.ist.common.AuthBean"/>
<jsp:useBean id="authorization" class="com.ist.common.Authorization" />
<jsp:useBean id="authBo" class="com.ist.platform.bo.AuthorizationBO" />
<%
    //转移到相应的功能点上 
    authorization = authBean.getAuthToken();
    String go_url = (String)request.getParameter("go_url");
    String modulekey = (String)request.getParameter("modulekey");
    String modulename = (String)request.getParameter("modulename");
    String systemkey = (String)request.getParameter("systemkey");
    authBo.writeSystemLog(authorization,modulekey,modulename) 	;
//    //authorization.writeClickModuleLog(modulekey,modulename);
    //当用户点击“后退”键后，可能会造成页面不刷新，可能导致systemkey没能重新设置
    //因此每次切换url的时候需要验证systemkey是否正确
    //如果不正确需要进行修正。
   // if(!authorization.getT00_group().getSystemkey().equals(systemkey)){
        //不允许操作
//        authorization.setCurrentLoginSystem(systemkey);
//        authBean.setAuthToken(authorization);
  //  }
//    //System.out.println("systemkey = "+authorization.getCurrentLoginSystem());
    if(go_url.indexOf("?")>0){
        go_url = go_url+"&ram="+StringUtils.getRandomString(10);
    }else{
        go_url = go_url+"?ram="+StringUtils.getRandomString(10);
    }
	System.out.println(go_url);
        System.out.println(modulekey);
        System.out.println(modulename);
        System.out.println(systemkey);
    response.sendRedirect(go_url);
%>
