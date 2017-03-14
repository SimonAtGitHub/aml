<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html:html>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2600.0" name=GENERATOR>
 <%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>

<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
<SCRIPT LANGUAGE="JavaScript">
		
		function dosubmit(theUrl,type){
		
		    var errMsg = "";
		    var isSub = false;
		    if(type == 'add'){
		    	isSub = true;
		    }
		    if(type == 'modi'){
		    	errMsg=CheckBoxCheckedSingleOne(document.forms[0]);
		    	isSub = true;

		    	var sel_check = document.forms[0].selecttkeys;
		    	for(var i=0; i<sel_check.length; i++){
					if(sel_check[i].checked){
						var tkey = sel_check[i].value;
						if(tkey.indexOf("P") == 0){
							theUrl = "t02_tp_report_modify.do";
						} else if (tkey.indexOf("C") == 0){
							theUrl = "t02_tp_chart_modify.do";
						} else if (tkey.indexOf("S") == 0){
							theUrl = "t02_tp_stat_modify.do";
						}
					}
			    }
			}
		    if(type=='del'){
		    	errMsg = CheckBoxMustChecked(document.forms[0]);
		    	if(!errMsg &&　confirm('你真的要删除吗？')){
		            isSub = true;
		        }
		    }
		    if(type=='search'){
		        if(errMsg==''){
					isSub = true;
		        }
		    }
		    if(isSub && errMsg==''){
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		    }else{
		        if(errMsg!='')
		            alert(errMsg);
		        return false;
		    }
		}


		function locate_order_window001(load_page_path){	
			//var whole_path = load_page_path+'/common/location_orderwindow.do?id='+id+'&name='+name+'&tablename='+tablename+'&keyname='+keyname+'&seqname='+seqname;
		    var whole_path = load_page_path+'/common/location_orderwindow.do';
		    var	property = 'height=450, width=600,left=370,top=100,scrollbars=yes,resizable=yes'; 
		     window.open('<%=request.getContextPath()%>/pub/blank.jsp', 'checktest', property);
		     document.forms[0].action=whole_path;
		     document.forms[0].target='checktest';
		     document.forms[0].submit();
		}
		</SCRIPT>


</HEAD>
<BODY leftmargin="0" topmargin="0">
<div id="content">
<html:form method="post" action="/template/t02_tp_show_list.do">
<html:hidden property="tplakey"/>
<input type='hidden' name='id'  value = '<%=request.getAttribute("keys") %>'>
<input type='hidden' name='name' value = '<%=request.getAttribute("names") %>'>
<input type='hidden' name='tablename' value = 't02_tp_show'>
<input type='hidden' name='keyname' value = 'showkey'>
<input type='hidden' name='seqname' value = 'seq'>
<input type='hidden' name='type' value = 'varchar'>
 <div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap>
							<span class="awp_title_td2">定义图表展现 - 列表</span>
						</td>
						<td align="right">
							<input type="button" name="Button1" value="调 序" onClick="locate_order_window001('<%=request.getContextPath()%>');" class="input">
							<input type="button" name="Button2" value="新 建" onclick="dosubmit('t02_tp_show_add.do','add')" class="input">
							<input type="button" name="Button3" value="修 改" onclick="dosubmit('t02_tp_show_modify.do','modi')" class="input">
							<input type="button" name="Button4" value="删 除" onclick="dosubmit('t02_tp_show_delete_do.do','del')" class="input">
						</td>
					</tr>
				</table>
			</div>   
 
  <html:messages id="errors" message="true">
		<bean:write name="errors" filter="fasle" />
  </html:messages>
 
   
<div class="awp_list">
  <TABLE>
    <TR > 
       <TD width="2%" nowrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</td>
      <TD align="center" nowrap width="15%">名称</TD> 
      <TD nowrap width="15%">列表</TD>
      <TD nowrap width="15%">图形</TD>
       <TD nowrap width="15%">排列模式</TD>
       <TD nowrap width="20%">分配大小</TD>
        <TD nowrap width="10%">顺序</TD>
    </TR>


	<logic:iterate id="show" name="t02_tp_showList"  type="com.ist.avp.template.dto.T02_tp_show">
    <TR align="center">
       <TD  nowrap>
             <html:multibox property="selecttkeys">
				<bean:write name="show" property="showkey" />
			</html:multibox>
		</TD>
		<TD  nowrap>
			<bean:write name="show" property="showname" />
		</TD>
		<TD  nowrap>
			<bean:write name="show" property="listname" />
		</TD>
		<TD  nowrap>
			<bean:write name="show" property="chartname" />
		</TD>
		<TD  nowrap>
			<img src="" name="imgtp" id="img<bean:write name="show" property="arrangemode" />"/>
		</TD>
		<TD  nowrap>
			<c:if test="${show.leftsize != null && show.leftsize != ''}">
			左：<bean:write name="show" property="leftsize" /> 右：<bean:write name="show" property="rightsize" />
			</c:if>
		</TD>
		<TD  nowrap>
			<bean:write name="show" property="seq" />
		</TD>
    </TR>
    </logic:iterate>
  </TABLE>
</div> 
</html:form>
</div>
</BODY>
<script>
	var imgs = document.getElementsByName("imgtp");
	var imagename;
	for(var i=0; i<imgs.length; i++){
		if(imgs[i].id == 'img1'){
			imagename = "avp-1-1.png";
		} else if(imgs[i].id == 'img2'){
			imagename = "avp-2-1.png";
		} else if(imgs[i].id == 'img3'){
			imagename = "avp-3-1.png";
		} else if(imgs[i].id == 'img4'){
			imagename = "avp-4-1.png";
		}
		
		imgs[i].src = "<%=request.getContextPath()%>/images/chart_blue/"+imagename;
	}
</script>
</html:html>
