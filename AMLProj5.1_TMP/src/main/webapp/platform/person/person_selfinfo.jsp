<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html>
  <HEAD>
   <link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
       <script src="../../js/title.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>

<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
   

    <SCRIPT LANGUAGE="JavaScript">
    function load0()
    {
    }
   
    function dosubmit(theUrl){
      document.forms[0].action=theUrl;
      document.forms[0].submit();
    }
    function _Open(url){
  
         window.open(url,'','height=500, width=700,left=100,top=100,scrollbars=yes,resizable=yes');
    }
    
    </SCRIPT>
    </HEAD>
    <BODY leftmargin="0" topmargin="0">
   
      <html:form action="/person/person_selfinfo.do" method="post">
       <div id="main">
        <div class="conditions">
		  <div class="cond_t">
		          <span>   设置 
              </span>
              <span class="buttons">  <a
							href="javascript:window.close();"><img
									src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />关 闭</a> </span>
              
		 </div>
		 <!-- 大选项卡开始 -->
				<div id="bigTab">
					<!-- 大选项卡菜单 -->
					<dl class="tabm">
						<dd class="tabcur">
							<span>个人信息</span>
						</dd>
						<dd>
							<span>修改密码</span>
						</dd>
						<!-- start add lixx 2011.10.09 添加换肤功能  -->
						<!--<logic:equal name="colorflag" value="1">
							<dd>
								<span>风格设置</span>
							</dd>
						</logic:equal>-->
						<!-- start add lixx 2011.10.09 添加换肤功能  -->
					</dl>
					
					<!-- 大选项卡内容开始 -->
					<dl class="tabc">
						<!-- 大选项卡（1）****个人信息****选项卡<dd>对应菜单<dd> 只有第一个选项卡dd有class -->
						<dd class="tabshow">
						<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
				<tr >
					<td >
						用户名：
					</td>
					<td>
						<bean:write name="t00_user" property="username" scope="request"/>
					</td>
					<td>
						真实姓名：
					</td>
					<td>
						<bean:write name="t00_user" property="realname" scope="request"/>
					</td>
				</tr>
				<tr>
					<td>
						归属机构：
					</td>
					<td bgcolor="F6F9FF">
						<bean:write name="t00_user" property="organkey_disp" scope="request"/>
					</td>
					<td>
						状态：
					</td>
					<td bgcolor="F6F9FF">
						<bean:write name="t00_user" property="flag_disp" scope="request"/>
					</td>
				</tr>
				
	 <tr>
      <td>
     角色：</td>
      <td  colspan="3">
           <logic:iterate id="role" name="t00_user" property="roleList" type="com.ist.platform.dto.T00_com_auth">
			      	<bean:write name="role" property="rolekey_disp" scope="page"/>
			      </logic:iterate>
      </td>
    </tr>
				 <tr>
         <td>地址：</td>
         <td colspan="3">
         <bean:write name="t00_user" property="address" scope="request"/>
         </td>
        </tr>
		<tr>
         <td>电话号码：</td>
         <td> <bean:write name="t00_user" property="telephone" scope="request"/>
        </td>
         <td>移动电话：</td>
         <td> <bean:write name="t00_user" property="mobilephone" scope="request"/>
        </td>
       </tr>
		<tr>
         <td>邮政编码：</td>
         <td> <bean:write name="t00_user" property="postalcode" scope="request"/>
       </td>
         <td>Email：</td>
         <td> <bean:write name="t00_user" property="emailaddress" scope="request"/>
         </td>
       </tr>
       <tr>
         <td>创建人：</td>
         <td> <bean:write name="t00_user" property="creator" scope="request"/>
        </td>
         <td>创建时间：</td>
         <td> <bean:write name="t00_user" property="createdate" scope="request"/>
        </td>
       </tr>
		<tr>
         <td>最后修改人：</td>
         <td> <bean:write name="t00_user" property="modifier" scope="request"/>
       </td>
         <td>最后修改时间：</td>
         <td> <bean:write name="t00_user" property="modifydate" scope="request"/>
         </td>
       </tr>
	  
	    <tr>
         <td>其他：</td>
         <td colspan="3">  <bean:write name="t00_user" property="remark" scope="request"/>
       
         </td>
       </tr>
       </table>
	</div>
						</dd>
						 <dd>
								<iframe src="<%=request.getContextPath()%>/platform/person/person_selfinfo_pass.do?username=<bean:write name="t00_user" property="username" />"
									width="100%" scrolling="no" height="1200" name="test"
									frameborder="0"></iframe>
						</dd>
						<!-- start add lixx 2011.10.09 添加换肤功能  -->
						<!--<logic:equal name="colorflag" value="1">
							<dd>
							   <iframe src="<%=request.getContextPath()%>/platform/person/person_selfinfo_color.do?username=<bean:write name="t00_user" property="username" />"
										width="100%" scrolling="no" height="800" name="test" frameborder="0">
						       </iframe>
							</dd>
						</logic:equal>-->
						<!-- start add lixx 2011.10.09 添加换肤功能  -->
				   </dl>
				</div>
                 
           </div>
           </div>
    </html:form>
    </body>
</html:html>
