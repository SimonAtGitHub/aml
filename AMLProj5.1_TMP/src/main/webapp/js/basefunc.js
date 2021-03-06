/**
//================================功能函数列表整理======================//
// 整理日期：2006-03-10
// 整理人员：heguoqiang
序号		函数名称    			函数功能			返回值
1		checkPrice			检查价格			boolean
2		checkPrice1			检查价格			1/0
3		checkTelephone			检查电话号码		1/0
4		checkNum			检查数字			boolean
5		time_select			年、月、日日期的下拉选择联动
6		checkRadio			检查是否选中check框	num>0已经选中
7		checkString			检测字串是否为数字或字母	1/0
8		checkNumLength			检测字串长度为是否strLength	boolean
9		checkNumber			检查数字			1/0
10		checkEmail			检测电子邮件是否正确	boolean
11		CheckBoxCheckedNum		取得checkbox选中的个数
12		CheckBoxCheckedSingleOne	只能选择一个checkbox
13		CheckBoxMustChecked		必须选择一个checkbox
14		getLength			判断一个字符的真实长度，汉字为两位
15		checkChina
16		checkPhone			判断电话号码是否合法	boolean
17		checkDouble			检查数字，保证小数点后最多两位数字
18		checkFraction			检测是否为小数或分数
19		checkChar			检测是否含有某个字符
20		Fraction			把分数转换为小数计算
21		getFloat			转换浮点数，默认为0，在JS做页面计算的时候会需要
22		round				四舍五入函数
23		formatDate			校核输入的字符是否符合日期规范 yyyy-mm-dd
24		formatDateAlert			校核输入的字符是否符合日期规范 yyyy-mm-dd（不合格有提示信息）
25		formatNum			检查数值是否符合规定的格式
26		formatNumAlert			检查数值是否符合规定的格式（不合格有提示信息）
27		getCookie			根据COOKIE名称，得到COOKIE的值
28		space				调整字符串输出长度，不够长的以空格填写，用于对<select>控件中格式处理之用
29		len				计算字符串的长度，汉字以2位表示
30		cut				字符串按照规定的长度截断，不足长度则不截断
31		justify				字符串以LN长度显示，不足加空格，多余的截断,最后以...结尾，
32		checkCharOrNum			校核字符是否为字母或者数字
33		checkCharOrNumAlert		校核字符是否为字母或者数字（不合格有提示信息）
34		checkChinese			校核字符是否含有双字节的字符
35		checkChineseAlert		校核字符是否含有双字节的字符（不合格有提示信息）
36		checkNullAndLen			校核字符是否为空或者长度是否满足要求
37		checkNullAndLenAlert		校核字符是否为空或者长度是否满足要求（不合格有提示信息）
38		trim				去掉字符串两边空格的函数
39		ltrim				去掉字符串左边空格的函数
40		rtrim				去掉字符串右边空格的函数
41		openDlgWindow			弹出对话窗口模式
42		openWindow			弹出普通窗口模式
43		getCheckedNum			取得checkbox 和 RADIO 选中的个数
44		getCheckedNumAlert		取得checkbox 和 RADIO 选中的个数（不合格有提示信息）
45		getSelectedOption		把SELECT中选中的option值返回
46		checkFloat  			检查是否为数字或小数	true/false
47              checkNull                       检查是否为空             true/false
48      DateDiff              计算两个时间差     字符串
//===================================功能函数列表整理======================//
*/

/**
//The following added by fish 20070911 for cibaml project
F00		formatDate2			校核输入的字符是否符合日期规范 yyyy-mm-dd
F01		formatDateAlert2			校核输入的字符是否符合日期规范 yyyy-mm-dd（不合格有提示信息）
F02		selectRadio			click the table line to select the radio in this line
//====== end by fish
*/

//功能：检查价格
//输入:价格字符串;价格必须为：xxx.xx格式
//返回：true / false
function checkPrice(numstr){
    return formatNum(numstr,2,0,null,true);

//    var TempChar;
//    var tmp=0
//    for(i=0;i<=numstr.length-1;i++){
//        TempChar=numstr.charAt(i);
//        if(TempChar!=0 && TempChar!=1 && TempChar!=2 && TempChar!=3 && TempChar!=4 && TempChar!=5 && TempChar!=6 && TempChar!=7 && TempChar!=8 && TempChar!=9 && TempChar!="."){
//            i=-1;
//            break;
//        }else if(TempChar=="."){
//            tmp=1;
//            if((numstr.length-1-i) != 2){
//                i=-1;
//                break;
//            }
//        }
//    }
//    if((i==-1) || (tmp==0))
//        return false;
//    else
//        return true;

}
/**
 价格中可以含有数字和.
 */
function checkPrice1(numstr){
    if(formatNum(numstr,2,0)){
    	return 1;
    }
    else{
    	return  0;
    }

//    var TempChar;
//    for(i=0;i<=numstr.length-1;i++){
//        TempChar=numstr.charAt(i);
//        if(TempChar!=0 && TempChar!=1 && TempChar!=2 && TempChar!=3 && TempChar!=4 && TempChar!=5 && TempChar!=6 && TempChar!=7 && TempChar!=8 && TempChar!=9 && TempChar!='.'){
//            i=-1;
//            break;
//        }
//    }
//    if(i==-1)	return 0;
//    else	return 1;
}
/**
 电话中可以含有数字和-
 */
