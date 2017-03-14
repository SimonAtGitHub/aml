<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>自定义SQL菜单</title>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<link  href="../../css/dtreeStyle.css" rel="stylesheet" type="text/css">
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>

		<script language="javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script type="text/javascript"src="<%=request.getContextPath()%>/js/MzTreeView.js"></script>
		<script language="javascript" src="../../../js/treeview_ogrleft.js"></script>
		<script type="text/javascript">
		function refresh(){
		  window.location.reload();
		}
		</script>
	</head>
	<%
	  String indickey = (String)request.getSession().getAttribute("indickey");
	  //指标类别
	  String indictype = (String)request.getSession().getAttribute("indictype");
	%>
	
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form id="xform" name="xform" method="post" action=""
			target="mainFramex">
			<table width="100%" border="0">
			    <tr >
				    <td align="left">
				      <input type="button" name="Submit3" value=".....刷   新....." class="awp_button" onClick="javascript:window.location.reload();">
				  
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
	
	tree.nodes["-1_10"]="text:指标管理;#;";
	<%if(indickey == null || "".equals(indickey)){
	%>
		tree.nodes["10_100000"]="text:基本属性;url:<%=request.getContextPath()%>/iap/indicator/indicator_add.do;";
	<%}else{%>
	    tree.nodes["10_100000"]="text:基本属性;url:<%=request.getContextPath()%>/iap/indicator/indicator_modify.do?indickey=<%=indickey%>;";
		tree.nodes["10_200000"]="text:定义输入参数;url:<%=request.getContextPath()%>/iap/t09_page_in_parm/t09_page_in_parm_list.do?newsearchflag=1&indickey=<%=indickey %>;";
	<%if("1".equals(indictype)){%>	
		tree.nodes["10_300000"]="text:定义查询SQL;url:<%=request.getContextPath()%>/iap/indicator/indicator_mulsql_edit.do?type=inedit&indickey=<%=indickey %>;";
		tree.nodes["10_400000"]="text:关系映射;url:<%=request.getContextPath()%>/iap/indicator/indicator_colmap.do?type=inedit&indickey=<%=indickey %>;";
	<%}if("3".equals(indictype)){%>
	    tree.nodes["10_300000"]="text:公式编辑;url:<%=request.getContextPath()%>/iap/indicator/t01_indic_subitem3_in_modify.do?indickey=<%=indickey %>;";
	<%}}%>
	  	document.write(tree.toString()); 
	</script>    

	</body>
</html>
