<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Userlist.UserlistDataBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>정보 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-metro.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body class="w3-theme-l5">
<div class="w3-container" style="width:800px; margin-left:30%; margin-top:250px; text-align: center;">	
  <h3 class="w3-center"><b>회원 목록</b></h3><br>
  <table class="w3-table w3-white w3-bordered">
    <thead>
      <tr class="w3-light-grey">
        <th colspan="4" style="text-align:center">${user.userid}님의 정보</th>
      </tr>
    </thead>
    
    <tr>
    	<td width="200"><b>아이디</b></td>
    	<td width="200">${user.userid}</td>
    	<td width="100"><b>가입일</b></td>
    	<td width="250">${user.reg_date}</td>
    </tr>
 
    <tr>
 		<td width="200"><b>이름</b></td>
 		<td width="200">${user.username}</td>
 		<td width="100"><b>성별</b></td>
 		<td width="250">${user.gender}</td> 
    </tr>
    
    <tr>
    	<td width="200"><b>닉네임</b></td>
    	<td width="200">${user.displayname}</td>
    	<td width="100"><b>포지션</b></td>
    	<td width="250">${user.position}</td>
    </tr>
    
    <tr>
    	<td width="200"><b>연락처</b></td>
    	<td width="550" colspan="3">${user.hp }</td>
    </tr>
    
    <tr>
    	<td width="200"><b>주소</b></td>
    	<td width="550" colspan="3">${user.address}</td>
    </tr>
    
    <tr>
    	<td width="200"><b>이메일</b></td>
    	<td width="550" colspan="3">${user.email}</td>
    </tr>
    
    <tr>
    	<td width="200"><b>소개</b></td>
    	<td width="550"  colspan="3"><pre>${user.bio}</pre></td>
    </tr>
  
  </table>

	<br>
	
	<button onclick="document.location.href='deleteForm?num=${user.num}&pageNum=${pageNum}'" class="w3-btn w3-round w3-red w3-hover-white"><b>강제 탈퇴</b></button>
   &nbsp;
   <button onclick="document.location.href='list?pageNum=${pageNum}'" class="w3-btn w3-round w3-metro-yellow w3-hover-white"><b>회원 목록</b></button>
   &nbsp;
   <button onclick="document.location.href='friendPage?num=${user.num}'" class="w3-btn w3-round w3-dark-grey w3-hover-white"><b>페이지 가기</b></button>
	
    
 </div>
      
</body>
</html>