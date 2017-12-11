<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="javascript">
</script>
</head>
<body id="iframecontent">
<html:form action="/custcheck/modifyT10_colu.do" method="post">
<div class="conditions">
	  <div class="cond_c3">
	  <table border="0" cellpadding="0" cellspacing="0" width="100%" >
	    <tr>
        <td>
		<span class="buttons"><strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.png" />业务信息</strong></span>
		</td>
		</tr>
	  </table>
	 </div>  
	<div class="list">
        <table border="0" cellspacing="0" cellpadding="0" >
			<tr>
				<th>业务背景</th>
			    <th>资金来源与去向</th>	
				<th>资金用途</th>	
				<th>实际经营业务</th>
			</tr>
			<logic:iterate id="result1" name="tList1" indexId="i" type="com.ist.aml.report.dto.T10_check_cust_clue">
               <tr>
			  	<td><bean:write name="result1" property="background" scope="page"/></td>
			    <td><bean:write name="result1" property="fundorigin" scope="page"/></td>			
			    <td><bean:write name="result1" property="founduse" scope="page"/></td>
			    <td><bean:write name="result1" property="runbusi" scope="page"/></td>
			   </tr>
			</logic:iterate>	
				<input  type="hidden" value="1" id="T10_BUSINESS_INFOresult" />
				<tr id="T10_BUSINESS_INFO" style="display:none;">
				<td><html:text name="t10_check_cust_cardForm"  property="background"/>
				</td>
				<td><html:text name="t10_check_cust_cardForm"  property="fundorigin"/>
				</td>
				<td><html:text name="t10_check_cust_cardForm"  property="founduse"/>
				</td>
				<td><html:text name="t10_check_cust_cardForm"  property="runbusi"/>
				</td>
				</tr>
									
	    </table>	
    </div>
    <div class="cond_c3">
	  <table border="0" cellpadding="0" cellspacing="0" width="100%">
	    <tr>
        <td>
		<span class="buttons"><strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />经济状况</strong></span>
		</td>
		</tr>
		</table>
	 </div>
	 <div class="list">
   		<table border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<th>行业状况分析</th>
			<th>经营状况分析</th>	
			<th>财务状况分析</th>	
		  </tr>	
		  <logic:iterate id="result2" name="tList2" indexId="i" type="com.ist.aml.report.dto.T10_check_cust_clue">
          <tr>
		  	<td><bean:write name="result2" property="tradeanalyse" scope="page"/></td>
		    <td><bean:write name="result2" property="runstatanalyse" scope="page"/></td>			
		    <td><bean:write name="result2" property="financeeanalyse" scope="page"/></td>
		  </tr>
		  </logic:iterate>
		    <input  type="hidden" value="1" id="T10_ECONOMY_INFOresult" />
			<tr id="T10_ECONOMY_INFO" style="display:none;">
			<td><html:text name="t10_check_cust_cardForm"  property="tradeanalyse"/>
			</td>
			<td><html:text name="t10_check_cust_cardForm"  property="runstatanalyse"/>
			</td>
			<td><html:text name="t10_check_cust_cardForm"  property="financeeanalyse"/>
			</td>
			</tr>
		</table>	
	</div>
 	<div class="cond_c3">
	  <table border="0" cellpadding="0" cellspacing="0" width="100%">
	    <tr>
 		<td>
		<span class="buttons"><strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />主控人或股东信息</strong></span>
		</td>
		</tr>
	  </table>
	 </div>
 	<div class="list">
   	<table border="0" cellspacing="0" cellpadding="0">
		<tr>
			<th>名称</th>
		    <th>证件号码</th>	
			<th>证件类型</th>
			<th>证件到期日</th>	
			<th>出资金额</th>	
			<th>联系方式</th>		
		</tr>	
		<logic:iterate id="result3" name="tList3" indexId="i" type="com.ist.aml.report.dto.T10_check_cust_clue">
          <tr>
		    <td><bean:write name="result3" property="party_name" scope="page"/></td>
		    <td><bean:write name="result3" property="card_no" scope="page"/></td>			
		    <td><bean:write name="result3" property="card_type" scope="page"/></td>
		    <td><bean:write name="result3" property="card_due_dt_disp" scope="page"/></td>
		    <td><bean:write name="result3" property="amt" scope="page"/></td>			
		    <td><bean:write name="result3" property="linkmode" scope="page"/></td>
		 </tr>
        </logic:iterate>
			 <input type="hidden" value="1" id="T10_CONTROLLERINFOresult" />
			<tr id="T10_CONTROLLERINFO" style="display:none;">
			<td>
				<html:text name="t10_check_cust_cardForm"  property="party_name"/>
			</td>
			<td>
				<html:text name="t10_check_cust_cardForm"  property="card_no"/>
			</td>
			<td>
				<html:select name="t10_check_cust_cardForm" property="card_type"  >
				<html:options collection="card_typeMap2" property="label" labelProperty="value" />
				</html:select>
			</td>
			<td>
				<html:text name="t10_check_cust_cardForm"   onclick="fPopUpCalendarDlg('card_due_dt_disp')" property="card_due_dt_disp" size="10" />
			</td>
				<td><html:text name="t10_check_cust_cardForm"  styleId="amt" property="amt"/>
			</td>
				<td><html:text name="t10_check_cust_cardForm"  property="linkmode"/>
			</td>
			</tr>						
		</table>	
		</div>   
    
    <div class="cond_c3">
	  <table border="0" cellpadding="0" cellspacing="0" width="100%">
 		<td>
		<span class="buttons"><strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />代办人信息</strong></span>
		</td>
	  </table>
	</div>
 	<div class="list">
   	<table border="0" cellspacing="0" cellpadding="0">
		<tr>
			<th>名称</th>
		    <th>证件号码</th>	
			<th>证件类型</th>
			<th>证件到期日</th>	
			<th>联系方式</th>		
		</tr>	
		<logic:iterate id="result4" name="tList4" indexId="i" type="com.ist.aml.report.dto.T10_check_cust_clue">
          <tr>
		  	<td><bean:write name="result4" property="party_name" scope="page"/></td>
		    <td><bean:write name="result4" property="card_no" scope="page"/></td>			
		    <td><bean:write name="result4" property="card_type" scope="page"/></td>
		   	<td><bean:write name="result4" property="card_due_dt_disp" scope="page"/></td>
		    <td><bean:write name="result4" property="linkmode" scope="page"/></td>			
		 </tr>
        </logic:iterate>
		<input  type="hidden" value="1" id="T10_AGENT_INFOresult"/>
			<tr id="T10_AGENT_INFO" style="display:none;">
			<td><html:text name="t10_check_cust_cardForm"  property="party_name_agent"/>
			</td>
			<td><html:text name="t10_check_cust_cardForm"  property="card_no_agent"/>
			</td>
			<td><html:select name="t10_check_cust_cardForm" property="card_type_agent"  >
					<html:options collection="card_typeMap2" property="label" labelProperty="value" />
				</html:select>
			</td>
			<td><html:text name="t10_check_cust_cardForm"  onclick="fPopUpCalendarDlg('income_dt_disp')" property="income_dt_disp"/>
			</td>
			<td><html:text name="t10_check_cust_cardForm"  property="linkmode_agent"/>
			</td>
			</tr>							
	</table>	
	</div>

	<div class="cond_c3">
	  <table border="0" cellpadding="0" cellspacing="0" width="100%">
 		<td>
		<span class="buttons"><strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />对手信息</strong></span>
		</td>
	  </table>
	</div>
 	<div class="list">
   	<table border="0" cellspacing="0" cellpadding="0">
		<tr>
			<th>名称</th>
			<th>证件号码</th>	
			<th>证件类型</th>
			<th>客户类型</th>		
		</tr>	
		<logic:iterate id="result5" name="tList5" indexId="i" type="com.ist.aml.report.dto.T10_check_cust_clue">
        <tr>
		    <td><bean:write name="result5" property="party_name" scope="page"/></td>
		    <td><bean:write name="result5" property="card_no" scope="page"/></td>			
		    <td><bean:write name="result5" property="card_type" scope="page"/></td>
		    <td><bean:write name="result5" property="party_class_cd_disp" scope="page"/></td>
		</tr>
			   
       </logic:iterate>
		<input  type="hidden" value="1" id="T10_OPP_CUST_INFOresult"/>
				<tr id="T10_OPP_CUST_INFO" style="display:none;">
				<td><html:text name="t10_check_cust_cardForm"  property="party_name_opp"/>
				</td>
				<td><html:text name="t10_check_cust_cardForm"  property="card_no_opp"/>
				</td>
				<td><html:select name="t10_check_cust_cardForm" property="card_type_opp" >
						<html:options collection="card_typeMap2" property="label" labelProperty="value" />
					</html:select>
				</td>
				<td>
				<html:select name="t10_check_cust_cardForm" property="party_class_cd" >
						<html:options collection="party_class_cdMap" property="label" labelProperty="value" />
					</html:select>
				</td>
				</tr>								
		</table>	
		</div>
 	</div>
</html:form> 
</body>
</html>
