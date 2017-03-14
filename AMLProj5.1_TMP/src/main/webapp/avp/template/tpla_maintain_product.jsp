<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<HTML>
    <HEAD>
        <%@ include file="../../bmp/platform/common/style_include.jsp" %>
        <%

String username = auth.getT00_user().getUsername();
String groupkey = auth.getCurrGroupkey();
%>
        <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
        
        <script  src="<%=request.getContextPath()%>/js/awp_base.js"></script>
        <SCRIPT  src="<%=request.getContextPath()%>/js/basefunc.js"></SCRIPT>
        <SCRIPT  src="<%=request.getContextPath()%>/js/load_window.js"></SCRIPT>
        <SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = true;
    if(type=='ok'){
    	if (document.forms[0].busstypecd.value==''){
    		errMsg += "请选择业务类别！";
    	}   
    	
    	if(errMsg=='' && document.forms[0].busstypecd_old.value!=''){
    		if(!confirm('该模板已投产,是否要重新投产？')){
	        	isSub = false;
	        }
    	}
    }
	else if(type=='back'){
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

function onChangeValue() {
    
}

</SCRIPT>
    </HEAD>
    <BODY leftmargin="0" topmargin="0"  >
        <div id='content'>
            <html:form method="post" action="/template/tpla_maint_product.do">
                <input type="hidden" name="tplakey" value="<bean:write name="t02_tp_bas_inf" property="tplakey" />"/>            
                <input type="hidden" name="busstypecd_old" value="<bean:write name="t02_tp_bas_inf" property="busstypecd" />"/>      
                <div class='awp_title'>
                    <table>
                        <tr>
                            <td>
                                <span class="awp_title_td2">查证模型 - 投产应用</span>
                            </td>
                            <td align="right">
                               <input type="button" name="backbutton" value="返 回" class="input"
                                    onClick="dosubmit('tpla_maint_list.do','back')">                                
                            </td>
                        </tr>
                    </table>
                </div>

                <html:messages id="errors" message="true">
                    <bean:write name="errors" filter="fasle" />
                </html:messages>

                <div class="awp_detail">
                    <table>
                        <tr>
                            <td align="right" nowrap>
                                <FONT color="#ff0000">*</FONT>模板名称：
                            </td>
                            <td nowrap>
                                <bean:write name="t02_tp_bas_inf" property="tplaname" ignore="true"/>
                            </td>
                        </tr>
                        
                        <tr>
                            <td align="right" nowrap>
                                <FONT color="#ff0000">*</FONT>业务类别：
                            </td>
                            <td nowrap>
                                <html:text property="busstypecd_disp" size="20" />
                                <input type="button" name="tool" onclick="locate_tree_window('<%=request.getContextPath() %>','t00_tooltree','forms[0]','busstypecd,busstypecd_disp','radio','&username=<%=username %>&groupkey=<%=groupkey %>')" value="单 选" />
							    <html:hidden property="busstypecd"/>
                            </td>
                        </tr>

                        <tr>
                            <td align="right" nowrap>
                                &nbsp;
                            </td>
                            <td nowrap>
                                <input type="button" name="publishbutton" value="投产应用" class="input"
                                    onClick="dosubmit('tpla_maint_product_do.do','ok')">
                            </td>
                        </tr>
                    </table>
                </div>
            </html:form>
        </div>
    </BODY>
</HTML>
