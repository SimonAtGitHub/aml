<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.ist.cms.common.constant.CmsConstant" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>


    <%@ include file="../bmp/platform/common/style_include.jsp" %>
	<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	<script src="<%=request.getContextPath()%>/js/awp_base.js"></script>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<script src="<%=request.getContextPath()%>/js/load_window.js"></script>
	
	<script type="text/javascript">
	
	function commitReply() {
	    var content = document.getElementById("replycontent").value;
	    if(trim(content) == '') {
	        alert("回复内容不能为空！");
	        document.getElementById("replycontent").focus();
	        return ;
	    }
	    
	    document.forms[0].action="../knowledgemanager/release_writeback.do";
		document.forms[0].submit();	    
	}

    </script>
			
<table width="100" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="8">
		
		</td>
	</tr>
</table>

<logic:notEmpty name="t12_article">		   			
		
		
<div id="popall">

  <div id="popNav">
   <span>知识管理 > 文章详情 
  </div>
  <div id="popCont">
  <!--修改提示-->
  <logic:equal value="1" name="t12_article" property="isadminmodify">
    <div class="tips">
	 <div class="tipbg"></div>
	 <div class="tipcot">
		  文章已被<span>[<bean:write name="t12_article" property="adminrealname" ignore="true"/>]</span>修改<br/>
		  修改时间(<bean:write name="t12_article" property="admindate" ignore="true"/>)
	 </div>
	</div>
	</logic:equal>
	<html:hidden property="articlekey" /> 
	 <html:hidden property="programakey" />
	<div class="pop_cl"></div>
  <!--文章-->
    <div class="Article">
	
	 <!--文章标题-->
	 <div class="Ar_title">
	   <h1><bean:write name="t12_article" property="articlename" ignore="true"/></h1>
	   <span><bean:write name="t12_article" property="createdate" ignore="true"/></span>
	   <span>作者：<bean:write name="t12_article" property="realname" ignore="true"/></span>
	   <span>
		 <a href="<%=request.getContextPath() %>/cms/knowledgemanager/t12_knowledge_collect.do?articlekey=<bean:write name="t12_articleActionForm" property="articlekey" />&programakey=<bean:write name="t12_articleActionForm" property="programakey" />" ><img src="<%=request.getContextPath()%>/skin/<%=style %>/images/pop_favorite.gif" />[收藏]</a>
		
		 <a href="javascript:void(0);" onclick="window.close();"><img src="<%=request.getContextPath()%>/skin/<%=style %>/images/pop_close.gif" />[关闭]</a>
		 
	   </span>
	 </div>
	  <!--文章内容-->
	  	   <%
						    Map map = (Map)request.getAttribute("resultMap");
						    if(map == null) {
						        map = new HashMap();
						    }
						    %>
	 <div class="Ar_cont">
	   <p >
	  
			<%=(String)map.get("D_ARTICLECON") %>
		
	   
	   </p>
	 </div>
	  
	  <!--附件-->
	  <logic:equal value="1" name="t12_programa_power" property="isdownload">	
	 <div class="Ar_other">
	 	<h1><img src="<%=request.getContextPath()%>/skin/<%=style %>/images/pop_annex.gif" />附件</h1>
	    
						  <jsp:include page="../cmp/attachment/attach_include_show_n.jsp" />
		
	 </div>
	 </logic:equal>
	 <!--文章相关信息-->
	 <div class="Ar_other">
	   <h1><img src="<%=request.getContextPath()%>/skin/<%=style %>/images/pop_art.gif" />文章相关信息</h1>

					<logic:iterate id="col" name="t12_programa_colsList" type="com.ist.cms.dto.T12_programa_cols">
				               <%
				                  String colkey = col.getColkey();
				                  String value = (String)map.get(colkey);
				                  if(value == null) value = "";
				                  String disp_value = com.ist.common.util.StringUtils.null2String((String)map.get(CmsConstant.LOCATE_DISP_VALUE_PRE+colkey));
				               %>						   
						    <logic:notMatch value="D_ARTICLENAM" name="col" property="colkey">
						   		<logic:notMatch value="ARTICLEKEY" name="col" property="colkey">
						   			<logic:notMatch value="D_ARTICLECON" name="col" property="colkey">
									  <logic:notMatch value="D_CREATOR" name="col" property="colkey">
									  	<logic:notMatch value="D_CREATEDATE" name="col" property="colkey">
											 <logic:notMatch value="D_MODIFIER" name="col" property="colkey">
											 	<logic:notMatch value="D_MODIFYDATE" name="col" property="colkey">
											 		<p><strong>【<bean:write property="colname" name="col"/>】</strong>&nbsp;&nbsp;<% if(!"1".equals(col.getRelevancetype())){
											 			if("2".equals(col.getParmtype())||"3".equals(col.getParmtype()) ||"5".equals(col.getParmtype())){
											 				out.print(disp_value);
											 			}else{
											 				out.print(value);
											 			}
											 		}else{
											 			out.print(value);
											 		}%></p>
									  			</logic:notMatch>
									  		</logic:notMatch>
									  	</logic:notMatch>
									  </logic:notMatch>							   
							   		</logic:notMatch>
							   </logic:notMatch>
						   </logic:notMatch>
					 </logic:iterate>
	   
	 </div>
	<logic:equal value="1" name="t12_programa_power" property="isreply"> 
	<!--评论-->
	<div class="comment">
		 <logic:notEmpty name="t12_writebackList" >
			  <h1>
			   <img src="<%=request.getContextPath()%>/skin/<%=style %>/images/pop_comtbig.gif" />相关评论
			   <a href="javascript:openWin('../businessmanager/t12_writeback/t12_writeback_list_by_articlekey.do?newsearchflag=1&articlekey=<bean:write name="t12_articleActionForm" property="articlekey"/>&programakey=<bean:write name="t12_articleActionForm" property="programakey"/>&1=1','','600','800')" >浏览所有评论</a>
			  </h1>
		 </logic:notEmpty>  
		
	  <div class="pop_cl"></div>
	 
	  		 <logic:iterate id="wirteback" name="t12_writebackList"  type="com.ist.cms.dto.T12_writeback" >
					<dl>
						<dt><bean:write name="wirteback" property="realname"/><span>&nbsp;<bean:write name="wirteback" property="createdate"/></span></dt>
						<dd><bean:write name="wirteback" property="replycontent" filter="false"/></dd>
					</dl>
			</logic:iterate>
	 
	 
	  <p class="reply">
	  	<textarea rows="6" cols="66" name="replycontent"></textarea>
	  	<input type="button" name="button" value="发 表 评 论" onClick="commitReply()" />
	  </p>
	   
	</div>
	</logic:equal>
	
	
	
  </div>

<script type="text/javascript">
<!--
function popwindow(){
   var bodyWidth=document.body.clientWidth;
   var divWidth=document.getElementById('popall'); 
   if(bodyWidth>988){
      divWidth.style.width=988+'px';
      divWidth.style.position="relative";
   } else {
      divWidth.style.width=bodyWidth+'px';
   }
}
popwindow();
window.onresize=popwindow; 
//-->
</script>

		
		</logic:notEmpty>
		