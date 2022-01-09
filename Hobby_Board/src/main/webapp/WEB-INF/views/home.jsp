<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%-- <%@ page session="false" %> --%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  비트캠프 501호
</h1>

<h2>  
	현재날짜 및 시간 : ${serverTime} <br>
	<a href="boardWrite.sp">[board글쓰기]</a> 
	<a href="boardList.sp">[board전체출력]</a> 
	<a href="kakao.sp">[home]</a> 
	<a href="http://www.daum.net">[daum]</a> 
</h2>
</body>
</html>
