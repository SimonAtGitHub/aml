// �ϴ�����
function uploadfile(url){
	//window.showModalDialog(url,window,'dialogHeight=400px,dialogWidth=600px,left=100,top=100,scrollbars=yes,resizable=yes');
	window.open(url,'','dialogHeight=400,dialogWidth=600,left=100,top=100,scrollbars=yes,resizable=yes');
}

// �༭���� modify by sunny 2008-02-18
function editAttach(_url){
	// ѡ�еĸ������ڵ�����
	document.getElementById("rowOfAttachList").value = event.srcElement.parentElement.parentElement.rowIndex;
	window.open(_url, "_blank", "");
	//"width=600,height=350,left=20,top=10,toolbar=0,location=0,directories=0,resizable=0,scrollbars=1"
}

// �༭��������
function editAttachEnd(oldAttachKey,newAttachKey,dispPath,editPath,fname,filesize,creator){
	var str = "";
	var s = document.getElementById("attachkeys").value + ",";
	if (s.length > 1 ){
		if (s.indexOf(oldAttachKey) > -1){
			str = s.substring(0,s.indexOf(oldAttachKey)) 
				+ s.substring(s.indexOf(oldAttachKey)+(oldAttachKey.length+1));
			str = str + newAttachKey + ",";
			
			// ѡ�е��ǵڼ��еĸ���
			var num = document.getElementById("rowOfAttachList").value;
			// ɾ��ѡ�еĸ���
			attachListTable.deleteRow(num);
			// ����༭��ĸ���
			var objTable = document.getElementById("attachListTable");
 			var objRow = objTable.insertRow(num);
 			//�����е���ʽ
 			objRow.style.backgroundColor="#FFFFFF";
 			objRow.style.textAlign="center";
			myTD = objRow.insertCell();
			//myTD.innerText = fname;
			myTD.innerHTML = "<a href=\"#\" onclick=\"showAttach('"+dispPath+"')\">"+fname+"</a>";
			myTD = objRow.insertCell();
			myTD.innerText = filesize;
			myTD = objRow.insertCell();
			myTD.innerText = creator;
			myTD = objRow.insertCell();
			myTD.innerHTML = "<a href=\"#\" onclick=\"editAttach('"+editPath+"')\">�༭</a> &nbsp; <a href=\"#\" onclick=\"delAttach('"+newAttachKey+"')\">ɾ��</a>";
		}else{
			str = s;
			alert("���༭�ĸ���ID�����ڣ�����ϵ����Ա��");
		}
		str = str.substring(0,str.lastIndexOf(","));
		document.getElementById("attachkeys").value = str;
	}
}

// ��ʾ
function showAttach(theUrl){
	window.open(theUrl, "_blank", "");
}

//ҳ����ɾ������
function delAttach(key){
	var str = "";
	if (confirm("��ȷ��Ҫɾ��ô��")){
		var s = document.getElementById("attachkeys").value + ",";
		if (s.length > 1 ){
			if (s.indexOf(key) > -1){
				str = s.substring(0,s.indexOf(key)) 
					+ s.substring(s.indexOf(key)+(key.length+1));
			}
			str = str.substring(0,str.lastIndexOf(","));
			document.getElementById("attachkeys").value = str;
			attachListTable.deleteRow(event.srcElement.parentElement.parentElement.rowIndex);
			try{
				if (typeof(eval("delSelectOption")) == "function") {
					delSelectOption("picName" , key);
				}
			}catch(e){
				
			}
		}
	}
}
//ҳ����ɾ������
function delAttach_new(key){
	var str = "";
	if (confirm("��ȷ��Ҫɾ��ô��")){
		var s = document.getElementById("attachkeys").value + ",";
		if (s.length > 1 ){
			if (s.indexOf(key) > -1){
				str = s.substring(0,s.indexOf(key)) 
					+ s.substring(s.indexOf(key)+(key.length+1));
			}
			str = str.substring(0,str.lastIndexOf(","));
			document.getElementById("attachkeys").value = str;
			var d = document.getElementById("del_attachkeys").value;  //ҳ��ɾ���ĸ���key
			if(d){
				d + ",";
			}
			document.getElementById("del_attachkeys").value = d  + key;			
			attachListTable.deleteRow(event.srcElement.parentElement.parentElement.rowIndex);
			try{
				if (typeof(eval("delSelectOption")) == "function") {
					delSelectOption("picName" , key);
				}
			}catch(e){
				
			}
		}
	}
}

