
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



<div class="w3-container" style="width:50%; margin-left:25%; margin-top:15%;">	
  <h3 class="w3-center"><b>${gboardid}님의 방명록 : ${count}</b></h3><br>
  <table class="w3-table w3-white w3-padding-large w3-bordered w3-hoverable">
    <thead>
      <tr class="w3-light-grey">
        <th align="center" width="100">번호</th>
        <th align="center" width="300">제목</th>
        <th align="center" width="200">작성자</th>
        <th align="center" width="200">작성일</th>
      </tr>
    </thead>
    
	   <c:forEach var="msgList" items="${msgList}">
		    <tr>
	    	<td align="center" width="100">${number}</td>
				<c:set var="number" value="${number-1}"/>
			<td width="300">
			
				<c:if test="${msgList.re_level>0}">
					<img src="/AllEars/img/level.gif" alt="dd"
					width="${5*msgList.re_level}" height="16">
					<img src="/AllEars/img/re.gif">
				</c:if>
			
	     		<c:if test="${msgList.re_level==0}">
				</c:if>
	      
      
      <a href="msgcontent?gnum=${msgList.gnum}&pageNum=${currentPage}&number=${number+1}&gboardid=${gboardid}">
      ${msgList.gtitle}</a></td>
      <td width="200">${msgList.writer}</td>
      <td width="200">${msgList.greg_date}</td>
    </tr> 
    </c:forEach>
    
  </table>
  <br>
	<div class="w3-center">

			<c:if test="${count>0}">
			<c:if test="${startPage>bottomLine}">
			<a href = "guestlist?pageNum=${startPage-bottomLine}&gboardid=${gboardid}">[이전]</a>
			</c:if>
			
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="guestlist?pageNum=${i}&gboardid=${gboardid}">
				
				<c:if test="${i!=currentPage}">[${i}]</c:if>
				<c:if test="${i==currentPage}">
				<font color='deep-purple'>[${i}]</font></c:if></a>
			</c:forEach>
			
			<c:if test="${endPage<pageCount}">
			<a href="guestlist?pageNum=${startPage+bottomLine}&gboardid=${gboardid}">[다음]</a>
			</c:if>
			</c:if>
	</div>
	
	<c:if test="${sessionScope.sessionid!=null}">
    	<input type="button" onclick="document.location.href='writeform_g?gboardid=${gboardid}&pageNum=${pageNum}'"
    	class="w3-btn w3-round w3-metro-yellow w3-hover-white w3-right" value="글작성">
	</c:if>
	
</div>

</body>
</html>