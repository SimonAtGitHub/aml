<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<title></title>
<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/avpfunc.js"></script>
<script src="<%= request.getContextPath() %>/js/load_window.js"></script>
<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>

<SCRIPT LANGUAGE="JavaScript">
function checkForm(theUrl){
        document.forms[0].action=theUrl;
		document.forms[0].submit();
		
        var left_value=window.parent.leftFrame.location+"";
        var p_url="<%=request.getContextPath()%>/avp/template/tpla_maint_list.do?newsearchflag=1&busstypecd=<%=request.getParameter("busstypecd")%>";
        //alert(left_value.indexOf("tpla_add_left"));
        if(left_value.indexOf("tpla_add_left") != -1 || left_value.indexOf("tpla_bz_add_left") != -1){ 
            //window.parent.opener.location=p_url;
            var _parentWin = window.parent ;
		    _parentWin.close();
        }else{
        	parent.location.href=p_url;
            event.srcElement.disabled = true;
        }
        
}
function dosubmit(theUrl,type){
		var rsltdisptype = "<bean:write name="t02_tp_bas_infActionForm" property="rsltdisptype"/>";
		if (type == "testSQL"){
			var tplaname = "<bean:write name="t02_tp_bas_infActionForm" property="tplaname"/>";
			var tplatype = "<bean:write name="t02_tp_bas_infActionForm" property="tplatype"/>";
			if (null == tplaname || "" == tplaname){
				alert('请先维护基本属性信息！');
				return;
			}			
			if(<%=request.getAttribute("isHaveMainSQL")%> != 1 && tplatype !=1 && rsltdisptype !=4){
				alert('请添加主SQL语句！');
				return;
			}
			avpPopUp(theUrl,'900','600');
		}else{
			document.forms[0].action=theUrl;
		    document.forms[0].submit();
		}
		        
}
function parentpage(theUrl){
	  parent.location=theUrl;
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
							<input type="button" name="button_save" Class="input" value="测试模型" onclick="dosubmit('tpla_chk_main_test.do?newsearchflag=1&pop_win_flag=1&tplakey=<bean:write name="t02_tp_bas_infActionForm" property="tplakey"/>','testSQL')"/>
			<html:button property="button_next" styleClass="input" value="完 成" onclick="parentpage('t02_jump_tp_achive.do')"/>     </td>
					</tr>
				</table>
	</div>      
  
  
   
  <div class="awp_detail">
     <table>
            <tr>
              <td ><font color="#FF0000">*</font>所属类别：</td>
              <td >
              <html:hidden property="tplacatecd" styleClass="text_white" />
              <bean:write name="t02_tp_bas_infActionForm" property="tplacatecd_name"/>
             </td>
            </tr>
            <tr>
              <td ><font color="#FF0000">*</font>模板名称：</td>
              <td >
              <bean:write name="t02_tp_bas_infActionForm" property="tplaname"/>
              </td>
            </tr>
           
            <tr>
              <td ><font color="#FF0000">*</font>模板结果显示类型：</td>
              <td >
                 <bean:write name="t02_tp_bas_infActionForm" property="rsltdisptype_disp"/>
			  </td>
            </tr>
              <!-- 
             <tr>
                <td ><font color="#FF0000">*</font>是否在导航树中显示：</td>
                <td >
                  <bean:write name="t02_tp_bas_infActionForm" property="isdisp"/>               
                </td>
             </tr>
              -->
              <tr>
                <td nowrap>显示序号：</td>
                <td >
                <bean:write name="t02_tp_bas_infActionForm" property="dispseq"/>
                </td>
              </tr>
            <tr>
              <td ><font color="#FF0000">*</font>是否分页：</td>
              <td >
              <bean:write name="t02_tp_bas_infActionForm" property="ispage"/>
			  </td>
            </tr>
             <tr>
                <td nowrap><font color="#FF0000">*</font>每页记录条数：</td>
                <td >
                <bean:write name="t02_tp_bas_infActionForm" property="pagerecnum"/>
                </td>
              </tr>
             <tr>
              <td ><font color="#FF0000">*</font>执行查询类型：</td>
              <td >
              <bean:write name="t02_tp_bas_infActionForm" property="querytype"/>
			  </td>
            </tr>
              <tr>
              <td ><font color="#FF0000">*</font>页面显示类型：</td>
              <td >
               <bean:write name="t02_tp_bas_infActionForm" property="pagetype"/>
			  </td>
            </tr>
             <tr>
              <td nowrap><font color="#FF0000">*</font>输入条件显示类型：</td>
              <td >
              <bean:write name="t02_tp_bas_infActionForm" property="condtype"/>
              </td>
            </tr>
            <tr>
              <td nowrap><font color="#FF0000">*</font>输入条件显示行数：</td>
              <td >
                <bean:write name="t02_tp_bas_infActionForm" property="condnum"/>
              </td>
            </tr>
             <tr style="display: none">
              <td  nowrap>结果处理类型：</td>
              <td >
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode1" value="1">统计、</logic:equal>
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode2" value="1">排序、</logic:equal>
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode3" value="1">抽样、</logic:equal>
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode4" value="1">筛选、</logic:equal>
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode5" value="1">导出</logic:equal> 
              </td>
            </tr>
           <tr>
              <td  nowrap>功能描述：</td>
              <td ><bean:write name="t02_tp_bas_infActionForm" property="fundes"/>
              </td>
            </tr>
           <tr>
              <td  nowrap><font color="#FF0000">*</font>数据来源：</td>
              <td ><bean:write name="t02_tp_bas_infActionForm" property="qryconncd_disp"/>
              </td>
            </tr> 
           <tr>
              <td  nowrap>查询权限：</td>
              <td ><bean:write name="t02_tp_bas_infActionForm" property="useauth_disp"/>
              </td>
            </tr>
            <tr>
              <td  nowrap>执行sql：</td>
              <td ><%=request.getAttribute("sql") %>
              </td>
            </tr>
            <tr>
              <td  nowrap>测试执行时间：</td>
              <td  ><input type="text" id="test_time" readonly="readonly" size="4" value="0">秒
              </td>
            </tr>
            <tr>
              <td  nowrap>脚本：</td>
              <td  ><bean:write name="t02_tp_bas_infActionForm" property="scriptcd"/>
              </td>
            </tr>
          </table>
       </div>

<div class="awp_list">
      <TABLE>
			<TR align=center >
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
			<TR align="center"  id='id_<bean:write name="parinfo" property="parmkey" />' onMouseOver=TableMouseOver(this,'id_<bean:write name="parinfo" property="parmkey" />') onmouseout=TableMouseOut(this,'id_<bean:write name="parinfo" property="parmkey" />')>
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
					<TR align="center"  id='id_<bean:write name="binfo" property="dispcolkey" />' onMouseOver=TableMouseOver(this,'id_<bean:write name="binfo" property="dispcolkey" />') onmouseout=TableMouseOut(this,'id_<bean:write name="binfo" property="dispcolkey" />')>
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
				<TR align="center" id='id_<bean:write name="binfo" property="jumpkey" />' onMouseOver=TableMouseOver(this,'id_<bean:write name="binfo" property="jumpkey" />') onmouseout=TableMouseOut(this,'id_<bean:write name="binfo" property="jumpkey" />')>
					<TD nowrap>
						<bean:write name="id"/>
					</TD>
					<TD nowrap>
						<bean:write name="binfo" property="dispname" scope="page" />
					</TD>
					<TD nowrap>
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
		
		<div class="awp_list">
			<TABLE>
				<TR align=center >
					<td>动作名称</td>
					<td>动作地址</td>
					<td>显示类型</td>
					<td>位置类型</td>
					<td>提交类型</td>
					<td>窗口宽度</td>
					<td>窗口高度</td>
					<td>显示顺序</td>
				</TR>
				<logic:iterate id="javaBean" name="t02_tp_cus_actionList" type="com.ist.avp.template.dto.T02_tp_cus_action">
				<tr>
					<td>
						<bean:write name="javaBean" property="actionname"/>
					</td>
					<td>
						<bean:write name="javaBean" property="actionurl"/>
					</td>
					<td align="center">
						<bean:write name="javaBean" property="disptype_disp"/>
					</td>
					<td align="center">
						<bean:write name="javaBean" property="locatetype_disp"/>
					</td>
					<td align="center">
						<bean:write name="javaBean" property="submittype_disp"/>
					</td>
					<td align="right">
						<bean:write name="javaBean" property="width"/>
					</td>
					<td align="right">
						<bean:write name="javaBean" property="height"/>
					</td>
					<td align="right">
						<bean:write name="javaBean" property="dispseq"/>
					</td>
				</tr>
				</logic:iterate>
			</TABLE>
		</div>
		
</html:form>
</div>
</BODY>
</HTML>
