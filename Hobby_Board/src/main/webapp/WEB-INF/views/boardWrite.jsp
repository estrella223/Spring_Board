<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
<link type="text/css" rel="stylesheet" href="resources/css/style.css"/>
<title>boardWrite.jsp</title>
 
<!-- jquery 라이브러리 가져오는것 -->	
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
		<span class="box_title">Board Enroll</span><p/>
			<form method="post" enctype="multipart/form-data" action="boardInsert.sp" >
				<div class="info">
					<span class="info_title"> 이름: </span>
					<input type="text" class="box_description" name="name" placeholder="이름을 입력하세요"><br/><br/>
				</div>
				<div class="info">
					<span class="info_title"> 제목: </span>
					<input type="text" class="box_description" name="title" placeholder="제목을 입력하세요"><br/><br/>
				</div>
				<div class="info">
					<span class="info_title"> 내용: <br/><br/><br/></span>
					<textarea class="box_description2" name="content" placeholder="내용을 입력하세요"></textarea><br/>
				</div>
				<div class="info">
					<span class="info_title"> 성별: </span>
					<input type="radio" name="gender" value="man" id="gender1" class="gender"><label for="gender1">남자</label> &ensp;
     				<input type="radio" name="gender" value="woman" id="gender2" class="gender"><label for="gender2">여자</label> <br/><br/>
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
					<input class="upload-name" value="파일 이름" disabled> <br/><br/>
				</div>
				<div class="btn_box">
				<input type="submit" class="btn"value="데이터 저장">
				&emsp;&emsp;&emsp;
				<input type="reset" class="btn" value="입력취소">
				</div>
				<br><br>						
			</form>
		</div>
	</div>

</body>
</html>