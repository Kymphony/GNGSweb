<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType= "text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<script>
function button_memberjoin(){
	
	var open_memberjoin;
	var url_memberjoin = 'http://localhost:8888/web/memberjoin';
	var title_memberjoin = '회원가입';
	var status_memberjoin = 'height=500, width=500, location=no, resizable=yes';
	open_memberjoin = window.open(url_memberjoin, title_memberjoin, status_memberjoin);
}

function button_login(){
	
	var open_login;
	var url_login = 'http://localhost:8888/web/login';
	var title_login = '로그인';
	var status_login = 'height=300, width=500, locatiin=no, resizable=yes';
	open_login = window.open(url_login, title_login, status_login);
	
}
</script>
<head>
	<title>홈 페이지</title>
</head>
<body>
<div>
<span><a href= "javascript: button_login()">로그인</a></span>      <span><a href= "javascript:button_memberjoin()">회원가입</a></span>
</div>
<h1>
	군산 교회 홈페이지에 오신걸 환영합니다! 
</h1>
</body>
</html>
