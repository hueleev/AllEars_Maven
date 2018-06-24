
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

  <div class="w3-container w3-center" style="margin-top:15%;">
		<i class="fa fa-bookmark-o" style="font-size:70px;">&nbsp;</i>
   <i class="fa fa-bookmark" style="font-size:70px;">&nbsp;</i>
    <i class="fa fa-bookmark-o" style="font-size:70px;">&nbsp;</i>
    <br><br>
		<table align="center" cellspacing="10" class="w3-card w3-round w3-white w3-padding-large"  style="width:50%" cellspacing="15">
		 

		   <tr>
		      	<td><b>작성자</b></td>
		 		<td align="left">${msg.writer}</td>
		 		<td><b>작성일</b></td>
                <td colspan="3" align="left">${msg.greg_date}</td>
		   </tr>
             
   
		   
		   <c:if test="${msg.gemail!=null}">
		   <tr>
		   <td><b>이메일</b></td>
              <td colspan="3" align="left">${msg.gemail}</td>
		   </tr>
		  
		   </c:if>
		   

			<tr>
				<td><b>제목</b></td>
                   <td colspan="3" align="left">${msg.gtitle}</td>
                   
			</tr>
               
               <tr>
               	<td><b>내용</b></td>
                   <td colspan="3" align="left"><span>${msg.gcontent}</span></td>
               </tr>
			
 				<tr height="30">
 				 <td colspan="4" class="w3-center">
 				 
			<c:if test="${sessionScope.sessionid eq msg.writer}">
			 
			  
			   <input class="w3-btn w3-round w3-metro-yellow w3-hover-white"
			   type="button" value="수정"
			   onclick="document.location.href='msgUpdateForm?gnum=${msg.gnum}&pageNum=${pageNum}&gboardid=${msg.gboardid}'">
			   &nbsp;&nbsp;
			</c:if>
			
			
			
			<c:if test="${sessionScope.sessionid!=null}">
			<input type="button" value="답글" class="w3-btn w3-round w3-dark-grey w3-hover-white"
			onclick="document.location.href='writeform_g?gnum=${msg.gnum}&ref=${msg.ref}&re_step=${msg.re_step}&re_level=${msg.re_level}&pageNum=${pageNum}'">
				&nbsp;&nbsp;
			</c:if>
			
			<c:if test="${sessionScope.sessionid eq msg.writer || sessionScope.sessionid eq 'admin' || sessionScope.sessionid eq msg.gboardid}">
			
			<input class="w3-btn w3-round w3-red w3-hover-white"
			   type="button" value="삭제" onclick="document.location.href='msgdeleteForm?gnum=${msg.gnum}&pageNum=${pageNum}&gboardid=${msg.gboardid}'">
			   &nbsp;&nbsp;
			</c:if>
			
			<input class="w3-btn w3-round w3-metro-yellow w3-hover-white"
			type="button" value="목록"
			onclick="document.location.href='guestlist?pageNum=${pageNum}&gboardid=${msg.gboardid}'">
			</td></tr>
		</table>
		</div>


</body>
</html>