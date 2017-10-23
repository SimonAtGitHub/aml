<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="�˻���֧����Ϣ">

<@CommonQueryMacro.CommonQueryTab id="bopAccDsGenTabs" navigate="false" currentTab="BopAccDsInOutGen">
	<@CommonQueryMacro.CommonQuery id="bopAccDsInOutGen" init="false" submitMode="all" navigate="false" >
		<table align="left">
			<tr>
				<td>
					<@CommonQueryMacro.Interface id="interface" label="�������ѯ����" />
				</td>
			</tr>
			<tr>
				<td valign="top">
					<@CommonQueryMacro.PagePilot id="ddresult" maxpagelink="9" showArrow="true" />
				</td>
		    </tr>
		    <tr>
		    	<td>
					<@CommonQueryMacro.DataTable id ="datatable1" fieldStr="brNo,brNoName,workDate[85],actiontype,accountno[200],currencyCode[100],dealDate[85],credit,debit,balance" hasFrame="true" width="900" height="260" readonly="true"/>
		      	</td>
		    </tr>
		</table>
	</@CommonQueryMacro.CommonQuery>
</@CommonQueryMacro.CommonQueryTab>
<script language="JavaScript">

	function datatable1_accountno_onRefresh(cell,value,record) {
		if (record) {//�����ڼ�¼ʱ
			var id = record.getValue("id");
			var accountno = record.getValue("accountno");
			cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:doDetail('"+id+"')\">" + accountno + "</a>"
		} else {
			cell.innerHTML="&nbsp;";
		}
	}

	//��ϸ��Ϣ
	function doDetail(id){
		showWin("�˻���֧����ϸ","${contextPath}/fpages/datacollection/ftl/BopAccDsRecordInOutInfo.ftl?id=" + id + "&op=detail");
	}
</script>
</@CommonQueryMacro.page>