<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	var xml = null;
	
	function errMsg(){
		
		var text = document.getElementsByName("textareas")[0].value;
		xml = new XMLHttpRequest();
		xml.onreadystatechange = react
		xml.open('get','${cp }/singo.do?a_num=<%=request.getParameter("a_num")%>&sel_number=<%=request.getParameter("sel_number")%>&m_num=<%=request.getParameter("m_num")%>&textareas='+text+'',true);
		xml.send();
	}
	function react(){
		var div = document.getElementById("div");//div
		if(xml.readyState ==4 & xml.status ==200){
		var data = xml.responseXML;
		var Msg = data.getElementsByTagName("Msg")[0].firstChild.nodeValue;
			if(Msg!=null){
				div.innerHTML="";
				div.innerHTML=Msg;
			}
		}
	}
</script>
</head>
<body>
<div id="div">
 <h1>판매자 번호 : <%=request.getParameter("sel_number")%></h1>
 <textarea name="textareas" rows="10" cols="50" placeholder="신고내용을 적어주시면 됩니다."></textarea>
 <input type="submit" id="inputt" onclick="errMsg()" value="등록">
</div> 
</body>
</html>