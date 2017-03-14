<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

  <div class="cond_c" >
	  
     <!-- 培训记录 -->
    <logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
        <tr >
		     <td> <font color="#FF0000">*</font>培训时间：</td>
		     <td >
		      <html:text  name="t07_recordActionForm" property="create_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		
		        
		       -
		       <html:text  name="t07_recordActionForm" property="create_end_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		       </td>	
        </tr>
	    <tr >
		     <td > <font color="#FF0000">*</font>培训内容：</td>
		     <td   >
		     <html:textarea name="t07_recordActionForm" property="content" cols="40" rows="5" ></html:textarea>
		     </td>
	    </tr>
	     
	     <tr >
		     <td > <font color="#FF0000">*</font>培训对象：</td>
		     <td > 
		      <html:textarea name="t07_recordActionForm" property="remark1" cols="40" rows="5" ></html:textarea>
		      <!-- 
		        <html:text name="t07_recordActionForm" property="remark1"  size="40" />
		       -->
		     </td>
	     </tr>
	     
	     <tr >
		     <td > <font color="#FF0000">*</font>参加人数：</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark2"  size="40" /> 
		     </td>
	     </tr>
	     
	     <tr >
		     <td > <font color="#FF0000">*</font>培训方式：</td>
		     <td > 
		      <html:text name="t07_recordActionForm" property="remark3"  size="40" />
		     </td>
	     </tr>
    </logic:equal>
    
     <!-- 宣传记录 -->
    <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
        <tr >
		     <td > <font color="#FF0000">*</font>活动时间：</td>
		     <td  >
		      <html:text  name="t07_recordActionForm" property="create_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		
		       -
		        <html:text  name="t07_recordActionForm" property="create_end_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		
		       </td>	
        </tr>
	    <tr >
		     <td > <font color="#FF0000">*</font>宣传内容：</td>
		     <td   >
		     <html:textarea name="t07_recordActionForm" property="content" cols="40" rows="5"  ></html:textarea>
		     </td>
	    </tr>
	     
	     <tr>
		     <td > <font color="#FF0000">*</font>参加人数：</td>
		     <td > 
		      <html:text name="t07_recordActionForm" property="remark1"  size="40" />
		     </td>
	     </tr>
	     
	     <tr >
		     <td> <font color="#FF0000">*</font>宣传方式：</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark3"  size="40" /> 
		     </td>
	     </tr>
	     
	     <tr>
		     <td > <font color="#FF0000">*</font>发放材料份数</：</td>
		     <td > 
		      <html:text name="t07_recordActionForm" property="remark2"  size="40" />
		     </td>
	     </tr>
    </logic:equal>
    
     <!-- 内控制度 -->
    <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
        <tr  >
		     <td> <font color="#FF0000">*</font>制度名称：</td>
		     <td >
		       <html:textarea name="t07_recordActionForm" property="remark1" cols="40" rows="5" ></html:textarea>
		     </td>	
        </tr>
	    <tr >
		     <td > <font color="#FF0000">*</font>主要内容：</td>
		     <td >
		     <html:textarea name="t07_recordActionForm" property="content" cols="40" rows="5"  ></html:textarea>
		     </td>
	    </tr>
	     
	     <tr  >
		     <td> <font color="#FF0000">*</font>制定部门：</td>
		     <td > 
		      <html:text name="t07_recordActionForm" property="record_obj" size="40" />
		     </td>
	     </tr>
	     
	     <tr >
		     <td > <font color="#FF0000">*</font>制定时间：</td>
		     <td > 
		     <html:text  name="t07_recordActionForm" property="create_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		        <logic:equal value="yes" name="searchPage" scope="request">
		       -
		       <html:text  name="t07_recordActionForm" property="create_dt_end_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		      </logic:equal>
		     </td>
	     </tr>
	     
	     <tr >
		     <td > <font color="#FF0000">*</font>相关文号：</td>
		     <td > 
		      <html:text name="t07_recordActionForm" property="remark2"  size="40" />
		     </td>
	     </tr>
    </logic:equal>
    
     <!-- 内部审计 -->
    <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
        <tr  >
		     <td > <font color="#FF0000">*</font>审计部门名称：</td>
		     <td  >
		       <html:text name="t07_recordActionForm" property="record_obj"  size="40" />
		       
		     </td>	
        </tr>
	    <tr >
		     <td > <font color="#FF0000">*</font>审计期限：</td>
		     <td   >
		     <html:text  name="t07_recordActionForm" property="create_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		       -
		        <html:text  name="t07_recordActionForm" property="create_end_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		       </td>
	    </tr>
	     
	     <tr >
		     <td> <font color="#FF0000">*</font>审计项目名称及主要内容：</td>
		     <td > 
		      <html:textarea name="t07_recordActionForm" property="content" cols="40" rows="5"  ></html:textarea>
		      <!-- 
		      <html:text name="t07_recordActionForm" property="content"  size="40" />
		       --> 
		     </td>
	     </tr>
	     
	     <tr >
		     <td > <font color="#FF0000">*</font>审计发现的主要问题：</td>
		     <td > 
		       <html:textarea name="t07_recordActionForm" property="remark1" cols="40" rows="5"  ></html:textarea>
		       <!-- 
		       <html:text name="t07_recordActionForm" property="remark1"  size="5" /> 
		        -->  
		     </td>
	     </tr>
	     
	     <tr >
		     <td > <font color="#FF0000">*</font>问题整改情况：</td>
		     <td > 
		      <html:textarea name="t07_recordActionForm" property="remark3" cols="40" rows="5"  ></html:textarea>
		      <!-- 
		      <html:text name="t07_recordActionForm" property="remark3"  size="40" />
		       -->		      
		     </td>
	     </tr>
	     
	     <!-- add lixx 2010.10.21 人行需求添 加 -->
	     <tr >
	       <td colspan="2">
	        <table  border="0" cellpadding="1" cellspacing="1">
	           <tr>
	        	  <td ><font color="#FF0000">*</font>内控制度不完善:</td>
		          <td> 
			   		 <html:select property="remark4" >
						<html:options collection="remarkMap" property="label"
							labelProperty="value"/>
					 </html:select> 
			      </td>
				  <td><font color="#FF0000">*</font>大额可疑交易漏报：</td>
			      <td> 
			    	 <html:select property="remark5">
						<html:options collection="remarkMap" property="label"
							labelProperty="value"/>
					 </html:select> 
		     	  </td>
	           </tr>
		       <tr>
			      <td><font color="#FF0000">*</font>客户身份识别不到位：</td>
			      <td > 
			    	 <html:select property="remark6">
						<html:options collection="remarkMap" property="label"
							labelProperty="value"/>
					 </html:select>
			      </td> 
			      <td><font color="#FF0000">*</font>未发现问题：</td>
			      <td > 
			    	 <html:select property="remark7">
						<html:options collection="remarkMap" property="label"
							labelProperty="value" />
					 </html:select>
			      </td>
		       </tr>
			   <tr >
			      <td><font color="#FF0000">*</font>宣传培训不到位：</td>
			      <td > 
			     	 <html:select  property="remark8">
						<html:options collection="remarkMap" property="label"
							labelProperty="value" />
					 </html:select>
			      </td>
			      <td><font color="#FF0000">*</font>客户资料保存不全：</td>
			      <td > 
				     <html:select property="remark9">
						<html:options collection="remarkMap" property="label"
							labelProperty="value" />
					 </html:select>
			      </td>
		       </tr>
		       <tr >
			      <td><font color="#FF0000">*</font>其他问题：</td>
			      <td >  
					 <html:select property="remark10">
						<html:options collection="remarkMap" property="label"
							labelProperty="value" />
					 </html:select>
			      </td>
			      <td></td>
			      <td ></td>  
		       </tr>
	        </table>
	       </td>
	     </tr>
	     <!-- end  lixx 2010.10.21 人行需求添 加 -->
	     
    </logic:equal>
    
     <!-- 打击洗钱活动情况 -->
    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
        <tr >
		     <td height="22" align="right" nowrap> <font color="#FF0000">*</font>被协助部门：</td>
		     <td >
		       <html:text name="t07_recordActionForm" property="record_obj"  size="40" />	    
		     </td>	
        </tr>
	    <tr >
		     <td height="22" align="right"  nowrap> <font color="#FF0000">*</font>协助时间：</td>
		     <td width="90%"  >
		    <html:text  name="t07_recordActionForm" property="create_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		        -
		       <html:text  name="t07_recordActionForm" property="create_end_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		        </td>
	    </tr>
	     
	     <tr>
		     <td height="22" align="right" nowrap> <font color="#FF0000">*</font>协助内容：</td>
		     <td > 
		      <html:textarea name="t07_recordActionForm" property="content" cols="40" rows="5"  ></html:textarea>
		      <!--
		      <html:text name="t07_recordActionForm" property="content"  size="40" /> 
		       -->		      
		     </td>
	     </tr>
	     
	     <tr  >
		     <td height="22" align="right"   nowrap> <font color="#FF0000">*</font>效果：</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark1"  size="40" /> 
		     </td>
	     </tr>
	     
	     <tr  >
		     <td height="22" align="right"   nowrap> 
			<font color="#FF0000">*</font>
		     协助单位(公安机关/其他机关)：</td>
		     <td > 
		      <html:text name="t07_recordActionForm" property="remark2"  size="40" />
		     </td>
	     </tr>
	     
	     <!-- add lixx 2010.10.21 人行需求添 加 -->
	     <tr  >
		     <td height="22" align="right"   nowrap><font color="#FF0000">*</font>配合调查次数：</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark4"  size="40"/> 
		     </td>
	     </tr>
	     <tr  >
		     <td height="22" align="right"   nowrap><font color="#FF0000">*</font>冻结人民币次数：</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark5"  size="40"/> 
		     </td>
	     </tr>
	     <tr  >
		     <td height="22" align="right"   nowrap><font color="#FF0000">*</font>冻结人民币金额（万元）：</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark6"  size="40"/> 
		     </td>
	     </tr>
	     <tr  >
		     <td height="22" align="right"   nowrap><font color="#FF0000">*</font>冻结外币次数：</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark7"  size="40"/> 
		     </td>
	     </tr>
	     <tr  >
		     <td height="22" align="right"   nowrap><font color="#FF0000">*</font>冻结外币金额（万美元）：</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark8"  size="40"/> 
		     </td>
	     </tr>
	     <tr  >
		     <td height="22" align="right"   nowrap><font color="#FF0000">*</font>报告人民币份数：</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark9"  size="40"/> 
		     </td>
	     </tr>
	     <tr  >
		     <td height="22" align="right"   nowrap><font color="#FF0000">*</font>报告人民币金额（万元）：</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark10"  size="40"/> 
		     </td>
	     </tr>
	     <tr  >
		     <td height="22" align="right"   nowrap><font color="#FF0000">*</font>报告外币份数：</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark11"  size="40"/> 
		     </td>
	     </tr>
	     <tr  >
		     <td height="22" align="right"   nowrap><font color="#FF0000">*</font>报告外币金额（万美元）：</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark12"  size="40"/> 
		     </td>
	     </tr>
	     <!-- end  lixx 2010.10.21 人行需求添 加 -->
	     
    </logic:equal>
    
 
 </div>

