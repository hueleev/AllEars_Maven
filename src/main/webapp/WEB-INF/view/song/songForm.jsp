<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%@include file="/common/variable.jspf" %>
<%@include file="/common/footer.jspf" %>

<body class="w3-theme-l5">

<div class="w3-container w3-center" style="margin-top:10%">

   <i class="fa fa-stop-circle-o" style="font-size:70px;">&nbsp;</i>
   <i class="fa fa-play-circle-o" style="font-size:70px;">&nbsp;</i>
    <i class="fa fa-pause-circle-o" style="font-size:70px;">&nbsp;</i>
    <br><br>
<form method="post" name="songForm" enctype="multipart/form-data" action="songInsert" onsubmit="return checkValue()">
  <table align="center" cellspacing="10" class="w3-card w3-round w3-white w3-padding-large" style="width:50%%;">
  
	<input type="hidden" name="sboardid" value="${sessionScope.sessionid}">
	<input type="hidden" name="snum" value="${snum}">
	
    <tr>
      <td><b>타이틀</b>&nbsp;&nbsp;<a style="color:red">*</a></td>
      <td><input class="w3-input w3-animate-input" name="stitle" style="width:50%" type="text" required></td>
    </tr>
    
    <tr>
      <td><b>장르</b>&nbsp;&nbsp;<a style="color:red">*</a></td>
      <td><input class="w3-input w3-animate-input" name="genre" style="width:50%" type="text" required></td>
    </tr>
    
    <tr>
      <td><b>앨범 커버</b></td>
      <td><input type="file" name="cupload"></td>
    </tr>
    
    <tr>
      <td><b>음악이나 영상을 선택해주세요 :)</b>&nbsp;&nbsp;<a style="color:red">*</a></td>
      <td><input type="file" name="supload" required></td>
    </tr>

    <tr>
      <td><b>소개</b></td>
      <td><textarea class="w3-input w3-border w3-margin-bottom" name="sbio" rows="4" cols="25"></textarea></td>
    </tr>
    
    <tr>
       <td></td>
       <td><button class="w3-btn w3-round w3-metro-yellow w3-hover-white w3-right" type="submit"><b>업로드</b></button><td>
    <tr>
    

  </table>
</form>
</div>

</body>
</html> 