function checkTelephone(numstr){
    var TempChar;
    for(i=0;i<=numstr.length-1;i++){
        TempChar=numstr.charAt(i);
        if(TempChar!=0 && TempChar!=1 && TempChar!=2 && TempChar!=3 && TempChar!=4 && TempChar!=5 && TempChar!=6 && TempChar!=7 && TempChar!=8 && TempChar!=9 && TempChar!='-'){
            i=-1;
            break;
        }
    }
    if(i==-1)	return 0;
    else	return 1;
}
//功能：检查数字
//输入：数字字符串
//返回：true / false
function checkNum(numstr){
    return formatNum(numstr,0,0);
//    var TempChar;
//    for(i=0;i<=numstr.length-1;i++){
//        TempChar=numstr.charAt(i);
//        if(TempChar!=0 && TempChar!=1 && TempChar!=2 && TempChar!=3 && TempChar!=4 && TempChar!=5 && TempChar!=6 && TempChar!=7 && TempChar!=8 && TempChar!=9){
//            i=-1;
//            break;
//        }
//    }
//    if(i==-1)
//        return false;
//    else
//        return true;
}
//功能：年、月、日日期的下拉选择联动函数
//输入：day_se-当前选择的日期;time_n-时间字符串;year_n,month_n,day_n－年月日的form框名字
//返回：
function time_select(year_n,month_n,day_n,time_n,day_se){
    var i;
    var len=31;
    var year=year_n.value;
    i=month_n.selectedIndex+1;
    //alert("i="+i);
    if(i==4 || i==6 || i==9 || i==11)
        len=30;
    if(i==2){
        len=28;
        if((year%4==0 && year%100==0 && year%400==0) || (year%4==0 && year%100!=0)){
            len=29;
        }
    }
    //alert(day_se);
    day_n.length = len ;
    for (j=0 ;j<len;j++){
        var va;
        if(j<9) va="0"+eval(j+1);
        else va = eval(j+1);
        day_n.options[j].text=j+1;
        day_n.options[j].value=va;
    }
    if(day_se>0)
        day_n.selectedIndex=day_se-1;
    //---
    var month = month_n.value;
    var day = day_n.value;
    time_n.value=eval(year+month+day)+"000000";
}
//功能：检查是否选中check框
//
//返回：num>0已经选中
function checkRadio(radioObj){
    var num=-1;
    if(radioObj!=null){
        //alert(radioObj);
        for ( var i=0; i < radioObj.length; i++ ){
            if ( ( true==radioObj[i].checked ) )
                num=i;
        }
        if(true==radioObj.checked)
            num=1000;
        //alert(num);
    }
    return num;
}

//检测字串是否为数字或字母
function checkString(Charstr){
	
    var Tempstr;
    for(j=0;j<=Charstr.length-1;j++){
        Tempstr=Charstr.charAt(j);
        if(!((Tempstr>="0" && Tempstr<="9") || (Tempstr>="a" && Tempstr<="z") || (Tempstr>="A" && Tempstr<="Z"))){
        	j=-1;
            break;
        }
    }
    if(j==-1)
        return 0;
    else
        return 1;
}

//检测字串长度为是否strLength
function checkNumLength(numStr,strLength) {
    if (numStr.length==0) return true;
    else if (numStr.length==strLength)	return true;
    else	return false;
}

//检测是否为数字
function checkNumber(numstr){
    if(formatNum(numstr,0,0)){
     	return 1;
    }
    else{
    	return 0;
    }
//    var TempChar;
//    for(i=0;i<=numstr.length-1;i++){
//        TempChar=numstr.charAt(i);
//        if(TempChar!=0 && TempChar!=1 && TempChar!=2 && TempChar!=3 && TempChar!=4 && TempChar!=5 && TempChar!=6 && TempChar!=7 && TempChar!=8 && TempChar!=9){
//            i=-1;
//            break;
//        }
//    }
//    if(i==-1)	return 0;
//    else	return 1;
}

//检测电子邮件是否正确

function checkEmail(email){
    invalid = "";
    if (!email)
        invalid = "";
    else {
        if ( (email.indexOf("@") == -1) || (email.indexOf(".") == -1) )
            invalid += "\n\nEmail地址不合法。应当包含'@'和'.'；例如('.com')。请检查后再递交。";
        if (email.indexOf("your email here") > -1)
            invalid += "\n\nEmail地址不合法，请检测您的Email地址，在域名内应当包含'@'和'.'；例如('.com')。";
        if (email.indexOf("\\") > -1)
            invalid += "\n\nEmail地址不合法，含有非法字符(\\)。";
        if (email.indexOf("/") > -1)
            invalid += "\n\nEmail地址不合法，含有非法字符(/)。";
        if (email.indexOf("'") > -1)
            invalid += "\n\nEmail地址不合法，含有非法字符(')。";
        if (email.indexOf("!") > -1)
            invalid += "\n\nEmail地址不合法，含有非法字符(!)。";
        if ( (email.indexOf(",") > -1) || (email.indexOf(";") > -1) )
            invalid += "\n\n只输入一个Email地址，不要含有分号和逗号。";
        if (email.indexOf("?subject") > -1)
            invalid += "\n\n不要加入'?subject=...'。";
        if (checkChina(email) == -1)
            invalid += "\n\n不要加入中文。";
        if (email.indexOf("@.")>-1||email.indexOf(".@")>-1)
            invalid += "\n\n不要加入 @. 连接的非法Email。";

    }
    if (invalid == "") {
        return true;
    }else {
        //alert("输入的Email可能包含错误：" + invalid);
        return false;
    }
}
/**
 取得checkbox选中的个数
 */
function CheckBoxCheckedNum(form)
{
    var num=0;
    for ( var i=0; i < form.elements.length; i++ )
    {
        if (( true==form.elements[i].checked) && (form.elements[i].type == 'checkbox' )) num++;
    }
    //alert(num);
    return num;
};

function CheckBoxCheckedSingleOne(form){
    var num=0;
    var errMsg=""
    num=CheckBoxCheckedNum(form);
    if(num<1) errMsg="请选择！";
    else if(num>1) errMsg="只能选择一个！";
    return errMsg;
}

function CheckBoxMustChecked(form){
    var num=0;
    var errMsg=""
    num=CheckBoxCheckedNum(form);
    if(num<1) errMsg="请选择！";
    return errMsg;
}

//检查form框的真实长度
function getLength(formValue){
    var length=0;
    for(i=0;i<formValue.length;i++){
        if(formValue.charAt(i)>'~')
            length+=2;
        else
            length++;
    }
    return length;
}

