<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%String analy_from = (String)request.getAttribute("analy_from"); %>

<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/FusionCharts.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script type="text/javascript">
function checkForm(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function selectType(obj){
   var id = obj.id;
   var dataxml1 = '<%=request.getAttribute("dataxml1") %>';
   var dataxml2 = '<%=request.getAttribute("dataxml2") %>';
   var dataxml3 = '<%=request.getAttribute("dataxml3") %>';
   var dataxml4 = '<%=request.getAttribute("dataxml4") %>';
   var dataxmla = "";
   var dataxmlb = "";
   if(id == "amt"){
       dataxmla = dataxml3;
       dataxmlb = dataxml4;
   }else if(id == "count"){
       dataxmla = dataxml1;
       dataxmlb = dataxml2;
   }
   
   var obj = document.getElementById("tu1");
   var width = obj.clientWidth || obj.offsetWidth;
   var chart1 = new FusionCharts('../../charts/free/Pie3D.swf', 'Chart1Id', width, '300', '0', '0');
   //chart1.setDataXML('<chart palette="5" showValues="0" formatNumberScale="0" useRoundEdges="1" caption="交易渠道" baseFontSize="14"><set label="网银" value="30"/><set label="柜面" value="25"/><set label="面" value="25"/></chart>');	
   chart1.setDataXML(dataxmla);						
   chart1.render("tu1");
	
   var obj = document.getElementById("tu2");
   var width = obj.clientWidth || obj.offsetWidth;
   var chart1 = new FusionCharts('../../charts/free/MSCombiDY2D.swf', 'Chart2Id', width, '300', '0', '0');
   //chart1.setDataXML('<chart palette="2" showValues="0" formatNumberScale="0" useRoundEdges="1" caption="交易渠道"><categories><category label="柜面"/><category label="网银"/></categories><dataset seriesName="笔数" renderAs="Column" parentYAxis="P"><set value="25"/><set value="30"/></dataset></chart>');		   
   chart1.setDataXML(dataxmlb);		
   chart1.render("tu2");
}
</script>
</head>
<body class="mainbg" id="iframecontent">
<html:form action="/custcheck/t10_cust_trans_analysis.do" method="post">

   <div class="list">
	<%
		String trans_count ="";
		String count_temp = (String)session.getAttribute("trans_count1");
		if(count_temp!=null&&!"".equals(count_temp)){
			trans_count = count_temp;
		}
		String total_amt="";
		String amt_temp = (String)session.getAttribute("total_amt1");
		if(amt_temp!=null&&!"".equals(amt_temp)){
			total_amt = amt_temp;
		}
		String analy_type="";
		String type_temp = (String)request.getAttribute("analy_type");
		if(type_temp!=null && !"".equals(type_temp)){
				analy_type = type_temp;
		}
	%>
	 <!-- 小选项卡（3）:列表大标题 --> 
	 <table border="0" cellspacing="0" cellpadding="0">
      <tr>
       <th><span>交易总笔数：<%=trans_count %></span></th> 
	   <th><span>交易总金额：<%=total_amt %></span></th> 
      </tr>
	 </table>
	 <!-- 小选项卡（3）:列表小标题 --> 
	 <table border="0" cellspacing="0" cellpadding="0">
	    <!-- 小选项卡（3）:列表小标题：两主标题class="st01" --> 
		<tr> 
		  <td rowspan="2" class="st01"><%=analy_type %></td>
		  <td colspan="4" nowrap class="st01">交易总量</td>
		</tr>
		<!-- 小选项卡（3）:列表小标题：交易总量的子标题class="st02" -->
		<tr> 
		  <td class="st02">笔数 </td>
		  <td class="st02">金额 </td>
		  <td class="st02">笔数占比 </td>
		  <td class="st02">金额占比 </td>
		</tr>
		<logic:iterate id="result" name="analysis_list" type="com.ist.aml.report.dto.T10_trans_analysis">
    	<tr>
	       <td><bean:write name="result" property="pattern" scope="page"/></td>
	       <td><bean:write name="result" property="t_count" scope="page"/></td>
	       <td><bean:write name="result" property="t_amt" scope="page"/></td>
	       <td><bean:write name="result" property="count_percent" scope="page"/></td>
	       <td><bean:write name="result" property="amt_percent" scope="page"/></td>
    	</tr>
		</logic:iterate>
    </table>
    <table border="0" cellspacing="0" cellpadding="0">	
		<tr>
		   <td colspan="5">
		       <div class="cond_c2">
					<table width="100%">
						<tr >
						   <td colspan="2" align="right" >笔数<input type="radio" name="type" id="count" onclick="selectType(this);" checked="true" />  金额<input type="radio" name="type" id="amt" onclick="selectType(this);"/></td>
						</tr>
						<tr>
						   <td width="80%" id="tu3">	
						       <div class="tu" id="tu1" style="border: 0px solid" ></div>
						   </td>
						   <td width="20%">	
							   <div class="tu" id="tu2" style="border: 0px solid" ></div>
						   </td>
						</tr>
					</table>
				</div>
		   </td>
		</tr>
	  	<script>
	  	    var dataxml1 = '<%=request.getAttribute("dataxml1") %>';
			
			var exist = "Pie3D.swf";
			if (exist != "") {
			//alert(dataxml1);
		        var chart1 = new FusionCharts('../../charts/free/Pie3D.swf', 'Chart1Id', '525', '300', '0', '0');
		 		//chart1.setDataXML('<chart palette="5" showValues="0" formatNumberScale="0" useRoundEdges="1" caption="交易渠道" baseFontSize="14"><set label="网银" value="30"/><set label="柜面" value="25"/></chart>');							
				chart1.setDataXML(dataxml1);
				chart1.render("tu1");
			}	
		</script>	

	  	<script>
	  	    var dataxml2 = '<%=request.getAttribute("dataxml2") %>';
	  	    
			var exist = "MSCombiDY2D.swf";
			if (exist != "") {
				var chart1 = new FusionCharts('../../charts/free/MSCombiDY2D.swf', 'Chart2Id', '525', '300', '0', '0');
				//chart1.setDataXML('<chart palette="2" showValues="0" formatNumberScale="0" useRoundEdges="1" caption="交易渠道"><categories><category label="柜面"/><category label="网银"/></categories><dataset seriesName="笔数" renderAs="Column" parentYAxis="P"><set value="25"/><set value="30"/></dataset></chart>');		   
				chart1.setDataXML(dataxml2);
				chart1.render("tu2");
			}	
		</script>	
    </table>
  </div>
</html:form> 
</body>
</html>