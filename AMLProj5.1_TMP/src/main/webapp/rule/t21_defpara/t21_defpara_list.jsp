<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

		<script language="JavaScript">
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
  if(type=='del'){
    
          errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你真的要删除吗？')){
                isSub = true;
            }
        }
        
    }
    
  else if(type=='search' || type=='add'){
       isSub=true;
    }
    if(isSub && errMsg==''){
    //alert(theUrl);
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}

function dosubmit1(theUrl,type)
{
	 var isSub = false;
	 if(type=='del'){
	    if(confirm('你真的要删除吗？')){
	 	  isSub = true;
	 	}
	 }	
	 else if(type='modi')
	 {
	 	isSub = true;
	 }
	 
	 if(isSub)
	 {
	 	document.forms[0].action=theUrl;
    	document.forms[0].submit();
	 }else{
	    return false;
	 }
	
}
</script>
	</head>
	<body leftmargin="0" topmargin="0">
		<div id="main">
			<!-- conditions -->
			<html:form action="/t21_defpara/t21_defpara_list.do" method="post">
				<div class="conditions">
					<div class="cond_t">
						<span>参数维护 </span>
						<span class="buttons">
						<a href="#" id="hdd_display" class="bt_hidden"></a>
						<a href="#" onclick="dosubmit('t21_defpara_add.do','add')"><img src="../../images/<%=session.getAttribute("style")%>/b_add.png" />添加</a>
						<a href="#" onclick="dosubmit('t21_defpara_delete_do.do','del')"><img src="../../images/<%=session.getAttribute("style")%>/b_delete.png" />删除</a>
						</span>
					</div>

					<div class="cond_c" id="searchtable">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									参数ID：
								</td>
								<td>
									<html:text property="defparakey" size="24" maxlength="20"/>
									<!--<input property="defparakey_s" size="24" maxlength="12" />
									
								--></td>
								<td>
									参数描述：
								</td>
								
									<td>
										<html:text property="para_des" size="24" maxlength="100" />
									</td>
							</tr>
							<tr>
								<td>
									参数类型：
								</td>
								<td>
									<html:select property="paratype">
										<html:options collection="paratypeMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
									是否启用：
								</td>

								<td>
									<html:select property="flag">
										<html:options collection="flagMap" property="label"
											labelProperty="value" />
									</html:select>
									<input type="button" value="查 询" class="in_button1"
										onclick="dosubmit('t21_defpara_list.do?newsearchflag=1','search')" />
									
							</tr>

						</table>
					</div>
				</div>
				<html:errors />
				<div class="list">
					<TABLE border=0 cellpadding="2" cellspacing="1">
						<TR align=center class="tdhead">
						<th>
						选择
						</th>
							<th width="10%">
								参数ID
							</th>
							<th width="25%">
								参数描述
							</th>
							<th width="15%">
								参数值
							</th>
							<th width="10%">
								参数类型
							</th>
							<th width="10%">
								是否为动态参数
							</th>
							<th width="10%">
								创建人
							</th>
							<th width="10%">
								是否启用
							</th>
							<th width="10%">
								操作
							</th>
						</TR>
						<logic:iterate id="info" name="t21_defparaList" indexId="i"
							type="com.ist.aml.rule.dto.T21_defpara">
							<TR align="center" class="interval"
								onMouseOver="this.className='interval2'"
								onMouseOut="this.className='interval'">
								   <TD height=22>
    							<html:multibox property="defparakey1">
   									 <bean:write  name="info" property="defparakey" />
   								 </html:multibox>
   								 </TD>
    							 
								<TD>
										<bean:write name="info" property="defparakey" />
								</TD>
								<TD style="white-space:normal;word-break:break-all;">
								<bean:write name="info" property="para_des" scope="page" />
								</TD>
								<TD>
									<bean:write name="info" property="para_val"scope="page" />
								</TD>
								<TD>
									<bean:write name="info" property="paratype" scope="page" />
								</TD>
								<TD>
									<bean:write name="info" property="dyna_ind" scope="page" />
								</TD>
								
								<TD>
									<bean:write name="info" property="createuser" scope="page" />
								</TD>
								<TD>
									<bean:write name="info" property="flag" scope="page" />
								</TD>
								<TD>
									<a href="#" onclick="dosubmit1('t21_defpara_modify.do?defparakey=<bean:write name="info" property="defparakey" />','modi')">
											<img src="../../images/<%=session.getAttribute("style")%>/modify.gif" title="修改" /></a>&nbsp;&nbsp;
									<a href="#" onclick="dosubmit1('t21_defpara_delete_do.do?defparakey=<bean:write name="info" property="defparakey" />&mark=1','del')">
											<img src="../../images/<%=session.getAttribute("style")%>/b_delete.png" title="删除" /></a>
								</TD>
							</TR>
						</logic:iterate>
					</TABLE>

				</div>
				<div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>

			</html:form>
			<!--提示块-->
			<div id=div_hint
				style="font-size: 12px; color: red; display: none; position: absolute; z-index: 6000; top: 200; background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid; filter: Alpha(style = 0, opacity = 80, finishOpacity = 100);"></div>
		</div>
	</BODY>
</HTML>
