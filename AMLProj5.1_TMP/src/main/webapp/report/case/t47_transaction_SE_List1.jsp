<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 
<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
<script type="text/javascript" src="../../js/ymPrompt.js"></script>
<script src="../../js/title.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language="JavaScript" src="../../js/uc.js"></script>
<script language=JavaScript src="../../js/selectbox.js"></script>

<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script language="JavaScript" src="../../js/jquery.validator.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
<script language="JavaScript">
function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj.value = retval;
	}else{
		//alert("canceled");
	}
}
function _Onblur(pname){
   var obj=eval("document.forms[0]."+pname);
   obj.value="";
}
function dosubmit(theUrl){
var errMsg = "";
var searchtype=document.forms[0].searchtype.value;
	if(document.forms[0].amt_end_search.value !="" ){
		if(parseFloat(document.forms[0].amt_end_search.value) < parseFloat(document.forms[0].amt_start_search.value)){
		document.forms[0].amt_end_search.focus();
		errMsg = "��ʼ���׽��ܴ��ڽ������׽�";
		}
	}
	
	     _Date1 = document.forms[0].tx_dt_search_disp.value;
         _Date2 = document.forms[0].tx_enddt_search_disp.value;  
         if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	  
         else if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "����д�����Ľ���������ʼʱ�䷶Χ��";  
         else if(!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "�������ڿ�ʼʱ�䲻�ܴ��ڽ���ʱ�䣡";
			
		_Date3=document.forms[0].start_time.value;
		_Date4=document.forms[0].start_time2.value;
         if(!_isDateSpaceComplete(_Date3, _Date4))
     		errMsg += "����д�����Ĳ�¼��������ʼʱ�䷶Χ��";  
          else if(!_compareTwoDateForString(_Date3, _Date4) )
   			errMsg += "��¼�����տ�ʼʱ�䲻�ܴ��ڽ���ʱ�䣡";
         if(errMsg=='')
         {
             document.forms[0].action=theUrl;
             if(jQuery('#form0').validateAll()){
 		          document.forms[0].submit();
 		          event.srcElement.disabled = true;
 		         }
         }else{
             if(errMsg!='')
                 alert(errMsg);
             return false;
         }
   
}
  function  _Opendailog(url){

  var showx = event.screenX - event.offsetX/2; // + deltaX;
    var showy = event.screenY - event.offsetY + 18; // + deltaY;
    showx = 20;
	showy = 20;
	
 var flag= window.showModalDialog(url,  "dialogWidth:500px; dialogHeight:500px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;resizable:yes;");
   if(flag=="1"){
        document.form1.action='AlertAnalyse_List.htm';
        document.form1.submit();
   }
  }

function $getSelectedIds(){
	return $getSelectedValues("selectedid");
}	
function $getSelectedValues(fieldName){
   	var checks=document.getElementsByName(fieldName);
   	var ret=new Array();
   	var i;
   	for (i=0 ; i<checks.length; i++){   	
   		if (checks[i].checked)
   			ret =ret.concat(checks[i].value);
   	}
   	
   	return ret;
}

function modify(theUrl, id){

	var form=document.forms[0];
	var ids=$getSelectedIds();
	if (ids.length == 0){
		alert("��ѡ���޸ĵ���Ϣ��");
		return false;
	} else if(ids.length > 1){
        alert("ֻ��ѡ��һ�������޸ģ�");
        return false;
	}
	if (!id)
		id=ids[0];
	  document.form1.action=url;
	
	  // form.modifydp_info.value=modifydp_info;
	  // document.forms[0].action=renderParsToUrl("investigate_modify_do.do" , modifydp_info);
	   document.forms[0].submit();	
}
function dosubmitt(theUrl,type){
        var errMsg = "";
        var isSub = false;
        if(type=='modi'){
            errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
            isSub = true;
        }
        else if(type=='del'){
            errMsg = CheckBoxMustChecked(document.forms[0]);
            if(errMsg==''){
                if(confirm('�����Ҫɾ��ѡ�������Ϣ��')){
                    isSub = true;
                }
            }
        }
          else if(type=='delcheck'){
            errMsg = CheckBoxMustChecked(document.forms[0]);
            if(errMsg==''){
                if(confirm('�����Ҫɾ��ѡ�����������')){
                    isSub = true;
                }
            }
        }
        else if(type=='search' || type=='add'){
            isSub = true;
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
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
}
function _Open(url){
    url=url+".do?newsearchflag=1";
    alert(url);
    window.open(url,'','height=500, width=820,left=100,top=100,scrollbars=yes,resizable=yes');
    //window.open(url);
      
}

function _openTrade(url){
 
   window.open(url,'','height=500, width=600,left=100,top=100,scrollbars=yes,resizable=yes');
 // window.open(url);
      
}
function openFullWin(url) {
 
	var iwidth = screen.availWidth  ;
	var iheight = screen.availHeight - 30;

	var openwin = window.open(url, "erbu", "scrollbars=yes,toolbar=no,status=yes,resizable=yes,MenuBar=no,location=no,top=0,left=0,width=" + iwidth + " ,height=" + iheight);
	if (openwin) {
 		openwin.focus();
  }
  return openwin;
}
</script>

</head>
<body class="mainbg">
<script type="text/javascript" src="../../js/calendar.js"></script>
<html:form action="/case/t47_transaction_SE_List1.do" method="post" styleId="form0">
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>
	     <strong><font
				color="0072BC">���ν��ײ�¼</font></strong>
	  </span>
	  <span class="buttons">
	  <a href="#" id="hdd_display" class="bt_hidden"></a>
	   </span>
	</div>
	<!-- table content -->
	<div class="cond_c"  id="searchtable">
	  <table border="0" cellpadding="0" cellspacing="0">
			 <%
				com.ist.aml.report.dto.T47_transaction t47_transaction3 = (com.ist.aml.report.dto.T47_transaction) session.getAttribute("t47_transactionSearchObjb");
				if(t47_transaction3==null) t47_transaction3=new com.ist.aml.report.dto.T47_transaction();
			 	if (t47_transaction3.getTx_dt() != null) {
					t47_transaction3.setTx_dt_disp(com.ist.util.DateUtils.dateToStringShort(t47_transaction3.getTx_dt()));
				}
				if (t47_transaction3.getTx_dtEnd() != null) {
					t47_transaction3.setTx_dtEndDisp(com.ist.util.DateUtils.dateToStringShort(t47_transaction3.getTx_dtEnd()));
				}
			 %>
					<tr>
		
							<td>������ֹ���ڣ�</td>
							<td> 
								<html:text property="tx_dt_search_disp" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" /> --
								<html:text property="tx_enddt_search_disp" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
								</td>

						
			
						<td>�����ʻ���</td>
						<td><html:text property="acct_num_search"
							styleClass="text_white" size="24"  value="<%=t47_transaction3.getAcct_num() %>" require="false" datatype="safeString|limit_max" max="64" msg="������Ϸ��Ľ����˻�|���ܳ���64���ַ�" /></td>
					</tr>
					<tr>
						<td>���׽�</td>
						<td><html:text property="amt_start_search"
							styleClass="text_white" size="12" require="flase" datatype="double|limit_max" msg="��ʽ����ȷ��|���Ȳ��ܳ���20λ��" max="20"  value="<%=t47_transaction3.getAmt_start_search() %>" /> �� <html:text
							property="amt_end_search" styleClass="text_white" size="12"
							require="flase" datatype="double|limit_max" msg="��ʽ����ȷ��|���Ȳ��ܳ���20λ��" max="20"  value="<%=t47_transaction3.getAmt_end_search() %>" />(�������)</td>
						<td>���׻�����</td>
						<td>
					<html:text property="organkey_search" styleClass="text_white"  size="10" onblur="_Onblur('organName')"  value="<%=t47_transaction3.getOrgankey() %>" require="false" datatype="number|limit_max" max="12" msg="����������|���ܳ���12������"/>	
					<html:text property="organName" styleClass="text_white"
										size="23" readonly="true" maxlength="50" />
					 <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey_search&input_name_disp=organName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
				
					</tr>
					<tr>
						<td>��ת��ǣ�</td>
						<td>
							<bean:define id="goflag_str" name="goflag_str"></bean:define>
				            <%=goflag_str%>
						</td>
						
						<td>�ͻ��ţ�</td>
						<td>
					<html:text property="party_id_search" styleClass="text_white"  size="10" require="false" datatype="safeString|limit_max" max="32" msg="������Ϸ��Ŀͻ�id|���ܳ���32���ַ�"  onblur="_Onblur('party_chn_name_disp')"  value="<%=t47_transaction3.getParty_id() %>"/>	
						<html:text property="party_chn_name_disp"
							styleClass="text_white" size="23" maxlength="10" readonly="true"/>
								<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id_search&input_name_disp=party_chn_name_disp','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
						</td>
					</tr>
						<tr>
						<td>����ң�</td>
						<td>
							
				            <bean:define id="clienttype_str" name="clienttype_str"></bean:define>
				             <%=clienttype_str%>
						</td>
						
						
						<%-- <td>�����־��</td>
						<td><html:select
							property="debit_credit_search_disp" style="width:100px"  value="<%=t47_transaction3.getDebit_credit() %>">
							<html:options collection="trackflagMap" property="label"
								labelProperty="value" />
						</html:select></td>--%>
						<td>���״��룺</td>
						<td><html:text property="cb_tx_cd" 
							styleClass="text_white" size="15"  value="<%=t47_transaction3.getCb_tx_cd() %>"  require="false" datatype="number|limit_max" max="10" msg="����������|���ܳ���10������"/></td>
					</tr>
					<tr>
						<td>�ͻ����ͣ�</td>
						<td>
							<bean:define id="curr_cd_str" name="curr_cd_str"></bean:define>
				            <%=curr_cd_str%>
						</td>
						
						
						<td><%=com.ist.util.Constans.ALERT_NAME %>���ͣ�</td>
						<td>
							<bean:define id="deky_str" name="deky_str"></bean:define>
				             <%=deky_str%>
						</td>
					</tr>
					<tr>
						<td>��֤״̬��</td>
						<td>
							<bean:define id="status_str" name="status_str"></bean:define>
				            <%=status_str%>
						</td>
						<td>���׹�Ա�ţ�</td>
						<td><html:text property="teller"  maxlength="50" 
							styleClass="text_white" size="15"  value="<%=t47_transaction3.getTeller() %>"/></td>
					</tr>
					<tr>
						
						<td>ԭ�ͻ��ţ�</td>
						<td>
							<html:text property="host_cust_id" styleClass="text_white" size="30" require="false" datatype="safeString|limit_max" max="24" msg="������Ϸ��Ŀͻ�id|���ܳ���24���ַ�"  value="<%=t47_transaction3.getHost_cust_id() %>"  />
							&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td>��¼�����գ�</td>
						<td> 
							<html:text property="start_time" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" /> --
							<html:text property="start_time2" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
						</td>
					</tr>
					<tr>
						<td>����</td>
						<td>
						<html:select property="orderby"
							style="width:110">
							<html:options collection="tradesortMap" property="label"
								labelProperty="value" />
						</html:select> &nbsp; <html:radio property="order" value="1" />����<html:radio
							property="order" value="2" /> ����&nbsp;&nbsp;&nbsp;&nbsp; <html:hidden
							property="searchtype" /> 
						</td>
						<td></td>
						<td>
							<input type="button" name="ok" value="�� ѯ" class="in_button1"
							onclick="dosubmit('<%=request.getContextPath()%>/report/case/t47_transaction_SE_List1.do?newsearchflag=1')" />
						</td>
					</tr>
				</table>
             </div>
          </div>

	<table width="100" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="8"></td>
		</tr>
	</table>
	<html:errors />
	<!-- list --> 
	  <div class="list">
	   <table border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<th>��ˮ��</th>
			<th>�ͻ���</th>
			<th>�ͻ�����</th>
			<th>��������</th>
			<th>���׻���</th>
			<th>�ʻ�</th>
			<th>����</th>
			<th>���׽��</th>
			<th>���״���</th>
			<th>��/��</th>
			<th>��ת���</th>
			<%boolean timeFlagForBuLu=(Boolean)request.getAttribute("timeFlagForBuLu") ;
			if(timeFlagForBuLu){
			%>
			<th>��¼��־</th>
			<%} %>
		</tr>
		<logic:present name="t47_transactionList" scope="request">
			<logic:iterate id="transaction" indexId="i"
				name="t47_transactionList"
				type="com.ist.aml.report.dto.T47_transaction">
			
				<tr>
					<td>
						<a href="#" onclick="openFullWin('<%=request.getContextPath()%>/report/case/t47_transaction_se_modify1.do?transactionkey=<bean:write
						name="transaction" property="transactionkey" />')">
						<bean:write name="transaction" property="tx_no" /></a>
					</td>
					<td><bean:write name="transaction" property="party_id" /></td>
					<td><bean:write name="transaction" property="party_chn_name" /></td>
					<td><bean:write name="transaction" property="tx_dt_disp" /></td>
					<td> <bean:write name="transaction" property="organkey" /></td>
					<td><bean:write name="transaction" property="acct_num" /></td>
					<td><bean:write name="transaction" property="currency_cd_disp" /></td>
					<td><bean:write name="transaction" property="amt_disp" /></td>
					<td><bean:write name="transaction" property="cb_tx_cd" /></td>
					<td><bean:write name="transaction" property="debit_credit_disp" /></td>
					<td><bean:write name="transaction" property="cash_trans_flag_disp" /></td>
			    <% if(timeFlagForBuLu){
			      %>
			      <td>
		          <a href='javascript:' onclick="ymPrompt.win({message:'<%=request.getContextPath()%>/report/case/getT47_transLogForBuLu.do?transactionkey=<bean:write
						name="transaction" property="transactionkey" />',width:500,height:300,title:'���ײ�¼��־',handler:handler,iframe:true,fixPosition:true,dragOut:false});return false;">
						�鿴</a>
						<%-- 
						<a href='javascript:' onclick='window.open("<%=request.getContextPath()%>/report/case/t47_transaction_se_modify1.do?transactionkey=<bean:write
						name="transaction" property="transactionkey" />","��¼��¼","scrollbars=yes,toolbar=no,status=yes,resizable=yes,MenuBar=no,location=no,top=0,left=0,width=300,height=200")'><bean:write name="transaction" property="transactionkey" /></a>--%>
						</td>
			    <%} %>
				</tr>
			</logic:iterate>
		</logic:present>
	</table>
	</div>

<!-- list_page --> 
  <div class="list_page"><bean:write name="pageInfo" scope="request"
				filter="false" />
  </div>
  </div>
</html:form>
<script>
	jQuery('#form0').checkFormSearch();
</script>
</body>
</html>