//检查form框的真实长度
function checkChina(formValue){
    var length=0;
    for(i=0;i<formValue.length;i++){
        if(formValue.charAt(i)>'~')
            length=-1;
    }
    return length;
}

function checkPhone(obj)
{
    if(obj=="")return true;
    slen=obj.length;
    for (i=0; i<slen; i++){
        cc = obj.charAt(i);
        if ((cc <"0" || cc >"9") && cc != "-" && cc!="+" && cc!="(" && cc !=")" && cc !="/")
        {
            return false;
        }
    }
    return true;
}
/**
 检查数字，保证小数点后最多两位数字
 number-要检测的数字
 jd-小数的精度，就是小数点后的位数
 */
function checkDouble(numstr,jd){
     if(formatNum(numstr,2)){
     	return 1;
    }
    else{
    	return 0;
    }

//    var TempChar;
//    var iPoint = -1;
//    var iPointNumber = 0;
//    for(i=0;i<=numstr.length-1;i++){
//        if(iPoint>-1){
//            iPoint ++;
//        }
//        TempChar=numstr.charAt(i);
//        if(i==0 && TempChar=='-'){
//            //负数
//            continue;
//        }
//        if(TempChar!=0 && TempChar!=1 && TempChar!=2 && TempChar!=3 && TempChar!=4 && TempChar!=5 && TempChar!=6 && TempChar!=7 && TempChar!=8 && TempChar!=9 && TempChar!='.'){
//            i=-1;
//            break;
//        }else if(TempChar=='.'){
//            iPointNumber ++;
//            iPoint = 0;
//        }
//        if(iPoint>jd || iPointNumber>1){
//            i=-1;
//            break;
//        }
//    }
//    if(i==-1)
//        return 0;
//    else
//        return 1;
}
//检测是否为小数或分数
function checkFraction(numstr){
    var TempChar;
    var hefa=0;
    var flag=-1;
    for(i=0;i<=numstr.length-1;i++){
        TempChar=numstr.charAt(i);
        if(((TempChar!='0' && TempChar!='1' && TempChar!='2' && TempChar!='3'&& TempChar!='4' && TempChar!='5'&& TempChar!='6' && TempChar!='7' && TempChar!='8' && TempChar!='9'&&TempChar!='.'&&TempChar!='/'))||(TempChar==' ')){
            flag=TempChar;
            break;
        }
        if(TempChar=='.'||TempChar=='/'){
           hefa++;
        }

    }
    var Errmsg="";
    if(flag!=-1)	Errmsg="输入的数字含有非法字符:"+flag+"。\n";
    else if(hefa>1)     Errmsg+="输入的数字含有多个/或.,请输入合法的小数或分数。\n ";
    //如果为分数，检查合法性
    if((Errmsg=="")&&(checkChar(numstr,"/"))){
       //1.检查第一位不能为0
        if(numstr.charAt(0)==0){
            Errmsg=" 分子第一位不能为零。";
        }
        else if(numstr.charAt(0)=='/'||numstr.charAt(numstr.length-1)=='/'){
            Errmsg=" 分数设置不合法。";
        }
        else{
      //2.分母第一位不能为0
            for(i=0;i<=numstr.length-1;i++){
                TempChar=numstr.charAt(i);
                if(TempChar=='/'){
                    beg=i+1;
                    break;
                }
            }
            if(numstr.charAt(beg)==0){
                Errmsg+=" 分母第一位不能为零。";
            }
        }
    }
    return Errmsg;
}
//检测是否含有某个字符
function checkChar(numstr,Subchar){
    var TempChar;
    for(i=0;i<=numstr.length-1;i++){
        TempChar=numstr.charAt(i);
        if(TempChar==Subchar){
            i=-1;
            break;
        }
    }

    if(i==-1)	return true;
    else return false;
}
//把分数转换为小数计算
function Fraction(numstr){
    var TempChar;
    var fengzi="";
    var fengmu="";
    var beg;
    for(i=0;i<=numstr.length-1;i++){
        TempChar=numstr.charAt(i);
        if(TempChar=='/'){
            beg=i+1;
            break;
        }
         fengzi+=TempChar;
        }

   for(i=beg;i<=numstr.length-1;i++){
      TempChar=numstr.charAt(i);
      fengmu+=TempChar;
        }
    var result=parseInt(fengzi)/parseInt(fengmu);
  //  alert("result:"+result);
    return result;
}




/**
 * 日期：2006-03-10
 * 作者：heguoqiang
 */


/**
   * 功能:转换浮点数，默认为0，在JS做页面计算的时候会需要
   * @param s 需要处理的数字
    * @return 数字
   */
function getFloat(s) {
  if(isNaN(s) || s.length==0){
    return 0.0;
  }
  else{
    return parseFloat(s);
  }
}

/**
   * 功能:四舍五入函数
   * @param f 需要处理的数字
   * @param n 需要保留小数点位数，为0，表明是保留到整数位数
    * @return 数字
   */
function round(f,n) { // f: float value; n:radix point
  var r=1;
  for(i=1;i<=n;i++){
      r=r*10;
  }
  f2=Math.round(f*r)/r;
  return f2;
}

/**
   * 功能:校核输入的字符是否符合日期规范 yyyy-mm-dd
   * @param str 需要校核的日期字符串
    * @return BOOLEAN
   */
function formatDate(str) {
    if(str.length!=10){
        return false;
    }
    var t=str.charAt(4);
    if(t!="-"){
        return false;
    }
    var t=str.charAt(7);
    if(t!="-"){
        return false;
    }
    var s=str.substring(0,4);
    if(!formatNum(s,0,1000,9999)){
        return false;
    }
    var y=parseInt(s);
    var s=str.substring(5,7);
    if(!formatNum(s,0,1,12)){
        return false;
    }
    var m=parseInt(s);
    var s=str.substring(8);
     if(!formatNum(s,0,1,31)){
        return false;
    }
    var d=parseInt(s);
    if((m==4 || m==6 || m==9 || m==11) && d>30){
        return false;
    }
    if(m==2 && d>29){
        return false;
    }
    if(m==2 && !((y % 4 ==0 && y % 100!=0) || y % 400==0) && d>28){
        return false;
    }
    return true;
}

