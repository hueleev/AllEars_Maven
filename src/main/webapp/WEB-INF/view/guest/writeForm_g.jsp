<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-metro.css">


</head>
<script type="text/javascript">

	function checkValue()
	{
		
		if (document.guest.gtitle.value=="") {
			alter("제목을 입력하세요.");
			return;
		}
		
		if (document.guest.gcontent.value=="") {
			alter("내용을 입력하세요.");
			return;
		}

		alert("업로드 되었습니다 !"); 
		
	}
		
	
	
</script>
<%@include file="/common/variable.jspf" %>
<%@include file="/common/footer.jspf" %>
<body>

	
<div class="w3-container w3-center" style="margin-top:10%">

   <i class="fa fa-sticky-note" style="font-size:70px;">&nbsp;</i>
   <i class="fa fa-sticky-note-o" style="font-size:70px;">&nbsp;</i>
    <i class="fa fa-pencil" style="font-size:70px;">&nbsp;</i>
    <br><br>
<form method="post" name="guest" action="writePro_g" onsubmit="return checkValue()">
  <table align="center" cellspacing="10" class="w3-card w3-round w3-white w3-padding-large" style="width:40%;">
  
	<input type="hidden" name="writer" value="${sessionScope.sessionid}">
	<input type="hidden" name="gnum" value="${gnum}">
	<input type="hidden" name="gboardid" value="${gboardid}">
	<input type="hidden" name="ref" value="${ref}">
	<input type="hidden" name="re_step" value="${re_step}">
	<input type="hidden" name="re_level" value="${re_level}">

    
    
	<c:if test="${gnum==null}">
		<tr>
			<td colspan="2"><h2><b>To. ${gboardid}</b></h2></td>
		</tr>
		<tr>
	      <td><b>제목</b>&nbsp;&nbsp;<a style="color:red">*</a></td>
	      <td><input class="w3-input w3-animate-input" name="gtitle" style="width:50%" type="text" required></td>
	    </tr>
    </c:if>
	<c:if test="${gnum!=null}">
		<tr>
	      <td><b>제목</b>&nbsp;&nbsp;<a style="color:red">*</a></td>
	      <td><input class="w3-input w3-animate-input" name="gtitle" style="width:50%" type="text" value="[답글]" required></td>
	    </tr>
	</c:if>
	
	
			<tr>
	      <td><b>이메일</b>&nbsp;&nbsp;</td>
	      <td><input class="w3-input w3-animate-input" name="gemail" style="width:50%" type="email"></td>
	    </tr>
	
    <tr>
      <td><b>내용</b>&nbsp;&nbsp;<a style="color:red">*</a></td>
      <td><textarea class="w3-input w3-border w3-margin-bottom" name="gcontent" rows="10" cols="25"></textarea></td>
    </tr>
    
    <tr>
       <td></td>
       <td><button class="w3-btn w3-round w3-metro-yellow w3-hover-white" type="submit">업로드</button>
		&nbsp;&nbsp;&nbsp;
		<input type="reset" class="w3-btn w3-round w3-red w3-hover-white" value="다시 작성">
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="목록보기" class="w3-btn w3-round w3-dark-grey w3-hover-white" OnClick="window.location='guestlist?gboardid=${gboardid}'">
		
    <tr>
    

  </table>
</form>
</div>

</body>
</html>