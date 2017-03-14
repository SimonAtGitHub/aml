<%@ page contentType="text/html; charset=GBK"%>
<%@page import="com.ist.common.metadata.dto.T01_mt_property;"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gbk">
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style")%>.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/awp_base.js"></script>
        
<SCRIPT LANGUAGE="JavaScript"> 
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type == 'add'){
    	isSub = true;
    }
    if(type=='modi'){ 
    	errMsg = CheckBoxCheckedSingleOne(document.forms[0]);  	
    	isSub = true;	
	}
    if(type=='del'){
    	errMsg = CheckBoxMustChecked(document.forms[0]);
    	if(errMsg == ""){
            if(confirm('你真的要删除选择的列吗？')){
            	isSub = true;
            } 
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
           function getUrl(url,parm){
             var theUrl = url+"?newsearchflag=1&"+parm;
             document.forms[0].action=theUrl;
             document.forms[0].submit();
           }
 </script>          
           

	</HEAD>
<BODY leftmargin="0" topmargin="0">
<div id="main">
<html:form method="post" action="/entity/t03_entity_kind_man_index.do">
	<html:hidden property="tablekey"/>
	<html:hidden property="tableename"/>
	<div class="conditions">
    	<div class="cond_t">
    		<span>［<bean:write name="t03_entity_kind_manActionForm" property="tablecname"/>］ - 列属性维护</span>
    		<span class="buttons">
    			<a href="#" onClick="dosubmit('col_t03_entity_kind_man_add.do','add');"><img src="../../images/<%=session.getAttribute("style") %>/b_add2.png" />新 建</a>
				<a href="#" onClick="dosubmit('col_t03_entity_kind_man_modify.do','modi');"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />修 改</a>
				<a href="#" onClick="dosubmit('col_t03_entity_kind_man_delete_do.do','del');"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a>
				<a href="#" onclick="dosubmit('t03_entity_kind_man_list.do','add')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返  回</a>
			</span>
        </div>
		<html:errors />
		<div class="list"> 
		     <table>
		       <tr>
		        <td   onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;' width="5%">全部</td>
		         <td>列中文名称</td>
		         <td>列英文名称</td>
		         <td>字段类型</td>
		         <td>字段长度</td>
		         <td>字段精度</td>
		         
		       </tr>
		       
	           <logic:iterate id="dataMaintList" name="col_t03_entity_kind_manList" type="com.ist.common.metadata.dto.T01_mt_col_pro">
	            <tr> 
	              <td height=22 align="center" nowrap>
	                <logic:equal name="dataMaintList" property="colename" value="EVENTKEY">
	                     <html:multibox property="selectedtable" disabled="true">
						      <bean:write name="dataMaintList" property="colename" />
					    </html:multibox>
	                </logic:equal>
	                <logic:notEqual name="dataMaintList" property="colename" value="EVENTKEY">
	                    <html:multibox property="selectedtable">
						     <bean:write name="dataMaintList" property="colename" />
					    </html:multibox>
	                </logic:notEqual>
                    
		          </td> 
	               <td align="left"><bean:write name="dataMaintList" property="colcname" scope="page"/></td>
	                <td align="left"><bean:write name="dataMaintList" property="colename" scope="page"/></td>
	               <td>
	                   <bean:write name="dataMaintList" property="coltype" scope="page"/>
	             
	              </td> 
	              <td align="center">
	              	<logic:notEqual value="DATE" name="dataMaintList" property="coltype">
	              		<bean:write name="dataMaintList" property="colprecision" scope="page"/>
	              	</logic:notEqual>
	              </td>  
	              <td align="center">
	              <logic:notEqual value="DATE" name="dataMaintList" property="coltype">
	              	<logic:notEqual value="VARCHAR" name="dataMaintList" property="coltype">
	              		<bean:write name="dataMaintList" property="colscale" scope="page"/>
	              	</logic:notEqual>
	              </logic:notEqual>
	              </td>  
                </tr>
	           </logic:iterate>
	         </table>
	       </div>
	</div>
</html:form>
</div>
</BODY>
</HTML>
