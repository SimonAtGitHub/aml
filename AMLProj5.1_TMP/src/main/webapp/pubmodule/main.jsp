<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.ist.util.StringUtils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/mainchangeskin.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/YLMarquee-1.1.min.js"></script>


<!--[if lte IE 6]>
<script type="text/javascript">var clear="../js/blank.gif"; </script>
<script type="text/javascript" src="../js/iepngfix.js"></script>
<script type="text/javascript" src="../js/unitpngfix.js"></script>
<![endif]--> 
<script language="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function _Open(url){
    url=url+"&newsearchflag=1&organkey="+document.forms[0].organkey.value+"&organlevel="+document.forms[0].organlevel.value;
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
  //window.open(url);     
}
function _Open1(url){
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
  //window.open(url);     
}
</script>
</head>
<body  class="mainbg">
<html:form action="/main.do" method="post">
<input type="hidden" name="organlevel" value="<bean:write name="organlevel"/>"/>
<input type="hidden" name="organkey" value="<bean:write name="organkey"/>"/>
  <html:errors/>
  <% 
  HashMap map=(HashMap)request.getAttribute("operMap"); 
  HashMap datemap=(HashMap)request.getAttribute("dateMap"); 
  int noHelpCheckAppCount = ((Integer)request.getAttribute("noHelpCheckAppCount")).intValue();
  String root=request.getContextPath();
  if(map!=null){
     for(int i=1;i<=12;i++){
       if(i==7||i==8){
       if(!map.containsKey(i+"1"))
         map.put(i+"1"," ");
         if(!map.containsKey(i+"3"))
         map.put(i+"3"," ");
         if(i==7){
         if(!map.containsKey(i+"2"))
          map.put(i+"2"," ");
         }
       }else{
          if(!map.containsKey(i+""))
           map.put(i+"","");
        }
     }
  }
  %>
