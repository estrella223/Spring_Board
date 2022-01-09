<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title> [board_reply.jsp]</title>
<link type="text/css" rel="stylesheet" href="resources/css/style.css"/>

<!-- jquery 라이브러리 가져오는것 -->	
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script type="text/javascript">
	 function replyEdit(rhobby_idx, rwriter,rmemo,hobby_idx){ 
		 $("#rwriter"+rhobby_idx).html(
		   "<input type='text' id='edit_writer"+rhobby_idx+"' value='" + rwriter + "' required  size=10>"		 
		 );
	  
		 $("#rmemo"+rhobby_idx).html(
		  "<input type='text' id='edit_memo"+rhobby_idx+"' value='" + rmemo + "' required  size=10>"		 
		);
		 
		 $("#rbt"+rhobby_idx).html(
		   "<input type='button' class='btn_edit' onClick='replyEditSave("+rhobby_idx+","+hobby_idx+")' id='btnEdit'  value='수정' size=10>&nbsp;"+
		   "<a href='javascript:location.reload();'><input type='button' class='btn_edit' onClick='replyEditSave("+rhobby_idx+","+hobby_idx+")' id='btnEdit'  value='취소' size=10></a>"
		);
	 }//end
	 
	 function replyEditSave(rhobby_idx,hobby_idx){
	   var rwriter = $("#edit_writer"+rhobby_idx).val();
	   var rmemo = $("#edit_memo"+rhobby_idx).val();
	   location.href="boardreply_edit.sp?rhobby_idx="+rhobby_idx+"&rwriter="+rwriter+"&rmemo="+rmemo+"&hobby_idx="+hobby_idx;
	 }//end
  </script>
</head>
<body>
  
<br>
<form  method="get"  action="boardreply.sp" >
  <table width="700"  border='0' cellspacing="0" cellpadding="7px">
 	<tr bgcolor="mistyrose">
 	  <td>
 	  	<div class="detail-name">댓글 입력</div>
 	  	<div class="change">
 	  		<button class="btn3" type="submit">댓글 등록</button>
 	  	</div>
 	  </td>
 	</tr>
 	<tr>
 	  <td>닉네임:
 		<input type="text" name="rwriter" size=70>
 		<input type="text" name="hobby_idx" value="${dto.hobby_idx}" style="display: none;">
 	  </td>
 	</tr>
 	<tr>
 	  <td>
 		<div style="display: inline-block;">내&emsp;용:<br/><br/></div> 
 		<textarea name="rmemo" cols="73" rows="2" class="reply_text"></textarea>
 	  </td>
 	</tr>
  	<tr>
	  	<td>
 		     
	 	</td>
	</tr>
  </table>
 </form>

 
 <p>
  <table width="750"  border='0' cellspacing="0" cellpadding="7px">
   <tr  bgcolor="mistyrose"  height='40'>
     <td>Index</td>
   	 <td>닉네임</td>
   	  <td>댓글 내용</td>
   	  <td></td>      
   </tr>
  <c:forEach var="rdto" items="${rLG}">
  <tr  
    onMouseOver="style.background='#f3f3f3'" 
    onMouseOut="style.background='' "
  >
  	<td width=50> ${rdto.rrn}  </td> 
  	<td width=50 style="display: none;"> ${rdto.rhobby_idx}  </td> 
    <td width=100 id="rwriter${rdto.rhobby_idx}"> ${rdto.rwriter}  </td> 
 	<td width=200 id="rmemo${rdto.rhobby_idx}"> ${rdto.rmemo} </td>
 	<td width=250 id="rbt${rdto.rhobby_idx}" align="right"> 
 	   <input type="button" class="btn" onclick="location.href='boardreply_delete.sp?Ridx=${rdto.rhobby_idx}&idx=${rdto.hobby_idx}'" value="삭제">
	   <input type="button" class="btn" onClick="replyEdit('${rdto.rhobby_idx}','${rdto.rwriter}','${rdto.rmemo}', '${rdto.hobby_idx}')" value="수정">    
 	 </td>       
  </tr>
  </c:forEach>

</table>	
</body>
</html>