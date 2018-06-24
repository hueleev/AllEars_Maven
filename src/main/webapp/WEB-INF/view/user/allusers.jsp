<%@page import="Userlist.UserlistDataBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<title>AllEars</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-metro.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@include file="/common/variable.jspf" %>
<%@include file="/common/footer.jspf" %>

<body class="w3-theme-l5">



<div class="w3-container w3-display-topmiddle" style="width:60%; margin-top:15%;">	
  <h3 class="w3-center"><b>회원 목록</b></h3><br>
  <table cellspacing="5" class="w3-table w3-white w3-padding-large w3-bordered w3-hoverable">
      <thead>
      <tr class="w3-light-grey">
        <th align="center" width="100">번호</th>
        <th align="center" width="150">닉네임</th>
        <th align="center" width="150">이름</th>
        <th align="center" width="50">성별</th>
        <th align="center" width="150">포지션</th>
        <th align="center" width="250">가입일</th>
      </tr>
	    </thead>
	
   <c:forEach var="user" items="${userList}">
    <tr>
    	<td align="center" width="50">${number}</td>
		<c:set var="number" value="${number-1}"/>
      <td width="150">
      <a href=<c:if test="${user.userid==sessionid}">"myPage"</c:if>
      <c:if test="${user.userid!=sessionid}">"friendPage?num=${user.num}"</c:if>>
      
      ${user.userid}</a></td>
      <td width="150">${user.username}</td>
      <td align="center" width="50">${user.gender}</td>
      <td width="150">${user.position}</td>
      <td width="250">${user.reg_date}</td>
    </tr> 
    </c:forEach>
    
  </table>
  <br>
	<div class="w3-center">
			
		
			
			
			<c:if test="${count>0}">
			<c:if test="${startPage>bottomLine}">
			<a href = "allusers?pageNum=${startPage-bottomLine}">[이전]</a>
			</c:if>
			
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="allusers?pageNum=${i}">
				
				<c:if test="${i!=currentPage}">[${i}]</c:if>
				<c:if test="${i==currentPage}">
				<font color='deep-purple'>[${i}]</font></c:if></a>
			</c:forEach>
			
			<c:if test="${endPage<pageCount}">
			<a href="allusers?pageNum=${startPage+bottomLine}">[다음]</a>
			</c:if>
			</c:if>
	</div>
</div>

</body>
</html>