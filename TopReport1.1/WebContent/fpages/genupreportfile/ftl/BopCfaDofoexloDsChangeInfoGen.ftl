<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="�䶯��Ϣ">
	<@CommonQueryMacro.CommonQueryTab id="BopCfaDofoexloDsGenTabs" navigate="false" currentTab="BopCfaDofoexloDsChangeInfoGen">
		<@CommonQueryMacro.CommonQuery id="BopCfaDofoexloDsChangeInfoGen" init="false" submitMode="current" navigate="false" >
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
						<@CommonQueryMacro.DataTable id ="datatable1" hasFrame="true"
							fieldStr="filler2[180],brNo,brNoName,workDate[100],actiontype,repStatus[70],dofoexlocode[130],buscode[130],changeno,loanopenbalan,changedate[100],withcurrence[150],withamount[100],settamount[100],useofunds[90]" readonly="true" hasFrame="true" width="900" height="260"/>
	      			</td>
	    		</tr>
			</table>
		</@CommonQueryMacro.CommonQuery>
	</@CommonQueryMacro.CommonQueryTab>
	<script language="JavaScript">

		//��ϵͳˢ�µ�Ԫ�������ʱ������
		function datatable1_filler2_onRefresh(cell,value,record) {
			if (record) {//�����ڼ�¼ʱ
				var id = record.getValue("id");
				var recStatus = record.getValue("recStatus");
				cell.innerHTML = "<center><a style='text-decoration:none' href=\"JavaScript:doDetail('"+id+"')\">"+value+"</a></center>";
			} else {
				//�������ڼ�¼ʱ
			 	cell.innerHTML="&nbsp;";
			}
		}

		//��ѯ
		function doDetail(id){
			showWin("�䶯��Ϣ��ѯ","${contextPath}/fpages/datacollection/ftl/BopCfaDofoexloDsChangeInfoAdd.ftl?op=detail&id="+id,"report","flushPage()");
		}

		//ˢ������
		function flushPage(){
			BopCfaDofoexloDsChangeInfoGen_dataset.flushData();
		}

	</script>
</@CommonQueryMacro.page>