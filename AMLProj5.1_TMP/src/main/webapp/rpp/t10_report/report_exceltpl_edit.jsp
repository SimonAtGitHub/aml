<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ include file="../../bmp/platform/common/style_include.jsp"%>
<link
    href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css"
    rel="stylesheet" type="text/css">
    
  <SCRIPT LANGUAGE="JavaScript">
  function  window.onbeforeunload()
  {
      var  issave = document.all.save.value;
      if(document.all.TANGER_OCX.ActiveDocument.ProtectionType==-1){
        if(issave!= 1){
          if(confirm('是否保存文档!')){
            SaveFile();
            window.open("","_self");
          }else{

          }
         }
      }

  }
  </SCRIPT >

  <SCRIPT LANGUAGE="JavaScript"
    src="<%=request.getContextPath()%>/js/ntkoocx.js"></SCRIPT>

  <SCRIPT LANGUAGE="JavaScript">

  function vision(flag){
    //SetReadOnly(false);
    if(flag == 0){
      TANGER_OCX_OBJ.ActiveDocument.ShowRevisions = false;
      }else{
      TANGER_OCX_OBJ.ActiveDocument.ShowRevisions = true;
      }
    //SetReadOnly(true);
  }

  //保存附件
  function SaveFile(){
    //document.all.save.value=1;
    document.all.savebutton.style.display="none";
    document.all.modifybutton.style.display="";
    //TANGER_OCX_SetReadOnly(true);
    //SetReadOnly(true);
    TANGER_OCX_EnableFileSaveMenu(true);
    TANGER_OCX_SaveEditToServer();

//    document.all.vision_0.disabled = false;
//    document.all.vision_1.disabled = false;
  }

  //修改
  function modify(userName, isMark){
    document.all.savebutton.style.display="";
    document.all.modifybutton.style.display="none";
    //TANGER_OCX_SetReadOnly(false);
//    document.all.vision_0.disabled = true;
//    document.all.vision_1.disabled = true;
    SetReadOnly(false);
    TANGER_OCX_EnableFileSaveMenu(true);
    if (isMark != 2) {
      TANGER_OCX_OBJ.ActiveDocument.ShowRevisions = true;
      TANGER_OCX_SetDocUser(userName);
      TANGER_OCX_SetMarkModify(true);
    }
    ShowToolbars(true);
  }

  //保存关闭窗口
  function Close(){
    window.close();

  }
  </SCRIPT>




</head>
<body  onLoad="javascript:TANGER_OCX_OpenAttatchDoc('<%=request.getContextPath()%>/rpp/t10_report/editReportDataTpl_read.do?attachPath=<bean:write name="report" property="exceltpl_file" scope="request" />','xls')">

     <form id="myForm" method="post" enctype="multipart/form-data"
      action="<%=request.getContextPath()%>/rpp/t10_report/editReportDataTpl_save.do?attachPath=<bean:write name="report" property="exceltpl_file" scope="request" />">
    <input type="hidden" name="filename" value="<bean:write name="report" property="exceltpl_file" scope="request" />" />
    
    <html:messages id="errors" message="true">
        <bean:write name="errors" filter="fasle" />
    </html:messages>
  
   

    <script language="JScript" for=TANGER_OCX event="OnDocumentClosed()">
      TANGER_OCX_OnDocumentClosed();
    </script>
 
    <script language="JScript" for=TANGER_OCX
      event="OnDocumentOpened(TANGER_OCX_str,TANGER_OCX_obj)">
      TANGER_OCX_OnDocumentOpened(TANGER_OCX_str,TANGER_OCX_obj,0);
      
        modify('admin','false'==='true');
      
    </script>

      <table width="98%" height="800" align="center" border="0"
        cellspacing="0" cellpadding="0">
        <tr height=25 bgcolor="">
          <td align="left" width=40%>
            <font  color="#006699">文档编辑:</font>
          </td>
          <td align="right" width=55%>
            <input type="hidden" name="save" value="">
             <input type=button class="input" name="closebutton" value="关 闭" 
              onclick="Close();">
            <input type=button class="input" name="modifybutton" value="修 改" 
              onclick="modify('admin','1')">
            <input type=button name="savebutton" class="input" value="保 存"
              onclick="SaveFile()" style="display:none">
          </td>
        </tr>
        <tr>
          <td align="center" colspan="2">
            <script language="javascript" type="text/javascript">
                    var filetitle="报表模板";
                </script>
            <script src="<%=request.getContextPath()%>/js/ntkoGenObj.js"></script>
          </td>
        </tr>
      </table>
    </form>

    <!-- 以下函数相应控件的两个事件:OnDocumentClosed,和OnDocumentOpened -->
    <script language="JScript" for=TANGER_OCX event="OnDocumentClosed()">
      TANGER_OCX_OnDocumentClosed();
    </script>

    <script language="JScript" for=TANGER_OCX
      event="OnDocumentOpened(TANGER_OCX_str,TANGER_OCX_obj)">
      TANGER_OCX_OnDocumentOpened(TANGER_OCX_str,TANGER_OCX_obj);
    </script>

</body>
</html>
