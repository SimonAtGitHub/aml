<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/aml.js"></script>
<!--[if lte IE 6]> 
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->	
<script language="javascript">
function _submit(type,id){

if (type=='C'){
  document.forms[0].action="<%=request.getContextPath()%>/information/client/t47_party_modify1.do?newsearchflag=1&party_id="+id
  
  }else  {
  document.forms[0].action="<%=request.getContextPath()%>/information/client/t47_party_modify.do?newsearchflag=1&party_id="+id
  }
  document.forms[0].submit();
  }
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
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
function _Commit(){
    if(checkRadio(document.forms[0].party_id)<0){
           alert("请选择！");
            return false;
    }else {
     	opener.document.forms[0].party_id.value=document.forms[0].party_id.value;
     	opener.document.forms[0].party_name.value=document.forms[0].party_chn_name.value;
   
     	window.close();
     }
}
</script>
	</head>
	<body leftmargin="0" topmargin="0" >
	 <div id="main">
		<html:form action="/client/t47_party_list.do" method="post">
		 
		<div class="conditions">
		<div class="cond_t">
		<span>客户信息 </span> 
     	<span class="buttons">
     	  <a href="#" id="hdd_display" class="bt_hidden"></a>
     	             <a href="#" onClick="dosubmit('<%=request.getContextPath()%>/information/client/t47_party_add.do?party_class_cd=C','search')" ><img
								src="../../images/<%=session.getAttribute("style") %>/b_addccustomer.png"/>添加对公客户</a>
						       <a href="#" onClick="dosubmit('<%=request.getContextPath()%>/information/client/t47_party_add.do?party_class_cd=I','search')"><img
								src="../../images/<%=session.getAttribute("style") %>/b_addccustomer.png"/>添加对私客户</a>
        </span></div>
		 
   		<div class="cond_c" id="searchtable">
							<table   border="0" cellpadding="0" cellspacing="0">

								<tr >
									<td  >
										客户种类：
									</td>
									<td  >
										<html:select property="party_class_cd_s">
											<html:options collection="party_classMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
									<td >
										客户状态：
									</td>
									<td  >
										<html:select property="party_status_cd">

											<html:options collection="party_statusMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
								</tr>
								
								
								
								<tr >
									<td >
										证件类型：
									</td>
									<td >
										<html:select property="card_type_s" style="width:160">
											<html:options collection="card_typeMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
									<td >
										证件号码：
									</td>
									<td >
										<html:text property="card_no_s" size="25" />
									</td>
								</tr>
								<tr >
									<td >客户号：</td>
									<td  >
										<html:text property="party_id_s" size="25" />
									<td  >
										客户名称：
									</td>
									<td  >
										<html:text property="party_chn_name_s" size="25" />
									</td>
								</tr>

								<tr >
									<td  >
										归属机构：
									</td>
									<td  >
									<html:text property="searchorgankey"  size="10" onblur="_Onblur('organName')"/>	
										<html:text property="organName" size="13" readonly="true"/>
					                 <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=searchorgankey&input_name_disp=organName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
				
									</td>
									<td >
										排序：
									</td>
									<td >

										<html:select property="customerorder">

											<html:options collection="customerorderMap" property="label"
												labelProperty="value" />
										</html:select>

										<html:radio property="order" value="0" />
										升序
										<html:radio property="order" value="1" />
										降序
                                          <input type="button" name="button1" value="查 询" class="in_button1"
											onclick="dosubmit('<%=request.getContextPath()%>/information/client/t47_party_list.do?newsearchflag=1','search')" >
										
									</td>
								
							</table>
				 
			  </div>
			  </div>
         
        		<div class="list">
          	<table cellspacing="0" cellpadding="0" border="0">
				<tr >
					<th >
						客户号
					</th>
					<th>
						客户种类
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
						客户状态
					</th>
				</tr>
				
				<logic:present name="t47_partyList">
					<logic:iterate id="t47_party" name="t47_partyList" indexId="i"
						type="com.ist.aml.report.dto.T47_party">
						<%
							String party_id = t47_party.getParty_id();
					        if(party_id.contains("#")){
					        	party_id = party_id.replace("#","%23");
					        }
						%>
						<tr align="center" class="interval" onMouseOver="this.className='interval2'" onMouseOut="this.className='interval'">
							<TD>
								<a href="#" onclick="_submit('<bean:write name="t47_party" property="party_class_cd" />','<%=party_id %>')">
									<bean:write name="t47_party" property="party_id" /> </a>
							</TD>
							<td>
								<bean:write name="t47_party" property="party_class_cd_disp" />
							</td>
							<td height="22">
								<bean:write name="t47_party" property="party_chn_name" />
							</td>
							<td>
								<bean:write name="t47_party" property="country_cd_disp" />
							</td>
							<td>
								<bean:write name="t47_party" property="card_type_disp" />
							</td>
							<td>
								<bean:write name="t47_party" property="card_no" />
							</td>
							<td>
								<bean:write name="t47_party" property="party_status_cd_disp" />
							</td>
						</tr>
					</logic:iterate>
				</logic:present>
			</table><br></div>
			<logic:present name="t47_partyList">
				<table width="98%" border="0" align="center" cellpadding="3"
					cellspacing="3">
					<tr>
						<td align="center">
							<bean:write name="pageInfo" scope="request" filter="false" />
						</td>
					</tr>
				</table>
				
			</logic:present>
		</html:form>
		</div>
	</BODY>
</HTML>
