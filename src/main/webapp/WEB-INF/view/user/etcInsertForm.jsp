<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-metro.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body class="w3-theme-l5">

<div class="w3-container w3-center" style="margin-top:10%">

   <i class="fa fa-address-book-o" style="font-size:70px;">&nbsp;</i>
   <i class="fa fa-address-book" style="font-size:70px;">&nbsp;</i>
   <i class="fa fa-address-book-o" style="font-size:70px;">&nbsp;</i>
    <br><br>
<form method="post" enctype="multipart/form-data" action="etcInsertPro">

 	<input type="hidden" name="etcid" value="${etcid}">
  	<table align="center" cellspacing="10" class="w3-card w3-round w3-white w3-padding-large" style="width:50%%;">

	<tr>
      <td><b>프로필 이미지</b></td>
      <td><input type="file" name="uploadfile"></td>
    </tr>
    
    <tr>
      <td><b style="color:blue;">페이스북</b>&nbsp;&nbsp;</td>
      <td><input class="w3-input w3-animate-input" name="facelink" style="width:70%" type="url" placeholder="http://"></td>
    </tr>
    
    <tr>
      <td><b style="color:violet;">인스타그램</b>&nbsp;&nbsp;</td>
      <td><input class="w3-input w3-animate-input" name="instalink" style="width:70%" type="url" placeholder="http://"></td>
    </tr>
    
        <tr>
      <td><b style="color:orange;">사운드 클라우드</b>&nbsp;&nbsp;</td>
      <td><input class="w3-input w3-animate-input" name="soundlink" style="width:70%" type="url" placeholder="http://"></td>
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