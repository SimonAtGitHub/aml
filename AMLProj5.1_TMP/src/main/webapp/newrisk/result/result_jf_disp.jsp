<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="com.ist.aml.newrisk.dto.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script language="javascript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
</script>
</head>
<body leftmargin=0 topmargin=0>
<html:form method="post" action="/result/t37_appr_bas_rsltList.do">
    <html:hidden property="resulekey" />
	<html:hidden property="party_id" />
	<html:hidden property="statistic_dt_disp" />
<!-- conditions --> 
	  <div class="conditions">
	    <!-- title -->
		<div class="cond_t">
		  <span>客户号：<bean:write name="t37_party_resultActionForm" property="party_id"/>&nbsp;&nbsp;&nbsp;客户名称：<bean:write name="t37_party_resultActionForm" property="party_chn_name"/>&nbsp;&nbsp;&nbsp;总得分：<bean:write name="t37_party_resultActionForm" property="lastscore"/>&nbsp;&nbsp;&nbsp;风险等级：<bean:write name="t37_party_resultActionForm" property="emendationlevel_disp"/></span>
		</div>
	</div>
		
		<div class="list4 biglist">
		    <table border="0" cellspacing="1" cellpadding="0" >
			  <tr align="center">
			    <th width="8%">模板</th>
			    <th width="6%">类型/权重(%)</th>
			    <%
			    int maxTreeLaye=(Integer)request.getAttribute("maxTreeLaye");
			    maxTreeLaye=(maxTreeLaye==0) ? 1 : maxTreeLaye;
			    if(maxTreeLaye<3){
			    for(int i=0;i<maxTreeLaye;i++){ %>
			    <th width="11%">子项</th>
			    <th width="6%">类型/权重(%)</th>
			    <% }}else{
			    for(int i=0;i<maxTreeLaye;i++){
			    %>
			    <th width="10%">子项</th>
			    <th width="6%">类型/权重(%)</th>
			    <%} }%>
			    <%if(maxTreeLaye==1){ %>
			    <th width="25%">要点</th>
			    <th width="5%">权重(%)</th>
			    <th width="6%">基准值</th>
			    <th width="4%">指标值</th>
			    <th width="4%">原始得分</th>
			    <th width="4%">当前得分</th>
			    <%}else if(maxTreeLaye==2){ %>
			     <th width="20%">要点</th>
			    <th width="5%">权重(%)</th>
			    <th width="6%">基准值</th>
			    <th width="4%">指标值</th>
			    <th width="4%">原始得分</th>
			    <th width="4%">当前得分</th>
			    <%}else{ %>
			    <th width="13%">要点</th>
			    <th width="5%">权重(%)</th>
			    <th width="6%">基准值</th>
			    <th width="4%">指标值</th>
			    <th width="4%">原始得分</th>
			    <th width="4%">当前得分</th>
			    <%} %>
			  </tr>
		      <% 
		        Map map=(Map)request.getAttribute("map");
		        int max=(maxTreeLaye*2)+6;
		        List first_list=(List)map.get("-1");
		        List last_List=(List)request.getAttribute("t37_appr_bas_rsltList");
		        if(first_list!=null){
		        for(int i=0;i<first_list.size();i++){
		        T37_appr_bas_rslt first_elem=(T37_appr_bas_rslt)first_list.get(i);
		      %>
			  <tr>
			     <td><%=first_elem.getElementname() %></td>
	             <%if(first_elem.getJs_type()!=null && first_elem.getJs_type().equals("1") && !first_elem.getBase_occ().equals("")){ %>
	                <td><%=first_elem.getBase_occ() %></td>
	             <%}else{ %>
	                <td><%=first_elem.getJs_type_disp() %></td>
	             <%} %>
			  <td colspan="<%=max %>">
			 
			  <% 
			 
			   List second_list=(List)map.get(first_elem.getElementkey());
			      if(second_list!=null&&second_list.size()>0){
			         for(int j=0;j<second_list.size();j++){
			           T37_appr_bas_rslt second_elem=(T37_appr_bas_rslt)second_list.get(j);
			  %>
			      <table cellpadding="0" cellspacing="0" >
			         <tr>
			             <% if(maxTreeLaye==1){%>
				             <td width="17%"><%=second_elem.getElementname() %></td>
				             <%if(second_elem.getJs_type()!=null && second_elem.getJs_type().equals("1") && !second_elem.getBase_occ().equals("")){ %>
				             <td width="9%"><%=second_elem.getBase_occ() %></td>
				             <%}else{ %>
				             <td width="9%"><%=second_elem.getJs_type_disp() %><%if(!second_elem.getBase_occ().equals("")){ %>/<%=second_elem.getBase_occ() %><%} %></td>
				             <%} %>
			             <%}else if(maxTreeLaye==2){ %>
			               <td width="14%"><%=second_elem.getElementname() %></td>
			               <% if(second_elem.getJs_type()!=null && second_elem.getJs_type().equals("1") && !second_elem.getBase_occ().equals("")){ %>
			               <td width="8%"><%=second_elem.getBase_occ() %></td>
			               <%}else{%>
			               <td width="8%"><%=second_elem.getJs_type_disp() %><%if(!second_elem.getBase_occ().equals("")){ %>/<%=second_elem.getBase_occ() %><%} %></td>
			               <%} %>
			             <%}else{ %>
			                   <td width="11%"><%=second_elem.getElementname() %></td>
				               <% if(second_elem.getJs_type()!=null && second_elem.getJs_type().equals("1") && !second_elem.getBase_occ().equals("")){ %>
				               <td width="8%"><%=second_elem.getBase_occ() %></td>
				               <%}else{%>
				               <td width="8%"><%=second_elem.getJs_type_disp() %><%if(!second_elem.getBase_occ().equals("")){ %>/<%=second_elem.getBase_occ() %><%} %></td>
				               <%} %>
			             <%} %>
			             <td>
			              <%
			                List third_list=(List)map.get(second_elem.getElementkey());
			                if(third_list!=null&&third_list.size()>0){
			                  for(int m=0;m<third_list.size();m++){
			                     T37_appr_bas_rslt third_elem=(T37_appr_bas_rslt)third_list.get(m);
			                
			              %>
			              <table cellpadding="0" cellspacing="0" >
			               <tr>
			                 <%if(maxTreeLaye==2){ %>
			                     <td width="18%"><%=third_elem.getElementname() %></td>
				                 <%if(third_elem.getJs_type()!=null && third_elem.getJs_type().equals("1") && !third_elem.getBase_occ().equals("")){ %>
				                 <td width="11%"><%=third_elem.getBase_occ() %></td>
				                 <%}else{ %>
				                  <td width="11%"><%=third_elem.getJs_type_disp() %><%if(!third_elem.getBase_occ().equals("")){ %>/<%=third_elem.getBase_occ() %><%} %></td>
				                 <%} %>
			                <%} else{%>
			                     <td width="14%"><%=third_elem.getElementname() %></td>
				                 <%if(third_elem.getJs_type()!=null && third_elem.getJs_type().equals("1")&& !third_elem.getBase_occ().equals("")){ %>
				                 <td width="10%"><%=third_elem.getBase_occ() %></td>
				                 <%}else{ %>
				                  <td width="10%"><%=third_elem.getJs_type_disp() %><%if(!third_elem.getBase_occ().equals("")){ %>/<%=third_elem.getBase_occ() %><%} %></td>
				                 <%} %>
			                <%} %>
			                 <td>
			                    <%
			                        List fourth_list=(List)map.get(third_elem.getElementkey());
					                if(fourth_list!=null&&fourth_list.size()>0){
					                  for(int o=0;o<fourth_list.size();o++){
					                     T37_appr_bas_rslt fourth_elem=(T37_appr_bas_rslt)fourth_list.get(o);
			                     %>
			                     <table cellpadding="0" cellspacing="0" >
			                       <tr>
			                            <td width="18%"><%=fourth_elem.getElementname() %></td>
				                         <%if(fourth_elem.getJs_type()!=null && fourth_elem.getJs_type().equals("1") && !fourth_elem.getBase_occ().equals("")){ %>
						                 <td width="14%"><%=fourth_elem.getBase_occ() %></td>
						                 <%}else{ %>
						                  <td width="14%"><%=fourth_elem.getJs_type_disp() %><%if(!fourth_elem.getBase_occ().equals("")){ %>/<%=fourth_elem.getBase_occ() %><%} %></td>
						                 <%} %>
			                         <td>
			                            <%
			                              List fifth_list=(List)map.get(fourth_elem.getElementkey());
							                if(fifth_list!=null&&fifth_list.size()>0){
							                  for(int q=0;q<fifth_list.size();q++){
							                     T37_appr_bas_rslt fifth_elem=(T37_appr_bas_rslt)fifth_list.get(q);
			                            %>
			                               <table cellpadding="0" cellspacing="0" >
			                                 <tr>
			                                   <td><%=fifth_elem.getElementname() %></td>
			                                   <td><%=fifth_elem.getBase_occ() %></td>
			                                   <td>
			                                     <%
			                                       List sixth_list=(List)map.get(fifth_elem.getElementkey());
									                if(sixth_list!=null&&sixth_list.size()>0){
									                  for(int s=0;s<sixth_list.size();s++){
									                     T37_appr_bas_rslt sixth_elem=(T37_appr_bas_rslt)sixth_list.get(s); 
			                                     %>
			                                     <table cellpadding="0" cellspacing="0" >
			                                       <tr>
			                                         <td><%=sixth_elem.getElementname() %></td>
			                                         <td><%=sixth_elem.getBase_occ() %></td>
			                                         <td>
			                                            <%
			                                               for(int e=0;e<last_List.size();e++){
									                        T37_appr_bas_rslt last_elem=(T37_appr_bas_rslt)last_List.get(e);
						                                    if(last_elem.getUpelementkey().equals(sixth_elem.getElementkey())){
			                                             %>
			                                               <table cellpadding="0" cellspacing="0" >
													         <tr>
													             <td width="5%"><%=last_elem.getElementname() %></td>
													             <td width="5%"><%=last_elem.getBase_occ() %></td>
													             <td width="8%"><%=last_elem.getBase_score() %></td>
													             <td width="8%"><%=last_elem.getBasic_val() %></td>
													             <td width="10%"><%=last_elem.getOld_score() %></td>
													             <td width="10%"><%=last_elem.getScore() %></td>
													         </tr>
													      </table>
													      <%}
													      } %>
			                                         </td>
			                                       </tr>
			                                     </table>
			                                     <%}
			                                     } else{
			                                           for(int v=0;v<last_List.size();v++){
								                        T37_appr_bas_rslt last_elem=(T37_appr_bas_rslt)last_List.get(v);
					                                    if(last_elem.getUpelementkey().equals(fifth_elem.getElementkey())){
			                                     %>
			                                     <table>
											         <tr>
											             <td width="5%"><%=last_elem.getElementname() %></td>
											             <td width="5%"><%=last_elem.getBase_occ() %></td>
											             <td width="8%"><%=last_elem.getBase_score() %></td>
											             <td width="8%"><%=last_elem.getBasic_val() %></td>
											             <td width="10%"><%=last_elem.getOld_score() %></td>
											             <td width="10%"><%=last_elem.getScore() %></td>
											         </tr>
											      </table>
											      <%} 
											      }
											      }
											      %>
			                                   </td>
			                                 </tr>
			                               </table>
			                               <%}
			                               } else{
				                                for(int r=0;r<last_List.size();r++){
						                        T37_appr_bas_rslt last_elem=(T37_appr_bas_rslt)last_List.get(r);
			                                    if(last_elem.getUpelementkey().equals(fourth_elem.getElementkey())){
			                               %>
			                                <table cellpadding="0" cellspacing="0" >
									         <tr>
									             <td width="12%"><%=last_elem.getElementname() %></td>
									             <td width="5%"><%=last_elem.getBase_occ() %></td>
									             <td width="5%"><%=last_elem.getBase_score() %></td>
									             <td width="4%"><%=last_elem.getBasic_val() %></td>
									             <td width="4%"><%=last_elem.getOld_score() %></td>
									             <td width="4%"><%=last_elem.getScore() %></td>
									         </tr>
									      </table>
									      <%} 
									      }
									      }
									      %>
			                               
			                         </td>
			                       </tr>
			                     </table>
			                     <%}
			                     } else{
			                           for(int p=0;p<last_List.size();p++){
					                   T37_appr_bas_rslt last_elem=(T37_appr_bas_rslt)last_List.get(p);
		                               if(last_elem.getUpelementkey().equals(third_elem.getElementkey())){
			                     %>
			                      <table cellpadding="0" cellspacing="0" >
							         <tr>
							             <td width="20%"><%=last_elem.getElementname() %></td>
							             <td width="5%"><%=last_elem.getBase_occ() %></td>
							             <td width="6%"><%=last_elem.getBase_score() %></td>
							             <td width="4%"><%=last_elem.getBasic_val() %></td>
							             <td width="4%"><%=last_elem.getOld_score() %></td>
							             <td width="4%"><%=last_elem.getScore() %></td>
							         </tr>
							      </table>
							      <%} 
							      }
							      }
							      %>
			                 </td>
			               </tr>
			              </table>
			               <%   }
			                }else{
			                     for(int n=0;n<last_List.size();n++){
			                     T37_appr_bas_rslt last_elem=(T37_appr_bas_rslt)last_List.get(n);
                                 if(last_elem.getUpelementkey().equals(second_elem.getElementkey())){
			                     
			                %>
			                 <table cellpadding="0" cellspacing="0" >
			                     
						         <tr>
						             <td width="25%"><%=last_elem.getElementname() %></td>
						             <td width="5%"><%=last_elem.getBase_occ() %></td>
						             <td width="6%"><%=last_elem.getBase_score() %></td>
						             <td width="4%"><%=last_elem.getBasic_val() %></td>
						             <td width="4%"><%=last_elem.getOld_score() %></td>
						             <td width="4%"><%=last_elem.getScore() %></td>
						         </tr>
						      </table>
						      <%} 
						      }
						      }
						      %>
			             </td>
			         </tr>
			      </table>
			      
			      <%}
			      }else{
			         for(int t=0;t<last_List.size();t++){
			          T37_appr_bas_rslt last_elem=(T37_appr_bas_rslt)last_List.get(t);
                      if(last_elem.getUpelementkey().equals(first_elem.getElementkey())){
			      %>
			      <table cellpadding="0" cellspacing="0" >
			         <tr>
			             <td width="15%"><%=last_elem.getElementname() %></td>
			             <td width="5%"><%=last_elem.getBase_occ() %></td>
			             <td width="8%"><%=last_elem.getBase_score() %></td>
			             <td width="8%"><%=last_elem.getBasic_val() %></td>
			             <td width="10%"><%=last_elem.getOld_score() %></td>
			             <td width="10%"><%=last_elem.getScore() %></td>
			         </tr>
			      </table>
			      <%  }
			        }
			      }
			      %>
			      
			  </td>
			  </tr>
			  <%} }%>
		</div>
		<div class="list">
		<TABLE cellpadding="0" cellspacing="0">
				<tr>
					<td height="22" align="left" colspan="8">
						<b>调整记录列表</b>
					</td>
				</tr>
				<tr>
					<th align="center" height="22">
						编号
					</th>
					<th align="center" >
						调整时间
					</th>
					<th align="center" >
						调整原因
					</th>
					<th align="center" >
						调整前风险等级
					</th>
					<th align="center" >
						调整后风险等级
					</th>
					<th align="center" >
						提交岗位
					</th>
					<th align="center" >
						接收岗位
					</th>
					<th align="center" >
						调整人
					</th>
				</tr>
				<logic:present name="t37_level_auditList">
				
					<logic:iterate id="result" name="t37_level_auditList"
						type="com.ist.aml.newrisk.dto.T37_level_audit">
						
						<tr align="center">
							<td>
								<bean:write name="result" property="audit_no" />
							</td>
							<td align="center" >
								<bean:write name="result" property="last_upd_dt_disp" />
							</td>
							<td align="center" >
								<bean:write name="result" property="adjust_reason" />
							</td>
							<td align="center" >
								<bean:write name="result" property="level_before_adjust" />
							</td>
							<td align="center" >
								<bean:write name="result" property="level_after_adjust" />
							</td>
							<td align="center"  >
								<bean:write name="result" property="post_id" />
							</td>
							<td align="center"  >
								<bean:write name="result" property="res_post_id" />
							</td>
							<td align="center"  >
								<bean:write name="result" property="last_upd_user" />
							</td>
						</tr>
					</logic:iterate>
				</logic:present>
			</TABLE>
		
        </div>
		</html:form>
</body>
</html>
