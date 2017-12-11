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
	  String tplakey = (String)request.getSession().getAttribute("tplakey");
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
	
	tree.nodes["-1_10"]="text:定义SQL;#;";
	    
	    
	    tree.nodes["10_100000"]="text:定义输入参数;url:<%=request.getContextPath()%>/rule/t21_rule/t03_page_in_parm_list.do?tplakey=<%=tplakey %>;";
	    tree.nodes["10_200000"]="text:定义业务参数;url:<%=request.getContextPath()%>/rule/t21_rule/t03_param_org_list.do?tplakey=<%=tplakey %>;";
	    tree.nodes["10_300000"]="text:定义查询SQL;url:<%=request.getContextPath()%>/rule/t21_rule/t03_tp_exec_qry_list.do?tplakey=<%=tplakey %>;";
	    tree.nodes["10_400000"]="text:结果主体设置;url:<%=request.getContextPath()%>/rule/t21_rule/t03_rule_rettype_set.do?tplakey=<%=tplakey %>;";
	    tree.nodes["10_500000"]="text:模型信息汇总;url:<%=request.getContextPath()%>/rule/t21_rule/t03_rule_all_info_do.do?tplakey=<%=tplakey %>;";
	   
	
	  	document.write(tree.toString()); 
	</script>    

	</body>
</html>
