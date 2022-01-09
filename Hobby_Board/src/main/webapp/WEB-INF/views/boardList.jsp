<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="resources/css/style.css"/>
<title>[boardList.jsp]</title>


</head>
<body>
 <div class="title" style="padding-left: 50px;">Board&emsp;List</div>
    
  <table border="1" class="list-table" style="margin-top: 10px;" cellpadding="4px">
  	 <tr height=50>
  	 	<td colspan="6" style="padding-left: 10px;">
	  	 	<a href="boardWrite.sp" style="margin-right: 20px;">[Board Enroll]</a>
			<a href="boardList.sp">[Board List]</a>
  	 	</td>
  	 </tr>
   	 <tr height=50>
  	 	<td colspan="6">
  	 		<form name="myform" action="boardList.sp" style="display: inline; margin-left: 5px;">
				검색:
				<select name="keyfield" class="keyfield">
					<option value="">--검색기준--</option>				
					<option value="title">--제&ensp;목--</option>				
					<option value="name">--글쓴이--</option>				
				</select>			
				<input type="text" name="keyword" class="keyword">
				<input type="submit" value="검 색" class="btn">
			</form> 
	  	 	<div class="count">레코드개수: ${Gtotal}/${GGtotal} &nbsp;</div>  
  	 	</td>
  	 </tr>
  
     <tr bgcolor="mistyrose" height="50">
     	<td>번호</td> <td>이름</td> 
     	<td>제목</td> <td>성별</td> <td>취미</td>  <td>이미지</td> 
     </tr>  
     
   <c:forEach var="dto" items="${LG}">
     <tr>
     	<td>${dto.rn}</td>  <!-- 데이블 필드이름이랑 DTO변수 이름이랑 같으면 이렇게 편하게 불러올 수 있음 --> 
     	<td>${dto.name}</td> 
    	<td> <a href="boardDetail.sp?idx=${dto.hobby_idx}"> ${dto.title}</a><c:if test="${dto.rcnt>0}"><font style="color:salmon; font-size:14pt">&ensp;[${dto.rcnt}]</font></c:if></td> 
    	<td>${dto.gender}</td> 
    	<td>${dto.hobby}</td> 
    	<td align="center">
    		<img src="${pageContext.request.contextPath}/resources/upload/${dto.img_file_name}" width=50 height=40 border=0>
   		</td>
     </tr> 
   </c:forEach>
     
   	 <tr align="center" height=50>
  	 	<td colspan="6">
  	 	  <!-- 이전 -->
  	 	  <c:if test="${startPage > 10 }">
  	 		<a href="boardList.sp?pageNum=${startPage-10}">[이전]</a>		
  	 	  </c:if>
  	 	  <c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
  	 	   <c:choose>
  	 	    <c:when test="${i==pageNUM}">
				<font style="font-weight:bold; color:salmon;">[${i}]</font>
  	 		</c:when>
  	 		<c:otherwise>
  	 			<a href="boardList.sp?pageNum=${i}${returnpage}">[${i}]</a>
  	 		</c:otherwise>
  	 	   </c:choose>
  	 	  </c:forEach> 
  	 	  <!-- 다음 -->
  	 	  <c:if test="${endPage < pageCount}">
  	 		<a href="boardList.sp?pageNum=${startPage+10}">[다음]</a>		
  	 	  </c:if>
		</td>
  	 </tr>
</table>

<!-- <h2>  
	&emsp;&emsp;&emsp;
	현재날짜 및 시간 : ${serverTime} <br>
	<a href="boardWrite.sp">[board글쓰기]</a> &emsp;
	<a href="boardList.sp">[board전체출력]</a> &emsp;
	<a href="kakao.sp">[home]</a> &emsp;
	<a href="index.jsp">[index]</a> 
</h2> -->
</body>
</html>