/**
 * validate date, format:yyyy-mm-dd, yyyy = 2000-2099
 */
function formatDate2(oStartDate)
{
    if(oStartDate==null || oStartDate.replace(/(^\s*)|(\s*$)/g, "").length==0) return true;
    
    //var pat_hd=/^20\d{2}-((0[1-9]{1})|(1[0-2]{1}))-((0[1-9]{1})|([1-2]{1}[0-9]{1})|(3[0-1]{1}))$/;
    //var pat_hd=/^20\d{2}-([0-9]{1,2})-([0-9]{1,2})$/;
    var pat_hd=/^([1-9]{1})\d{3}-([0-9]{1,2})-([0-9]{1,2})$/;

 try{
     if(!pat_hd.test(oStartDate)){throw "Invalid Date!";}
  /*var arr_hd=oStartDate.split("-");
  var dateTmp;
  dateTmp= new Date(arr_hd[0],parseFloat(arr_hd[1])-1,parseFloat(arr_hd[2]));
  if(dateTmp.getFullYear()!=parseFloat(arr_hd[0]) || dateTmp.getMonth()!=parseFloat(arr_hd[1]) -1 || dateTmp.getDate()!=parseFloat(arr_hd[2]))
  {
   throw "Invalid Date!";
  }*/
 }
 catch(ex)
 {
  if(ex.description)
   {return false;}
   else
    {return false;}
 }
 return true;
}

/**
 * fomratdate and alert
 */
function formatDateAlert2(obj)
{
	if(!formatDate2(obj.value)){
		alert(obj.value+"\n验证不合格，请输入正确的日期（YYYY-MM-DD）!");
		obj.focus();
	}
}

/**
   * 功能:校核输入的对象所含有的数据是否符合日期规范 yyyy-mm-dd
   * @param obj 需要校核的对象
    * @return BOOLEAN
   */
function formatDateAlert(obj) {
    var s="";
    var objFlag=false;
    if(typeof(obj)=='object'){
    	var s=obj.value;
        objFlag=true;
    }
    else{
    	s=obj;
    }
    if(!formatDate(s)){
        alert(s+'\n验证不合格，请输入正确的日期（YYYY-MM-DD）!');
        if(objFlag){
            obj.focus();
        }
        return false;
    }
    return true;
}


/**
   * 功能:检查数值是否符合规定的格式
   * @param str 待校核的数字
   * @param n 需要校核的小数位数
   * startNum 数字开始值
   * endNum 数字结束值
   * flag 小数位是否必须补齐
   * @return boolean
   */

function formatNum(str,n,startNum,endNum,flag) {
    var flag1=false; //是否符合数字规范
    var flag2=false; //是否符合小规范
    var flag3=false; //是否符合大规范
    var flag4=true; //是否小数位必须补齐
    if(!isNaN(str)){
        if(n==null){//只是验证是否为数字情况
            flag1=true;
        }
        else if(n==0){//验证是否为整数
            if(str.indexOf(".")<0 && str.indexOf(" ")<0){
                flag1=true;
            }
        }
        else{//验证为小数的情况，只要不超过对应的小数位数就可以了
            if(str.indexOf(".")<0 || str.length-str.indexOf(".")<=n+1){
              	flag1=true;
            }
            if(flag){
                if(str.indexOf(".")<0 || str.length-str.indexOf(".")!=n+1){
                    flag4=false;
            	}
            }
        }
        if(startNum==null){
            flag2=true;
    	}
        else{
            if(parseFloat(str)>=parseFloat(startNum)){
                flag2=true;
            }
        }
        if(endNum==null){
            flag3=true;
    	}
        else{
            if(parseFloat(str)<=parseFloat(endNum)){
                flag3=true;
            }
        }
    }
    if(flag1 && flag2 && flag3 && flag4){
  	return true;
    }
    return false;
}


/**
   * 功能:检查数值是否符合规定的格式
   * @param obj 待校核的对象
   * @param n 需要校核的小数位数，可以为空，表明只要是数字就可以
   * startNum 数字开始值，可以为空，表示没有大小限制
   * endNum 数字结束值，可以为空，表示没有大小限制
   * flag 小数位是否必须补齐，true 表示必须补足小数位数，false和为空，表示不需要补足
   * @return boolean
   */

function formatNumAlert(obj,n,startNum,endNum,flag) {
    var s="";
    var objFlag=false;
    if(typeof(obj)=='object'){
    	var s=obj.value;
        objFlag=true;
    }
    else{
    	s=obj;
    }
    var message="";

    if(n==0){
       message+="必须是整数!";
    }
    if(n>0 && flag){
       message+="必须补足 " + n +" 位小数!";
    }
    if(startNum!=null && endNum!=null){
        if(startNum==endNum){
            message+="数值必须等于 " + startNum + " !"   ;
        }
        else{
          message+="数值必须在 " + startNum +" 和 "+ endNum +" 之间!" ;
        }
    }
    else{
    	if(startNum!=null){
       	    message+="数值必须大于或者等于 " + startNum +"!";
        }
        if(endNum!=null){
   	    message+="数值必须小于或者等于 " + endNum +"!";
  	 }
    }
    if(!formatNum(s,n,startNum,endNum,flag)){
        alert(s+'\n验证不合格!'+message);
        if(objFlag){
            obj.focus();
        }
        return false;
    }
    return true;
}

/**
   * 功能:根据COOKIE名称，得到COOKIE的值
   * @param name 需要取值的cookie名称
   * @return string cookie的值，无对应COOKIE则返回 "";
   */
function getCookie(name) {
var cookieFound=false;
var start=0;
var end=0;
var s=document.cookie;
var i=0;
// LOOK FOR name IN CookieString
  while( i <= s.length) {
    start=i;
    end=start+name.length;
    if(s.substring(start,end)==name) {
      cookieFound=true;
      break;
    }
    i++;
  }
  //CHECK IF NAME WAS FOUND
  if(cookieFound) {
    start=end+1;
      end=s.indexOf(";",start);
      if(end < start)
      end=s.length;
      return(unescape(s.substring(start,end)));
  }
  //NAME WAS NOT FOUND
  return "";
}

