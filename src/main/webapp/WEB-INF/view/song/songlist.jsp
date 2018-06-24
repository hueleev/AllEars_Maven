<%@page import="Userlist.UserlistDataBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/common/variable.jspf" %>
<%@include file="/common/footer.jspf" %>
<html>
<title>AllEars</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-metro.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body class="w3-theme-l5">



<div class="w3-container" style="width:50%; margin-left:25%; margin-top:15%;">	
  <h3 class="w3-center"><b>${sboardid}님의 음악 : ${count}</b></h3><br>	
  <table class="w3-table w3-white w3-padding-large w3-bordered w3-hoverable">
    <thead>
      <tr class="w3-light-grey">
        <th align="center" width="100">번호</th>
        <th align="center" width="300">타이틀</th>
        <th align="center" width="100">장르</th>
        <th align="center" width="300">작성일</th>

      </tr>
    </thead>
    
   <c:forEach var="song" items="${songList}">
    <tr>
    	<td align="center" width="100">${number}</td>
		<c:set var="number" value="${number-1}"/>
      <td width="300">
      <a href="songcontent?snum=${song.snum}&pageNum=${currentPage}&number=${number+1}&sboardid=${sboardid}">
      ${song.stitle}</a></td>
      <td width="100">${song.genre}</td>
      <td width="300">${song.sreg_date}</td>
    </tr> 
    </c:forEach>
    
  </table>
  <br>
	<div class="w3-center">

			<c:if test="${count>0}">
			<c:if test="${startPage>bottomLine}">
			<a href = "songlist?pageNum=${startPage-bottomLine}&sboardid=${sboardid}">[이전]</a>
			</c:if>
			
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="songlist?pageNum=${i}&sboardid=${sboardid}">
				
				<c:if test="${i!=currentPage}">[${i}]</c:if>
				<c:if test="${i==currentPage}">
				<font color='deep-purple'>[${i}]</font></c:if></a>
			</c:forEach>
			
			<c:if test="${endPage<pageCount}">
			<a href="songlist?pageNum=${startPage+bottomLine}"&sboardid=${sboardid}>[다음]</a>
			</c:if>
			</c:if>
	</div>
	
	
	<c:if test="${sessionScope.sessionid eq sboardid}">
    <a href="songForm" class="w3-btn w3-round w3-metro-yellow w3-hover-white w3-right"><b>업로드</b></a>
	</c:if>
	
</div>

</body>
</html>