<div id="main">
<!-- home_process -->
  <div class="home_title">
    <img src="../images/<%=session.getAttribute("style") %>/icon_do.png" />待办事项
  </div>
  <div class="home_process">
   <table width="98%" border="0" cellspacing="0" cellpadding="0" class="dottedbg">
    <tr>
      <td width="18%" align="center">交易日期: <span><%=datemap.get("1")%></span></td>
     <td width="18%">案例日期: <span><%=datemap.get("2")%></span></td>
     <td width="15%">未协查案例: <span><%=noHelpCheckAppCount%></span></td>
     <td width="25%"> <%=request.getAttribute("organStrDisp")%></td>
      <td width="25%"><a href="#" onclick="_Open('detail_list.do?msg_type=13')">未调整的中，较高，高客户数:<span>
      <%if(map.get("13")==null){
      %>
      0
      <%
      }
      else{
      %>
      
      <%=(String)map.get("13")%>
      <%} %>
      </span></a></td>
    </tr>
   </table>
   <table width="96%" border="0" cellpadding="0" cellspacing="0" id="pc_text" >
	  <tr>
		<td colspan="10" class="pc_title"><img src="../images/<%=session.getAttribute("style") %>/pc01.png" />正常数据处理</td>
	  </tr>
	  <tr>
		<td width="20%" valign="middle">数据完善</td>
		<td width="4%" height="22">&nbsp;</td>
		<td width="40%"><div class="pc_but">案例处理</div></td>
		<td width="4%">&nbsp;</td>
		<td>&nbsp;</td>
		<td width="4%">&nbsp;</td>
		<td width="4%">&nbsp;</td>
		<td>&nbsp;</td>
		<td width="4%">&nbsp;</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr>
	    <td valign="middle"><div class="pc_k pc_textsmall"><a href="<%=root%>/report/transaction/t47_alert_transaction_list.do?searchtype=today">一次交易补录 &nbsp;<span><%=StringUtils.null2String((String)map.get("1"))%></span></a><br/>
	     <a href="<%=root%>/report/case/t47_transaction_SE_List1.do">二次交易补录&nbsp;<span><%=StringUtils.null2String((String)map.get("21"))%></span></a><br/>
	      <a href="<%=root%>/report/case/t47_party_uc_list.do?newsearchflag=1">客户信息补录<span><%=StringUtils.null2String((String)map.get("31"))%></span></a><br/>
        </div></td>
		<td valign="middle"><img src="../images/<%=session.getAttribute("style") %>/pc_arrow.gif" /></td>
		<td valign="middle" class="pc_butarrow"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="pc_k">
          <tr>
            <td>
            <span><%=(String)map.get("71")%></span>
            </td>
            <td width="10%" rowspan="2"><img src="../images/<%=session.getAttribute("style") %>/pc_arrow.gif" /></td>
            <td><span><%=(String)map.get("72")%></span></td>
            <td width="10%" rowspan="2"><img src="../images/<%=session.getAttribute("style") %>/pc_arrow.gif" /></td>
            <td><span></span></td>
          </tr>
          <tr>
            <td><img src="../images/<%=session.getAttribute("style") %>/pc_edit.png" />
             <logic:equal name="bpost" value="1">
           <a href="<%=root%>/report/case/t07_flow_list.do">编辑岗</a></logic:equal>
           <logic:equal name="bpost" value="0">编辑岗</logic:equal>
           </td>
            <td><img src="../images/<%=session.getAttribute("style") %>/pc_audit.png" />
            <logic:equal name="spost" value="1">
           <a href="<%=root%>/report/case/t07_flow_list.do">审核岗</a></logic:equal>
           <logic:equal name="spost" value="0">审核岗</logic:equal></td>
            <td><img src="../images/<%=session.getAttribute("style") %>/pc_approval.png" />
                 <logic:equal name="ppost" value="1">
           <a href="<%=root%>/report/case/t07_flow_list.do">审批岗</a></logic:equal>
           <logic:equal name="ppost" value="0">审批岗</logic:equal>
            </td>
          </tr>
        </table></td>
		<td valign="middle"><img src="../images/<%=session.getAttribute("style") %>/pc_arrow.gif" /></td>
		<td width="84" valign="top"><table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="21"><span></span></td>
          </tr>
          <tr>
            <td><div class="pc_but">正常报告</div></td>
          </tr>
        </table></td>
		<td class="pc_line01">&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr>
	    <td height="25" class="pc_title">&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td rowspan="3" class="pc_line02">&nbsp;</td>
	    <td rowspan="3"><img src="../images/<%=session.getAttribute("style") %>/pc_arrow.gif" /></td>
	    <td width="84" rowspan="3" valign="top"><table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="21"><span></span></td>
          </tr>
          <tr>
            <td><div class="pc_but">数据包下载</div></td>
          </tr>
        </table></td>
	    <td rowspan="3"><img src="../images/<%=session.getAttribute("style") %>/pc_arrow.gif" /></td>
	    <td width="84" rowspan="3" valign="top"><table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="21"><span></span></td>
          </tr>
          <tr>
            <td><div class="pc_but">待上传回执</div></td>
          </tr>
        </table></td>
      </tr>
	  <tr>
	    <td colspan="5" class="pc_title"><img src="../images/<%=session.getAttribute("style") %>/pc02.png" width="18" height="16" />错误回执数据处理</td>
	  </tr>
	  <tr>
		<td>错误回执</td>
		<td>&nbsp;</td>
		<td><div class="pc_but">案例处理</div></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr>
	    <td><div class="pc_k pc_textsmall"> <a href="<%=root%>/pbcreport08/data/getT07_data_trans_listAll.do?newsearchflag=1">回执交易补录 <span><%=StringUtils.null2String((String)map.get("4"))%></span></a><br/>
	      <a href="<%=root%>/information/client/t07_nbh_ctif_validate_list.do?newsearchflag=1">回执客户补录 <span><%=StringUtils.null2String((String)map.get("5"))%></span></a><br/>
	      <a href="<%=root%>/information/client/t07_nbs_atif_validate_list.do?newsearchflag=1">回执账户补录 <span><%=StringUtils.null2String((String)map.get("6"))%></span></a><br/>
        </div></td>
	    <td valign="middle"><img src="../images/<%=session.getAttribute("style") %>/pc_arrow.gif" /></td>
	    <td valign="middle" class="pc_butarrow"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="pc_k">
          <tr>
            <td><span><%=StringUtils.null2String((String)map.get("81"))%></span></td>
            <td width="10%" rowspan="2"><img src="../images/<%=session.getAttribute("style") %>/pc_arrow.gif" /></td>
            <td><span></span></td>
          </tr>
          <tr>
            <td><img src="../images/<%=session.getAttribute("style") %>/pc_edit.png" />
             <logic:equal name="bpost" value="1">
           <a href="<%=root%>/report/case/t07_flow_list.do">编辑岗</a></logic:equal>
           <logic:equal name="bpost" value="0">编辑岗</logic:equal>
          </td>
            <td><img src="../images/<%=session.getAttribute("style") %>/pc_approval.png" />审批岗</td>
          </tr>
        </table></td>
	    <td valign="middle"><img src="../images/<%=session.getAttribute("style") %>/pc_arrow.gif" /></td>
	    <td valign="top"><table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="21"><span></span></td>
            </tr>
            <tr>
              <td><div class="pc_but">特殊报告</div></td>
            </tr>
        </table></td>
	    <td valign="top" class="pc_line03">&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
      </tr>
   </table>
  </div>
