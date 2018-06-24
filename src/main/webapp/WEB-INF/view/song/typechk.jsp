<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${chk==1}">

<script>
	alert("이미지 확장자는 jpg,png,jpeg,gif만 가능합니다 !");
	history.go(-1);
</script>
</c:if>

<c:if test="${chk==-1}">
<script>
	alert("음원/영상 확장자는 mp3,mp4,wav만 가능합니다 !");
	history.go(-1);
</script>
</c:if>


<c:if test="${chk==0}">
<script>
	alert("업로드 되었습니다 !");
	location.href="songlist";
</script>

</c:if>
</body>
</html>