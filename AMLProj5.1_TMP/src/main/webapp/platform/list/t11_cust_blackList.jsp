<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />	
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<!--[if lte IE 6]>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->
		<script language="JavaScript">
		
	
function dosubmit(theUrl,type){
	var errMsg = "";
	var isSub = false;
	if(type=='modi'){
		errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
		isSub = true;
	}
	else if(type=='del'){
			errMsg = CheckBoxMustChecked(document.forms[0]);
			if(errMsg==''){
				if(confirm('你真的要排除选择的黑名单客户吗？')){
					isSub = true;
				}
			}
		}
	else if(type=='search' || type=='add'){
		isSub = true;
	}
	if(type=='search'){
		if(!_compareTwoDateForString(document.forms[0].startDt.value, document.forms[0].endDt.value)) {
			errMsg = "开始时间不能大于结束时间";		    
		}     
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
function selectAll(obj){
    if(document.forms[0].selectedKeys!=null){
 
    if(obj.innerHTML=="全选"){
        obj.innerHTML="全不选"
		if(document.forms[0].selectedKeys.value!=""){
                document.forms[0].selectedKeys.checked=true;
    	}
        if(document.forms[0].selectedKeys.length!=0)
             for ( var i=0; i < document.forms[0].selectedKeys.length; i++ ){
             document.forms[0].selectedKeys[i].checked=true;
        }
    }
    else{
	    obj.innerHTML="全选"
	    if(document.forms[0].selectedKeys.value!="")
                document.forms[0].selectedKeys.checked=false;
        if(document.forms[0].selectedKeys.length!=0)
             for ( var i=0; i < document.forms[0].selectedKeys.length; i++ )
	             document.forms[0].selectedKeys[i].checked=false;
    }
  }
    else{
        alert("对不起！没有可选的项.");
    }
}
</script>
</head>
	<body leftmargin="0" topmargin="0" class="mainbg">
	<div id="main">
		<html:form action="/list/getCustBlackListFact.do" method="post"
			enctype="multipart/form-data">
			<div class="conditions">
				<div class="cond_t">
					<span>黑名单管理</span>
				
				<span class="buttons">				
					<img src="../../images/<%=session.getAttribute("style") %>/b_checkall.png" /><a href="#" onclick="selectAll(this)">全选</a>
					<img src="../../images/<%=session.getAttribute("style") %>/b_susnot.png" /><a href="#" onclick="dosubmit('/platform/list/removeCustFromBlackList.do','del')" >排 除</a>
				</span>
				</div>
			
			<html:errors />
			<div class="cond_c">
			
							<table>
								<tr >
									<td>
										创建日期：
									</td>

									<td >
									 <html:text property="startDt" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/> －
									 <html:text property="endDt" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
   
									</td>
									<td>
										客户ID：
									</td>
									<td >
										<html:text property="party_id" size="20" />
									</td>
								</tr>
								<tr >
									<td>
										客户名称：
									</td>
									<td >
										<html:text property="party_name" size="20" />
									</td>
									<td >
										证件号码：
									</td>
									<td >
										<html:text property="card_no" size="20" />
									</td>
								</tr>
								<tr >
									<td >
										排序：
									</td>
									<td >
										<html:select property="orders">
											<html:options collection="orderList" property="label"
												labelProperty="value" />
										</html:select>
										<html:radio property="fashion" value='asc' />
										升序
										<html:radio property="fashion" value='desc' />
										降序
									</td>
									<td></td>
									<td>
										<html:button property="button" styleClass="input" value="查 询"
											onclick="dosubmit('/platform/list/getCustBlackListFact.do?newsearchflag=1','search')" />
									</td>
								</tr>
							</table>
			
			</div>
			</div>
			<div class="list">
			<table  border="0" cellpadding="0"	cellspacing="0" >
				<tr>
					<th>
						选择
					</th>
					<th>
						客户号
					</th>
					<th>
						客户名称
					</th>
					<th>
						证件号码
					</th>
					<th>
						创建机构
					</th>
					<th>
						创建时间
					</th>
					<th>
						类型
					</th>
				</tr>
				<logic:iterate id="result" name="t11_cust_blacklist"
					type="com.ist.platform.dto.T11_BlackList_Cust">
					<tr>
						<td>
							<html:multibox property="selectedKeys">
								<bean:write name="result" property="party_id" scope="page"/>_<bean:write name="result" property="type_cd" scope="page" />
							</html:multibox>
						</td>
						<td>
							<bean:write name="result" property="party_id" scope="page" />
						</td>
						<td>
							<bean:write name="result" property="party_name" scope="page" />
						</td>
						<td>
							<bean:write name="result" property="card_no" scope="page" />
						</td>
						<td>
							<bean:write name="result" property="organkey" scope="page" />
						</td>
						<td>
							<bean:write name="result" property="create_dt_display" scope="page" />
						</td>
						<td>
							<logic:equal value="1" name="result" property="type_cd" scope="page">
							<a href="#" onclick="window.open('/report/listmanager/t07_blacklist_disp.do?party_id=<bean:write name="result" property="party_id" scope="page" />','enter2','height=500, width=700,left=400,top=100,scrollbars=no,resizable=yes')";>
							<font color="#FF0000">人工识别</font></a>
							</logic:equal>
							<logic:equal value="2" name="result" property="type_cd" scope="page">
							<a href="#" onclick="window.open('/platform/list/getDetailBlackCustInfo.do?party_id=<bean:write name="result" property="party_id" scope="page"  />','enter2','height=500, width=700,left=400,top=100,scrollbars=yes,resizable=no');">
							<font color="#FF0000">系统生成</font></a>
							</logic:equal>
						
						</td>
					</tr>
				</logic:iterate>
			</table>
			</div>
			<div class="list_page">
				<logic:present name="pageInfo" scope="request">
							<bean:write name="pageInfo" scope="request" filter="false" />
				</logic:present>
			</div>
		</html:form>
		</div>
	</body>
</html>
