<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   
   <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
   <div class="cond_c">
    <table border="0" cellpadding="0" cellspacing="0">
    <tr> <td colspan="8" align="center"><b>内部审计结论</b></td></tr>
    <TR  >
        
         <td>内控制度不完善:</td>
         <td><bean:write name="t07_recordor" property="remark4"/></td>
         <td>宣传培训不到位:</td>
         <td><bean:write name="t07_recordor" property="remark8"/></td>
         <td >大额可疑交易漏报：</td>
         <td ><bean:write name="t07_recordor" property="remark5"/></td>
           <td >客户资料保存不全：</td>
         <td ><bean:write name="t07_recordor" property="remark9"/></td>
       
       </TR>
       <TR>
         
       
         <td >客户身份识别不到位：</td>
         <td  ><bean:write name="t07_recordor" property="remark6"/></td>
         <td >其他问题：</td>
         <td  ><bean:write name="t07_recordor" property="remark10"/></td>
       
         <td >未发现问题：</td>
         <td   ><bean:write name="t07_recordor" property="remark7"/></td>
         <td ></td>
         <td  ></td>
       </TR>
	   </table>
	   </div>
	 </logic:equal>
	 
	 
	 <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
      <div class="cond_c">
      <table border="0" cellpadding="0" cellspacing="0">
       <TR align=right >
         <TD nowrap><b>配合人行开展调查情况：</b></TD>
         <TD colspan="2">配合调查次数：<bean:write name="t07_recordsum" property="remark4"/></TD>
         
       </TR>
       <TR align=right  >
         <TD rowspan="2"  ><b>执行临时冻结措施情况：</b></TR>
         <TD nowrap>冻结人民币次数：<bean:write name="t07_recordsum" property="remark5"/>&nbsp; &nbsp;&nbsp;&nbsp;
                           冻结人民币金额（万元）：<bean:write name="t07_recordsum" property="remark6"/></td>
         
       <TR align=left >
         <TD nowrap>冻结外币次数：<bean:write name="t07_recordsum" property="remark7"/> &nbsp; &nbsp;&nbsp;&nbsp;
                         冻结外币金额（万美元）：<bean:write name="t07_recordsum" property="remark8"/></TD>
          
       </TR>
       <TR align=right  >
         <TD rowspan="2" width='30%' nowrap><b>向人行报告涉嫌犯罪情况：</b></TD>
         <TD nowrap>报告人民币份数：<bean:write name="t07_recordsum" property="remark9"/>  &nbsp; &nbsp;&nbsp;&nbsp;
                            报告人民币金额（万元）：<bean:write name="t07_recordsum" property="remark10"/></TD>
         
       </TR>
       <TR align=left >
         <TD nowrap>报告外币份数：<bean:write name="t07_recordsum" property="remark11"/> &nbsp; &nbsp;&nbsp;&nbsp;
         报告外币金额（万美元）：<bean:write name="t07_recordsum" property="remark12"/></TD>
     
       </TR>
        </table>
        </div>
    </logic:equal>
    
    <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<TH  nowrap height="22">选择</TH>
		 <logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
      	 <TH nowrap>上报机构</TH>
         <TH nowrap>培训时间</TH>
         <TH width="30%">培训内容</TH>
         <TH  nowrap>培训对象</TH>
         <TH  nowrap>参加人数</TH>
         <TH  noWrap>培训方式</TH>
      </logic:equal>
       <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
      	 <TH nowrap>上报机构</TH>
         <TH nowrap>活动时间</TH>
         <TH width="30%" nowrap>宣传内容</TH>
         <TH  nowrap>参加人数</TH>
         <TH  nowrap>宣传方式</TH>
         <TH  noWrap>发放材料份数</TH>
      </logic:equal>
      
      <!-- 内控制度 -->
     <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
     	 <TH nowrap>上报机构</TH>
         <TH nowrap>制度名称</TH>
         <TH width="30%" nowrap>主要内容</TH>
         <TH  nowrap>制定部门</TH>
         <TH  nowrap>制定时间</TH>
         <TH  noWrap>相关文号</TH>
      </logic:equal>
      
     <!-- 内部审计 -->
     <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
     	 <TH nowrap>上报机构</TH>
         <TH nowrap>审计部门名称</TH>
         <TH nowrap>审计期限</TH>
         <TH  width="30%" nowrap>审计项目名称及主要内容</TH>
         <TH  nowrap>审计发现主要问题</TH>
         <TH  noWrap>问题整改情况</TH>
      </logic:equal>
      
      <!-- 打击洗钱活动情况 -->
      <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
      	 <TH nowrap>上报机构</TH>
         <TH nowrap>被协助部门</TH>
         <TH nowrap>协助时间</TH>
         <TH  width="30%" nowrap>协助内容</TH>
         <TH  nowrap>效果</TH>
         <TH  noWrap>协助单位(公安机关/其他机关)</TH>
      </logic:equal>
	  </tr>
	 <logic:iterate id="record" name="t07_recordList" type="com.ist.aml.offs_report.dto.T07_record">
	<TR align="center" onMouseOver="this.className='interval2'" onMouseOut="this.className='interval'">
      <TD height=22>
         <html:multibox property="record_id_selected">
              	<bean:write name="record" property="record_id" ignore="true"/>
          </html:multibox>
      </TD>
      <!-- 
      <TD><a href="javascript:dosubmit('t07_record_detail.do?record_id=<bean:write name="record" property="record_id" ignore="true"/>&record_type_cd=<bean:write name="record" property="record_type_cd" ignore="true"/>','add')">详细信息</a></TD>
       -->
      <!-- 培训记录 -->
      <logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
      	  <TD ><bean:write name="record" property="organkey" ignore="true"/></TD>
          <TD><bean:write name="record" property="create_dt_disp" ignore="true"/> - <bean:write name="record" property="create_end_dt_disp" ignore="true"/></TD>
	      <TD style="white-space:normal;"><bean:write name="record" property="content" ignore="true"/></TD>
	      <TD><bean:write name="record" property="remark1" ignore="true"/></TD>
	      <TD><bean:write name="record" property="remark2" ignore="true"/></TD>
	      <TD><bean:write name="record" property="remark3" ignore="true"/></TD>
      </logic:equal>
      
      <!-- 宣传记录 -->
      <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
      	  <TD ><bean:write name="record" property="organkey" ignore="true"/></TD>
          <TD><bean:write name="record" property="create_dt_disp" ignore="true"/> - <bean:write name="record" property="create_end_dt_disp" ignore="true"/></TD>
	      <TD style="white-space:normal;"><bean:write name="record" property="content" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="remark1" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="remark3" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="remark2" ignore="true"/></TD>
      </logic:equal>
      
      <!-- 内控制度 -->
      <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
      	  <TD ><bean:write name="record" property="organkey" ignore="true"/></TD>
          <TD><bean:write name="record" property="remark1" ignore="true"/></TD>
	      <TD style="white-space:normal;"><bean:write name="record" property="content" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="record_obj" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="create_dt_disp" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="remark2" ignore="true"/></TD>
      </logic:equal>
      
      <!-- 内部审计 -->
      <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
      	  <TD ><bean:write name="record" property="organkey" ignore="true"/></TD>
          <TD><bean:write name="record" property="record_obj" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="create_dt_disp" ignore="true"/> - <bean:write name="record" property="create_end_dt_disp" ignore="true"/></TD>
	      <TD style="white-space:normal;"><bean:write name="record" property="content" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="remark1" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="remark3" ignore="true"/></TD>
      </logic:equal>
      
      <!-- 打击洗钱活动情况 -->
      <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
      	  <TD ><bean:write name="record" property="organkey" ignore="true"/></TD>
          <TD><bean:write name="record" property="record_obj" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="create_dt_disp" ignore="true"/> - <bean:write name="record" property="create_end_dt_disp" ignore="true"/></TD>
	      <TD style="white-space:normal;"><bean:write name="record" property="content" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="remark1" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="remark2" ignore="true"/></TD>
      </logic:equal>
      
    </TR>
</logic:iterate>
   </table>
  </div>
	  
    
</html>
