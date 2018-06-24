<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>AllEars</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-metro.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">

html,body {
      background-image: url("${pageContext.request.contextPath}/img/login.png");
      background-size: cover;
      background-attachment: fixed;}
      
span{
  font-size: 15px;
}
#checkMsg{
  font-size: 12px;
}
#checkPwd{
  color : red;
  font-size: 12px;
}
      
</style>
<script type="text/javascript">
var checkFirst = false;
var lastKeyword = '';
var loopSendKeyword = false;

	function checkValue()
	{
		
	
		if(document.JoinForm.passwd.value!=document.JoinForm.passwdcheck.value){
			alert("비밀번호를 동일하게 입력하세요."); 
		return false;
		}
		
		if(document.JoinForm.idDuplication.value!= "idCheck"){
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
	
		alert("반가워요! 로그인해주세요 - "); 
		
		}

	
	 function checkPwd(){
		  var f1 = document.forms[0];
		  var pw1 = f1.passwd.value;
		  var pw2 = f1.passwdcheck.value;
		  if(pw1!=pw2){
		   document.getElementById('checkPwd').style.color = "red";
		   document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요."; 
		  }else{
		   document.getElementById('checkPwd').style.color = "black";
		   document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다."; 
		   
		  }
		  
		 }
	 
	 	function confirmId() {
			
			if (document.JoinForm.userid.value=="") {
				alter("ID를 입력하세요.");
				return;
			}
			url = "confirmId?userid="+document.JoinForm.userid.value;
			open(url,"confirm","toobar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
			document.JoinForm.idDuplication.value="idCheck";
		}
	 	

		function inputIdChk() {
	 		document.JoinForm.idDuplication.value="idUncheck";
	 	}
	 	
	 


</script>

<body class="w3-theme-l5 w3-animate-opacity">


      <form class="w3-card w3-round w3-white w3-padding-large w3-right" style="margin-right:30%; width:40%; margin-top:3%; margin-bottom:3%;" name="JoinForm" method="post" action="joinPro" onsubmit="return checkValue()">
        <input type="hidden" name="num" value="${num}">
        <div class="w3-section" >
 			<label><b>아이디</b></label><br>
          <input class="w3-input w3-half w3-margin-bottom" type="text" placeholder="아이디를 입력해주세요." style="width:70%" name="userid" id="userid" onkeydown="inputIdChk()" required> 
          &nbsp;&nbsp;&nbsp;<a class="w3-btn w3-round w3-metro-yellow w3-hover-white" value="중복확인" name="confirm_id" onClick="confirmId(this.form)"><b>중복확인</b></a>
          <br><input type="hidden" name="idDuplication" value="idUncheck"><br>
          <label><b>비밀번호</b></label>
          <input class="w3-input w3-margin-bottom" type="password" placeholder="비밀번호를 입력해주세요." name="passwd" required>
          <label><b>비밀번호 확인</b></label>
          <input class="w3-input w3-margin-bottom" type="password" placeholder="비밀번호를 다시 한번 입력해주세요." name="passwdcheck" onkeyup="checkPwd()" required>
          <div id="checkPwd"></div>
          <label><b>이름</b></label>
          <input class="w3-input w3-margin-bottom" type="text" placeholder="이름을 입력해주세요." name="username" required>
          <label><b>닉네임</b></label>
          <input class="w3-input w3-margin-bottom" type="text" placeholder="닉네임을 입력해주세요." name="displayname" required>
          <label><b>포지션</b></label>
          <input class="w3-input w3-margin-bottom" type="text" placeholder="Songwriter? Listener? Entertainment? 어느 쪽이신가요 ?" name="position" required>
          <label><b>성별</b></label><br>
          <input type="radio" name="gender" value="남"> 남
       	  <input class="w3-margin-bottom" type="radio" name="gender" value="여"> 여 <br>
          <label><b>연락처</b></label>
          <input class="w3-input w3-margin-bottom" type="text" placeholder="연락처를 입력해주세요." name="hp">
          <label><b>주소</b></label>
          <input class="w3-input w3-margin-bottom" type="text" placeholder="주소를 입력해주세요." name="address">
          <label><b>이메일</b></label>
          <input class="w3-input w3-margin-bottom" type="email" placeholder="이메일을 입력해주세요." name="email">
          <label><b>소개</b></label><br>
          <textarea class="w3-input w3-border w3-margin-bottom" name="bio" rows="5" cols="20"></textarea>
          <button class="w3-btn w3-round w3-block w3-metro-yellow w3-hover-white w3-section w3-padding" type="submit"><b>Join</b></button>
        </div>
      </form>
      
 </body>
 </html>