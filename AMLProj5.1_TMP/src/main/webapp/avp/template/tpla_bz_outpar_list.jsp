<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title></title>
		
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl,type){
   var errMsg ="";
    if(type=="del"){
     errMsg = CheckBoxMustChecked(document.forms[0]);
    }
    if(type=="mod"){
    errMsg=CheckBoxCheckedSingleOne(document.forms[0]);
    }
    
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
       if(type=="del"){
        if(confirm('确认删除此信息！')) {
            document.forms[0].target="_self";
            document.forms[0].action=theUrl;
            document.forms[0].submit();
            event.srcElement.disabled = true;
        }
       }else{
            document.forms[0].target="_self";
            document.forms[0].action=theUrl;
            document.forms[0].submit();
            event.srcElement.disabled = true;
        }
    }
}


   function doRefesh(){        
                var theUrl='<%=request.getContextPath()%>/avp/template/t02_tp_disp_rst_list.do';
                var tplakey=document.forms[0].tplakey.value; 
                theUrl=theUrl+'?tplakey='+tplakey;
                location.href=theUrl;  
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
	<BODY>
	<div id="content">
		<html:form method="post" action="/template/t02_tp_disp_rst_list.do">
		  <html:hidden property="tplakey"/>
			
                         <input type='hidden' name='id'  value = '<%=request.getAttribute("keys") %>'>
                         <input type='hidden' name='name' value = '<%=request.getAttribute("names") %>'>
                         <input type='hidden' name='tablename' value = 't02_tp_disp_rst'>
                         <input type='hidden' name='keyname' value = 'dispcolkey'>
                         <input type='hidden' name='seqname' value = 'dispseq'>
						 <input type='hidden' name='type' value = 'int'>
		<div class='awp_title'>
				<table>
					<tr>
					
						<td width="23%" nowrap>
							<span class="awp_title_td2">模型管理-调整输出结果
							</span>
						</td>
						<td align="right">
							<input type=button value="调 序" onClick="locate_order_window001('<%=request.getContextPath() %>');">
	              			<input type="button" value="批量添加" onClick="dosubmit('t02_tp_disp_rst_addList.do','add')"/>
							<input type=button value="新 建" onClick="dosubmit('t02_tp_disp_rst_add.do','add')">
							<input type=button value="修 改" onClick="dosubmit('t02_tp_disp_rst_modify.do','mod')">
							<input type=button value="删 除" onClick="dosubmit('t02_tp_disp_rst_delete_do.do','del');">&nbsp;</td>
					</tr>
				</table>
			</div> 
		
			<div class="awp_list">
			<TABLE>
				<TR align=center >
					<TD width="2%" nowrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</td>
					<TD width="20%" align="center" nowrap>
						表名称
					</TD>
					<TD width="20%" align="center" nowrap>
						列显示名称
					</TD>
					<TD width="24%" align="center" nowrap>
						列代码
					</TD>
					<TD width="8%" noWrap>
						是否码表转换
					</TD>
					<TD width="8%" noWrap>
						对应码表
					</TD>
					<TD width="6%" noWrap>
						显示类型
					</TD>
					<TD width="6%" noWrap>
						是否启用
					</TD>
					<TD width="6%" noWrap>
						显示序号
					</TD>
				</TR>


				<logic:iterate id="binfo" name="t02_tp_disp_rstList"
					type="com.ist.avp.template.dto.T02_tp_disp_rst">
					<TR align="center">
						<TD  nowrap>
							<html:multibox property="dispcolkeys">
								<bean:write name="binfo" property="dispcolkey" />
							</html:multibox>
						</TD>
						<TD align="left" nowrap>
							<bean:write name="binfo" property="tabcnname" scope="page" />
						</TD>
						<TD align="left">
							<bean:write name="binfo" property="dispname" scope="page" />
						</TD>
						<TD align="left">
							<bean:write name="binfo" property="colaliascd" scope="page" />
						</TD>

						<TD >
							<bean:write name="binfo" property="iscdchg_disp" scope="page" />
						</TD>
						<TD >
							<bean:write name="binfo" property="catecd" scope="page" />
						</TD>
						<TD >
							<bean:write name="binfo" property="disptype_disp" scope="page" />
						</TD>
						<TD >
							<bean:write name="binfo" property="isenable_disp" scope="page" />
						</TD>
						<TD >
							<bean:write name="binfo" property="dispseq" scope="page" />
						</TD>
					</TR>
				</logic:iterate>

			</TABLE>
			</div>
		</html:form>
		</div>
	</BODY>
</HTML>
