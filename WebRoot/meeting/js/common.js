function urlEncode(type,name){
	name=escape(name);
	var url="showDetailInfoServlet?type="+type+'&name='+name;
	window.open(url);
  
  }

function post(URL, PARAMS) {      
    var temp = document.createElement("form");      
    temp.action = URL;      
    temp.method = "post";      
    temp.style.display = "none";      
    for (var x in PARAMS) {      
        var opt = document.createElement("textarea");      
        opt.name = x;      
        opt.value = PARAMS[x];      
        // alert(opt.name)      
        temp.appendChild(opt);      
    }      
    document.body.appendChild(temp);      
    temp.submit();      
    return temp;      
}      

function checkRate(input)
{
     var re = /^[0-9]+.?[0-9]*$/;   //判断字符串是否为数字     //判断正整数 /^[1-9]+[0-9]*]*$/   
     if (!re.test(input.value))
    {
        alert("输入值不合法,请输入(0~1)的浮点值");
        input.focus();
        return false;
     }else{
    	 if(input.value>1||input.value<0){
    	 alert("输入值不合法,请输入(0~1)的浮点值");
    	 input.focus();
         return false;
    	 }
    	 return true;
     }
}

function stringEncode(name){
	alert('到这里了');
	name=escape(name);
	return name;
  }