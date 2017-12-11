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
		<script language="JavaScript" src="../../js/App_Select.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/awp_base.js"></script>
        <SCRIPT language="JavaScript" src="../../js/load_window.js"></script>
        
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
<html:form method="post" action="/entity/t03_entity_kind_man_list.do">
	<div class="conditions">
    	<div class="cond_t">	
            <span>结果主体维护</span>
            <span class="buttons">
				  <a href="#" onClick="dosubmit('t03_entity_kind_man_add.do','add');"><img src="../../images/<%=session.getAttribute("style") %>/b_add2.png" />新 建</a>
				  <a href="#" onClick="dosubmit('t03_entity_kind_man_modify.do','modi');"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />修 改</a>
				  <a href="#" onClick="dosubmit('t03_entity_kind_man_delete_do.do','del');"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a>
					
			</span>
		</div>
		<html:errors />
		  <div class="list"> 
		     <table>
		       <tr>
		        <th width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</th>
		         <th width="30%">表英文名称</th>
		         <th width="30%">表中文名称</th> 
		         <th width="6%">状态</th> 
		         <th width="8%">创建人</th>
		         <th width="21%">创建时间</th>
		         
		       </tr>
		    
	           <logic:iterate id="dataMaintList" name="t03_entity_kind_manList" type="com.ist.aml.rule.dto.T03_entity_kind_man">
	            <tr> 
	              <td height=22 align="center" nowrap>
                    <html:multibox property="selectedtable">
						<bean:write name="dataMaintList" property="tablekey" />
					</html:multibox>
		          </td> 
	               <td><bean:write name="dataMaintList" property="tableename" scope="page"/></td>
	                <td>
	               <a href="javascript:getUrl('<%=request.getContextPath()%>/rule/entity/col_t03_entity_kind_man_list.do','tablekey=<bean:write name="dataMaintList" property="tablekey" />')">
	                   <bean:write name="dataMaintList" property="tablecname" scope="page"/>
	                </a>
	              </td> 
	              <td align="center"><bean:write name="dataMaintList" property="flag_disp" scope="page"/></td>  
	              <td align="center"><bean:write name="dataMaintList" property="creator_disp" scope="page"/></td> 
	              <td align="center"><bean:write name="dataMaintList" property="createdate" scope="page"/></td>
                </tr>
	           </logic:iterate>
	         </table>
	       </div>
	       </div>
		</html:form>
		<script type="text/javascript">
		      var msg='<bean:write name="msg"/>';
		      //alert(msg);
		      if(msg='refresh'){
		          if(window.parent.leftFrame){
                      window.parent.leftFrame.location= '<%=request.getContextPath()%>/platform/pub/menu_left_tree.do?menu_id=t03_entity_kind_man_index_tree';
        		  }   
		      }
		</script>
		 </div>
	</BODY>
</HTML>
