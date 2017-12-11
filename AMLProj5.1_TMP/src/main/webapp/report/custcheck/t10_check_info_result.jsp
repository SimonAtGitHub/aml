<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.TreeMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String backflag=(String)request.getAttribute("backflag");
	String flag=(String)request.getAttribute("flag");
%>
<HEAD>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type='text/javascript' src='<%=request.getContextPath() %>/report/case/dwr/interface/CountryArea.js'></script>
<script type='text/javascript' src='<%=request.getContextPath() %>/report/case/dwr/engine.js'></script>
<script type='text/javascript' src='<%=request.getContextPath() %>/report/case/dwr/util.js'></script>
 <script type="text/javascript" src="../../js/calendar.js"></script>
     

<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="javascript">
var backflag=<%=backflag%>
var flag=<%=flag%>
if(backflag=="1"){alert("已识别")
var url="<%=request.getContextPath()%>/report/custcheck/t10_check_cust_kelist.do";
if(flag=="2")
   url="<%=request.getContextPath()%>/report/custcheck/t10_check_cust_cardlist.do";
parent.location.href=url;
}

function dosubmit(){
	
	var checkresult=document.getElementById('check_result').value;
	if(checkresult==''){
		 alert('调查结论为必填项');
	        return false;
		}
	var tablename="";
	var valid_dt_disp=document.getElementById('valid_dt_disp').value;
	if(valid_dt_disp==''){
        alert('调查结论有效期为必填项');
        return false;
	}
	CountryArea.getcustTableName(checkresult,function(data){
		  if(data=="black"){
			  var con =confirm("是否将该客户加入黑名单");
			  if(con){
				  document.forms[0].action='modifyT10_colu_result.do?tablename=T07_BLACKLIST&custtype=1';
				  document.forms[0].submit();
			   }else{
				   document.forms[0].action='modifyT10_colu_result.do?custtype=1';
				 document.forms[0].submit();
			}
		   }
		  else if(data=="white"){
			  var con =confirm("是否将该客户加入白名单");
			  if(con){
				  document.forms[0].action='modifyT10_colu_result.do?tablename=T07_WHITELIST_INFO&custtype=1';
				  document.forms[0].submit();
			   }else{
				   document.forms[0].action='modifyT10_colu_result.do?custtype=1';
					 document.forms[0].submit();
			}
			  
		   }else{
		    var party_id= document.forms[0].party_id.value;
		  	   document.forms[0].action='modifyT10_colu_result.do?custtype=1';
				 document.forms[0].submit();
			}
		});
	
}
</script>
</HEAD>
<BODY leftmargin="0" topmargin="0" id="iframecontent">
<html:form action="/custcheck/modifyT10_colu.do" method="post">
<html:hidden property="party_id"/>
<html:hidden property="party_class_cd"/>
<html:hidden property="flag"/>
<inp
	 <div class="conditions">
	<div class="cond_c2">
	    <table border="0" cellpadding="0" cellspacing="0">
	     <tr>
			 <td>调查结论有效期：</td>
			<td>
			 <html:text name="t10_check_cust_cardForm"  property="valid_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
			
			</td>
		    </tr>	
	  <tr>
								<td>调查结论：
			</td>
			<td>
			<html:select name="t10_check_cust_cardForm" property="check_result" styleId="check_result"  >
			<html:options collection="check_resultMap" property="label" labelProperty="value" />
			</html:select>
		    </td>
		    </tr>	
		   
		 <tr>
				 <td>调查情况说明：</td>
				 <td>
				 <html:textarea property="check_explain" cols="80" rows="8" styleId="check_explain">
				 </html:textarea>
				 </td>
		 </tr>	
		
			<tr>
				<td>&nbsp;</td>
			    <td align="center">
			<input type="button" class="in_button1"  name="s" value=" 保存" onClick="dosubmit()">								</td>
			</tr>							
		</table>
     </div>
 </div>
    
</html:form> 


</BODY>
</HTML>
