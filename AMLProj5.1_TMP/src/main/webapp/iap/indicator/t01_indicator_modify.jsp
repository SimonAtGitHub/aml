<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<html:html lang="true">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="../../js/basefunc.js"></script>
    <script type="text/javascript" src="../../js/jquery.js"></script>
    <script type="text/javascript" src="../../js/aml.js"></script>  
    <SCRIPT LANGUAGE="JavaScript">
	var contextPath='<%=request.getContextPath()%>';
	function _Click(){
			var  fromarea=eval(document.forms[0].indictype);
		   
		    var index=fromarea.selectedIndex;
			var selvalue=fromarea.options[index].value;
		  
		  	var j;
		  	
		  	//为财务指标时：粒度不显示 指标类别不显示 标准值：显示
		  	var trElement = document.getElementById("indic3");
		  	var trElementorg = document.getElementById("noindic3");
		  	var trElementcat = document.getElementById("noindic5");
		  	var trElementcatn = document.getElementById("noindic6");
		    if(selvalue==3){
		    	trElement.style.display="";
		    	trElementorg.style.display="none";
		    	trElementcat.style.display="none";
				trElementorg.value=""
				trElementcatn.value=""
		    }else{
		    	trElementorg.style.display="";
		    	trElementcat.style.display="";
		    	trElement.style.display="none";
		    	trElementcatn.value="none"
				trElement.value=""
		    }
		}
		function checkForm(theUrl){
		    var errMsg ="";
		   if(getLength(document.forms[0].indicname.value)==0){
		        errMsg+="指标名称不能为空！";
		        document.forms[0].indicname.focus();
		    } 
		    else if(getLength(document.forms[0].indicname.value)>64){
		        errMsg+="指标名称不能大于64个字符！";
		        document.forms[0].indicname.focus();
		    } 		       
		    
		    else if(getLength(document.forms[0].des.value)>256){
		        errMsg+="指标描述不能大于256个字符！";
		        document.forms[0].des.focus();
		    } 
		    		       
		    if(errMsg!=""){
		        alert(errMsg);
		        return false;
		    }else{
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		    }
		}
		function clearNoNum(obj){
			 obj.value = obj.value.replace(/[^\d.]/g,"");
			 obj.value = obj.value.replace(/^\./g,"");
			 obj.value = obj.value.replace(/\.{2,}/g,".");
			 obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
		}		
		function dosubmit(theUrl){			
			 parent.location = theUrl;
		}
</SCRIPT>
</head>

<body leftmargin="0" topmargin="0">
    <div id='main'>
        <html:form method="POST" action="/indicator/indicator_add_do.do">
            <div class="conditions">
	            <div class="cond_t">
                  <span>指标定义 - 修 改</span>
				  <span class="buttons">
				    <a href="javascript:void(0);" onclick="dosubmit(contextPath+'/iap/indicator/indicator_list.do');return false;"  class="btn btn_back"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
				  </span>
	            </div>
			

            <div class="cond_c2">
                <table id="query_table" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="right">
                            <FONT color="#ff0000">*</FONT>指标编码：
                        </td>
                        <td>
                            <bean:write name="t09_indicatorActionForm" property="indickey" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <FONT color="#ff0000">*</FONT>指标名称：
                        </td>
                        <td>
                            <html:text property="indicname" size="30" />
                            <html:hidden property="indickey" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            指标属性：
                        </td>
                        <td>
                            <html:select property="indictype" onchange="_Click()" disabled="true">
                                <html:options collection="indictypeMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                            <html:hidden property="indictype" name="t09_indicatorActionForm" />
                        </td>
                    </tr>
                   
                        <tr id="noindic5">
                            <td align="right">
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
                        <td align="right">
                            指标实现性质：
                        </td>
                        <td>
                            <html:select property="resultype">
                                <html:options collection="resultypeMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                        </td>
                    </tr>
                  
                    <logic:notEqual value="3" property="indictype" name="t09_indicatorActionForm">
                        <tr id="noindic3">
                            <td align="right">
                                计算粒度：
                            </td>
                            <td>
                                <html:checkbox property="guizld_1" value="1">日</html:checkbox>
                                <html:checkbox property="guizld_4" value="1">月</html:checkbox>
                                <html:checkbox property="guizld_5" value="1">季</html:checkbox>
                                <html:checkbox property="guizld_7" value="1">年</html:checkbox>
                            </td>
                        </tr>
                    </logic:notEqual>
                    <logic:equal value="3" property="indictype" name="t09_indicatorActionForm">
                        <tr id="indic3">
                            <td align="right">
                                标准值：
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td nowrap align="right">
                                            银监会标准值：
                                        </td>
                                        <td>
                                            <html:text property="stdval1" styleClass="text_white"
                                                onkeyup="clearNoNum(this)" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" nowrap>
                                            行业标准值：
                                        </td>
                                        <td>
                                            <html:text property="stdval2" styleClass="text_white"
                                                onkeyup="clearNoNum(this)" />
                                            <FONT color="#ff0000">注意：标准值可以为空，如果输入，必须为整数或者小数</FONT>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" nowrap>
                                            我行标准值：
                                        </td>
                                        <td>
                                            <html:text property="stdval3" styleClass="text_white"
                                                onkeyup="clearNoNum(this)" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </logic:equal>
                    <tr>
                        <td align="right">
                            状态：
                        </td>
                        <td>
                            <html:select property="flag">
                                <html:options collection="flagMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <FONT color="#ff0000">*</FONT>显示序号：
                        </td>
                        <td>
                            <html:text property="dispseq" size="10" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            指标描述：
                        </td>
                        <td>
                            <html:textarea property="des" cols="60" rows="6" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <input type="hidden" name="indictype"
                                value="<bean:write property="indictype" name="t09_indicatorActionForm"/>" />
                        </td>
                        <td>
                            <html:button property="button" value="提 交" styleClass="in_button1"
                                onclick="checkForm('indicator_modify_do.do')" />
                            <html:reset styleClass="in_button1" value="重 填" />
                        </td>
                    </tr>
                </table>
            </div>
            </div>
        </html:form>
    </div>
</body>
<script type="text/javascript">
var frame = window.parent["leftFrame"];
frame.refresh();
</script>
</html:html>
