<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
	function _Click(){
	
	var  indictype=eval(document.forms[0].indictype);
   
    var index=indictype.selectedIndex;
	var selvalue=indictype.options[index].value;
	
	var tdElement = document.getElementById("ind");
	var tdElementcw = document.getElementById("cwind");
		if(selvalue==3){
			tdElementcw.style.display="";
	    	tdElement.style.display="none";
		}else{
			tdElementcw.style.display="none";
	    	tdElement.style.display="";
		}
	}
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
				if(confirm('你真的要删除吗？')){
				isSub = true;
			}
			}
		}
		 else if(type=='search'){
				
				if(!_isDateSpaceComplete(document.forms[0].createdate_min.value, document.forms[0].createdate_max.value)){
		       		errMsg = "请填写完整的起始时间范围！";
		       		}
		    	   else if(!_compareTwoDateForString(document.forms[0].createdate_min.value, document.forms[0].createdate_max.value)) {
		    			 errMsg = "开始时间不能大于结束时间";	
		    		}
				isSub = true;
		}
		else if(type=='add' || type=='save'){
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
	</head>
	<body class="mainbg">
	<div id="main">
        <html:form action="/indicator/indicator_list.do" method="post">
            <div class="conditions">
					<div class="cond_t">
					   <span>指标定义列表</span>
					   <span class="buttons">
					                <a href="#" id="hdd_display" class="bt_hidden"></a>
								    <a href="javascript:void(0);" onclick="dosubmit('indicator_add_page.do','add');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />新 建</a>
									<a href="javascript:void(0);" onclick="dosubmit('indicator_modify_page.do','modi');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />修 改</a>
								    <a href="javascript:void(0);" onclick="dosubmit('indicator_delete_do.do','del');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a>
							    	<a href="javascript:void(0);" onclick="dosubmit('indicator_depoly_do.do','search');return false;"><img src="../../images/<%=session.getAttribute("style")%>/b_publish.png" />申请发布</a>
					   </span>
					</div>

            

    <div class="cond_c" id="searchtable">
	  <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                                                                  指标编码：
                        </td>
                        <td>
                            <html:text property="indickey"/>
                        </td>
                        <td>
                                                                   指标名称：
                        </td>
                        <td>
                            <html:text property="indicname"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                                                                  指标属性：
                        </td>
                        <td>
                            <html:select property="indictype" onchange="_Click();">
                                <html:options collection="indictypeMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                        </td>
                        <td>
                                                                     指标类别：
                        </td>
                        <td id="ind">
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
                                                                 状 态：
                        </td>
                        <td>
                            <html:select property="flag">
                                <html:options collection="flagMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                                                                  创建时间：
                        </td>
                        <td>
                            <html:text property="createdate_min" size="12" onclick="calendar.show(this);" readonly="true"
										styleClass="calimg" />
                            --
                            <html:text property="createdate_max" size="12" onclick="calendar.show(this);" readonly="true"
										styleClass="calimg"/>
                        </td>
                        <td>
                                                                   排序：
                        </td>
                        <td>
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
                                onclick="dosubmit('indicator_list.do?newsearchflag=1','search')" />
                        </td>
                    </tr>
                </table>
         </div>
      </div>
     <div class="list">
   		<table border="0" cellspacing="0" cellpadding="0">
                    <TR>
                        <th noWrap onclick='selectAllCheckBoxbyindic(this,document.forms[0])'
                            style='cursor:hand;' align="center" nowrap>
                                                                     全部
                        </th>
                        <th align="center" nowrap>
                                                                  指标编码
                        </th>
                        <th align="center" nowrap>
                                                                    指标名称
                        </th>
                        <th align="center" nowrap>
                                                                   指标属性
                        </th>
                        <th align="center" nowrap>
                                                                   指标类别
                        </th>
                        <th align="center" nowrap>
                                                                    计算粒度
                        </th>
                        <th align="center" nowrap>
                                                                     状态
                        </th>
				         <th align="center" nowrap>
						      实现方式
						</th>
                        <th align="center" nowrap>
                                                                      创建时间
                        </th>
                        <th align="center" nowrap>
                                                                      操作
                        </th>
                    </TR>

                    <logic:iterate id="indicator" name="t01_indicatorList"
                        type="com.ist.iap.dto.T09_indicator">
                        <%
                                        java.util.HashMap map = new java.util.HashMap();
                                        map.put("indickey", indicator.getIndickey());

                                        map.put("rad", "" + (new java.util.Date()).getTime());
                                        pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
                        %>
                        <TR align="center">
                            <TD noWrap>
                                <html:multibox property="selectedindickey">
                                    <bean:write name="indicator" property="indickey" />
                                </html:multibox>
                            </TD>
                            <TD noWrap>
                                <bean:write name="indicator" property="indickey" scope="page" />
                            </TD>
                            <TD noWrap>
                                <a
                                    href="javascript:openWin('<%=request.getContextPath()%>/iap/indicator/indicator_disp.do?indickey=<%=indicator.getIndickey()%>','indickey')">
                                    <bean:write name="indicator" property="indicname" scope="page" /></a>
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
                                <bean:write name="indicator" property="flag_disp" scope="page" />
                            </TD>
                            <!-- 
					<TD>
						<bean:write name="indicator" property="dispseq" scope="page" />
					</TD>
					 -->
					  <TD noWrap>
                                <bean:write name="indicator" property="implway_disp" scope="page" />
                            </TD>
                            <TD noWrap>
                                <bean:write name="indicator" property="createdate" scope="page" />
                            </TD>
                            <TD noWrap>
                                <logic:equal name="indicator" property="indictype" value="1">
                                    <!-- 业务指标 -->
                                    <logic:equal name="indicator" property="calmode" value="1">
                                        <!-- SQL方式实现 -->
                                        <html:link name="map"
                                            page="/indicator/indicator_mulsql_edit.do?flag=1">SQL编辑</html:link>
                                        <html:link name="map"
                                            page="/indicator/indicator_colmap.do">关系映射</html:link>
                                    </logic:equal>
                                    <logic:equal name="indicator" property="calmode" value="2">
                                        <!-- 界面方式实现 -->
                                        <html:link name="map"
                                            page="/indicator/indicator_mulsql_edit.do">公式编辑</html:link>
                                    </logic:equal>
                                     <logic:equal name="indicator" property="implway" value="2">
                                        <!-- 界面方式实现 -->
                                        <html:link name="map"
                                            page="/indicator/t09_indicator_md_back.do">退回探索</html:link>
                                    </logic:equal>
                                </logic:equal>
                                <logic:equal name="indicator" property="indictype" value="2">
                                    <!-- 衍生指标 -->
                                    <html:link name="map"
                                        page="/indicator/t01_indic_subitem2_modify.do">公式编辑</html:link>
                                </logic:equal>
                                <logic:equal name="indicator" property="indictype" value="3">
                                    <!-- 财务指标 -->
                                    <html:link name="map"
                                        page="/indicator/t01_indic_subitem3_modify.do">公式编辑</html:link>
                                </logic:equal>
                            </TD>
                        </TR>
                    </logic:iterate>
                </TABLE>
            </div>

		
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
     
        </html:form>
    </div>
</BODY>
</html>

