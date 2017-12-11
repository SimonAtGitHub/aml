<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=GBK">
<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<script src="../../js/title.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl){
    var errMsg ="";
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}

</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
 <html:form action="/calinfo/dm_task_list.do" method="post">
<html:hidden property="newsearchflag" value="1"/>
<html:hidden property="domainkey"/>
<html:hidden property="serverkey"/>
<html:hidden property="statisticdate_disp"/>
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr>
      <td width="94%" class="td1">
          <span class="css014">
          <strong><font color="0072BC">DM计算管理 - 任务查询</font></strong></span>      </td>
      <td width="6%" align="right" nowrap class="td2">
          <html:button property="backbutton" value="返  回" styleClass="input" onclick="dosubmit('dm_task_list.do','back')"/>
      </td>
    </tr>
  </table>
  <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
     <tr><td height="8"></td></tr>
  </table>

  <TABLE align=center border=1 borderColor=333333 cellPadding=0 cellSpacing=0 style="BORDER-COLLAPSE: collapse" width="98%">
    <TBODY>
      <TR>
        <TD align="center" valign="top" style="PADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; PADDING-TOP: 2px">
  <table width="100%" border="0" cellpadding="1" cellspacing="1">
            <tr bgcolor="ECF3FF">
              <td width="160" height="22" align="right" bgcolor="ECF3FF"> 机构：</td>
              <td bgcolor="F6F9FF"><select name="select3" id="select3">
                <option value="1">--全部--</option>
                <option value="0">总行</option>
                <option value="-1">北京管理部</option>
                                                                      </select>              </td>
            </tr>
            <tr bgcolor="F6F9FF">
              <td height="22" align="right" bgcolor="ECF3FF">粒度：</td>
              <td bgcolor="F6F9FF"><select name="select4" id="select4">
                <option>--全部--</option>
                <option value="1">日</option>
                <option value="0">月</option>
                <option value="-1">季</option>
                <option>年</option>
                                                        </select></td>
            </tr>
            <tr bgcolor="ECF3FF">
              <td height="22" align="right" bgcolor="ECF3FF">任务名称：</td>
              <td bgcolor="F6F9FF"><select name="select5" id="select5">
                <option selected>--全部--</option>
                <option value="1">1201-会计科目表 </option>
                <option value="0">1202-资产负债表</option>
                <option value="-1">1203-损益表</option>
                <option>1204-损益明细表</option>
                                                                      </select></td>
            </tr>
            <tr bgcolor="F6F9FF">
              <td height="22" align="right" bgcolor="ECF3FF">任务类别：</td>
              <td bgcolor="F6F9FF"><select name="select2" id="select2">
                  <option selected>--全部--</option>
                  <option>码表导入</option>
                  <option>全量事实表导入</option>
                  <option>增量事实表导入</option>
                  <option>内部计算</option>
                                                          </select>
              </td>
            </tr>
            <tr bgcolor="F6F9FF">
              <td height="22" align="right" bgcolor="ECF3FF">任务状态：</td>
              <td bgcolor="F6F9FF"><select name="select2" id="select2">
                <option>--全部--</option>
                <option>未计算</option>
                <option>正在计算</option>
                <option>计算完毕</option>
                <option>计算出错</option>
                                                        </select>              </td>
            </tr>
            <tr bgcolor="ECF3FF">
              <td height="22" align="center" bgcolor="ECF3FF">&nbsp;</td>
              <td bgcolor="F6F9FF"><input type=button value="提 交" name=Button52 class="input" onClick="checkForm('dm_task_list.htm')">
              <input name="Submit2" type="reset" class="input" value="重 置"></td>
            </tr>
          </table>
        </TD>
      </TR>
    </TBODY>
  </TABLE>
</html:form>
</BODY>
</HTML>
