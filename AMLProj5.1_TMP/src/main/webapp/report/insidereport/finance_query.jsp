<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script src="../../js/title.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<script src="../../js/title.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/jquery.validator.js"></script>
		
		
<script type="text/javascript">
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
}	
function dosubmit1(theUrl) {
    document.forms[0].action = theUrl;
    document.forms[0].submit();
  }
function dosubmit(theUrl,type){
        var errMsg = "";
        var isSub = false;
       if(type=='search' || type=='add'){
            isSub = true;
        }
        if(type=='search'){
    	_Date1 = document.forms[0].begindat.value;
    	_Date2 = document.forms[0].enddat.value;  
    	if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "请填写完整的起始时间范围！";
         else if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	      
         else if(!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "开始时间不能大于结束时间！";		  		
  		isSub = true;
 	}
 	if(isSub && errMsg=='')
    {
        document.forms[0].action=theUrl;
        if(jQuery('#form0').validateAll()){
	          document.forms[0].submit()
	         }
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
 	}
 	//begin zyd 
</script>
<script> 
</script>
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
<html:form action="/insidereport/finance_query.do" method="post"  styleId="form0" enctype="multipart/form-data">
<div class="main">
	<div class="conditions">
	<!-- title -->
					<div class="cond_t">
						<span>金融查询</span>			
					</div>
	<html:errors />
	<div class="cond_c" id="searchtable">
    <table border="0" cellpadding="0" cellspacing="0">
   		
		 <tr>
		 	<td width="10%" height="22" align="right">
								         核查日期：
								</td>
								<td width="40%" >
								 <html:text property="begindat" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
								 －
							     <html:text property="enddat" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>

								</td>
		    
            <td width="10%" align="right">批次号：</td>
            <td> <html:text property="verification_BATCH" styleClass="text_white" /></td>
         </tr>
            <tr>
            <td width="18px" height="22" style="margin:1px" style="word-wrap:normal">序号：</td>     
            <td width="30px" style="margin-left: 2px">
                    <html:text property="verification_SEQ" />
              </td>
           <td>
  	       <input type="button" name="button1" class="in_button1"
										value="查 询"
										onclick="dosubmit('<%=request.getContextPath()%>/report/insidereport/finance_query.do?newsearchflag=1','search')" />  
           	      	
           </td>
         </tr>
    </table>
    </div>
   
   
    <div class="list">
    <table>
    <tr>
	  <th>需求文件名</th>
	  <th>明文</th>
	  <th>密文</th>
	  <th>密文状态</th>
	  <th>信息</th>
    </tr>
    <logic:iterate id="t47Flog" 
								name="t47FlogList"
								type="com.ist.common.T47Flog">
								<TR>
								    <TD>
											<bean:write name="t47Flog" property="xqFileName" />
									</TD>
									<TD align="center" noWrap>
									<%String str=t47Flog.getMwFileName(); %>
<a href="#"   
	onclick="dosubmit1('<%=request.getContextPath()%>/report/insidereport/finance_query_download.do?mwFileName=<%=str%>&flag=1')">
										<bean:write name="t47Flog" property="mwFileName"
											scope="page" />
										</a>
									</TD>							
									<TD align="center">
									<%String strd=t47Flog.getMiFileName(); %>
									<a href="#"   
	onclick="dosubmit1('<%=request.getContextPath()%>/report/insidereport/finance_query_download.do?miFileName=<%=strd%>&flag=2')">
										<bean:write name="t47Flog" property="miFileName" 
											scope="page" />
											</a>
									</TD>

									<TD align="center" noWrap>
									<%String fl= t47Flog.getMiStatus(); 
									  String tep;
									  if("4".equals(fl))
									  tep="已推送";
									  else{
									  tep="错误";
									  }
									  %>
										<%=tep%>
									</TD>
									<TD align="center" align="left">
										<bean:write name="t47Flog" property="errmsg"
											scope="page" />
									</TD>			
								</TR>
							</logic:iterate>
						</TABLE>
					</div>
					<div class="list_page">
						<table width="98%" border="0" align="center" cellpadding="3"
							cellspacing="3">
							<tr>
								<td align="center">
									<bean:write name="pageInfo" scope="request" filter="false" />
								</td>
							</tr>
						</table>
					</div>
					</div>
		</html:form>
</body>
</html>