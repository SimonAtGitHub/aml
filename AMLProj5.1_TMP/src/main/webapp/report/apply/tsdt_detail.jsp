<%@ page contentType= "text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix ="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix ="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix ="logic"%>
<html xmlns="http://www.w3.org/1999/xhtml">
       <HEAD>
             <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
             <meta name="save" content="history" />
              <link id= "skincss" href="../../css/aml_<%=session.getAttribute("style" )%>.css" rel="stylesheet" type="text/css" />
             <script src="../../js/title.js" ></script>
             <script language="JavaScript" src="../../js/basefunc.js" ></script>
             <script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
             <script type="text/javascript" src="../../js/jquery.js" ></script>
             <script type="text/javascript" src="../../js/aml.js" ></script>
<SCRIPT LANGUAGE="JavaScript" >
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0" class="mainbg">
<div id= "main">
<html:form method="post" action="/apply/tsdt_detail.do">
	<div class="conditions" >
    	<div class="cond_t" >
             	<span>交易详情</span >
                <span class="buttons" ><a href ="#" onclick="javascript:window.close();" ><img src="../../images/blue/b_shut.png" />关 闭</a></span>
         </div>
         <div class="cond_c2" >
         	<table border="0" cellpadding= "0" cellspacing ="0">
            	<tr><th colspan="4"><strong>机构信息</strong></th></tr>
				<tr>
					<td>网点代码类型：</td>
					<td><bean:write property="fict" name="tsdt"/></td>
					<td> 网点代码：</td>
					<td><bean:write property="finc" name="tsdt"/></td>
				</tr>
				<tr>
					<td>金融机构网点名称：</td>
					<td><bean:write property="finn" name="tsdt"/></td>
					<td>机构与大额交易关系：</td>
					<td><bean:write property="rltp" name="tsdt"/></td>
										
				</tr>
				<tr>
					<td>地区行政区划代码：</td>
					<td colspan="3"><bean:write property="firc_disp" name="tsdt"/></td>
				</tr>
            </table>
         </div>
         
         <div class="cond_c2">
			<table border="0" cellpadding="0" cellspacing="0" align="center" id="agent_table">
				<tr><th colspan="4"><strong>代办人信息</strong></th></tr>
				<tr>
					<td>代办人姓名： </td>
					<td><bean:write property="tbnm" name="tsdt"/></td>
					<td>代办人国籍：</td>
					<td><bean:write property="tbnm" name="tsdt"/></td>
				</tr>
				<tr>
					<td>代办人身份证件类型：</td>
					<td colspan="3"><bean:write property="tbit" name="tsdt"/></td>
				</tr>
				<tr>
					<td> 代办人身份证件号码：</td>
					<td colspan="3"><bean:write property="tbid" name="tsdt"/></td>
				</tr>
			</table>
		 </div>
			 
		<div class="cond_c2">
			<table width="100%" border="0" cellpadding="1" cellspacing="1">
			<tr><th colspan="4"><strong>交易信息</strong></th></tr>
			<tr>
				<td>帐户类型：</td>
				<td><bean:write property="catp" name="tsdt"/></td>
				<td>账号：</td>
				<td><bean:write property="ctac" name="tsdt"/></td>
			</tr>	
			<tr>
				<td>交易时间：</td>
				<td><bean:write property="tstm_disp" name="tsdt"/></td>
				<td>币种：</td>
				<td><bean:write property="crtp_disp" name="tsdt"/></td>
			</tr>
			<tr>
				<td>交易金额：</td>
				<td><bean:write property="crat_disp" name="tsdt"/></td>
				<td> 资金收付标识：</td>
				<td><bean:write property="tsdr" name="tsdt"/></td>
			</tr>
			<tr>
				<td> 交易方式：</td>
				<td colspan="3"><bean:write property="tstp_disp" name="tsdt"/></td>
			</tr>
			<tr>
				<td> 涉外交易分类代码：</td>
				<td colspan="3"><bean:write property="tsct_disp" name="tsdt"/></td>
			</tr>	
			<tr>
				<td> 交易发生地：</td>
				<td colspan="3"><bean:write property="trcd_disp" name="tsdt"/></td>
			</tr>
			<tr>
				<td>交易方向：</td>
				<td colspan="3"><bean:write property="tdrc_disp" name="tsdt"/></td>
			</tr>
			<tr>
				<td> 资金用途：</td>
				<td colspan="3"><bean:write property="crpp" name="tsdt"/></td>
			</tr>
			<tr><th colspan="4"><strong>对手信息</strong></th></tr>
			<tr>
				<td>对方金融机构网点名称：</td>
				<td colspan="3"><bean:write property="cfin" name="tsdt"/></td>
			</tr>
			<tr>
				<td>对方金融机构代码类型：</td>
				<td colspan="3"><bean:write property="cfct" name="tsdt"/></td>
			</tr>
			<tr>
				<td>对方金融机构网点代码：</td>
				<td colspan="3"><bean:write property="cfic" name="tsdt"/></td>
			</tr>
			<tr>
				<td>交易对手姓名：</td>
				<td colspan="3"><bean:write property="tcnm" name="tsdt"/></td>
			</tr>
			<tr>
				<td>交易对手证件号码：</td>
				<td colspan="3"><bean:write property="tcid" name="tsdt"/></td>
			</tr>
			<tr>
				<td>交易对手证件类型：</td>
				<td colspan="3"><bean:write property="tcit" name="tsdt"/></td>
			</tr>
			<tr>
				<td>交易对手账号类型：</td>
				<td colspan="3"><bean:write property="tcat" name="tsdt"/></td>
			</tr>
			<tr>
				<td>交易对手账号：</td>
				<td colspan="3"><bean:write property="tcac" name="tsdt"/></td>
			</tr>
		</table>
		</div>
</html:form>
</div>
</BODY>
</HTML>
