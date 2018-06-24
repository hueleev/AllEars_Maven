<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${result}">
 	<center>
 	<br/><br/>
 	<h4>이미 사용중인 ID입니다.</h4>
 	</center>
</c:if>

<c:if test="${!result}">
	<center>
	<br/><br/>
	<h4>입력하신  ${userid}는 사용할 수 있는 ID입니다.</h4>
	</center>

</c:if>
</body>
</html>