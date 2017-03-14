<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<title>分值转换规则</title>
	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
		type="text/css" />
	<script language="JavaScript" src="../../js/basefunc.js"></script>
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript" src="../../js/aml.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 	
</SCRIPT>

</HEAD>
<body leftmargin="0" topmargin="0" class="mainbg">
	<html:form action="/t31_count_rule/t31_count_ruleList.do" method="post">
		<div id="main">
			<!-- conditions -->
			<div class="conditions">
				<!-- title -->
				<div class="cond_t">
					<span>配置管理 - 积分转换规则</span>
					
				</div>
				<!-- table content -->

			</div>

			<html:errors />
			<div class="list">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<th>
							标准分值
						</th>
						<th>
							值类型
						</th>
						<th>
							上限区间说明
						</th>
						<th>
							要素得分上限
						</th>
						<th>
							要素得分下限
						</th>
						<th>
							下限区间说明
						</th>
						<th>
							修改时间
						</th>

					</tr>
					<logic:iterate id="valueRule" name="t31_count_ruleList"
						type="com.ist.aml.newrisk.dto.T31_count_rule">
						<TR>
							<TD>
								<bean:write name="valueRule" property="score"></bean:write>
							</TD>
							<TD>
								<bean:write name="valueRule" property="scoretype"></bean:write>
							</TD>
							<TD>
								<bean:write name="valueRule" property="maxisclosed"></bean:write>
							</TD>
							<TD>
								<bean:write name="valueRule" property="ctrulemax"></bean:write>
							</TD>
							<TD>
								<bean:write name="valueRule" property="ctrulemin"></bean:write>
							</TD>
							<TD>
								<bean:write name="valueRule" property="minisclosed"></bean:write>
							</TD>
							<TD>
								<bean:write name="valueRule" property="create_dt"></bean:write>
								<br>
							</TD>
						</TR>
					</logic:iterate>
				</TABLE>
			</div>
			<div class="list_page">
				<table width="98%" border="0" align="center" cellpadding="3"
					cellspacing="3">
					<tr>
						<td align="center">
							<bean:write name="pageInfo" scope="request" filter="false" />
						</td>
					</tr>
				</table>
			</div>
			<!-- all end -->
		</div>

	  <div class="sys_warning">
    <strong><img src="../../images/<%=session.getAttribute("style") %>/warning.png" />系统提示：</strong>
	<p>
1、分值转换规则：应用于积分评级体系，其作用是将基础要素（即指标）的分值转换为标准分值，以便用于上层计算。<br/>
2、积分评级体系：由一组基础要素构成，在算出基础要素标准分值的基础上，通过积分计算规则算出客户最终得分，从而匹配相应的风险等级。<br/>
3、积分计算规则：将积分评级体系下不同基础要素进行分类，分类最底层为风险评级的基础要素，针对不同的分类设置相应的权重，系统根据最底层的基础要素的数值进行分值转换，并进行加权计算，算出上层分类的分值，再对分类进行加权计算，算出评级体系的最后得分，再将最后得分进行风险等级转换，算出客户最终的风险等级。
	</p>
  </div>  
	</html:form>

</body>
</html:html>
