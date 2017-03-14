<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html:html>
<HEAD>
    <META http-equiv=Content-Type content="text/html; charset=gb2312">
    <%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
    
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
    <SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
    <SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
   <SCRIPT LANGUAGE="JavaScript"> 

function checkForm(theUrl){
    var errMsg ="";
    //附件名称
    if(getLength(document.forms[0].attachname.value)==0){
        errMsg += "码表内容不能为空！";
        document.forms[0].attachname.focus();
    }else{
		errMsg = check_input(document.forms[0].attachname.value);
	}
    if(errMsg != ""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action = theUrl;
        document.forms[0].submit();
    }
}

//检查输入格式是否有误	
function check_input(str){
	var arrcol = str.split("\n");		
	for(i=0;i<arrcol.length;i++){
		var col = arrcol[i].split(",");
		if(col.length != 2){
			return("输入格式有错误，请重新输入");
		}else{
			if(getLength(col[0]) > 12){
				return("码值不能超过12位字符，请重新输入");
			}
			if(getLength(col[1]) > 32){
				return("码值名称不能超过32位字符，请重新输入");
			}
		}
	}		
	return("");
}
	</SCRIPT>
</HEAD>
<body>
	<div id='content'>
		<html:form method="post" action="/businessmanager/t12_programa_attachtype/t12_programa_attachtype_add_do.do">

			 <div class='awp_title'>
                <table>
                    <tr>
                        <td>
                            <span class="awp_title_td2">栏目附件类别管理
									- 新 建</span>
                        </td>
                        <td align="right" nowrap>
						    <html:button property="button4" value="返 回" styleClass="input"
							onclick="awpDoSubmit('t12_programa_attachtype_list.do','add')" />
                        </td>
                    </tr>
                </table>
            </div>
            
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<html:hidden property="programakey"/>
			<div class='awp_detail'>
				<table>
					
					<tr>
						<td>
							<font color="red">*</font>附件类别：
						</td>
						<td>
						  <html:textarea property="attachname" cols="60" rows="30"
											styleClass="text_white"></html:textarea>
						</td>
					</tr>
				
				    <tr>
						<td>
							&nbsp;
						</td>
						<td>
							<input type="button" value="提 交" OnClick="checkForm('t12_programa_attachtype_add_do.do')">
							<html:reset styleClass="input" value="重 填"/>
						</td>
					</tr>
				</table>
			</div>

		</html:form>
	</div>
<div class="awp_msgtab">
	  <table>
		<tr> 
        <td ><p><strong>系统提示：</strong><br>
        <ol>
				<li> 文本域添加信息格式为码值和码值名称之间要用","逗号分割然后回车再添加下一个
				<li> 例如 1,正常<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2,禁用<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3,删除<br>
			</ol>
        </td>
        </tr>
      </table>
    </div>

</body>
</html:html>
