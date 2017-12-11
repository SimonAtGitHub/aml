<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<div class="cond_c" >
	  <table border="0" cellpadding="0" cellspacing="0" id="searchtable">
       <tr>
         <td>
            <logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
				    培训时间：
				    </logic:equal>
				    <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
				    活动时间：
				    </logic:equal>
				    <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
				    制度名称：
				    </logic:equal>
				    <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
				    审计部门名称：
				    </logic:equal>
				    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
				    被协助部门：
		 </logic:equal>
         </td>
         <td>
         <logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
          <html:text name="t07_recordActionForm" property="create_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		     -
		    <html:text name="t07_recordActionForm" property="create_dt_end_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
   
	       </logic:equal>
	    
	    <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
	       
	    <html:text name="t07_recordActionForm" property="create_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		     -
		    <html:text name="t07_recordActionForm" property="create_dt_end_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
   
	    </logic:equal>
	    
	    <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
	         <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark1" size="30" maxlength="256"></html:text>
	    </logic:equal>
	    
	    <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
	         <html:text name="t07_recordActionForm" property="record_obj" maxlength="256" styleClass="text_white" size="30" />
	    </logic:equal>
	    
	    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
	         <html:text name="t07_recordActionForm" property="record_obj" maxlength="256" styleClass="text_white" size="30" />
	    </logic:equal>
			</td>
        <td align="right" >
        <logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
		    培训内容：
		    </logic:equal>
		    <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
		    宣传内容：
		    </logic:equal>
		    <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
		    主要内容：
		    </logic:equal>
		    <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
		    审计期限：
		    </logic:equal>
		    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
		    协助时间：
		    </logic:equal>
        </td>
          <td width="40%">
          <logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
			    <html:text  name="t07_recordActionForm" styleClass="text_white" property="content" size="30"></html:text>
			</logic:equal>
		    
		    <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
		        <html:text  name="t07_recordActionForm" styleClass="text_white" property="content" size="30"></html:text>
		    </logic:equal>
		    
		    <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
		         <html:text  name="t07_recordActionForm" styleClass="text_white" property="content" size="30"></html:text>
		    </logic:equal>
		    
		    <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
	          
		    <html:text name="t07_recordActionForm" property="create_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		     -
		    <html:text name="t07_recordActionForm" property="create_dt_end_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
   
		   </logic:equal>
		    
		    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
		          <html:text name="t07_recordActionForm" property="create_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		     -
		    <html:text name="t07_recordActionForm" property="create_dt_end_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
              </logic:equal>	
          </td>
        </tr>
	    <tr>
			<td>
			<logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
			    培训对象：
			    </logic:equal>
			    <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
			    参加人数：
			    </logic:equal>
			    <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
			    制定部门：
			    </logic:equal>
			    <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
			    审计项目名称及主要内容：
			    </logic:equal>
			    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
			    协助内容：
			    </logic:equal>
			</td>
			<td><logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
			    <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark1" size="30" maxlength="256"></html:text>
			</logic:equal>
		    
		    <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
		        <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark1" size="30" maxlength="256"></html:text>
		    </logic:equal>
		    
		    <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
		         <html:text  name="t07_recordActionForm" styleClass="text_white" property="record_obj" maxlength="256" size="30"></html:text>
		    </logic:equal>
		    
		    <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
		         <html:text  name="t07_recordActionForm" styleClass="text_white" property="content" size="30"></html:text>
		   </logic:equal>
		    
		    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
		         <html:text  name="t07_recordActionForm" styleClass="text_white" property="content" size="30"></html:text>
		    </logic:equal>
		    </td>

		    <td ><logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
				    参加人数：
				    </logic:equal>
				    <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
				    宣传方式：
				    </logic:equal>
				    <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
				    制定时间：
				    </logic:equal>
				    <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
				    审计发现的主要问题：
				    </logic:equal>
				    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
				    效果：
				    </logic:equal>
			</td>
		    <td>
		    <logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
			    <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark2" maxlength="256" size="30"></html:text>
			</logic:equal>
		    
		    <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
		        <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark3" maxlength="256" size="30"></html:text>
		    </logic:equal>
		    
		    <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
		     <html:text name="t07_recordActionForm" property="create_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		     -
		    <html:text name="t07_recordActionForm" property="create_dt_end_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
   
		    </logic:equal>
		    
		    <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
		         <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark1" size="30" maxlength="256"></html:text>
		   </logic:equal>
		    
		    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
		         <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark1" size="30" maxlength="256"></html:text>
		    </logic:equal>
		    </td>
			</tr>
            <tr >
				<td >
                 <logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
				    培训方式：
				    </logic:equal>
				    <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
				    发放材料份数：
				    </logic:equal>
				    <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
				    相关文号：
				    </logic:equal>
				    <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
				    问题整改情况：
				    </logic:equal>
				    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
				    协助单位(公安机关/其他机关)：
				    </logic:equal>
                 </td>
				<td >
				 <logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
				    <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark3" maxlength="256" size="30"></html:text>
				</logic:equal>
			    
			    <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
			        <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark2" maxlength="256" size="30"></html:text>
			    </logic:equal>
			    
			    <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
			         <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark2" maxlength="256" size="30"></html:text>
			    </logic:equal>
			    
			    <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
			         <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark3" maxlength="256" size="30"></html:text>
			   </logic:equal>
			    
			    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
			         <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark2" maxlength="256" size="30"></html:text>
			    </logic:equal>
				</td>

				<td >  &nbsp;
				    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
				         季度：
				    </logic:equal>
				</td>
				<td>
				<logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
				       <html:select name="t07_recordActionForm" property="quarter">
					       <html:option value="">选择季度</html:option>
					       <html:option value="1">第一季度</html:option>
					       <html:option value="2">第二季度</html:option>
					       <html:option value="3">第三季度</html:option>
					       <html:option value="4">第四季度</html:option>
				    </html:select>
				    </logic:equal>
				    &nbsp;
										
					                  
					</td>

				</tr>
				<tr >
	          <td height="22" align="right" >机构名称：</td>
	          <td hight="40" colspan="3">
		          <bean:define id="organMultiSelHTMLStr" name="organMultiSelHTMLStr"></bean:define>
				  <%=organMultiSelHTMLStr%>
	          </td>
							          
			 </tr>
			 <tr bgcolor="ECF3FF">
			<td height="" align="right" colspan="4"  class="in_button">
				<input type=button value="查  询" name=sub  onClick="dosubmit('gett07_record_list.do?newsearchflag=1&record_type_cd=<bean:write name="t07_recordActionForm" property="record_type_cd" ignore="true"/>','search')">
				<html:button property="clear"  value="清 空" onclick="clearText()"></html:button>
			</td>
			</tr>
								
	  </table>
	</div>
  </div>