/**
   * 功能:调整字符串输出长度，不够长的以空格填写，用于对<select>控件中格式处理之用
   * @param n 需要补足空格的位数
   * @return string 以空格组成的字符串
   */
function space(n) {
  var i=0;
  var s="";
  for(i=0;i<n;i++){
      s+=" ";
  }
  return s;
}

/**
   * 功能:计算字符串的长度，汉字以2位表示
   * @param s 待处理的字符串
   * @return 字符串的长度
   */
function len(s) {
  var ln=0,i=0;
  for(i=0;i<s.length;i++) {
    c=s.charAt(i);
    if(c>=' ' && c<='~'){ // 所有单字节ASCII
      ln+=1;
    }
    else{
      ln+=2;
    }
  }
  return ln;
}

/**
   * 功能:字符串按照规定的长度截断，不足长度则不截断
   * @param s 待处理的字符串
   * @param xlen 字符串的长度
   * @return string
   */

function cut(s,xlen) {
  var ln=0,i=0; var t="";
  for(i=0;i<s.length;i++) {
    c=s.charAt(i);
    if(c>=' ' && c<='~'){ // 所有单字节ASCII
      ln+=1;
    }
    else{
      ln+=2;
    }
    if(ln==xlen) {
        i++;
        t=s.substring(0,i);
        break;
    }
    else if(ln>xlen) {
        t=s.substring(0,i)+" ";
        break;
    }
  }
  return t;
}

/**
   * 功能:字符串以LN长度显示，不足加空格，多余的截断,最后以...结尾，
   * @param s 待处理的字符串
   * @param ln 字符串的长度
   * @return string
   */
function justify(s,ln) {
  var sLen=len(s);
  var t="";
  var i=0;
  if(sLen<=ln){
    t=s+space(ln-sLen);
  }
  else{
    t=cut(s,ln-3)+"...";
  }
  return t;
}

 /**
   * 校核字符是否为字母或者数字
   * @param s
   * @return boolean
   */
function checkCharOrNum(s){
  var ln=0,i=0;
  var t="";
  if(s.length!=len(s)){
    return false;
  }
  for(i=0;i<s.length;i++) {
    c=s.charAt(i);
    if(c>='0' && c<='9') continue;
    if(c>='A' && c<='Z') continue;
    if(c>='a' && c<='z') continue;
    if(c=='_') continue;
    return false;
  }
  return true;
}

/**
   * 校核字符是否为字母或者数字
   * @param obj 需要验证的对象
   * @return boolean
   */
function checkCharOrNumAlert(obj){
    var s="";
    var objFlag=false;
    if(typeof(obj)=='object'){
    	var s=obj.value;
        objFlag=true;
    }
    else{
    	s=obj;
    }

    if(!checkCharOrNum(s)){
        alert(  s+' \n验证不合格，含有非字母和数字的数值!');
        if(objFlag){
            obj.focus();
        }
        return false;
    }
    return true;
}

/**
   * 校核字符是否含有双字节的字符
   * @param s
   * @return boolean
   */
function checkChinese(s) {
  var i=0;
  for(i=0;i<s.length;i++) {
    c=s.charAt(i);
    if(c>=' ' && c<='~'){
        continue;
    }
    return true;
  }
  return false;
}

/**
   * 校核字符是否含有双字节的字符
   * @param obj待验证的对象
   * @return boolean
   */
function checkChineseAlert(obj) {
 var s="";
    var objFlag=false;
    if(typeof(obj)=='object'){
    	var s=obj.value;
        objFlag=true;
    }
    else{
    	s=obj;
    }

    if(!checkChinese(s)){
        alert(  s+' \n验证不合格，没有含中文!');
        if(objFlag){
            obj.focus();
        }
        return false;
    }
    return true;
}

/**
   * 校核字符是否为空或者长度是否满足要求
   * @param s 待校核的字符串
   * @param minLen 必须满足的长度，可以为空
   * @param maxLen 不能超过的长度，可以为空
   * @return boolean
   */
function checkNullAndLen(s,minLen,maxLen) {
  if(s==null || trim(s).length==0){
  	return false;
  }
  if(minLen!=null){
   if(parseInt(minLen)>parseInt(len(s))){
       return false;
   }
  }
  if(maxLen!=null){
   if(parseInt(maxLen)<parseInt(len(s))){
       return false;
   }
  }
  return true;
}


/**
   * 校核字符是否为空或者长度是否满足要求
   * @param obj 待校核的对象
   * @param minLen 必须满足的长度，可以为空
   * @param maxLen 不能超过的长度，可以为空
   * @return boolean
   */

function checkNullAndLenAlert(obj,minLen,maxLen) {
 var s="";
    var objFlag=false;
    if(typeof(obj)=='object'){
    	var s=obj.value;
        objFlag=true;
    }
    else{
    	s=obj;
    }

    var message="";

    if(minLen!=null && maxLen!=null){
        if(minLen==maxLen){
            message+="数值长度必须等于 " + minLen +" !" ;
        }
        else{
            message+="数值长度必须在 " + minLen +" 和 "+ maxLen +" 之间!";
        }
    }
    else{
    	if(minLen!=null){
       	    message+="数值长度必须大于或者等于 " + minLen +"!";
        }
        else if(maxLen!=null){
   	    message+="数值长度必须小于或者等于 " + maxLen +"!";
  	 }
         else{
             message+="数值不能为空和全部为空格！";
         }
    }

    if(!checkNullAndLen(s,minLen,maxLen)){
        alert(  s+' \n验证不合格!'+message+'一个汉字算两个字符！');
        if(objFlag){
            obj.focus();
        }
        return false;
    }
    return true;
}

/**
   * 去掉字符串两边空格的函数
   * @param s 待处理的字符串
   * @return 处理完毕后的字符串
   */

