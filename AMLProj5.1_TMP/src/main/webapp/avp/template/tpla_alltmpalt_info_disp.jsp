<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
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
<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/avpfunc.js"></script>
<script src="<%= request.getContextPath() %>/js/load_window.js"></script>
<SCRIPT LANGUAGE="JavaScript">
function checkForm(theUrl){
        document.forms[0].action=theUrl;
		document.forms[0].submit();
		
        var left_value=window.parent.leftFrame.location+""; 
        var p_url="<%=request.getContextPath()%>/avp/template/tpla_maint_list.do?newsearchflag=1&busstypecd=<%=request.getParameter("busstypecd")%>";
        //alert(left_value.indexOf("tpla_add_left"));
        if(left_value.indexOf("tpla_add_left") != -1){ 
            //window.parent.opener.location=p_url;
            var _parentWin = window.parent ;
		    _parentWin.close();
            
        }else{
        	parent.location.href=p_url;
            event.srcElement.disabled = true;
        }
        
}
function dosubmit(theUrl,type){
		if (type == "testSQL"){
			var tplaname = "<bean:write name="t02_tp_bas_infActionForm" property="tplaname"/>";
			var tplatype = "<bean:write name="t02_tp_bas_infActionForm" property="tplatype"/>";
			if (null == tplaname || "" == tplaname){
				alert('请先维护基本属性信息！');
				return;
			}			
			if(<%=request.getAttribute("isHaveMainSQL")%> != 1 && tplatype !=1 ){
				alert('请添加主SQL语句！');
				return;
			}
			avpPopUp(theUrl,'900','600');
		}else{
			document.forms[0].action=theUrl;
		    document.forms[0].submit();
		}
		        
}
</SCRIPT>
</HEAD>
<BODY>
<div id="content">
<html:form method="post" action="/template/t02_jump_tp_achive.do">
  <html:hidden property="tplakey"/>
  <html:hidden property="busstypecd"/>
  
  <div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2">模板管理 - 模型信息汇总</span></td>
						<td align="right">
							 <html:button property="button_next" styleClass="input" value="关 闭" onclick="window.close();"/>						                  </td>
					</tr>
				</table>
			</div>  
  
  
  
  <div class="awp_detail">
     <table>
            <tr >
              <td  ><font color="#FF0000">*</font>所属类别：</td>
              <td >
              <html:hidden property="tplacatecd" styleClass="text_white" />
              <bean:write name="t02_tp_bas_infActionForm" property="tplacatecd_name"/>
             </td>
            </tr>
            <tr >
              <td  ><font color="#FF0000">*</font>模板名称：</td>
              <td >
              <bean:write name="t02_tp_bas_infActionForm" property="tplaname"/>
              </td>
            </tr>
           
            <tr >
              <td  ><font color="#FF0000">*</font>模板结果显示类型：</td>
              <td >
                 <bean:write name="t02_tp_bas_infActionForm" property="rsltdisptype"/>
			  </td>
            </tr>
              
             <tr >
                <td ><font color="#FF0000">*</font>是否在导航树中显示：</td>
                <td >
                  <bean:write name="t02_tp_bas_infActionForm" property="isdisp"/>               
                </td>
             </tr>
              <tr >
                <td  nowrap>显示序号：</td>
                <td >
                <bean:write name="t02_tp_bas_infActionForm" property="dispseq"/>
                </td>
              </tr>
            <tr >
              <td  ><font color="#FF0000">*</font>是否分页：</td>
              <td >
              <bean:write name="t02_tp_bas_infActionForm" property="ispage"/>
			  </td>
            </tr>
             <tr >
                <td  nowrap><font color="#FF0000">*</font>每页记录条数：</td>
                <td >
                <bean:write name="t02_tp_bas_infActionForm" property="pagerecnum"/>
                </td>
              </tr>
             <tr >
              <td  ><font color="#FF0000">*</font>执行查询类型：</td>
              <td >
              <bean:write name="t02_tp_bas_infActionForm" property="querytype"/>
			  </td>
            </tr>
              <tr >
              <td  ><font color="#FF0000">*</font>页面显示类型：</td>
              <td >
               <bean:write name="t02_tp_bas_infActionForm" property="pagetype"/>
			  </td>
            </tr>
             <tr >
              <td  nowrap><font color="#FF0000">*</font>输入条件显示类型：</td>
              <td >
              <bean:write name="t02_tp_bas_infActionForm" property="condtype"/>
              </td>
            </tr>
            <tr >
              <td  nowrap><font color="#FF0000">*</font>输入条件显示行数：</td>
              <td >
                <bean:write name="t02_tp_bas_infActionForm" property="condnum"/>
              </td>
            </tr>
             <tr  style="display: none">
              <td  nowrap>结果处理类型：</td>
              <td >
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode1" value="1">统计、</logic:equal>
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode2" value="1">排序、</logic:equal>
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode3" value="1">抽样、</logic:equal>
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode4" value="1">筛选、</logic:equal>
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode5" value="1">导出</logic:equal> 
              </td>
            </tr>
           <tr >
              <td  nowrap>功能描述：</td>
              <td ><bean:write name="t02_tp_bas_infActionForm" property="fundes"/>
              </td>
            </tr>
            <tr >
              <td  nowrap><font color="#FF0000">*</font>数据来源：</td>
              <td ><bean:write name="t02_tp_bas_infActionForm" property="qryconncd_disp"/>
              </td>
            </tr>
           <tr >
              <td  nowrap>查询权限：</td>
              <td ><bean:write name="t02_tp_bas_infActionForm" property="useauth_disp"/>
              </td>
            </tr>
            <tr >
              <td  nowrap>执行sql：</td>
              <td ><%=request.getAttribute("sql") %>
              </td>
            </tr>
          </table>
       </div>

	<div class="awp_list">
      <TABLE>
			<TR align=center>
				<TD width="10%" align="center" nowrap>
					序号
				</TD>
				<TD width="15%" align="center" nowrap>
					参数代码
				</TD>
				<TD width="35%" noWrap>
					显示名称
				</TD>
				<TD width="20%" noWrap>
					输入参数类型
				</TD>
				<TD width="10%" noWrap>
					是否必输
				</TD>
				<TD width="10%" noWrap>
					显示序号
				</TD>
			</TR>

            <logic:iterate id="parinfo" name="t02_tp_in_parmList"  type="com.ist.avp.template.dto.T02_tp_in_parm" indexId="id" offset="0">
			<TR align="center" >
				<TD nowrap>
					<bean:write name="id" />
				</TD>
				<TD nowrap align="left">
					<bean:write name="parinfo" property="sysinparmcd" scope="page" />
				</TD>
				<TD nowrap align="left">
					<bean:write name="parinfo" property="dispname" scope="page" />
				</TD>
				<TD nowrap>
					<bean:write name="parinfo" property="parmtype_disp" scope="page" />
				</TD>
				<TD nowrap>
					<bean:write name="parinfo" property="isness_disp" scope="page" />
				</TD>
				<TD nowrap>
					<bean:write name="parinfo" property="dispseq" scope="page" />
				</TD>
			</TR>
			</logic:iterate>
		</TABLE>
  	</div>

	<div class="awp_list">
		<TABLE>
				<TR align=center>
					<TD width="10%" align="center" nowrap>
						序号
					</TD>
					<TD width="15%" align="center" nowrap>
						列代码
					</TD>
					<TD width="35%" align="center" nowrap>
						列显示名称
					</TD>
					<TD width="20%" noWrap>
						是否码表转换
					</TD>
					<TD width="10%" noWrap>
						对应码表
					</TD>
					<TD width="10%" noWrap>
						显示序号
					</TD>
				</TR>
				<logic:iterate id="binfo" name="t02_tp_disp_rstList" indexId="id" offset="0"
					type="com.ist.avp.template.dto.T02_tp_disp_rst">
					<TR align="center" >
						<TD nowrap>
							<bean:write name="id"/>
						</TD>					
						<TD nowrap align="left">
							<bean:write name="binfo" property="colaliascd" scope="page" />
						</TD>
						<TD nowrap align="left">
							<bean:write name="binfo" property="dispname" scope="page" />
						</TD>

						<TD nowrap>
							<bean:write name="binfo" property="iscdchg_disp" scope="page" />
						</TD>
						<TD nowrap>
							<bean:write name="binfo" property="catecd" scope="page" />
						</TD>
						<TD nowrap>
							<bean:write name="binfo" property="dispseq" scope="page" />
						</TD>
					</TR>
				</logic:iterate>

			</TABLE>
		</div>
			
		<div class="awp_list">
			<TABLE>
				<TR align=center >
					<TD width="10%" noWrap>
						序号
					</TD>
					<TD width="21%" noWrap>
						跳转列名称
					</TD>
					<TD width="28%" noWrap>
						跳转模型
					</TD>
					<TD width="20%" noWrap>
						跳转条件
					</TD>
					<TD width="26%" noWrap>
						跳转参数
					</TD>
				</TR>

				<logic:iterate id="binfo" name="t02_jump_tpList"
					type="com.ist.avp.template.dto.T02_jump_tp" indexId="id" offset="0">
				<TR align="center" >
					<TD nowrap>
						<bean:write name="id"/>
					</TD>
					<TD nowrap align="left">
						<bean:write name="binfo" property="dispname" scope="page" />
					</TD>
					<TD nowrap align="left">
						<bean:write name="binfo" property="jumptplaname" scope="page" />
					</TD>
					<TD nowrap>
						<bean:write name="binfo" property="dispjumpcond" scope="page" />
					</TD>
					<TD nowrap>
						<bean:write name="binfo" property="dispjumpparm" scope="page" />
					</TD>
				</TR>
				</logic:iterate>
			</TABLE>
		</div>
</html:form>
</div>
</BODY>
</HTML>
