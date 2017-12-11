<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="对外担保信息">
	<@CommonQueryMacro.CommonQueryTab id="BopCFAExguAuditTabs" navigate="false" currentTab="BOPCFAExguInfoAudit">
		<@CommonQueryMacro.CommonQuery id="BOPCFAExguInfoAudit" init="false" submitMode="selected" navigate="false" >
			<table align="left">
				<tr>
					<td colspan="2">
						<@CommonQueryMacro.Interface id="interface" label="请输入查询条件" />
					</td>
				</tr>

				<tr>
					<td valign="top">
						<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="9" showArrow="true" />
					</td>
		    	</tr>

		    	<tr>
		    		<td colspan="2">
						<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btAudit" fieldStr="select[40],filler2[80],brNo[80],brNoName[150],workDate[80],actiontype[80],recStatus[80],approveStatus[80],repStatus[80],exguarancode[80],guarantorcode[80],guarantype[80],appdocuno[80],contractdate[80],maturity[80],guarancurr[80],maindebtcurr[80],guaranamount[80],maindebtamount[80],guappcode[80],guappname[80],guappnamen[80],remark[80],actiondesc[80]" hasFrame="true" width="900" height="260" readonly="true"/>
		      		</td>
		    	</tr>
		    	<tr>
		    		<td>
		    			<@CommonQueryMacro.FloatWindow id="aditADSubWindow" label="" width="" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
		      				<div align="center">
		      					<@CommonQueryMacro.Group id="group1" label="审核信息"  fieldStr="approveStatusChoose,approveResultChoose" colNm=2/>
		        			 	</br>
		      					<center>
		      						<@CommonQueryMacro.Button id= "btAuditSave"/>&nbsp;&nbsp;
		      						<@CommonQueryMacro.Button id= "btBack"/>
		      					</center>
		      				</div>
		     			</@CommonQueryMacro.FloatWindow>
		    		</td>
		    	</tr>
			</table>
		</@CommonQueryMacro.CommonQuery>
	</@CommonQueryMacro.CommonQueryTab>
	<script language="JavaScript">
		//工作日期
		function initCallGetter_post() {
			<#assign v_txdate = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getTxdate()>
			BOPCFAExguInfoAudit_interface_dataset.setValue("qstartDate","${v_txdate}");
			BOPCFAExguInfoAudit_interface_dataset.setValue("qendDate","${v_txdate}");
		}


	    function datatable1_filler2_onRefresh(cell,value,record) {
			if (record) {//当存在记录时
				var id = record.getValue("id");
				var filler2 = record.getValue("filler2");
				cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:doDetail('"+id+"')\">" + filler2 + "</a>"
			} else {
				cell.innerHTML="&nbsp;";
			}
		}
		//刷新数据
		function flushPage(){
			BOPCFAExguInfoAudit_dataset.flushData(1);
		}
		function btAuditSave_onClickCheck(){
		   	var approveStatusChoose = BOPCFAExguInfoAudit_dataset.getValue("approveStatusChoose");
		   	var approveResultChoose = BOPCFAExguInfoAudit_dataset.getValue("approveResultChoose");
		   	if (!approveStatusChoose.length > 0) {
		   		alert("请选择审核结果！");
		   		return false;
		   	}
		   	if (approveStatusChoose == "02" && approveResultChoose.length < 1) {
		   		alert("审核结果不通过，审核说明必须填写！");
		   		return false;
		   	}
		   	BOPCFAExguInfoAudit_dataset.setParameter("approveStatusChoose",approveStatusChoose);
		   	BOPCFAExguInfoAudit_dataset.setParameter("approveResultChoose",approveResultChoose);
			subwindow_aditADSubWindow.hide();
		}
		function btAuditSave_postSubmit(button){
			alert("保存成功");
			BOPCFAExguInfoAudit_dataset.flushData();
		}
		function btAudit_onClick(){
			var hasSelected = false;
			var hasAudit = false;
			var record = BOPCFAExguInfoAudit_dataset.getFirstRecord();
			while(record){
				var v_selected = record.getValue("select");
				var v_approveStatus = record.getValue("approveStatus");
				if( v_selected == true ){
					hasSelected=true;
					if (v_approveStatus != "00") {
						hasAudit = true;
					}
				}
				record=record.getNextRecord();
		   	}
		   	if (!hasSelected) {
		   		alert("请选择相应的记录！");
		   		return false;
		   	}
		   	if (hasAudit) {
		   		if(!confirm("所选记录包含已审核记录，确定需重新审核吗？"))
				{
					return false;
				}
		   	}
			subwindow_aditADSubWindow.show();
		}
		function btBack_onClick(){
			subwindow_aditADSubWindow.hide();
		}
		//详细信息
		function doDetail(id){
			showWin("对外担保签约信息明细","${contextPath}/fpages/datacollection/ftl/BopForCFAExguDsAdd.ftl?id=" + id + "&op=detail");
		}
	</script>
</@CommonQueryMacro.page>