<%@ page contentType="text/html; charset=GBK" %>
	 <SCRIPT LANGUAGE="JavaScript">
	 //根据粒度，确定时间选择框的显示
function Changegranularity1(selObj){
    var selval=selObj.options[selObj.selectedIndex].value;
    start_8.style.display='none'  //季度
    start_4.style.display='none'  //月
    start_1.style.display='none'  //日
    start_82.style.display='none' //季度
    start_42.style.display='none' //月
    start_12.style.display='none' //日
    start_9.style.display = 'none'//开始半年
    start_92.style.display = 'none'//结束半年
        if(selval==1){
        start_1.style.display='';
        start_4.style.display='';
        start_12.style.display='';
        start_42.style.display='';
		time_select(document.forms[0].s_year,document.forms[0].s_month,document.forms[0].s_day,document.forms[0].starttime,"0");
		time_select(document.forms[0].e_year,document.forms[0].e_month,document.forms[0].e_day,document.forms[0].endtime,"0");
     }
        if(selval==4){
        start_4.style.display='';
        start_42.style.display='';
     }
        if(selval==5){
        start_8.style.display='';
        start_82.style.display='';
     }
      if(selval==6){
        start_9.style.display='';
        start_92.style.display='';
     }
}
	 </SCRIPT> 
	  <tr id="" bgcolor="F6F9FF">
        <td height="22" align="right">时间粒度：</td>
        <td align="left" colspan='3'>
		  <html:select property="granularity" onchange="Changegranularity1(this);">
            <html:options collection="granularityMap" property="label" labelProperty="value" />
          </html:select>
		</td>
      </tr>
	  <tr id=""bgcolor="ECF3FF">
	    <td height="22" align="right">起始时间：</td>
	    <td align="left" colspan='3'><table width="270" border="0" cellpadding="0" cellspacing="0">
	        <tr>
	          <td width="90" nowrap> <input type="hidden" name="starttime" value="">
	          
	            <html:select property="s_year" onchange="return time_select(document.forms[0].s_year,document.forms[0].s_month,document.forms[0].s_day,document.forms[0].starttime,'0')">
            		<html:options collection="sYearMap" property="label" labelProperty="value" />
          		</html:select>
	    年 </td>
	  <td width="90" nowrap> 
	  <div id="start_9" style="display:'none'">
	      <html:select property="s_halfyear">
            		<html:options collection="sHalfYearMap" property="label" labelProperty="value" />
          </html:select>半年
	      </div>
	  
	  <div id="start_8" style="display:'none'">第
	      <html:select property="s_quarter">
            		<html:options collection="sQuarterMap" property="label" labelProperty="value" />
          </html:select>
	      季度</div>
	    <div id="start_4" style="display:''">
	      		<html:select property="s_month" onchange="return time_select(document.forms[0].s_year,document.forms[0].s_month,document.forms[0].s_day,document.forms[0].starttime,'0')">
            		<html:options collection="sMonthMap" property="label" labelProperty="value" />
          		</html:select>
	              月</div></td>
	          <td width="90" nowrap> <div id="start_1" >
	              <html:select property="s_day">
            					<html:options collection="sDayMap" property="label" labelProperty="value" />
          				  </html:select>
	              日 </div></td>
	        </tr>
	      </table></td>
	  </tr>
	  <tr id="" bgcolor="F6F9FF" style = 'display:none'>
	    <td height="22" align="right">结束时间：</td>
	    <td align="left" colspan='3'><table width="270" border="0" cellpadding="0" cellspacing="0">
	        <tr>
	          <td width="90" nowrap> <input type="hidden" name="endtime" value="">
	            <html:select property="e_year" onchange="return time_select(document.forms[0].s_year,document.forms[0].s_month,document.forms[0].s_day,document.forms[0].starttime,'0')">
            		<html:options collection="eYearMap" property="label" labelProperty="value" />
          		</html:select>
	    年 </td>
	  <td width="90" nowrap> 
	  <div id="start_92" style="display:'none'">
	      <html:select property="e_halfyear">
            		<html:options collection="eHalfYearMap" property="label" labelProperty="value" />
          </html:select>半年
	      </div>
	      <div id="start_82" style="display:'none'">第
	      <html:select property="e_quarter">
            		<html:options collection="eQuarterMap" property="label" labelProperty="value" />
          </html:select>
	      季度</div>
	    <div id="start_42" style="display:''">
	      		<html:select property="e_month" onchange="return time_select(document.forms[0].s_year,document.forms[0].s_month,document.forms[0].s_day,document.forms[0].starttime,'0')">
            		<html:options collection="eMonthMap" property="label" labelProperty="value" />
          		</html:select>
	                      月</div></td>
	                  <td width="90" nowrap> <div id="start_12" >
	                      <html:select property="e_day">
            					<html:options collection="eDayMap" property="label" labelProperty="value" />
          				  </html:select>
	                      日 </div></td>
	                </tr>
	              </table></td>
	          </tr>
	          <SCRIPT language="javascript">
				Changegranularity1(document.all.granularity);
			  </SCRIPT>