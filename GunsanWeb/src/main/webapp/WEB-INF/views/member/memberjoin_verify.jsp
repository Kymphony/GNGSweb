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
	<td>${name}</td>
	<td>${member.name}</td>
</tr>
<tr>
	<td>아이디</td>
	<td>${id}</td>
	<td>${member.id}</td>
</tr>
<tr><!-- "1","2"로 표현되는걸 남, 여로 표현하기 -->
	<td>생년월일</td>
	<td>${birth}</td>
	<td>${member.birth}</td>
</tr>
<tr>
	<td>성별</td>
	<c:if test = "${sex == '1'}">
		<td><p>남</p></td>
	</c:if>
	<c:if test = "${sex == '2'}">
		<td><p>여</p></td>
	</c:if>
	<c:if test = "${member.sex == '1'}">
		<td><p>남</p></td>
	</c:if>
	<c:if test = "${member.sex == '2'}">
		<td><p>여</p></td>
	</c:if>
</tr>
<tr>
	<td>전화번호</td>
	<td>${phone}</td>
	<td>${member.phone_number}</td>
</tr>
<tr>
	<td>
		<input type="button" onclick="history.back()" value="수정하기">
	</td>
	<td>
		<input type="button" onclick="location.href='http://localhost:8888/web/memberjoinfinal'" value="확인">
	</td>
</tr>
</table>
</div>
</body>
</html>
