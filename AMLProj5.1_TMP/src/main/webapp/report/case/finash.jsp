<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<script src="js/title.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">


      <script for="window" event="onbeforeunload">

		window.opener.location.href='<%=request.getContextPath() %>/report/case/t47_transaction_SE_List1.do?tag=1;

	  </script>
	  <% String valflag="0";
	  if(request.getAttribute("valfalg")!=null)
	  valflag=(String)request.getAttribute("valfalg");
	   %>
	 <script>
      var flag=<%=valflag%>;
     //alert(flag);
      if(flag!="1"){
	 	alert('恭喜您已经补完了当前查询条件下的所有交易！');
	 	}
	 	window.close();
	 
	 </script> 
</head>

<body leftmargin="0" topmargin="0">

</body>
</html>
