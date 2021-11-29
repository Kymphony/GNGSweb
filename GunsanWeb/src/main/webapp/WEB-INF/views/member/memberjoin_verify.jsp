<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType= "text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>가입정보 확인</title>
</head>
<body>
<div>
<p>이대로 진행하시겠습니까?</p>
</div>
<div>

<table>
<tr>
	<td>이름</td>
	<td>${sessionScope.name}</td>
</tr>
<tr>
	<td>아이디</td>
	<td>${sessionScope.id}</td>
</tr>
<tr><!-- "1","2"로 표현되는걸 남, 여로 표현하기 -->
	<td>생년월일</td>
	<td>${sessionScope.birth}</td>
</tr>
<tr>
	<td>성별</td>
	<c:if test = "${sessionScope.gender == '1'}">
		<td><p>남</p></td>
	</c:if>
	<c:if test = "${sessionScope.gender == '2'}">
		<td><p>여</p></td>
	</c:if>
</tr>
<tr>
	<td>전화번호</td>
	<td>${sessionScope.phone}</td>
</tr>
<tr>
	<td>
		<input type="button" onclick="history.back()" value="수정하기">
	</td>
	<td>
	<input type="button" id="save_to_db_button" value="확인">
	</td>
</tr>
</table>
</div>
</body>
<script src ="resources/js/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	
	// bind event to [save_to_db_button]
	$('#save_to_db_button').on('click', ajax_sending_precess);
	
});
		
// sending data to Controller through ajax
function ajax_sending_precess(){
	
	console.log('start ajax process to sending member data to controller');
	
	// get input data from session
	var member_name = '<%=(String)session.getAttribute("name")%>';
	var member_id = '<%=(String)session.getAttribute("id")%>';
	var member_pw = '<%=(String)session.getAttribute("pw")%>';
	var member_birth = '<%=(String)session.getAttribute("birth")%>';
	var member_gender = '<%=(String)session.getAttribute("gender")%>';
	var member_phone = '<%=(String)session.getAttribute("phone")%>';
	
	// get member data from session
	$.ajax({
		url:			'memberjoinfinal',
		type:			'POST',
		dataType:		'text',
		data:			{name: member_name, id: member_id, pw: member_pw, birth: member_birth, gender: member_gender, phone_number: member_phone},
		success:		function(){
							console.log('succeed to sending member data to controller through ajax');
							// initialize session
							<%
								session.invalidate();
							%>
							console.log('succeed to initializing session');
							
							// move to memberjoin_final.jsp
							var url = 'http://localhost:8888/web/thankyouforjoin';
							location.href = url;
							
						},
		error:			function(e){alert(JSON.stringfy(e));}
	});
}
</script>
</html>
