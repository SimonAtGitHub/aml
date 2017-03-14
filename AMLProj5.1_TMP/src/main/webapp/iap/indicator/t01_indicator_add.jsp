<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <html:base />
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

  	//为财务指标时：粒度不显示 指标类别不显示 标准值：显示
  	var trElement = document.getElementById("indic3");
  	var trElementorg = document.getElementById("noindic3");
  	var appEl = document.getElementsByName("apptype");
    if(selvalue==3){
    	trElement.style.display="";
    	trElementorg.style.display="none";
		trElementorg.value="";
    }else{
    	trElementorg.style.display="";
    	trElement.style.display="none";
		trElement.value="";
    }
}
        function checkForm(theUrl){
		    var errMsg ="";
		   if(getLength(document.forms[0].indickey.value)==0){
		        errMsg+="请输入指标编码！";
		        document.forms[0].indickey.focus();
		    }
		    else if(getLength(document.forms[0].indickey.value)!=7){
		        errMsg+="指标编码必须为7位！";
		        document.forms[0].indickey.focus();
		    }  	
		   else if(getLength(document.forms[0].indicname.value)==0){
		        errMsg+="请输入指标名称！";
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

<body class="mainbg">
    <div id='main'>
        <html:form method="POST" action="/indicator/indicator_add_do.do">
           <div class="conditions">
            <div class="cond_t">
               <span>指标定义 - 新 建</span>
			   <span class="buttons">
			    <a href="javascript:void(0);" onclick="dosubmit(contextPath+'/iap/indicator/indicator_list.do');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
			   </span>
            </div>
            <html:messages id="errors" message="true">
                <bean:write name="errors" filter="fasle" />
            </html:messages>

            <div class="cond_c2">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <FONT color="#ff0000">*</FONT>指标编码：
                        </td>
                        <td>
                            <html:text property="indickey" size="30" />
                            <FONT color="#ff0000"> 注：指标编码必须为7位</FONT>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <FONT color="#ff0000">*</FONT>指标名称：
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
                            <html:select property="indictype" onchange="_Click()">
                                <html:options collection="indictypeMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                        </td>
                    </tr>
                    <tr>
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
                            指标实现性质：
                        </td>
                        <td>
                            <html:select property="resultype">
                                <html:options collection="resultypeMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                        </td>
                    </tr>
                    <tr id="noindic3">
                        <td>
                            计算粒度：
                        </td>
                        <td>
                            <html:checkbox property="guizld_1" value="1">日</html:checkbox>
                            <html:checkbox property="guizld_4" value="1">月</html:checkbox>
                            <html:checkbox property="guizld_5" value="1">季</html:checkbox>
                            <html:checkbox property="guizld_7" value="1">年</html:checkbox>
                        </td>
                    </tr>
                    <tr>
                        <td>
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
                        <td>
                            <FONT color="#ff0000">*</FONT>显示序号：
                        </td>
                        <td>
                            <html:text property="dispseq" size="10" />
                        </td>
                    </tr>


                    <tr>
                        <td>
                            指标描述：
                        </td>
                        <td>
                            <html:textarea property="des" cols="60" rows="6" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <html:button property="button" styleClass="in_button1" value="提 交"
                                onclick="checkForm('indicator_add_do.do')" />
                            <html:reset styleClass="in_button1" value="重 填" />
                        </td>
                    </tr>
                </table>
            </div>
            </div>
        </html:form>
    </div>
    
</body>

</html>