function trim(s) {
    return rtrim(ltrim(s));
}

/**
   * 去掉字符串左边空格的函数
   * @param s 待处理的字符串
   * @return 处理完毕后的字符串
   */

function ltrim(s) {
    if(s==null || s.length==0){
    	return "";
    }
    while(s.length>0 && s.charAt(0)==' '){ //去除左边空格
    	 s=s.substring(1);
    }
    return s;
}
/**
   * 去掉字符串右边空格的函数
   * @param s 待处理的字符串
   * @return 处理完毕后的字符串
   */

function rtrim(s) {
    if(s==null || s.length==0){
    	return "";
    }
    while(s.length>0 && s.charAt(s.length-1)==' '){//去除右边空格
    	 s=s.substring(0,s.length-1);
    }
    return s;
}

/**
   * 弹出对话窗口模式
   * @param ctrlobj 待返回数据的控件名称
   * @param url 弹出窗口所调用的URL地址，不含http://ip:8080/web/
   * @param width,height 弹出窗口的宽和高
   * @return boolean(操作有数值返回为true)
   */

function openDlgWindow(ctrlobj,url,width,height){
   	var secondSlash=0;
	var path= '';
	var codebase = '';
	if ((secondSlash = (path = window.location.pathname).indexOf('/',1)) != -1){
		codebase = path.substring(0,secondSlash);
	}
        var d=new Date();
        url=url+"&temp_seq="+d.getTime();
       retval = window.showModalDialog(codebase+"/"+url, "", "dialogWidth:"+width+"px; dialogHeight:"+height+"px; status:no; directories:yes;scrollbars:auto;Resizable=yes; ");
        if( retval != null ){
		ctrlobj.value = retval;
                return true;
	}else{
          return false;
	}
}

/**
   * 弹出普通窗口模式
   * @param url 弹出窗口所调用的URL地址，不含http://ip:8080/web/
   * @param width,height 弹出窗口的宽和高
   * @return boolean(操作有数值返回为true)
   */
function openWindow(url,width,height){
        var secondSlash=0;
	var path= '';
	var codebase = '';
	if ((secondSlash = (path = window.location.pathname).indexOf('/',1)) != -1){
		codebase = path.substring(0,secondSlash);
	}
        var para="Resizable=yes,scrollbars=yes,width="+width+"px,height="+height+"px";
	window.open(codebase+"/"+url,"", para);
}

/**
 取得checkbox 和 RADIO 选中的个数
  * @param obj checkbox对象
   * @return num 个数
 */
function getCheckedNum(obj){
    var num=0;
    if(obj.length>1){//对象数组情况
    	for ( var i=0; i < obj.length; i++ ){
        	if (true==obj[i].checked){
        	   num++;
      	 	 }
    	}
    }
    else{//单个对象情况
        if (true==obj.checked){
        	num++;
        }
    }
    return num;
}

/**
 取得checkbox 和 RADIO 选中的个数
  * @param obj checkbox对象
   * @return num 个数
 */
function getCheckedNumAlert(obj,num){
    if(typeof(obj)!='object'){//供调试使用
        alert('无记录或者对象错误！');
        return false;
    }
    var num2=getCheckedNum(obj);
    var flag=false;//判断是否是数组
    var flag2=false;//判断是否有错误
    if(obj.length>1){//对象数组情况
	flag=true;
    }
    if(num2<1){
    	    alert('请选择！');
            flag2=true;
    }
    else if(num!=null && num2!=num){
    	    alert('必须选择 '+ num +' 个！');
            flag2=true;
    }
    if(flag2){
    	if(flag){
        	obj[0].focus();
                return false;
        }
        else{
            obj.focus();
            return false;
        }
    }
    return true;
}

/**
   * 功能:字符串替换函数
   * @param s
   * @return
   */
function strReplace(s,sourceStr,replaceStr) {
    if(s==null || s.length==0 || sourceStr==null || sourceStr.length==0 || replaceStr==null){
      	return s;
    }

    var index=0,startIndex=0;
    var length=sourceStr.length;
    var length1=replaceStr.length;
    while(!((index=s.indexOf(sourceStr,startIndex))<0)){
      startIndex=index-length+length1;
      s=s.substring(0,index)+replaceStr+s.substring(index+length);
    }
    return s;

  }


/**
   * 功能:把SELECT 的所有选项都选中
   * @param s
   * @return
   */
function selectAllOptions(obj) {
    if(typeof(obj)!='object'){//供调试使用
        return false;
    }
    for(var i=0;i<obj.length;i++){
    	obj[i].selected=true;
    }
    return true;
  }

  /**
   * 功能:把SELECT中选中的option值返回
   * @param s
   * @return string
   */
function getSelectedOption(obj) {
    for(var i=0;i<obj.length;i++){
    	if(obj[i].selected==true)
            return obj[i].value;
    }
    return "";
  }

    /**
   * 功能:  检查是否为数字或小数
   * @param s
   * @return  true/false
   */
function checkFloat(numstr) {
    var TempChar;
    for(i=0;i<=numstr.length-1;i++){
        TempChar=numstr.charAt(i);
        if(TempChar!=0 && TempChar!=1 && TempChar!=2 && TempChar!=3 && TempChar!=4 && TempChar!=5 && TempChar!=6 && TempChar!=7 && TempChar!=8 && TempChar!=9 && TempChar!='.'){
            i=-1;
            break;
        }
    }
    if(i==-1)	return false;
    else	return true;
  }


    /**
   * 功能:  检查是否为空
   * @param s
   * @return  true/false
   */
  function checkNull(obj) {
    if(obj.value==null || obj.value==""){
       alert("请输入值！");
       return false;
    }
    else
       return true;
  }