//ҳ������������
function addAttach(dispPath,editPath,akey,fname,filesize,creator){
	var s = document.getElementById("attachkeys").value;
	if (s.length == 0){
		s = akey;
	}else{
		s = s + "," + akey;
	}
	document.getElementById("attachkeys").value = s;

	var objTable = document.getElementById("attachListTable");
 	var objRow = objTable.insertRow(); 
 	
 	//�����е���ʽ
 	objRow.style.backgroundColor="#FFFFFF";
 	objRow.style.textAlign="center";

	myTD = objRow.insertCell();
	//myTD.innerText = fname;
	myTD.innerHTML = "<a href=\"javascript:void(0);\" onclick=\"showAttach('"+dispPath+"')\">"+fname+"</a>";

	myTD = objRow.insertCell();
	myTD.innerText = filesize;

	myTD = objRow.insertCell();
	myTD.innerText = creator;

	myTD = objRow.insertCell();
	myTD.innerHTML = "<a href=\"javascript:void(0);\" onclick=\"delAttach('"+akey+"')\">ɾ��</a>";
}
//ҳ������������
function addAttach_new(dispPath,editPath,akey,fname,filesize,creator){
	var s = document.getElementById("attachkeys").value;
	if (s.length == 0){
		s = akey;
	}else{
		s = s + "," + akey;
	}
	document.getElementById("attachkeys").value = s;

	var objTable = document.getElementById("attachListTable");
 	var objRow = objTable.insertRow(); 
 	
 	//�����е���ʽ
 	objRow.style.backgroundColor="#FFFFFF";
 	objRow.style.textAlign="center";

	myTD = objRow.insertCell();
	//myTD.innerText = fname;
	myTD.innerHTML = "<a href=\"javascript:void(0);\" onclick=\"showAttach('"+dispPath+"')\">"+fname+"</a>";

	myTD = objRow.insertCell();
	myTD.innerText = filesize;

	myTD = objRow.insertCell();
	myTD.innerText = creator;
	
	myTD = objRow.insertCell();
	myTD.innerText = "";
	
	myTD = objRow.insertCell();
	myTD.innerText = "";

	myTD = objRow.insertCell();
	myTD.innerHTML = "<a href=\"javascript:void(0);\" onclick=\"delAttach_new('"+akey+"')\">ɾ��</a>";
}
//ҳ������������
function modAttach_new(fname,filesize,modifier,modifydate){
	var objTable = document.getElementById("attachListTable");
	for(var i=1; i < objTable.rows.length; i++){
		if(objTable.rows[i].cells[0].innerText == fname){
			if(filesize){
				objTable.rows[i].cells[1].innerText = filesize;
			}
			if(modifier){
				objTable.rows[i].cells[3].innerText = modifier;
			}
			if(modifydate){
				objTable.rows[i].cells[4].innerText = modifydate;	
			}
		}
	}
}

//ҳ������������
function addAttach_n(dispPath,editPath,akey,fname,filesize,creator,attachtype){
	var s = document.getElementById("attachkeys").value;
	if (s.length == 0){
		s = akey;
	}else{
		s = s + "," + akey;
	}
	document.getElementById("attachkeys").value = s;

	var objTable = document.getElementById("attachListTable");
 	var objRow = objTable.insertRow(); 
 	
 	//�����е���ʽ
 	objRow.style.backgroundColor="#FFFFFF";
 	objRow.style.textAlign="center";
 	
 	myTD = objRow.insertCell();
	myTD.innerText = attachtype;
	
	myTD = objRow.insertCell();
	//myTD.innerText = fname;
	myTD.innerHTML = "<a href=\"#\" onclick=\"showAttach('"+dispPath+"')\">"+fname+"</a>";

	myTD = objRow.insertCell();
	myTD.innerText = filesize;

	myTD = objRow.insertCell();
	myTD.innerText = creator;

	myTD = objRow.insertCell();
	myTD.innerHTML = "<a href=\"#\" onclick=\"delAttach('"+akey+"')\">ɾ��</a>";
}


//ҳ������������
function addAttach_ch(dispPath,editPath,akey,fname,filesize,creator,attachtype){
	var s = document.getElementById("attachkeys").value;
	if (s.length == 0){
		s = akey;
	}else{
		s = s + "," + akey;
	}
	document.getElementById("attachkeys").value = s;

	var objTable = document.getElementById("attachListTable");
 	var objRow = objTable.insertRow(); 
 	
 	//�����е���ʽ
 	objRow.style.backgroundColor="#FFFFFF";
 	objRow.style.textAlign="center";
	
	myTD = objRow.insertCell();
	//myTD.innerText = fname;
	myTD.innerHTML = "<a href=\"javascript:void(0);\" onclick=\"showAttach('/aml/cmp/attachment/t01_attachment_disp.do?attachkey="+akey+"')\">"+fname+"</a>";

	myTD = objRow.insertCell();
	myTD.innerText = filesize;

	myTD = objRow.insertCell();
	myTD.innerText = creator;

	myTD = objRow.insertCell();
	myTD.innerHTML = "<a href=\"javascript:void(0);\" onclick=\"delAttach('"+akey+"')\">ɾ��</a>";
}