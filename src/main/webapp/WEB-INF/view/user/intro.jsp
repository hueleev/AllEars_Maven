<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>
<title>AllEars</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-metro.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
html,body {
      background-image: url("${pageContext.request.contextPath}/img/11111.png");
      background-size: cover;
 	  background-attachment: fixed;}
</style>
<%@include file="/common/variable.jspf" %>
<body class="w3-theme-l5 w3-animate-opacity">

<!-- Navbar -->

<!-- <div class="w3-bar w3-black">
  <a href="intro" class="w3-bar-item w3-button w3-large w3-hover-cyan"><i class="fa fa-play w3-margin-right"></i>All Ears</a>
  <a href="#" class="w3-bar-item w3-button w3-large w3-hover-white"><i class="fa fa-envelope"></i></a>
  <input type="text" class="w3-bar-item w3-large w3-input" placeholder="Search..">
  <a href="#" class="w3-bar-item w3-button w3-large w3-hover-cyan"><i class="fa fa-search"></i></a>
  <a href="loginForm" class="w3-bar-item w3-button w3-large w3-right w3-hover-cyan" title="Login">
  <i class="fa fa-user-circle w3-margin-right" alt="Login"></i>Login</a>
</div>
 -->
<!-- body -->


<div class="w3-center w3-animate-right" style="margin-top:13%;">

  <p><i class="fa fa-spinner w3-spin" style="font-size:64px; color:white;"></i></p>  
  <a class="w3-jumbo" style="color:white; text-shadow:1px 1px 0 #444;">ALL EARS</a>
  <br>
  <a style="color:dark-grey;">당신의 음악을 들려주세요 -<br>All Ears가 당신의 음악을 기다려요 !</a>
  <br><br>
  <!-- 로그인  -->
	<a href="loginForm"><button class="w3-btn w3-round w3-large w3-center w3-border w3-border-white w3-hover-white" style="width:25%; color:white;"><b>Login</b></button></a>

	<br><br>
  
  <!-- 회원가입 폼 -->
	 <a href="joinForm"><button class="w3-btn w3-round w3-large w3-center w3-border w3-border-white w3-hover-white" style="width:25%; color:white;"><b>Join</b></button></a>


  
</div>

</body>
</html>