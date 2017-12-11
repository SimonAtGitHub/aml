<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="com.ist.aml.risk_rate.dto.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
--><link id="skincss" href="../../css/aml_blue.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/ymPrompt.js"></script>
<script language="javascript">
function dosubmit(theUrl){
   var errMsg ="";
   var scores=document.forms[0].score;
   for(var i=0;i<scores.length;i++){
     if(getLength(scores[i].value)==0){
        errMsg+="当前得分不能为空!";
        break;
     }
     else if(getLength(scores[i].value)>0 && formatNum(scores[i].value,2,0,5)==false){
        errMsg+="当前得分只能为0~5之间的数字或小数,且小数点后最多两位！";
        break;
     }
   }
   if(errMsg!=""){
     alert(errMsg);
     return false;
   }else{
     document.forms[0].action=theUrl;
     document.forms[0].submit();
   }
  
}
</script>
</head>
<body class="mainbg">
<html:form method="post" action="/result/t37_appr_bas_rsltList.do">
<!-- conditions --> 
	  
	  
<div class="conditions">
	
    <div class="cond_c2">
	 <table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									客户名称：
								</td>
								<td>
									<bean:write name="t37_party_result"
										property="party_chn_name" />
								</td>
								<td>
									客户类型：
								</td>
								<td>
									<bean:write name="t37_party_result" 	property="party_class_cd" />
								</td>
							
							</tr>
								<tr>
								<td>
									客户等级：
								</td>
								<td>
									<bean:write name="t37_party_result" 	property="levelkey_disp" />
								</td>
								<td>
									分值：
								</td>
								<td>原得分：
								<bean:write name="t37_party_result" property="score" />
							
						        &nbsp;&nbsp;&nbsp;    现得分：
								  
								<logic:equal name="t37_party_result"  property="scoremodi_flag"  value="0">
								 <bean:write name="t37_party_result" property="score" />
								</logic:equal>
									<logic:equal name="t37_party_result"  property="scoremodi_flag"  value="1">
									 <bean:write name="t37_party_result" property="lastscore" />
								</logic:equal>
								</td>
						
							</tr>
								
						
							<tr>
									<td>
									系统评级时间：
								</td>
								<td>
									<bean:write name="t37_party_result"
										property="statistic_dt_disp" />
								</td>
								<td>
									系统评级结果：
								</td>
								<td>
									<bean:write name="t37_party_result" property="fristappralevel_disp" />
									
								</td>
							</tr>
							
							<tr>
							  <td>
									是否被调整：
								</td>
								<td>
									<bean:write name="t37_party_result" property="modify_cd_disp" />
								</td>
								<td>
									调整等级：
								</td>
								<td>
								<logic:equal name="t37_party_result" property="modify_cd" value="1">
									<bean:write name="t37_party_result" property="emendationlevel_disp" />
							      </logic:equal>
							      &nbsp;&nbsp;
							      <a  href="#" onclick="ymPrompt.win({message:'<%=request.getContextPath()%>/risk_rate/result/getT37_level_auditList.do?newsearchflag=1&resulekey=<bean:write name="t37_party_result" property="resulekey" />&organkey=<bean:write name="t37_party_result" property="organkey"/>&rate_source=<bean:write name="t37_party_result" property="rate_source" />',width:650,height:350,title:'',handler:handler,iframe:true,fixPosition:true,dragOut:false}); ">
							      <img src="../../images/<%=session.getAttribute("style")%>/b_risktranc.png" title="调整记录" /></a>
								  <logic:equal name="is_showCheck" value="1">
								  &nbsp;&nbsp;
								  <a  href="#" onclick="ymPrompt.win({message:'<%=request.getContextPath()%>/risk_rate/result/getT37_helpcheckList.do?newsearchflag=1&resultkey=<bean:write name="t37_party_result" property="resulekey" />&organkey=<bean:write name="t37_party_result" property="organkey"/>',width:650,height:350,title:'',handler:handler,iframe:true,fixPosition:true,dragOut:false}); ">
							      <img src="../../images/<%=session.getAttribute("style")%>/b_agencyinfo.png" title="协查信息" /></a>
								  </logic:equal>
								  &nbsp;&nbsp;
								  <a  href="#" onclick="ymPrompt.win({message:'<%=request.getContextPath()%>/risk_rate/t37_risk_attach/t37_risk_attach_dispList.do?newsearchflag=1&resulekey=<bean:write name="t37_party_result" property="resulekey" />&organkey=<bean:write name="t37_party_result" property="organkey"/>',width:650,height:350,title:'',handler:handler,iframe:true,fixPosition:true,dragOut:false}); ">
							      <img src="../../images/<%=session.getAttribute("style")%>/b_attach.png" title="附件" /></a>
								</td>
								
						
							</tr>
							
						
							
						</table>
					</div>
					</div>
		<html:errors />
		<div class="list4 biglist">
		    <table border="0" cellspacing="1" cellpadding="0" >
			  <tr align="center">
			    <%
			    int maxTreeLaye=(Integer)request.getAttribute("maxTreeLaye");
			    maxTreeLaye=(maxTreeLaye==0) ? 1 : maxTreeLaye;
			    System.out.println("maxTreeLaye:::"+maxTreeLaye);
			    if(maxTreeLaye<3){
			    for(int i=0;i<maxTreeLaye;i++){ %>
			    <th width="15%">子项</th>
			    <% }}else{
			    for(int i=0;i<maxTreeLaye;i++){
			    %>
			    <th width="15%">子项</th>
			    <%} }%>
			    <%if(maxTreeLaye==1){ %>
			    <th width="25%">要点</th>
			    <th width="4%">原始得分</th>
			    <th width="4%">当前得分</th>
			    <th width="25%">描述</th>
			    <%}else if(maxTreeLaye==2){ %>
			     <th width="20%">要点</th>
			     <th width="10%">原始得分</th>
			     <th width="10%">当前得分</th>
			     <th width="30%">描述</th>
			    <%}else{ %>
			    <th width="20%">要点</th>
			    <th width="10%">原始得分</th>
			    <th width="10%">当前得分</th>
			    <th width="30%">描述</th>
			    <%} %>
			  </tr>
		      <% 
		        Map map=(Map)request.getAttribute("map");
		        int max=(maxTreeLaye)+4;
		        List first_list=(List)map.get("-1");
		        List last_List=(List)request.getAttribute("t37_appr_bas_rsltList");
		        if(first_list!=null){
		        for(int i=0;i<first_list.size();i++){
		        T37_appr_bas_rslt first_elem=(T37_appr_bas_rslt)first_list.get(i);
		      %>
			  <tr>
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
			             <%}else if(maxTreeLaye==2){ %>
			               <td width="15%"><%=second_elem.getElementname() %></td>
			          
			             <%}else{ %>
			                   <td width="15%"><%=second_elem.getElementname() %></td>
				              
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
			                     <td width="17%"><%=third_elem.getElementname() %></td>
				               
			                <%} else{%>
			                     <td width="15%"><%=third_elem.getElementname() %></td>
				               
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
			                             <td width="17%"><%=fourth_elem.getElementname() %></td>
				                     
			                         <td>
			                            <%
			                              List fifth_list=(List)map.get(fourth_elem.getElementkey());
							                if(fifth_list!=null&&fifth_list.size()>0){
							                  for(int q=0;q<fifth_list.size();q++){
							                     T37_appr_bas_rslt fifth_elem=(T37_appr_bas_rslt)fifth_list.get(q);
			                            %>
			                               <table cellpadding="0" cellspacing="0" >
			                                 <tr>
			                                   <td width="10%"><%=fifth_elem.getElementname() %></td>
			                                   <td>
			                                     <%
			                                       List sixth_list=(List)map.get(fifth_elem.getElementkey());
									                if(sixth_list!=null&&sixth_list.size()>0){
									                  for(int s=0;s<sixth_list.size();s++){
									                     T37_appr_bas_rslt sixth_elem=(T37_appr_bas_rslt)sixth_list.get(s); 
			                                     %>
			                                     <table cellpadding="0" cellspacing="0" >
			                                       <tr>
			                                         <td width="10%"><%=sixth_elem.getElementname() %></td>
			                                         <td>
			                                            <%
			                                               for(int e=0;e<last_List.size();e++){
									                        T37_appr_bas_rslt last_elem=(T37_appr_bas_rslt)last_List.get(e);
						                                    if(last_elem.getUpelementkey().equals(sixth_elem.getElementkey())){
			                                             %>
			                                               <table cellpadding="0" cellspacing="0" >
													         <tr>
													             <td width="5%"><%=last_elem.getElementname() %></td>
													             <td width="10%"><%=last_elem.getOld_score() %></td>
													             <td width="10%">
													             <%=last_elem.getScore() %>
													             </td>
													             <td width="10%"><%=last_elem.getDes() %></td>
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
			                                     <table cellpadding="0" cellspacing="0" >
											         <tr>
											             <td width="5%"><%=last_elem.getElementname() %></td>
											             <td width="10%"><%=last_elem.getOld_score() %></td>
											             <td width="10%">
											               <%=last_elem.getScore() %>
											             </td>
											             <td width="10%"><%=last_elem.getDes() %></td>
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
									             <td width="15%"><%=last_elem.getElementname() %></td>
									             <td width="4%"><%=last_elem.getOld_score() %></td>
									             <td width="4%">
									               <%=last_elem.getScore() %>
									             </td>
									             <td width="10%"><%=last_elem.getDes() %></td>
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
			                      <table cellpadding="0" cellspacing="0">
							         <tr>
							             <td width="20%"><%=last_elem.getElementname() %></td>
							             <td width="10%"><%=last_elem.getOld_score() %></td>
							             <td width="10%">
							              <%=last_elem.getScore() %>
							             </td>
							             <td width="30%"><%=last_elem.getDes() %></td>
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
			                 <table cellpadding="0" cellspacing="0">
						         <tr>
						             <td width="15%"><%=last_elem.getElementname() %></td>
						             <td width="2%"><%=last_elem.getOld_score() %></td>
						             <td width="2%">
									   <%=last_elem.getScore() %>
						             </td>
						             <td width="10%"><%=last_elem.getDes() %></td>
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
			             <td width="10%"><%=last_elem.getOld_score() %></td>
			             <td width="10%">
			              <%=last_elem.getScore() %>
			             </td>
			             <td width="10%"><%=last_elem.getDes() %></td>
			         </tr>
			      </table>
			      <%  }
			        }
			      }
			      %>
			      
			  </td>
			  </tr>
			  <%} }%>
			  </table>
		</div>

		</html:form>
</body>
</html>
