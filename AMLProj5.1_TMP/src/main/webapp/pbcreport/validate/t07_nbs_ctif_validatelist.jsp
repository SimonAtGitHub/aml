<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script src="../../js/title.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
<SCRIPT LANGUAGE="JavaScript">
function _submit(type,id){
  document.forms[0].action="<%=request.getContextPath()%>/information/client/t47_party_ucmodify.do?application_pary_type=" + type + "&party_id="+id;
  document.forms[0].submit();
  
}

function do_submit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}

function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
  if(!_compareTwoDateForString(document.forms[0].pbc_crt_dt_start.value, document.forms[0].pbc_crt_dt_end.value)) {
   document.forms[0].pbc_crt_dt_start.focus();
	 errMsg = "开始时间不能大于结束时间";		    
		   }
  if(type=='modi'){
          if(checkRadio(document.forms[0].party_id)<0){
           errMsg = "请选择！";
          } 
        isSub = true;
    
    }else if(type=='del'){
    
         if(checkRadio(document.forms[0].party_id)<0){
                errMsg = "请选择！";
            }
            if(errMsg==''){
                if(confirm('你真的要删除所选的一批样品吗？')){
                    isSub = true;
                }
            }
        
    }else if(type=='search' || type=='add'){
       isSub=true;
    }
    if(isSub && errMsg==''){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function _Click(party_id,party_chn_name){
     document.forms[0].party_id.value=party_id;
     document.forms[0].party_chn_name.value=party_chn_name;
}
function _Onblur(pname){
   var obj=eval("document.forms[0]."+pname);
   obj.value="";
}
   function _compareTwoDateForString(_Date1, _Date2) {
     vDate1 = _Date1.split("-")
	 vDate2 = _Date2.split("-")
	 _Year1 = parseInt(vDate1[0]-0)
	 _Month1 = parseInt(vDate1[1]-0)
	 _Day1 = parseInt(vDate1[2]-0)

	 _Year2 = parseInt(vDate2[0]-0)
	 _Month2 = parseInt(vDate2[1]-0)
	 _Day2 = parseInt(vDate2[2]-0)

     if (_Year1 > _Year2) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 > _Month2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 > _Day2)) {
	    return false
	 }

	 return true
}
function _Commit(){
    if(checkRadio(document.forms[0].party_id)<0){
           alert("请选择！");
           return false;
    } 
     opener.document.forms[0].party_id.value=document.forms[0].party_id.value;
     opener.document.forms[0].party_name.value=document.forms[0].party_chn_name.value;
   
     window.close();
}
	<%
               	 	String root=request.getContextPath();
	     			
    %>
</SCRIPT>
	</head>
	<BODY leftmargin="0" topmargin="0" class="mainbg">
		<div id="main">
		<html:form action="/client/t07_nbs_ctif_validate_list.do" method="post">
		 <div class="conditions">
<div class="cond_t">
		<span class="in_button"> 
		<input name="" type="button" value="大  额" onclick="do_submit('<%=request.getContextPath()%>/information/client/t07_nbh_ctif_validate_list.do?newsearchflag=1')" />
		<input name="" type="button" value="可  疑" onclick="do_submit('<%=request.getContextPath()%>/information/client/t07_nbs_ctif_validate_list.do?newsearchflag=1')" disabled="disabled"/>
          </span>
      </div>
      </div>
       
  <div class="cond_c">
      <table   border="0" cellpadding="0" cellspacing="0">	
								<tr>
									<td>
										证件类型：
									</td>
									<td>
										<html:select property="citp" style="width:160" onmouseover="selMouseOver(this,$('div_hint'))" onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="card_typeMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
									<td>
										证件号码：
									</td>
									<td>
										<html:text property="ctid" size="25" />
									</td>
								</tr>
								<tr>
									<td height="" align="right">客户号：</td>
									<td>
										<html:text property="csnm" size="25" />
									<td>
										客户名称：
									</td>
									<td>
										<html:text property="ctnm" size="25" />
									</td>
								</tr>

								
								<tr>
									<td>
										客户类型：
									</td>
									<td>
										<html:select property="cttp">
											<html:options collection="pbc_cttpMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
									<td>是否通过验证：</td>
									<td align="left">
									<html:select property="validate_ind">
										<html:option value="">--请选择--</html:option>
										<html:option value="1">是</html:option>
										<html:option value="0">否</html:option>	
									</html:select>
									
									<input type="button" name="button1" value="查 询" class="in_button1"
											onclick="dosubmit('<%=request.getContextPath()%>/information/client/t07_nbs_ctif_validate_list.do?newsearchflag=1','search')" />
									</td>
								</tr>
		</table>
		</div>
	
  	 <div class="list">
			<table cellspacing="0" cellpadding="0"  
				   border=0>
				<tr  >
					<th height="22">
						客户号
					</th>
					
					<th>
						客户类型
					</th>
					<th>
						客户名称
					</th>
					<th>
						客户国籍
					</th>
					<th>
						证件类型
					</th>
					<th>
						证件号码
					</th>
					<th>
						验证状态
					</th>
				</tr>
				
				<logic:present name="t07_nbs_ctifList">
					<logic:iterate id="t07_nbs_ctif" name="t07_nbs_ctifList" indexId="i"
						type="com.ist.aml.pbcreport.dto.T07_nbs_ctif">
						<tr>
							<TD>
							<a href="<%=request.getContextPath() %>/pbcreport/validate/getValidateCustDisp.do?pbc_msg_type_cd=<bean:write name="t07_nbs_ctif" property="pbc_msg_type_cd"/>&fromcase=1&cati_seqno=<bean:write name="t07_nbs_ctif" property="ctif_seqno"/>&reportkey=<bean:write name="t07_nbs_ctif" property="reportkey"/>&report_type=2&validbackurl=<%=request.getContextPath()%>/pbcreport/validate/t07_nbs_ctif_validate_list.do?back_btn=1">
								<bean:write name="t07_nbs_ctif" property="csnm" /> 
							</a>
							</TD>
							<td>
								<bean:write name="t07_nbs_ctif" property="cttp_disp" />
							</td>
							<td height="22">
								<bean:write name="t07_nbs_ctif" property="ctnm" />
							</td>
							<td height="22">
								<bean:write name="t07_nbs_ctif" property="ctnt_disp" />
							</td>
							
							<td>
								<bean:write name="t07_nbs_ctif" property="citp_disp" />
							</td>
							<td>
								<bean:write name="t07_nbs_ctif" property="ctid" />
							</td>
							<td>
								<bean:write name="t07_nbs_ctif" property="validate_ind_disp" filter="false"/>
							</td>
						</tr>
					</logic:iterate>
				</logic:present>
</table>
</div>
   <div class="list_page">
   <bean:write name="pageInfo" scope="request" filter="false"/>
</div>
	</html:form>			
	</BODY>
</html>
