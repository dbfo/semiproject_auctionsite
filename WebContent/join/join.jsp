<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	th {text-align: left;}
</style>
<script>
	/*이름 유효성 검사*/
	function nameck() { 
		var name=document.getElementById("name").value;
		var nameckmsg=document.getElementById("nameckmsg");
		var nameck= /[a-z0-9]|[ []{}()<>?|`~!@#$%^&*-_+=,.;:\"'\]/g;
		if(name.length>=4){  /*이름 4자 이상이면x*/
			nameckmsg.innerHTML="이름은 4자 이하로 입력해주세요.";
			return;
		}else{
			nameckmsg.innerHTML="";
		}
		/*이름에 한글외 문자 입력시 x*/
		if(nameck.test(name)){
			nameckmsg.innerHTML="이름은 한글만 입력해주세요.";
			return;
		}else{
			nameckmsg.innerHTML="";
		}
	}
	//아이디 중복검사
	var xhrid=null;
	function idck() { 
		var id=document.getElementById("id").value;
		xhrid=new XMLHttpRequest();
		xhrid.onreadystatechange=idckok;
		xhrid.open('post','${cp}/join/idck.jh',true);
		xhrid.setRequestHeader('Content-type','application/x-www-form-urlencoded');
		console.log(id);
		xhrid.send('id='+id);
	}
	function idckok() {
		var idckmsg=document.getElementById("idckmsg");
		var id=document.getElementById("id").value;
		var id_alphanumber = /^[A-Za-z0-9]*$/ ;  
		if(xhrid.readyState==4 && xhrid.status==200){
			var msg=xhrid.responseText;
			var json=JSON.parse(msg);
			console.log(json.msg);
			if(json.msg=='error'){
				idckmsg.innerHTML="사용중인 아이디 입니다.";
				return;
			}else if(!(id.length>=5)){
				idckmsg.innerHTML="아이디는 5자 이상으로 입력해주세요.";
				return;
			}else if(!(id.length<=10)){
				idckmsg.innerHTML="아이디는 10자리 이하로 입력해주세요.";
				return;
			}else if(!(id_alphanumber.test(id))){
				idckmsg.innerHTML="아이디는 영문과 숫자만 입력해주세요.";
				return;
			}else{
				idckmsg.innerHTML="";
			}
		}		
	}
	/*비밀번호 유효성검사*/
	function pwdCk(pwd) {
		var pwd=pwd.value;
		var pwdckmsg=document.getElementById("pwdckmsg");
		var pwd_alphanumber = /^[A-Za-z0-9]*$/ ; 
		if(!(pwd.length>=8 && pwd.length<=25)){
			pwdckmsg.innerHTML="비밀번호는 8~25자리 사이로 입력해주세요.";
			return;
		}else if(!(pwd_alphanumber.test(pwd))){
			pwdckmsg.innerHTML="비밀번호는 영문과 숫자만 입력해주세요.";
			return;
		}else{
			pwdckmsg.innerHTML="";
		}
	}
	/*비밀번호 확인하기*/
	function pwdDubleCk() {
		var pwd=document.getElementById("pwd").value;
		var pwdck=document.getElementById("pwdck").value;
		var pwdckmsg2=document.getElementById("pwdckmsg2");
		
		if(!(pwd==pwdck)){
			pwdckmsg2.innerHTML="입력한 비밀번호와 다릅니다.";
			return;
		}else{
			pwdckmsg2.innerHTML="";
		}
	}
	/*이메일 중복검사*/
	var xhremail=null;
	function emailCk() {
		var email=document.getElementById("email").value;
		xhremail=new XMLHttpRequest();
		xhremail.onreadystatechange=emailckOk;
		xhremail.open('post','${cp}/join/idck.jh',true);
		xhremail.setRequestHeader('Content-type','application/x-www-form-urlencoded');
		xhremail.send('email='+email);
	}
	function emailckOk() {
		var emailckmsg=document.getElementById("emailckmsg");
		var email=document.getElementById("email").value;
	}

</script>
<h1>회원가입</h1>
<div>
<form method="post" action="${cp }join/insert.jh">
	<table border="1" >
		<tr>
			<th>* 이름 : </th>
			<td><input type="text" name="name" id="name" onkeyup="nameck()">
			<span id="nameckmsg" style="color:red"></span></td>
		</tr>
		<tr>
			<th>* 아이디 : </th>
			<td><input type="text" name="id" id="id" onkeyup="idck()">
			<span id="idckmsg" style="color:red"></span></td>
		</tr>
		<tr>
			<th>* 비밀번호 : </th>
			<td><input type="password" name="pwd" id="pwd" onkeyup="pwdCk(this)">
			<span id="pwdckmsg" style="color:red"></span></td>
		</tr>
		<tr>
			<th>* 비밀번호 확인 : </th>
			<td><input type="password" name="pwdck" id="pwdck" onkeyup="pwdDubleCk()">
			<span id="pwdckmsg2" style="color:red"></span></td>
		</tr>
		<tr>
			<th>* 이메일 : </th>
			<td><input type="text" name="email" id="email" onkeyup="emailCk()">
			<span id="emailckmsg" style="color:red"></span></td>
		</tr>
		<tr>
			<th>* 주소 : </th>
			<td><input type="text" name="addr"><span>테스트용 메세지</span></td>
		</tr>
		<tr>
			<th>* 연락처 : </th>
			<td><input type="text" name="phone" placeholder="숫자만입력" width="500">
			<span>테스트용 메세지</span></td>
		</tr>
	</table>
	<br>
	<input type="button" value="취소"><!-- 취소버트 누르면 메인으로..? -->
	<input type="submit" value="가입" disabled="disabled">
</form>
</div>
