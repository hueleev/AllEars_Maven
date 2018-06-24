<%@page import="Userlist.UserlistDataBean"%>
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
<body class="w3-theme-l5">

	
<script>
	function checkValue()
	{
		
	
		if(document.updateForm.passwd.value!=document.updateForm.passwdcheck.value){
			alert("비밀번호를 동일하게 입력하세요."); 
		return false;
		}
		
	}
</script>
<form method="post" name="updateForm" action="updatePro" onsubmit="return checkValue()">
<div class="w3-container" style="width:750px; margin-left:30%; margin-top:150px; margin-bottom:80px; text-align: center;">	
 <input type="hidden" name="num" value="${user.num}">
  <table class="w3-table w3-white w3-bordered">
    <thead>
      <tr class="w3-light-grey w3-bordered">
        <th colspan="4" style="text-align:center">${user.userid}님의 정보</th>
      </tr>
    </thead>
    
    <tr>
    	<td width="200"><b>아이디</b></td>
    	<td width="550" colspan="3">${user.userid}</td>
    </tr>
 
    <tr>
 		<td width="200"><b>이름</b></td>
 		<td width="200">${user.username}</td>
 		<td width="100"><b>성별</b></td>
 		<td width="250">${user.gender}</td> 
    </tr>
    
    <tr>
    		<td width="200"><b>비밀번호</b></td>
    		<td width="175"><input type="password" name="passwd" value="${user.passwd}"></td>
    		<td width="200"><b>비밀번호 확인</b></td>
    		<td width="175"><input type="password" name="passwdcheck" value="${user.passwd}"></td>
    </tr>
    
    <tr>
    		<td width="200"><b>닉네임</b></td>
    		<td width="175"><input type="text" name="displayname" value="${user.displayname}"></td>
    		<td width="200"><b>포지션</b></td>
    		<td width="175"><input type="text" name="position" value="${user.position}"></td>
    </tr>
    
   
    <tr>
    	<td width="200"><b>연락처</b></td>
    	<td width="550" colspan="3"><input type="text" name="hp" value="${user.hp}"></td>
    </tr>
    
    <tr>
    	<td width="200"><b>주소</b></td>
    	<td width="550" colspan="3"><input type="text" name="address" value="${user.address}"></td>
    </tr>
    
    <tr>
    	<td width="200"><b>이메일</b></td>
    	<td width="550" colspan="3"><input type="text" name="email" value="${user.email}"></td>
    </tr>
    
    <tr>
    	<td width="200"><b>소개</b></td>
    	<td width="550"  colspan="3"><textarea name="bio" rows="13" cols="40">${user.bio}</textarea></td>
    </tr>
  
  
  </table>
 <br>
	<a onclick="document.location.href='deleteForm?userid=${user.userid}&num=${user.num}'" class="w3-btn w3-round w3-red"><b>탈퇴</b></a>
 	&nbsp;
 	<button class="w3-btn w3-round w3-metro-yellow" type="submit"><b>수정</b></button>
 	&nbsp;
 	<a href="main" class="w3-btn w3-round w3-dark-grey w3-hover-white"><b>취소</b></a>
 	
 	</div>
 </form>

</body>
</html>