<%@ page contentType= "text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix ="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix ="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix ="logic"%>
<HTML>
       <HEAD>
             <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
             <meta name="save" content="history" />
             <link id= "skincss" href="../../css/aml_<%=session.getAttribute("style" )%>.css" rel="stylesheet" type="text/css" />
             <script language="JavaScript" src="../../js/basefunc.js" ></script>
             <script type="text/javascript" src="../../js/jquery.js"></script>
             <script type="text/javascript" src="../../js/aml.js" ></script>
             <script type="text/javascript" src="../../js/calendar.js"></script>
<SCRIPT LANGUAGE="JavaScript" >
function dosubmit(theUrl,type){
	var errMsg="";
	if(type=="search"){
		_Date1 = document.forms[0].start_dt_disp.value;
        _Date2 = document.forms[0].end_dt_disp.value; 
        if(_Date1=="")
        	errMsg += "请填写起始时间！";
        else if(_Date1!="" && !formatDateAlert(_Date1))
           return false;       
        else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	  
        else if(!_isDateSpaceComplete(_Date1, _Date2))
   		errMsg += "请填写完整的起始时间范围！";  
        else if(!_compareTwoDateForString(_Date1, _Date2) )
 			errMsg += "开始时间不能大于结束时间！";
	}else if(type=="choose"){
		errMsg = CheckBoxMustChecked(document.forms[0]);
	}
	if(errMsg==""){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
	}else{
		alert(errMsg);
		return false;
	}
}
function _Onblur(pname){
	   var obj=eval("document.forms[0]."+pname);
	   obj.value="";
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<div id="main">
<html:form method="post" action="/apply/t07_cd_apply_add.do">
<input type="hidden" property="msg_type" value="1"/>
       <div class="conditions" >
             <div class="cond_t" >
             	<span>新增申请 - 大额</span >
                   <span class="buttons" >
                   		 <a href="#" onclick="dosubmit('t07_cd_apply_add.do?msg_type=2&initflag=1')"><img src="../../images/blue/b_sus.png" />可 疑</a>
	   					<a href="#" class="makegray"><img src="../../images/blue/b_large.png" />大 额</a>
						<a href="t07_cd_apply_list.do"><img src="../../images/blue/b_back.png" />返 回</a>
                 </span>
             </div>
             <div class="cond_c" id="searchtable">
                   <table border="0" cellpadding="0" cellspacing="0">
                         <tr>
                               <td> 机构名称：</td >
                               <td>
                               	<html:text property="ricd" size="7" onblur="_Onblur('rinm')" require="false" datatype="number|limit_max" max="12" msg="请输入数字|不能超过12个数字" />
									<html:text property="rinm" size="23" maxlength="30"  readonly="true" />
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=ricd&input_name_disp=rinm','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								
								</td>
                          	<td>大额交易发生日期：</td >
                               <td>
							<html:text property="start_dt_disp" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
									-
							<html:text size="12" property="end_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
							<font color="red">* </font>
								</td>
								</tr>
								<tr>
								<td>币种：</td>
                               <td>
									<html:select property="curr_cd" >
						              <html:options collection="curr_cdMap"  property="label" labelProperty="value" />
						              </html:select>
								</td >
                               <td>客户号：</td>
                               <td>
                               	<html:text property="party_id" size="10" onblur="_Onblur('party_name')" require="false" datatype="safeString|limit_max" max="32" msg="请输入合法的用户id|不能超过32个字符"/>
									<html:text property="party_name" size="23" maxlength="30"  readonly="true" />
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								
								</td>
                         		</tr>
								<tr>
								<td>业务标识号：</td>
                               <td><html:text property="ticd" size="20" /></td >
                               <td></td>
                               <td><input type="button" name="button3" value="查 询" class="in_button1"
										onclick="dosubmit('t07_cd_apply_trans_list.do?newsearchflag=1','search')" /></td>
                         		</tr>
                   </table>
             </div>
             </div>
             <html:errors/>
             <div class="list" >
                  <table border="0" cellspacing="0" cellpadding="0" id="table_name">
						<tr>
						  <th>选择</th>
				          <th>业务标识号</th>
				          <th>客户号</th>
				          <th>交易日期</th>
				          <th>大额交易特征代码</th>
				          </tr>
				          <logic:present name="transList">
								<logic:iterate id="t07_nbh_tsdt"
									name="transList"
									type="com.ist.aml.pbcreport.dto.T07_nbh_tsdt">
				          <tr>
				          	<td><html:multibox property="reportkeys" value="<%=t07_nbh_tsdt.getReportkey()+t07_nbh_tsdt.getCati_seqno()+t07_nbh_tsdt.getCrcd()+t07_nbh_tsdt.getTsdt_seqno() %>"> 
				          		</html:multibox>
				          	</td>
				          <td>
				          	<a href="#" onclick="window.open('<%=request.getContextPath() %>/pbcreport/report/ibh_tsdt_detaillist.do?closeflag=1&&pbc_msg_type_cd=N&fromcase=2&reportkey=<bean:write name='t07_nbh_tsdt' property='reportkey' />&cati_seqno=<bean:write name='t07_nbh_tsdt' property='cati_seqno' />&Crcd=<bean:write name='t07_nbh_tsdt' property='crcd' />&tsdt_seqno=<bean:write name='t07_nbh_tsdt' property='tsdt_seqno' />','enter2','height=500,width=800,left=100,top=100,scrollbars=yes,resizable=yes');">
				          	<bean:write name="t07_nbh_tsdt" property="ticd" /></a>
				          </td>
				          <td><bean:write name="t07_nbh_tsdt" property="party_id"  /></td>
				          <td><bean:write name="t07_nbh_tsdt" property="tstm_disp" /></td>
				          <td><bean:write name="t07_nbh_tsdt" property="crcd" /></td>
				          </tr>
				          </logic:iterate>
				          </logic:present>
				          </table>
             </div>
             <logic:present name="pageInfo">
             <div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>
				</logic:present>
				<table align="right">
	     	  <tr>
				<td class="in_button"  align="right">
					<input  type="button" value="选定" onclick="dosubmit('t07_cd_apply_trans_add.do','choose')"/>
					<input  type="button" value="完成" onclick="dosubmit('t07_cd_apply_trans_result_list.do','submit')"/>		
				</td>
	   			</tr>
	   			   		
	 		</table>
</html:form>
</div>
</BODY>
</HTML>
