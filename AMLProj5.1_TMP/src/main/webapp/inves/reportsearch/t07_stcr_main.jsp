<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.LinkedHashMap"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.lang.String"%>
<%@ page import="java.lang.Double"%>
<%@page import="com.ist.aml.rule.dto.T03_entity_kind"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->
		<%
			String url = request.getContextPath();
			String cssurl = url + "/css/css_all.css";
			String titlejsurl = url + "/js/title.js";
			String basefuncurl = url + "/js/basefunc.js";
			String ucjsurl = url + "/js/uc.js";
		%>
		<link rel="stylesheet" href=<%=cssurl%> type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src=<%=titlejsurl%>></script>
		<script language="JavaScript" src=<%=basefuncurl%>></script>
		<script language="JavaScript" src=<%=ucjsurl%>></script>

		<style>
		html,body{ overflow:visible; height:99%; overflow-y:hidden; }
		</style>

	</head>
	<body leftmargin="0" topmargin="0" class="mainbg">
		<html:form method="post" action="/case/t07_stcr_main.do">
		    <%
				String root = request.getContextPath();
				String root1 = url + "/inves/case/stcr_party_search.do?stcr="
					  + request.getAttribute("stcr") + "&application_num=" + request.getAttribute("application_num") + "&case_type="+request.getAttribute("case_type") + "&newsearchflag=1&casesearchtime=" + request.getAttribute("casesearchtime");
			    String root2 = url + "/inves/case/stcr_acct_search.do?stcr="
					  + request.getAttribute("stcr") + "&application_num=" + request.getAttribute("application_num") + "&case_type="+request.getAttribute("case_type") + "&newsearchflag=1&casesearchtime=" + request.getAttribute("casesearchtime");
			    String root3 = url + "/inves/case/stcr_trans_list_search.do?stcr="
					  + request.getAttribute("stcr") + "&application_num=" + request.getAttribute("application_num") + "&party_id=" + request.getAttribute("party_id") + "&case_type="+request.getAttribute("case_type") + "&newsearchflag=1&casesearchtime=" + request.getAttribute("casesearchtime");
			    

				
				String tag = (String)request.getAttribute("tag");
				ArrayList t03_entity_kindList = (ArrayList)request.getAttribute("t03_entity_kindList");
				LinkedHashMap t02_page_in_parmMap = (LinkedHashMap)request.getAttribute("t02_page_in_parmMap");
					  
				String root4 = url + "/avp/template/tpla_chk_t07_case_list.do?newsearchflag=1&new_qry_flag=1&jump_rslt_flag=1&tplakey=";
				String root_temp = "";
				if(tag.equals("0"))
				{
			%>
		  <div id="main">
			<div id="tab_menu">
			  <a target="trans" href=<%=root1 %> class="bglink">客户信息</a>
			  <a target="trans" href=<%=root2 %> class="">账户信息</a>
			  <a target="trans" href=<%=root3 %> class="">交易信息</a>
			</div>
			<iframe src=<%=root1 %> width="100%" height="540" scrolling="auto" frameborder="0" name="trans" id="trans"></iframe>
		  </div>
		  <%
		  		}
		  		else
		  		{
		  			if(t03_entity_kindList.size()>0)
		  			{
		  			String root_temp1 = root4;
		  			T03_entity_kind temp1=(T03_entity_kind) t03_entity_kindList.get(0);
		  			root_temp1 = root_temp1 + temp1.getTplakey();
		  			LinkedHashMap tempMap = new LinkedHashMap();
		  			tempMap = (LinkedHashMap) t02_page_in_parmMap.get(temp1.getTplakey());
		  			Iterator iter_temp = tempMap.keySet().iterator();
					while (iter_temp.hasNext())
					{
						String key = (String)iter_temp.next();
						String value = (String)tempMap.get(key);
						root_temp1 = root_temp1 + "&" + key + "=" + request.getAttribute(value);
					}
		  			
		  			
		  %>
		   <div id="main">
		   <div id="tab_menu">
		    <%
		  			Iterator iter = t03_entity_kindList.iterator();
					while (iter.hasNext())
					{
						T03_entity_kind temp = (T03_entity_kind) iter.next();
						String rtettypekey = temp.getRtettypekey();
						String rtetname = temp.getRtetname();
						String tplakey = temp.getTplakey();
						root_temp = root4 + tplakey;
						
						if(t02_page_in_parmMap.size() > 0)
						{
							LinkedHashMap parmMap = new LinkedHashMap();
							parmMap = (LinkedHashMap) t02_page_in_parmMap.get(tplakey);
							Iterator iter1 = parmMap.keySet().iterator();
							while (iter1.hasNext())
							{
								String key = (String)iter1.next();
								String value = (String)parmMap.get(key);
								root_temp = root_temp + "&" + key + "=" + request.getAttribute(value);
							}
						}
						
		   %>
			  <a target="trans" href=<%=root_temp %> class="bglink"><%=rtetname %></a>
			<%
					}
			 %>
			</div>
			<iframe src=<%=root_temp1 %> width="100%" height="540" scrolling="auto" frameborder="0" name="trans" id="trans"></iframe>
		  </div>
		   
		   <%
		  			}
		  			else
		  			{
		  				String root5 = (String)request.getAttribute("root5");
		  				String root6 = (String)request.getAttribute("root6");
		  				String root7 = (String)request.getAttribute("root7");
		  	%>
		  			 <div id="main">
		  			   <div id="tab_menu">
		  			   	<a target="trans" href=<%=root5 %> class="bglink">客户信息</a>
			  			<a target="trans" href=<%=root6 %> class="">账户信息</a>
			  			<a target="trans" href=<%=root7 %> class="">交易信息</a>
					  </div>
					<iframe src=<%=root5 %> width="100%" height="540" scrolling="auto" frameborder="0" name="trans" id="trans"></iframe>
		  			</div>
		  	<%
		  			}
		   		}
		    %>
		</html:form>
	</body>
</html>