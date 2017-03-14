<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>自定义SQL菜单</title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" type="text/css">
		<link href="<%=request.getContextPath()%>/skin/<%=style %>/css/dtreeStyle.css" rel="stylesheet" type="text/css">
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<script language="javascript" src="<%= request.getContextPath() %>/js/basefunc.js"></script>
		<script type="text/javascript"src="<%=request.getContextPath()%>/js/MzTreeView.js"></script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0"
		marginheight="0">
		<form id="xform" name="xform" method="post" action=""
			target="mainFramex">
			<table width="100%" border="0">
				<tr align="left">
					<td width="47%" align="left">
						<input type="button" name="Submit3" value=".....刷   新....."
							class="text_white" onClick="javascript:window.location.reload();">
					</td>
					<td width="53%">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="2">

						<div id="MENUTREE"></DIV>

					</td>
				</tr>
			</table>
		</form>

		<script language="javascript">
			function strReplace(str,s,d){
				var len=s.length;
				var i=str.indexOf(s);
				while(i>0){
					str=str.substring(0,i)+d+str.substring(i+len,str.length);
					i=str.indexOf(s);
				}
				return str;
			}
			
			function _getQuery() {
				var urlStr=this.remark;
				top.status=this.title;
				if(urlStr=='' || urlStr==null || urlStr.length==0 || urlStr =='#'){
					return null;
				}
		        var f=document.forms(0);
		        var d=new Date();
		        urlStr=strReplace(urlStr,"&amp;","&");
		        if(urlStr.indexOf('?')>-1){
		            	urlStr=urlStr+"&temp_seq_ram="+d.getTime();
		        }
		        else{
		         	urlStr=urlStr+"?temp_seq_ram="+d.getTime();
		        }
		
		        f.action=urlStr;
		        f.target="mainFrame1";
		        if(f.target=='' || f.target=='null' ||  f.target.length==0){
		        	window.open(urlStr,'','');
		        }
		        else{
		        	f.submit();
		        }
	
				return null;
			}
			
			var tree = new MzTreeView("tree");
			tree.setIconPath("<%=request.getContextPath()%>/images/mztree/");
			tree.setTarget("mainFrame1");
			
		    tree.nodes["-1_10"]="text:视图管理;#;";
		    tree.nodes["10_100000"]="text:定义属性;url:<%=request.getContextPath()%>/avp/search/addT02_srch_eng_inf.do?srchengkey=<%=request.getParameter("srchengkey") %>&newsearchflag=1;";
		    tree.nodes["10_200000"]="text:定义参数;url:<%=request.getContextPath()%>/avp/search/t02_srch_eng_parm_list.do?srchengkey=<%=request.getParameter("srchengkey") %>&newsearchflag=1;";
		    tree.nodes["10_300000"]="text:定义类别;url:<%=request.getContextPath()%>/avp/search/t02_srch_cate_list.do?srchengkey=<%=request.getParameter("srchengkey") %>&newsearchflag=1;";
		    tree.nodes["10_400000"]="text:关联搜索;url:<%=request.getContextPath()%>/avp/search/t02_crlt_srch_list.do?srchengkey=<%=request.getParameter("srchengkey") %>&newsearchflag=1;";
		    tree.nodes["10_500000"]="text:视图汇总;url:<%=request.getContextPath()%>/avp/search/srch_eng_info_view.do?srchengkey=<%=request.getParameter("srchengkey") %>&newsearchflag=1;";
		    document.write(tree.toString());
	        
		</script>

	</body>
</html>
