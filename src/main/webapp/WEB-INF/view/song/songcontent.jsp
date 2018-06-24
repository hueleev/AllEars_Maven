<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-metro.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@include file="/common/variable.jspf" %>
<%@include file="/common/footer.jspf" %>

<body class="w3-theme-l5">

	  <div class="w3-container w3-center" style="margin-top:100px; margin-bottom:80px;">

			<i class="fa fa-stop-circle-o" style="font-size:70px;">&nbsp;</i>
   <i class="fa fa-play-circle-o" style="font-size:70px;">&nbsp;</i>
    <i class="fa fa-pause-circle-o" style="font-size:70px;">&nbsp;</i>
    <br><br>
			<table align="center" cellspacing="5" class="w3-card w3-round w3-white w3-padding-large"  style="width:30%" cellspacing="15">
			 
			 	<tr>
			      	<td colspan="4" align="center">
			      	<h3><b>${song.stitle}</b></h3></td>
			   </tr>
			   
			 	<tr>
			      	<td colspan="4" align="center"><h4><b>${song.sboardid}</b></h4></td>
			   </tr>
			   <tr>
			      	<td><b>번호</b></td>
			 		<td>${song.snum}</td>
			      	<td><b>장르</b></td>
			 		<td>${song.genre}</td>
			
			   </tr>
			   
			   <c:if test="${song.cfilesize!=0}">
			   <tr>
			   <td colspan="4" align="center">
			   <br>
			   <img src="${pageContext.request.contextPath}/songSave/${song.cfilename}" class="w3-rounded" style="height:300px; width:300px;" alt="Avatar"></td>
			   </tr>
			  
			   </c:if>
			   
				<tr>
					<td colspan="4" class="w3-center"><br>
					<c:if test="${song.type eq 'mp3' || song.type eq 'wav'}">
						<audio controls="controls">
						  <source src="${pageContext.request.contextPath}/songSave/${song.sfilename}" type="audio/mpeg">
						  <source src="${pageContext.request.contextPath}/songSave/${song.sfilename}" type="audio/wav">
						</audio>
					</c:if>	
					
					<c:if test="${song.type eq 'mp4'}">
						<video width="320" height="240" controls>
						  <source src="${pageContext.request.contextPath}/songSave/${song.sfilename}" type="video/mp4">
						  <source src="${pageContext.request.contextPath}/songSave/${song.sfilename}" type="video/ogg">
						</video>
					</c:if>
				
					</td>
				</tr>
				
				<tr>
					<td colspan="4" class="w3-center">
						<h6>${song.sbio}</h6>
					</td>
				</tr>
				
  				<tr height="30">
  				 <td colspan="4" class="w3-center">
				<c:if test="${sessionScope.sessionid eq song.sboardid}">
				 
				  
				   <input class="w3-btn w3-round w3-dark-grey w3-hover-white"
				   type="button" value="수정"
				   onclick="document.location.href='songUpdateForm?snum=${song.snum}&pageNum=${pageNum}'">
				   &nbsp;&nbsp;&nbsp;&nbsp;


				</c:if>
				
				<c:if test="${sessionScope.sessionid eq song.sboardid || sessionScope.sessionid eq 'admin'}">
				
				<input class="w3-btn w3-round w3-red w3-hover-white"
				   type="button" value="삭제" onclick="document.location.href='songdeleteForm?snum=${song.snum}&pageNum=${pageNum}&sboardid=${song.sboardid}'">
				   &nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
				
				<input class="w3-btn w3-round w3-metro-yellow w3-hover-white"
				type="button" value="목록"
				onclick="document.location.href='songlist?pageNum=${pageNum}&sboardid=${song.sboardid}'">
				</td></tr>
			</table>
			</div>

	
</body>
</html>