//select 选择框鼠标上移时提示选择的内容 
  function selMouseOver(obj,divobj){
  	   	divobj.innerText = obj.options[obj.selectedIndex].text;
  		if (divobj.innerText.length > 0){
  			if(divobj.style.display != "block"){
  				divobj.innerHTML = " " + divobj.innerText + " ";
  				divobj.style.display = "block";
  			}
  			divobj.style.left = obj.getBoundingClientRect().left+getScroll().left+obj.offsetWidth+'px';
  			divobj.style.top = obj.getBoundingClientRect().top+getScroll().top+'px';
  		}
  } 
  function getScroll(){
  				var t, l, dde=document.documentElement, db=document.body;
  				if (dde && (dde.scrollTop || dde.scrollLeft)) {
  					t = dde.scrollTop;
  					l = dde.scrollLeft;
  				} else if (db) {
  					t = db.scrollTop;
  					l = db.scrollLeft;
  				}
  				return { top: t, left: l };
  }
/**
   * @param 孙日朋 2009-07-28
   * 功能:计算天数差
   * sDate1, sDate2 时间
   * number 相差天数
   * @return true/flase
   */
function DateDiff(sDate1, sDate2, number){  //sDate1和sDate2是2002-12-18格式
        var aDate, oDate1, oDate2, iDays;
        aDate = sDate1.split("-");
        oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);  //转换为12-18-2002格式
        aDate = sDate2.split("-");
        oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);
        iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 /24);  //把相差的毫秒数转换为天数
        if(iDays > number){
            return "查询时间相差不能超过"+number+"天！";  
            }
        else return '';
}
//两个日期进行对比 
   function _compareTwoDateForString(_Date1, _Date2) {
     vDate1 = _Date1.split("-")
	 vDate2 = _Date2.split("-")
	 _Year1 = parseInt(vDate1[0]-0)
	 _Month1 = parseInt(vDate1[1]-0)
	 _Day1 = parseInt(vDate1[2]-0)

	 _Year2 = parseInt(vDate2[0]-0)
	 _Month2 = parseInt(vDate2[1]-0)
	 _Day2 = parseInt(vDate2[2]-0)

     if (_Year1 > _Year2) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 > _Month2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 > _Day2)) {
	    return false
	 }

	 return true
}
//select 选择框鼠标移开时消失 
function selMouseOut(obj,divobj) {
		divobj.style.display = "none"
} 

