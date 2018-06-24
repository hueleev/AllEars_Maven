
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
<form method="post" action="msgUpdatePro" >
	<input type="hidden" name="gboardid" value="${gboardid}">
	<input type="hidden" name="gnum" value="${msg.gnum}">
	<input type="hidden" name="ref" value="${msg.ref}">
	<input type="hidden" name="re_step" value="${msg.re_step}">
	<input type="hidden" name="re_level" value="${msg.re_level}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	
  <div class="w3-container w3-center" style="margin-top:10%;">
				<h3><b>글 수정</b></h3><br>
		<table align="center" cellspacing="10" class="w3-card w3-round w3-white w3-padding-large"  style="width:50%">
		 

		   <tr>
		      	<td><b>번호</b></td>
		 		<td align="left">${msg.gnum}</td>
		      	<td><b>작성자</b></td>
		 		<td align="left">${msg.writer}</td>
		
		   </tr>
             
           
			<tr>
				<td><b>작성일</b></td>
                <td colspan="3" align="left">${msg.greg_date}</td>
                   
			</tr>
		   
		   	<tr>
				<td><b>제목</b></td>
                   <td colspan="3" align="left">
                   <input class="w3-input w3-animate-input" name="gtitle" style="width:50%" type="text" value="${msg.gtitle}" required></td>
			</tr>
			
		   
		   <tr>
		   <td><b>이메일</b></td>
              <td colspan="3" align="left">
              <input class="w3-input w3-animate-input" name="gemail" style="width:50%" type="email" value="${msg.gemail}"></td>
		   </tr>

               <tr>
               	<td><b>내용</b></td>
                   <td colspan="3" align="left">
                   <textarea class="w3-input w3-border w3-margin-bottom" name="gcontent" rows="10" cols="25">${msg.gcontent}</textarea>
                   </td>
               </tr>
			
 				<tr height="30">
 				 <td colspan="4" class="w3-center">
 				 

			   <input class="w3-btn w3-round w3-metro-yellow w3-hover-white"
			   type="submit" value="수정">
			   &nbsp;&nbsp;
			   <input class="w3-btn w3-round w3-red w3-hover-white"
			   type="reset" value="다시작성">
			   &nbsp;&nbsp;
			   <input class="w3-btn w3-round w3-dark-grey w3-hover-white"
			   type="button" OnClick="window.location='guestlist?pageNum=${pageNum}&gboardid=${gboardid}'" value="목록">
			   
			</td></tr>
		</table>
		</div>

</form>
</body>
</html>