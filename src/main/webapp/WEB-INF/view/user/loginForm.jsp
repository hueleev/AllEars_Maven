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
      background-image: url("${pageContext.request.contextPath}/img/login.png");
      background-size: cover;
      background-attachment: fixed;}
</style>

<body class="w3-theme-l5 w3-animate-opacity">
 	<form class="w3-card w3-round w3-white w3-padding-large w3-center" style="width:30%; margin-top:15%; margin-left:35%;" method="post" action="loginpro">
        <div class="w3-section">
          <label><b>아이디</b></label>
          <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="아이디를 입력해주세요" name="userid" required>
          <label><b>비밀번호</b></label>
          <input class="w3-input w3-border" type="password" placeholder="비밀번호를 입력해주세요" name="passwd" required>
          <button class="w3-btn w3-round w3-block w3-metro-yellow w3-section w3-padding w3-hover-white" type="submit"><b>Login</b></button>
        </div>
        <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <a href="intro" class="w3-btn w3-round w3-red w3-hover-white w3-right">Cancel</a>


      </div>
      </form>

</body>
</html>