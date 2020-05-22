<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script> 

<div>
<form class="form-horizontal" method="post" action="${cp }/myinfo/pwdChange.jh">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-5 control-label">현재 비밀번호 입력</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputEmail3" placeholder="Password"
       onkeyup="nowPwdCk()" name="nowpwd">
      <span id="nowpwdmsg" style="color:red; font-size:15"></span>
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-5 control-label">비밀번호 입력</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Password"
      onkeyup="newPwdCk()" name="newpwd">
      <span id="newpwdmsg" style="color:red; font-size:15"></span>
    </div>
  </div>
  <div class="form-group">
     <label for="inputPassword3" class="col-sm-5 control-label">비밀번호 확인</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Password"
      onkeyup="newPwdCk2()" name="newpwd2">
      <span id="newpwdmsg2" style="color:red; font-size:15"></span>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" id="pwdbt" class="btn btn-secondary btn-lg" 
      disabled="disabled">비밀번호 변경하기</button>
    </div>
  </div>
   <input type="hidden" name="m_mum" value="${m_num}" />
</form>
</div>

<!-- Modal -->

  <div class="modal fade" id="myModal" role="dialog"> <!-- 사용자 지정 부분① : id명 -->
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">모달 창 타이틀</h4> <!-- 사용자 지정 부분② : 타이틀 -->
        </div>
        <div class="modal-body">
          <p>여기에 필요한 텍스트 메시지 넣기</p> <!-- 사용자 지정 부분③ : 텍스트 메시지 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

<script>
	var nowpwdbool=false;
	var newpwdbool=false;
	var newpwdbool2=false;
	
	/*현재 비밀번호 확인하기*/
	var xhrpwd=null;
	function nowPwdCk() { 
		var nowpwd=document.getElementsByName("nowpwd")[0].value;
		xhrpwd=new XMLHttpRequest();
		xhrpwd.onreadystatechange=nowpwdok;
		xhrpwd.open('post','${cp}/myinfo/pwdCheck.jh',true);
		xhrpwd.setRequestHeader('Content-type','application/x-www-form-urlencoded');
		xhrpwd.send('nowpwd='+nowpwd+'&m_num=${m_num}');
	}
	function nowpwdok() {
		var nowpwdmsg=document.getElementById("nowpwdmsg");
		var nowpwd=document.getElementsByName("nowpwd")[0].value;
		if(xhrpwd.readyState==4 && xhrpwd.status==200){
			var msg=xhrpwd.responseText;
			var json=JSON.parse(msg);
			if(json.msg=='error'){
				nowpwdmsg.innerHTML="현재 비밀번호와 일치하지 않습니다.";
				nowpwdbool=false;
			}else{
				nowpwdmsg.innerHTML="";
				nowpwdbool=true;
			}
			bt();
		}		
	}
	
	/*비밀번호 유효성 검사*/
	function newPwdCk() {
		var pwd=document.getElementsByName("newpwd")[0].value;
		var newpwdmsg=document.getElementById("newpwdmsg");
		var pwd_alphanumber = /^[A-Za-z0-9]*$/ ; 
		if(!(pwd.length>=8 && pwd.length<=25)){
			newpwdmsg.innerHTML="비밀번호는 8~25자리 사이로 입력해주세요.";
			newpwdbool=false;
		}else if(!(pwd_alphanumber.test(pwd))){
			newpwdmsg.innerHTML="비밀번호는 영문과 숫자만 입력해주세요.";
			newpwdbool=false;
		}else{
			newpwdmsg.innerHTML="";
			newpwdbool=true;
			bt();
		}
	}
	
	/*비밀번호 맞는지 확인하기*/
	function newPwdCk2() {
		var pwd=document.getElementsByName("newpwd")[0].value;
		var pwdck=document.getElementsByName("newpwd2")[0].value;
		var newpwdmsg2=document.getElementById("newpwdmsg2");
		if(!(pwd==pwdck)){
			newpwdmsg2.innerHTML="입력한 비밀번호와 다릅니다.";
			newpwdbool2=false;
		}else{
			newpwdmsg2.innerHTML="";
			newpwdbool2=true;
		}
		bt();
	}
	var btn = document.getElementById("pwdbt");
	function bt() {
		if(nowpwdbool==true && newpwdbool==true && newpwdbool2==true){
			btn.disabled=false;
		}else{
			btn.disabled=true;
		}
	}
	


</script>