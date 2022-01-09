<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
<link type="text/css" rel="stylesheet" href="resources/css/style.css"/>
 <title>boardEdit.jsp</title>
 
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(document).ready(function(){ 
	  var fileTarget = $('#files'); 
	  fileTarget.on('change', function(){ // 값이 변경되면
	      var cur=$(".info input[type='file']").val();
	    $(".upload-name").val(cur);
	  }); 
	}); 	
	
</script>
</head>

<body>
	<div class="box">
		<div class="box_menu" align="right">
			<a href="boardWrite.sp">[Board Enroll]</a> &ensp;
			<a href="boardList.sp">[Board List]</a> <p>
		</div>
		<div class="box_info">
		<br>
		<span class="box_title">${dto.name} 정보 수정</span><p/>
			<form method="post" enctype="multipart/form-data" action="boardEditSave.sp" >
				<div class="info">
					<span class="info_title"> 이름: </span>
					<input type="text" class="box_description" name="name" value="${dto.name}"><br/><br/>
				</div>
				<div class="info">
					<span class="info_title"> 제목: </span>
					<input type="text" class="box_description" name="title" value="${dto.title}"><br/><br/>
				</div>
				<div class="info">
					<span class="info_title"> 내용: <br/><br/><br/></span>
					<textarea class="box_description2" name="content">${dto.content}</textarea><br/>
				</div>
				<div class="info">
					<span class="info_title"> 성별: </span>
					    <c:choose>
				      		<c:when test="${dto.gender == 'man'}">
				      			<input type="radio" name="gender" value="man" checked>남자
				      		</c:when>
				      		<c:otherwise>
				      			<input type="radio" name="gender" value="man">남자
				      		</c:otherwise>
				      </c:choose>
				      <c:choose>
				      		<c:when test="${dto.gender == 'woman'}">
				      			<input type="radio" name="gender" value="woman" checked>여자
				      		</c:when>
				      		<c:otherwise>
				   				<input type="radio" name="gender" value="woman">여자
				      		</c:otherwise>
				      </c:choose> <br/><br/>
				</div>
				<div class="info">
					<span class="info_title"> 취미: </span>
					<input type="checkbox" name="hobby" value="game" id="hobby1" class="hobby"/><label for="hobby1">게임</label>&ensp;
      				<input type="checkbox" name="hobby" value="study" id="hobby2" class="hobby"><label for="hobby2">공부</label>&ensp;
      				<input type="checkbox" name="hobby" value="ski" id="hobby3" class="hobby"><label for="hobby3">스키</label>&ensp;
      				<input type="checkbox" name="hobby" value="movie" id="hobby4" class="hobby"><label for="hobby4">영화</label> <br/><br/>
				</div>
				<div class="info">
					<span class="info_title"> 파일: </span>
					<label for="files" class="files">파일 업로드</label>
					<input type="file" id="files" class="files" name="upload_f">
					<input class="upload-name" value="기존 이미지: ${dto.img_file_name}" disabled> <br/><br/>
					<input type="hidden" name="hobby_idx" value="${dto.hobby_idx}">
				</div>
				<div class="btn_box">
				<input type="submit" class="btn"value="데이터 수정">
				&emsp;&emsp;&emsp;
				<input type="reset" class="btn" value="입력취소">
				</div>
				<br><br>						
			</form>
		</div>
	</div>
</body>
</html>