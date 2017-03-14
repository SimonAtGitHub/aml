<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/App_Select.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<SCRIPT language="JavaScript" src="../../js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
		
	function dosubmit(theUrl){
	    document.forms[0].action=theUrl;
	    document.forms[0].submit();
	}
	
    function save(theUrl){ 
		var maxvalue = document.getElementById("maxIndex").value;
		if(maxvalue == 0){
			alert("不能找到源表列，不能进行保存动作");
			return;
		}		
        for(var i=1; i<=maxvalue; i++){
			if(document.getElementById("colename_"+i).value == ""){				
				alert("序号"+i+"的映射列不能为空");
				return;
			}
       }     
      document.forms[0].action=theUrl;
      document.forms[0].submit();
     
    }
	
	
 
	
	function del(flag){ 
	   var key1 = document.getElementById('colename_'+flag);
	   var name1 = document.getElementById('colcname_'+flag);
	   key1.value='';
	   name1.value='';
	}
	
	function ding(index){
	   var rtetfacttable = document.forms[0].rtetfacttable.value;	  
	   var temp=" t1.TABLEENAME='"+rtetfacttable+"'";	   
	   var returnparm="colename_"+index + ",colcname_"+index; 
	   locate_pop_window('<%=request.getContextPath()%>','t03_object_copyconfMappLocation' ,'radio' ,'forms[0]',returnparm,temp); 
	}
</SCRIPT>
	</HEAD>
 <BODY leftmargin="0" topmargin="0"   onbeforeunload="leaveChk()"	>
<div id="main">
 <html:form method="post" action="/entity/result_colmap.do">
<div class="conditions">
	 <input type="hidden" value="<bean:write name="rtetfactsctable"/>" name="rtetfactsctable"/>
	  <input type="hidden" value="<bean:write name="rtettypekey"/>" name="rtettypekey"/>
	  <input type="hidden" value="<bean:write name="rtetfacttable"/>" name="rtetfacttable"/>
	<div class="cond_t">
		<span><strong>结果主体管理  - 映射</strong></span>
		<span class="buttons">
				<a href="#" onclick="save('t03_entity_kind_mapping_do.do')">
 	   			<img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保 存</a>
 	   			<a href="#" onclick="dosubmit('t03_entity_kind_list.do')">
 	   			<img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返  回</a>
		</span>
	</div>
	<html:errors/>
    <input type="hidden" name="maxIndex" id="maxIndex" value="<bean:write name="maxIndex"/>"/>	
	<div class="list">
       <table>
            <tr> 
		        <td width="5%">序号</td> 
		         <td>结果主体事实表列英文名</td>
		         <td>结果主体事实表列中文名</td>
		         <td>映射列英文名</td>
		         <td>映射列中文名</td>
		         <td  width="8%">清除</td>
		     </tr>
		    <%  
		    HashMap map = (HashMap)request.getAttribute("columsMap") ;
		    	if(map == null || map.size() < 0){
		    		map  = new HashMap();
		    	}
		    %>
		     <logic:iterate id="obj" name="columslist" type="com.ist.common.metadata.dto.T01_mt_col_pro"  indexId="index">
		     
	            <tr>  
		             <TD align="center">
							 <%=index.intValue()+1%>		
					 </TD>
	               <td align="left" nowrap="nowrap">
		               <input type="hidden" name="scolename_<%=index.intValue()+1%>" 
		               							value="<bean:write name="obj" property="colename" scope="page"/>"/>
		               <bean:write name="obj" property="colename" scope="page"/>
	               </td>
	               <td align="left" nowrap="nowrap">
	               	 <input type="hidden" name="scolcname_<%=index.intValue()+1%>" 
		               							value="<bean:write name="obj" property="colename" scope="page"/>"/>
	                <bean:write name="obj" property="colcname" scope="page"/> 
	                </td>
	               	<% 
	               	String key = obj.getColename();
	               	boolean flag = map.containsKey(key);          
	               		
	               	%> 	              
	               <td align="left" nowrap="nowrap">
	                            
	                  		<% 
	                  			if(flag){
	                  		%>
	                  		<input type="text" value="<bean:write name="obj" property="colename" scope="page"/>" name="colename_<%=index.intValue()+1%>" id="colename_<%=index.intValue()+1%>" size="30" readonly="readonly"/>
	                  		<% 
	                  		} else{                   	  
	                        	 
	               			%>
	               			 <input type="text" value="" name="colename_<%=index.intValue()+1%>" id="colename_<%=index.intValue()+1%>" size="30" readonly="readonly"/>
	               			<%
	                          }
	               			%>  
	                  		
	               </td> 
	               <td align="left" nowrap="nowrap">	
	               		
	               			<% 
	               			if(flag){
	               				String svalue = (String)map.get(obj.getColename()) ;
	               			
	               			%>
	                  		<input type="text" value="<%=svalue %>" name="colcname_<%=index.intValue()+1%>" id="colcname_<%=index.intValue()+1%>" size="30" readonly="readonly"/>
	                          <%  }  else{                        	  
	                        	 
	               			%>
	               			 <input type="text" value="" name="colcname_<%=index.intValue()+1%>" id="colcname_<%=index.intValue()+1%>" size="30" readonly="readonly"/>
	               			<%
	                          }
	               			%>
	                   <input type="button" name="locate1" value="定 位" class="botton"   onclick="ding('<%=index.intValue()+1%>')">
	               </td>
	               <td  align="center" nowrap="nowrap">
	                    <input type="button" value="取 消" onclick="del('<%=index.intValue()+1%>')">
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
