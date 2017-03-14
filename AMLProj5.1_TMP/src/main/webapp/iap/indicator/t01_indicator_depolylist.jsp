<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]> 
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
<script type="text/javascript" src="../../js/calendar.js"></script>   
    <SCRIPT LANGUAGE="JavaScript">
	
	function selectAllCheckBoxbyindic(objElement,currentForm){
	var strInnerText = "";
	var isSelectAll = false;
	if(currentForm){
		for(var i=0;i<currentForm.elements.length;i++){
			var formElement = currentForm.elements[i];
			if(formElement.type=="checkbox" && !formElement.disabled && formElement.name!="guizld_1" && formElement.name!="guizld_4" && formElement.name!="guizld_5" && formElement.name!="guizld_7"){
				formElement.checked = trim(objElement.innerText)=="\u5168\u90e8" ? true : false;
				isSelectAll = formElement.checked;
			}						
		}
		strInnerText = isSelectAll == true ? "\u53d6\u6d88" : "\u5168\u90e8";
		objElement.innerText = strInnerText;
	}
}

	function doSubmit(theUrl,type){
		var form = document.forms[0];
		var errMsg = CheckBoxMustChecked(form);
		if(!errMsg){
			if(type == '2'){
				//指标发布，排除已发布
				errMsg = CheckBoxCheckedSingleOne(form);
				if(!errMsg){
					for (var i = 0; i < form.elements.length; i++) {
						if ((true == form.elements[i].checked) && (form.elements[i].type == "checkbox")) {
							if(form.elements[i].nextSibling.nextSibling.value == '2'){
								form.elements[i].checked = "";	
							}
						}
					}
				}else{
					alert(errMsg);
					return false;
				}
				if(CheckBoxMustChecked(document.forms[0])){
					alert("请选择未发布的指标");
					return false;
				}
			}else if(type == '1'){
				//撤销发布，排除未发布
				for (var i = 0; i < form.elements.length; i++) {
					if ((true == form.elements[i].checked) && (form.elements[i].type == "checkbox")) {
						if(form.elements[i].nextSibling.nextSibling.value == '1'){
							form.elements[i].checked = "";	
						}
					}
				}
				if(CheckBoxMustChecked(document.forms[0])){
					alert("请选择已发布的指标");
					return false;
				}
			}
			
		  form.action=theUrl;
	      form.submit();
			
			
		}else{
			alert(errMsg);
			return false;
		}
	}
	function doSubmit1(theUrl,type){
	     document.forms[0].action=theUrl;
		 document.forms[0].submit();
	}
 function openWin(theUrl,win_name,height,width){	
	    var top =  (window.screen.availHeight-30-400)/2;
	    var left = (window.screen.availWidth-10-750)/2;
	    var h,w;
	    if(height==undefined){ h = 500 }else{ h = height; }
	    if(width==undefined){ w = 600 }else{ w = width; }
	   
		var	property = 'height='+h+', width='+w+',left='+left+',top='+top+',scrollbars=yes,resizable=yes';
		
	    window.open(theUrl,'',property);     
   }
	</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
    <div id='main'>
        <html:form method="POST" action="/indicator/indicator_list.do">
            <div class="conditions">
					<div class='cond_t'>
					  <span>指标发布</span>
					  <span class="buttons">
					    <a href="javascript:void(0);" onclick="doSubmit('indicator_depolyDo.do?deploy=2','2');return false;">
					     <img src="../../images/<%=session.getAttribute("style")%>/b_publish.png" />指标发布</a>
					    <a href="javascript:void(0);" onclick="doSubmit('indicator_depolyDo.do?deploy=1','1');return false;">
					     <img src="../../images/<%=session.getAttribute("style")%>/b_re_refused.png" />撤销发布</a>
					    <a href="javascript:void(0);" onclick="doSubmit('indicator_depolyDo.do?deploy=3','3');return false;">
					     <img src="../../images/<%=session.getAttribute("style")%>/b_re_refused.png" />撤销申请</a>
					  </span>
					</div> 

           <html:messages id="errors" message="true">
                <bean:write name="errors" filter="fasle" />
            </html:messages>

            <div class="cond_c" id="searchtable">
                <table border="0"   cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            指标编码：
                        </td>
                        <td>
                            <html:text property="indickey" size="30" />
                        </td>
                        <td>
                            指标名称：
                        </td>
                        <td>
                            <html:text property="indicname" size="30" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            指标属性：
                        </td>
                        <td>
                            <html:select property="indictype">
                                <html:options collection="indictypeMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                        </td>
                        <td>
                            指标类别：
                        </td>
                        <td>
                            <html:select property="apptype">
                                <html:options collection="apptypeMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            计算粒度：
                        </td>
                        <td>
                            <html:checkbox property="guizld_1" value="1">日</html:checkbox>
                            <html:checkbox property="guizld_4" value="1">月</html:checkbox>
                            <html:checkbox property="guizld_5" value="1">季</html:checkbox>
                            <html:checkbox property="guizld_7" value="1">年</html:checkbox>
                        </td>
                        <td>
                            发布状态：
                        </td>
                        <td>
                            <html:select property="deployflag">
                                <html:options collection="indicdeployMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                        </td>
                    </tr>
                    <tr>
                        <td nowrap>
                            创建时间：
                        </td>
                        <td nowrap>
                            <html:text property="createdate_min" size="12" onclick="calendar.show(this);" readonly="true"
										styleClass="calimg"/>
                            
                            --
                            <html:text property="createdate_max" size="12" onclick="calendar.show(this);" readonly="true"
										styleClass="calimg"/>
                            
                        </td>
                        <td nowrap>
                            排序：
                        </td>
                        <td nowrap>
                            <html:select property="sort">
                                <html:options collection="sortMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                            &nbsp;
                            <html:radio property="sort_type" value="asc">升序</html:radio>
                            <html:radio property="sort_type" value="desc">降序</html:radio>
                            <html:radio property="sort_type" value="">不排序</html:radio>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <html:button property="button" styleClass="in_button1" value="查 询"
                                onclick="doSubmit1('indicator_depolylist.do?newsearchflag=1','search')" />
                        </td>
                    </tr>
                </table>
            </div>

            <div class='list'>
                <TABLE>
                    <TR align=center>
                        <th onclick='selectAllCheckBoxbyindic(this,document.forms[0])'
                            style='cursor:hand;'>
                            全部
                        </th>
                        <th>
                            指标编码
                        </th>
                        <th>
                            指标名称
                        </th>
                        <th>
                            指标属性
                        </th>
                        <th>
                            指标类别
                        </th>
                        <!-- 
				<TD>
					计算方式
				</TD>
				 -->
                        <th>
                            计算粒度
                        </th>
                        <th>
                            发布状态
                        </th>
                        <th>
                            创建时间
                        </th>
                    </TR>
                    <logic:iterate id="indicator" name="t01_indicatorList"
                        type="com.ist.iap.dto.T09_indicator">
                        <TR align="center">
                            <TD noWrap>
                                <html:multibox property="selectedindickey">
                                    <bean:write name="indicator" property="indickey" />
                                </html:multibox>
                                 <input type="hidden" value="<bean:write name="indicator" property="deployflag" />" />
                            </TD>
                            <TD noWrap>
                                <bean:write name="indicator" property="indickey" scope="page" />
                            </TD>
                            <TD noWrap>
                                <a
                                    href="javascript:openWin('<%=request.getContextPath()%>/iap/indicator/indicator_disp.do?indickey=<%=indicator.getIndickey()%>','indickey')">

                                    <bean:write name="indicator" property="indicname" scope="page" />
                                </a>
                            </TD>
                            <TD noWrap>
                                <bean:write name="indicator" property="indictype_disp" scope="page" />
                            </TD>
                            <TD noWrap>
                                <bean:write name="indicator" property="apptype_disp" scope="page" />
                            </TD>
                            <!-- 
					<TD>
						<bean:write name="indicator" property="calmode_disp" scope="page" />
					</TD>
 					-->
                            <TD noWrap>
                                <bean:write name="indicator" property="granularity_disp"
                                    scope="page" />
                            </TD>
                            <TD noWrap>
                                <bean:write name="indicator" property="deployflag_disp" scope="page" />
                            </TD>
                            <TD noWrap>
                                <bean:write name="indicator" property="createdate" scope="page" />
                            </TD>
                        </TR>
                    </logic:iterate>
                </TABLE>
            </div>

           <div class="list_page">
			<logic:present name="pageInfo">
				<table width="98%" align="center" border="0" cellpadding="3"
					cellspacing="3">
					<tr>
						<td align="center">
							<bean:write name="pageInfo" scope="request" filter="false" />
						</td>
					</tr>
				</table>
			</logic:present>
		</div> 
            </div>
        </html:form>
    </div>
</BODY>
</html>

