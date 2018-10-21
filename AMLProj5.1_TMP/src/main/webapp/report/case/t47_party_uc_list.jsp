<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/ymPrompt.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script src="../../js/title.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/jquery.validator.js"></script>
		<script language="JavaScript">
function _submit(id){
  document.forms[0].action="<%=request.getContextPath()%>/report/case/t47_party_ucmodify.do?party_id="+id;
  document.forms[0].submit();
  
}
function dosubmit(theUrl){
	document.forms[0].action=theUrl;
    if(jQuery('#form0').validateAll()){
          document.forms[0].submit()
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
           alert("��ѡ��");
           return false;
    } 
     opener.document.forms[0].party_id.value=document.forms[0].party_id.value;
     opener.document.forms[0].party_name.value=document.forms[0].party_chn_name.value;
   
     window.close();
}
</script>
	</head>
	<body leftmargin="0" topmargin="0" class="mainbg">
		<html:form action="/case/t47_party_uc_list.do" method="post" styleId="form0">
		<div id="main">
		<!-- conditions --> 
		  <div class="conditions">
		    <!-- title -->
			<div class="cond_t">
			  <span>�ͻ���Ϣ��¼</span>
		
			  <span class="buttons">
			  <a href="#" id="hdd_display" class="bt_hidden"></a>&nbsp;
			  <a href='javascript:' onclick="ymPrompt.win({message:'<%=request.getContextPath()%>/information/client/getT47_partyLogForBuLu.do'
			  ,width:450,height:300,title:'�ͻ���¼��־',handler:handler,iframe:true,fixPosition:true,dragOut:false});return false;"><img src="../../images/blue/b_add2.png" />��¼��־</a>
			  </span>
			</div>
			
			
			
			 <div class="cond_c"   id="searchtable">
			  <table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td align="right">
						֤�����ͣ�
					</td>
					<td align="left">
						<html:select property="card_type_s" style="width:250px"  
							onmouseover="selMouseOver(this,$('div_hint'))"
							onmouseout="selMouseOut(this,$('div_hint'))">
							<html:options collection="card_typeMap" property="label"
								labelProperty="value" />
						</html:select>
					</td>
					<td align="right">
						֤�����룺
					</td>
					<td align="left">
						<html:text property="card_no_s" size="20" require="false" datatype="number|limit_max" max="24" msg="��������ȷ��ʽ����|�ֶγ��Ȳ��ܳ���24λ"  />
					</td>
				</tr>
				<tr>
					<td align="right">
						�ͻ��ţ�
					</td>
					<td align="left">
						<html:text property="party_id_s" size="25" require="false" datatype="safeString|limit_max" max="32" msg="������Ϸ��Ŀͻ�id|���ܳ���32���ַ�"/>
					<td align="right">
						�ͻ����ƣ�
					</td>
					<td align="left">
						<html:text property="party_chn_name_s" size="20" require="false" datatype="safeString|limit_max" max="200" msg="������Ϸ��Ŀͻ�����|���ܳ���200���ַ�"/>
					</td>
				</tr>

				<tr>
					<td align="right">
						����������
					</td>
					<td align="left">
						<html:text property="organkey" size="8"
							onblur="_Onblur('organName')" require="false" datatype="number|limit_max" max="12" msg="����������|���ܳ���12������" />
						<html:text property="organName" size="15" readonly="true" />
							 <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
					</td>
					<td align="right">
						�ͻ����ࣺ
					</td>
					<td align="left">
						<html:select property="party_class_cd_s" >
							<html:options collection="party_classMap" property="label"
								labelProperty="value" />
						</html:select>
						&nbsp;&nbsp;<input type="button" name="button1" value="�� ѯ" class="in_button1"
							onclick="dosubmit('<%=request.getContextPath()%>/report/case/t47_party_uc_list.do?newsearchflag=1')" />
					</td>
				</tr>
			</table>
            </div>
		
		</div>
		<!-- list --> 
		  <div class="list">
		   <table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th>
						�ͻ���
					</th>
					<th>
						��������
					</th>
					<th>
						�ͻ�����
					</th>
					<th>
						�ͻ�����
					</th>
					<th>
						�ͻ�����
					</th>
					<th>
						֤������
					</th>
					<th>
						֤������
					</th>
					<th>
						��֤״̬
					</th>
				</tr>

				<logic:present name="t47_partyList">
					<logic:iterate id="t47_party" name="t47_partyList" indexId="i"
						type="com.ist.aml.report.dto.T47_party">
						<tr>
						<%
										java.util.HashMap map = new java.util.HashMap();
													map.put("party_id", t47_party.getParty_id());
													pageContext.setAttribute("map", map,
															PageContext.PAGE_SCOPE);
									%>
							<td>
								<html:link name="map" page="/case/t47_party_ucmodify.do">
									<bean:write name="t47_party" property="party_id" />
								</html:link>
							</td>
							<td>
								<bean:write name="t47_party" property="organkey" />
							</td>
							<td>
								<bean:write name="t47_party" property="party_class_cd" />
							</td>
							<td>
								<bean:write name="t47_party" property="party_chn_name" />
							</td>
							<td>
								<bean:write name="t47_party" property="country_cd" />
							</td>
							<td>
								<bean:write name="t47_party" property="card_type" />
							</td>
							<td>
								<bean:write name="t47_party" property="card_no" />
							</td>
							<td>
								<logic:equal value="1" name="t47_party" property="validate">
									ͨ��
					 			</logic:equal>
								<logic:equal value="0" name="t47_party" property="validate">
									<font color="#FF0000">δͨ��</font>
								</logic:equal>
							</td>
						</tr>
					</logic:iterate>
				</logic:present>
			</table>
			</div>
			<logic:present name="t47_partyList">
				<!-- list_page --> 
				  <div class="list_page">
					 <bean:write name="pageInfo" scope="request" filter="false" />
                  </div>
			</logic:present>
		</html:form>
		<script>
			jQuery('#form0').checkFormSearch();
		</script>
		<!--��ʾ��-->
		<div id="div_hint"
			style="font-size: 12px; color: red; display: none; position: absolute; z-index: 6000; top: 200; background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid; filter: Alpha(style = 0, opacity = 80, finishOpacity = 100);"></div>

	</body>
</html>
