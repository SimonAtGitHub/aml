//Change Skin
function getcookie(sname)
{ 
    var acookie = document.cookie.split("; ");
    for (var i=0; i < acookie.length; i++)
    {
        var acrumb = acookie[i].split("=");
        if (sname == acrumb[0])
        {
            return acrumb[1];
        }
    }
    return null;
}
function setcookie(name, value, time, domain)
{
    var expdate = new Date();
    var expires = time;
    if(expires!=null){
      expdate.setTime(expdate.getTime() + ( expires * 1000 ));
      expd = "expires="+expdate.toGMTString()+";";
    }else
      expd = "";
    if (domain)
    {
        domain = "domain="+ domain +"; path=/; ";
    }
    document.cookie = name + "=" + escape (value) + "; " + expd + domain;
}
var cookietag = "crystal_skin";
var vskin = getcookie(cookietag);
function setskincolor(vskinnum)
{
    setcookie( cookietag, vskinnum, 60*60*24*30,"");	
	document.getElementById("skincss").href = "css/aml_"+vskinnum+".css";
	changeImagePath();
	
}
function changeSkinStyle(){
	var cssid=document.getElementById("skincss");
	if(cssid!=null &&  vskin!=null && vskin!="aml" )
	{
	   var  stylePath=document.getElementById("skincss").href;
	   stylePath=(stylePath.replace(/css\/aml_[a-zA-Z]*.css/g,"css/aml_"+vskin+".css"));
	   document.getElementById("skincss").href=stylePath;
	 }
}
changeSkinStyle();
//Change Skin:Change Image's URL
function changeImagePath(){
	if(vskin!=null  && vskin!=''){
		var imgArray=document.getElementsByTagName("img");
		for(var i=0;i<imgArray.length;i++){
			var img=imgArray[i];
			var imgPath=img.src; 
			if(imgPath!=null && imgPath!=''){
				 imgPath=(imgPath.replace(/images\/[a-zA-Z]*\//g,'images/'+vskin+'/'));
				 img.src=imgPath;
			}
			
		}
	}
}
window.setTimeout('changeImagePath()',1000);//change skin and image