function $(id) {
	return document.getElementById(id);
}
//判断起始时间不为空
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
} 
//检查身份证号 ---15位或18位 
function IdCardRegCheck(obj){
  var str = obj.value;
  var reg = /^([0-9]{15}|[0-9Xx]{18})$/;
  var flag = reg.test(str);
  if(!flag){
  	  alert("身份证号码位数不符或含有非法字符!");
 			flag = false;
 			return flag; 
  }
  var idcard_array = new Array();
  idcard_array = str.split(""); 
 var area={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"}
  //地区检验
  if(area[parseInt(str.substr(0,2))]==null){
     alert("身份证地区非法!");
     flag = false;
     return flag; 
  } 
   
  //身份号码位数及格式检验
  switch(str.length){
  		case 15:
			if ( (parseInt(str.substr(6,2))+1900) % 4 == 0 || ((parseInt(str.substr(6,2))+1900) % 100 == 0 && (parseInt(str.substr(6,2))+1900) % 4 == 0 )){
				ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;//????????????????????
			} else {
				ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;//????????????????????
			}
			if(ereg.test(str)){ 
     			flag = true;
			}else{
				alert("身份证号码出生日期超出范围或含有非法字符!");
     			flag = false;
     			return flag; 
			}
			break;
		case 18:
			if ( parseInt(str.substr(6,4)) % 4 == 0 || (parseInt(str.substr(6,4)) % 100 == 0 && parseInt(str.substr(6,4))%4 == 0 )){
				ereg=/^[1-9][0-9]{5}[1-2][0-9]{3}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//??????????????????????????????
			} else {
				ereg=/^[1-9][0-9]{5}[1-2][0-9]{3}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//??????????????????????????????
			}
			if(ereg.test(str)){//测试出生日期的合法性
				//计算校验位
				S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7
				+ (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9
				+ (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10
				+ (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5
				+ (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8
				+ (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4
				+ (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2
				+ parseInt(idcard_array[7]) * 1 
				+ parseInt(idcard_array[8]) * 6
				+ parseInt(idcard_array[9]) * 3 ;
				Y = S % 11;
				M = "F";
				JYM = "10X98765432";
				JYN = "10x98765432";
				M = JYM.substr(Y,1);//判断校验位
				if(M == idcard_array[17] ){
					flag = true;
				}else {
				    M = JYN.substr(Y,1);//判断校验位
				    if(M == idcard_array[17]){
				        flag = true;
				    }else{
						alert("身份证号码校验错误!");
		     			flag = false;
		     			return flag; 
	     			}
				}
				 
			}else {
				alert("身份证号码出生日期超出范围或含有非法字符!");
     			flag = false;
     			return flag; 
			}
			break;
	    default:
		   flag = true;
		   break;
  }
  return flag; 
}
//检查身份证号 ---18位  
function IdCardCheck(str){ 
  var reg = /^([0-9Xx]{18})$/;
  var flag = reg.test(str);
  if(!flag){
  	   alert("身份证号码位数不符或含有非法字符!");
 			flag = false;
 			return flag; 
  }
  var idcard_array = new Array();
  idcard_array = str.split(""); 
  var area={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"}
  //地区检验
  if(area[parseInt(str.substr(0,2))]==null){
     alert("身份证地区非法!");
     flag = false;
     return flag; 
  } 
   
  //身份号码位数及格式检验
  switch(str.length){ 
		case 18:
			if ( parseInt(str.substr(6,4)) % 4 == 0 || (parseInt(str.substr(6,4)) % 100 == 0 && parseInt(str.substr(6,4))%4 == 0 )){
				ereg=/^[1-9][0-9]{5}[1-2][0-9]{3}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//??????????????????????????????
			} else {
				ereg=/^[1-9][0-9]{5}[1-2][0-9]{3}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//??????????????????????????????
			}
			if(ereg.test(str)){//测试出生日期的合法性
				//计算校验位
				S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7
				+ (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9
				+ (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10
				+ (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5
				+ (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8
				+ (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4
				+ (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2
				+ parseInt(idcard_array[7]) * 1 
				+ parseInt(idcard_array[8]) * 6
				+ parseInt(idcard_array[9]) * 3 ;
				Y = S % 11;
				M = "F";
				JYM = "10X98765432";
				JYN = "10x98765432";
				M = JYM.substr(Y,1);//判断校验位
				if(M == idcard_array[17] ){
					flag = true;
				}else {
				    M = JYN.substr(Y,1);//判断校验位
				    if(M == idcard_array[17]){
				        flag = true;
				    }else{
						alert("身份证号码校验错误!");
		     			flag = false;
		     			return flag; 
	     			}
				}
				 
			}else {
				alert("身份证号码出生日期超出范围或含有非法字符!");
     			flag = false;
     			return flag; 
			}
			break;
	    default:
		   flag = true;
		   break;
  }
  return flag; 
} 

function OutPutValue(name,value){
	
	var object=eval("document.forms[0]."+name);
	//alert("1"+object);
	object.value=value;
}

/**
 * click the table line to select the radio in this line
 * radioObj:the radio array obj in the table
 * selectvalue: the value will be selected radio
 */
function selectRadio(radioObj,selectvalue){
	var changed=true;
	if(radioObj!=null){
		//only one radio
       	if(radioObj.value==selectvalue && changed) {
       		radioObj.click();
        	//radioObj.checked=true;
       		changed=false;
       		return;
       	}
		//more than one radio
        for ( var i=0; i < radioObj.length; i++ ){
        	if(radioObj[i].value==selectvalue && changed) {
        		radioObj[i].click();
	        	//radioObj[i].checked=true;
        		changed=false;
        		return;
        	}
        }
    }
	
	
}
//ip地址
function testRegx(obj)
{		
	 var regex ='^(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|[1-9])\\.(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\.(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\.(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)$'; 

	var regx=new RegExp(regex);
	var isMatch=regx.test(obj.value);	
	if(isMatch)
	{ 
		showValidateMsg($$('ipaddr',0),'1','');			
	}else
	{
		//document.getElementById('ipError').style.display='';	
		//obj.focus();
		showValidateMsg($$('ipaddr',0),'2','交易方式为网上支付时，此项填写正确IP地址');
	}
}
function CheckStcrLeng(obj,maxlength){
	 var inputNum = obj.value.replace(/[^\x00-\xff]/g, "**").length; 
	    if (inputNum>maxlength) {
	       return false;
	    }
	    return true;
}

var Wi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 ];    // 加权因子  
var ValideCode = [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ];            // 身份证验证位值.10代表X   
function IdCardValidate(idCard) {  //alert( idCard); 
 idCard = trim(idCard.replace(/ /g, ""));               //去掉字符串头尾空格    
 var flag=true;                    
if (idCard.length == 15) {          
   if(!isValidityBrithBy15IdCard(idCard))
   {   flag= false;
   };       //进行15位身份证的验证      
  } else if (idCard.length == 18) {          
   var a_idCard = idCard.split("");                // 得到身份证数组       
      if(isValidityBrithBy18IdCard(idCard)&&isTrueValidateCodeBy18IdCard(a_idCard)){   //进行18位身份证的基本验证和第18位的验证            
     flag=true;           }
      else {              
       flag= false;           }      
       } else {          
        flag=false;       }  
   if(!flag){   
     alert("身份证格式错误");
     return flag;
   }
   return flag;
 }   /**   * 判断身份证号码为18位时最后的验证位是否正确   * @param a_idCard 身份证号码数组   * @return   */  
function isTrueValidateCodeBy18IdCard(a_idCard) {       var sum = 0;                             // 声明加权求和变量     
 if (a_idCard[17].toLowerCase() == 'x') {           a_idCard[17] = 10;                    // 将最后位为x的验证码替换为10方便后续操作    
    }       
    for ( var i = 0; i < 17; i++) {          
     sum += Wi[i] * a_idCard[i];            // 加权求和      
     }      
      valCodePosition = sum % 11;                // 得到验证码所位置    
   if (a_idCard[17] == ValideCode[valCodePosition]) {           
             return true;       
    } else {           return false;       }   }   /**    * 验证18位数身份证号码中的生日是否是有效生日    * @param idCard 18位书身份证字符串    * @return    */  
    function isValidityBrithBy18IdCard(idCard18){      
     var year =  idCard18.substring(6,10);      
     var month = idCard18.substring(10,12);     
      var day = idCard18.substring(12,14);      
       var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));       // 这里用getFullYear()获取年份，避免千年虫问题     
         if(temp_date.getFullYear()!=parseFloat(year)             ||temp_date.getMonth()!=parseFloat(month)-1             ||temp_date.getDate()!=parseFloat(day)){               
         return false;       }
         else{           return true;       }   }     /**     * 验证15位数身份证号码中的生日是否是有效生日     * @param idCard15 15位书身份证字符串     * @return     */    
  function isValidityBrithBy15IdCard(idCard15){         
         var year =  idCard15.substring(6,8);        
          var month = idCard15.substring(8,10);        
           var day = idCard15.substring(10,12);        
            var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));         // 对于老身份证中的你年龄则不需考虑千年虫问题而使用getYear()方法         
            if(temp_date.getYear()!=parseFloat(year)                 ||temp_date.getMonth()!=parseFloat(month)-1                 ||temp_date.getDate()!=parseFloat(day)){                   return false;           }
            else{               return true;           }     }   //去掉字符串头尾空格 
function trim(str) {       return str.replace(/(^\s*)|(\s*$)/g, "");   }  
function maleOrFemalByIdCard(idCard){      
 idCard = trim(idCard.replace(/ /g, ""));        // 对身份证号码做处理。包括字符间有空格。       
 if(idCard.length==15){           
 if(idCard.substring(14,15)%2==0){               
 return 'female';           }else{               return 'male';           }       }
 else if(idCard.length ==18){           if(idCard.substring(14,17)%2==0){               return 'female';           }
 else{               return 'male';           }       }else{           return null;       } 
   }  
