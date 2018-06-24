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
<script type="text/javascript" src="${pageContext.request.contextPath}/ajax/httpRequest.js"></script>

<script type="text/javascript">

	function imgToServer() {
		var params = "name="
		+encodeURIComponent(document.f.etcid.value);
		
		sendRequest("deleteImg", params, imgFromServer, "POST");
	}
	function imgFromServer() {
			if (httpRequest.readyState == 4) {
				if (httpRequest.status == 200) {
					
		document.getElementById("aaa").innerHTML
		='프로필 사진이 삭제되었습니다.';
				}}	}	</script>
				
				
				
<body class="w3-theme-l5">

<div class="w3-container w3-center" style="margin-top:10%">

   <i class="fa fa-address-book-o" style="font-size:70px;">&nbsp;</i>
   <i class="fa fa-address-book" style="font-size:70px;">&nbsp;</i>
   <i class="fa fa-address-book-o" style="font-size:70px;">&nbsp;</i>
    <br><br>
<form name="f" method="post" enctype="multipart/form-data" action="etcUpdatePro">

 	<input type="hidden" name="etcid" value="${etcid}">
 	<input type="hidden" name="profilename" value="${etc.profilename}">
 	<input type="hidden" name="profilesize" value="${etc.profilesize}">
 	
  	<table align="center" cellspacing="10" class="w3-card w3-round w3-white w3-padding-large" style="width:50%%;">

	<tr>
      <td><b>프로필 이미지</b></td>
      <td><input type="file" name="uploadfile">${etcid} ${etc.profilename} ${etc.profilesize}</td>

    </tr>
    
     <tr>
     <td></td>
     <td>
	 <span style="float:left"><input type="button" value="삭제" onclick="imgToServer()" /></span>
	 <div id="aaa"></div>
	 </td>
     <tr>
     
    <tr>
      <td><b style="color:blue;">페이스북</b>&nbsp;&nbsp;</td>
      <td><input class="w3-input w3-animate-input" name="facelink" style="width:70%" type="url" value="${etc.facelink}"></td>
    </tr>
    
    <tr>
      <td><b style="color:violet;">인스타그램</b>&nbsp;&nbsp;</td>
      <td><input class="w3-input w3-animate-input" name="instalink" style="width:70%" type="url" value="${etc.instalink}"></td>
    </tr>
    
        <tr>
      <td><b style="color:orange;">사운드 클라우드</b>&nbsp;&nbsp;</td>
      <td><input class="w3-input w3-animate-input" name="soundlink" style="width:70%" type="url" value="${etc.soundlink}"></td>
    </tr>

    <tr>
       <td></td>
       <td><button class="w3-btn w3-round w3-metro-yellow w3-right w3-hover-white" type="submit"><b>수정</b></button><td>
    <tr>

  </table>
</form>
</div>

</body>
</html> 