<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script language="JavaScript">
          function dosubmit(theUrl,type){
        	  var errMsg = "";
  	          var isSub = false;
  	          if(type=='search'){
		    	   if(!_isDateSpaceComplete(document.forms[0].createdate_start.value, document.forms[0].createdate_end.value)){
		       	    document.forms[0].createdate_start.focus();
		   	 		errMsg = "请填写完整的起始时间范围！";
		             } 
			       	else if(!_compareTwoDateForString(document.forms[0].createdate_start.value, document.forms[0].createdate_end.value)) {
			      			document.forms[0].createdate_start.focus();
			   	 		errMsg = "开始时间不能大于结束时间";		    
			   		   } 
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
		 
		  function openMfa(net_id){
		    //channelmode=yes,
		
		  var url='<%=request.getContextPath()%>/mfa/rel_issue/REL.html?net_id='+net_id+'&isView=1';		 
		 		   	 
			 window.open(url,'_blank' , 'fullscreen=yes,location=no,menubar=no,resizable=yes,scrollbars=no,status=no,toolbar=no');
		 }
        </script>
	</head>
	<body class="mainbg">
		<html:form action="/relation/relation_net_search.do" method="post">
			<html:errors />
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->

					<div class="cond_t">
						<span>关系网络查询</span>
					</div>
					<!-- table content -->
					<div class="cond_c" id="searchtable">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									关系网名称：
								</td>
								<td>
									<html:text property="net_name" />
								</td>

								<td nowrap>
									客户：
								</td>
								<td>
								    <html:text property="party_id" styleClass="text_white"  size="10" />	
									<html:text property="party_name"
										styleClass="text_white" size="23" readonly="true"/>
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								</td>
							</tr>
							<tr>
							    <td>
									创建日期：
								</td>
								<td>
									<html:text property="createdate_start" size="12"
										onclick="calendar.show(this);" readonly="true"
										styleClass="calimg" />
									--
									<html:text property="createdate_end" size="12"
										onclick="calendar.show(this);" readonly="true"
										styleClass="calimg" />
								</td>
								<td></td>
								<td>
									<input type="button" class="in_button1" name="search"
										value="查 询"
										onclick="dosubmit('relation_net_search.do?newsearchflag=1','search')" />
								</td>
							</tr>
						</table>

					</div>
				</div>


				<div class="list">
					<table>
						<tr>
							<th>
								网络编号
							</th>
							<th>
								关系网名称
							</th>
							<th>
								客户总数
							</th>
							<th>
								创建人
							</th>
							<th>
								创建时间
							</th>
						</tr>
						<logic:iterate id="t13_relation_net" name="t13_relation_netList"
							type="com.ist.mfa.dto.T13_rel_info">
						

							<tr>
							    <td align="center" nowrap>
									<a href="javascript:void(0)" onclick="openMfa('<bean:write name="t13_relation_net" property="net_id" />','handle');">	<bean:write name="t13_relation_net" property="net_id" scope="page" /></a>
								</td>
								<td align="center" nowrap>
																	
									<bean:write name="t13_relation_net" property="net_name"/>
								</td>
								<td align="center" nowrap>
									<bean:write name="t13_relation_net" property="party_count"
										scope="page" />
								</td>
								<td align="center" nowrap>
									<bean:write name="t13_relation_net" property="creator"
										scope="page" />
								</td>
								<td align="center" nowrap>
									<bean:write name="t13_relation_net" property="createdate"
										scope="page" />
								</td>
							</tr>
						</logic:iterate>

					</table>
				</div>

				<!-- all end -->
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