<!--home_down:begin-->
 <div id="home_down">
      <!--notice-->
	  <div class="notice">
	   <div class="notice01"></div>
	   <div class="ylMarquee">
				  <ul>
				   <logic:iterate id="supervice" name="superList" type="com.ist.aml.information.dto.T07_Supervise_msg">
					<li>
					 <a href="#" onclick="_Open1('<%=root%>/information/t07_supervise_msg/t07_supervise_msg_detail.do?msg_mode=2&flag=1&msg_id=<bean:write name="supervice" property="msg_id"/>')"><bean:write name="supervice" property="msg_name"/></a> 
					  <logic:equal  name="supervice" property="msg_state" value="0">
					  <img src="../images/<%=session.getAttribute("style") %>/new.gif" />	
					  </logic:equal>				
					</li>
					</logic:iterate>
				  </ul>
		</div>
		<div class="notimore" style="position:absolute;"><a href="<%=root%>/information/t07_supervise_msg/t07_supervise_msg_list.do?newsearchflag=1&msg_mode=2"><img src="../images/<%=session.getAttribute("style") %>/more.png"/></a></div>
		<div class="notice02" style="position:absolute; top:0;"></div>
	  </div>
      <!--home_post-->
	  <div class="home_post">
	   <div class="home_title">
	     <img src="../images/<%=session.getAttribute("style") %>/icon_post.png" />信息公告
		 <span><a href="#" onclick="_Open1('<%=root%>/information/t00_notice/t00_notice_list2.do?newsearchflag=1&flag=2')" ><img src="../images/<%=session.getAttribute("style") %>/more.png" border="0" /></a></span>	   </div>
	   <div class="ylMarquee2">
		   <ul>
		     <logic:iterate id="notice" name="noticeList" type="com.ist.aml.information.dto.T00_NOTICE">
			<li><strong>·</strong>
		   <a href="#" onclick="_Open1('<%=root%>/information/t00_notice/t00_notice_disp.do?noteice_no=<bean:write name="notice" property="noteice_no"/>')">
			<bean:write name="notice" property="title"/>
			</a>
			<span><bean:write name="notice" property="createdate"/></span></li>
			</logic:iterate>
			</ul>
	</div>
	  </div>
 </div>
<script type="text/javascript">
        $(document).ready(function(){
			   $(".ylMarquee").YlMarquee({
					visible:5,
					vertical: true,
					textMode: true,
					step: 2
				});
		});
 </script>
<!--home_down:end--> 
</div>
</html:form>
</body>
</html>