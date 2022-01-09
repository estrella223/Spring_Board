<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>boardDetail.jsp</title>
 <style type="text/css">
 	a{
		color: blueviolet !important;
	}
	td{
		padding-left: 20px !important;
	}
 </style>
<link type="text/css" rel="stylesheet" href="resources/css/style.css"/>

</head>
<body>
<div class="title" style="padding-left: 40px;">Board&emsp;Detail</div><br>
<table border="1" cellspacing="0" cellpadding="8px">
 	<tr>
  	    <td colspan="2" bgcolor="mistyrose"> 
  	   	    <a href="boardWrite.sp">[Board Enroll]</a>&emsp;
		    <a href="boardList.sp">[Board List]</a>&emsp;
	    </td>
  	</tr>
 	<tr>
  	    <td colspan="2" bgcolor="mistyrose"> 
  	    	<div class="detail-name"> 제&ensp;목: ${dto.title} </div>
  	   	    <div class="change">
		  	    <button class="btn3"><a href="boardDelete.sp?idx=${dto.hobby_idx}" style="color: firebrick !important;">삭제</a></button>&emsp;
  	   	  		<button class="btn3"><a href="boardEdit.sp?idx=${dto.hobby_idx}" style="color:firebrick !important;">수정</a></button>
  	   	    </div>	
		</td>
  	</tr>
  	<tr>
  		<td> 이&ensp;름: ${dto.name} </td>
  		<td width="250" rowspan="4" align="center" style="padding-left: 8px !important;" >
  		 <a href="download.sp?fname=${dto.img_file_name}">
  		 <img src="${pageContext.request.contextPath}/resources/upload/${dto.img_file_name}"  width="350" height="230">
  		 </a> 
  		</td> 
  	</tr> 	
  	<tr>
  	   <td> 성&ensp;별: ${dto.gender} </td>
  	</tr>
   	<tr>  
  	   <td> 취&ensp;미: ${dto.hobby } </td>
  	</tr>
  	<tr>
  	   <td> 내&ensp;용: ${dto.content} </td>
  	</tr>

 </table>

<c:import url="/boardreply_list.sp" />

</body>
</html>







