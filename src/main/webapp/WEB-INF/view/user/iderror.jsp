<%@page import="Userlist.UserlistDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body >

<c:if test="${pwcheck==-1}">
	<script>
		alert("가입되지 않은 아이디입니다 -");
		history.go(-1);
	</script>
</c:if>

<c:if test="${pwcheck==0}">

	<script>
	alert("비밀번호가 틀립니다 -");
	history.go(-1);
	</script>
</c:if>


	


</body>
</html>