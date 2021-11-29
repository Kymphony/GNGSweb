<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<script src ="resources/js/jquery-3.4.1.min.js"></script>
<script>
	// $(document).ready(function(){
	// alert('jquery 실행!');
	// });


function login_input_check(){
	
	var id = document.getElementById('login_id');
	var pw = document.getElementById('login_pw');
	
	// 1) valid check
	if (id.value == '' || id.value == null){
		
		alert('아이디를 입력하세요');
		return false;
	}
	if (pw.value == '' || pw.value == null){
		
		alert('비밀번호를 입력하세요');
		return false;
	}
	
	// 2) space or tab check  -> 애초에 화면 딴에서 입력 못하게 막겠지만 2차 방지 차원
	var pattern = /\s/g; // regexp for tab and space
	
	if (id.value.match(pattern)){
		alert('아이디에 공백을 입력할 수 없습니다');
		return false;
	}
	if (pw.value.match(pattern)){
		alert('비밀번호에 공백을 입력할 수 없습니다');
		return false;
	}
	
	// 3) number of characters check
	var id_minimum = 6;
	var id_maximum = 18;
	var pw_minimum = 8;
	var pw_maximum = 18;
	
	if (id.value.length < id_minimum || id.value.length > id_maximum){
		alert('아이디는 '+ id_minimum +'자 이상, '+ id_maximum +'자 이내로 입력해 주세요');
		return false;
	}
	if (pw.value.length < pw_minimum || pw.value.length > pw_maximum){
		alert('비밀번호는 '+ pw_minimum +'자 이상, '+ pw_maximum +'자 이내로 입력해 주세요');
		return false;
	}
	
	// input check all pass
	return true;
}
</script>
<head>
<title>로그인</title>
</head>
<body>
	<div style='margin-top: 40px;'>
		<form action="" method="post" onsubmit="return login_input_check()">
			<table>
				<tr>
					<td><p>아이디</p></td>
					<td><input type="text" id="login_id" name="login_id"></td>
				</tr>
				<tr>
					<td><p>비밀번호</p></td>
					<td><input type="text" id="login_pw" name="login_pw"></td>
				</tr>
				<tr>
					<td>아이디 기억하기<input type="checkbox" id="login_save_id" name="login_save_id" value="save"></td>
					<td>비밀번호 기억하기<input type="checkbox" id="login_save_pw" name="login_save_pw" value="save"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="로그인"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<span onclick="location.href = 'http://localhost:8888/web/findaccount'" style="color: orange; cursor: pointer;">아이디/비밀번호 찾기</span>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<span>아이디가 없으신가요?</span>
						<span onclick="location.href = 'http://localhost:8888/web/memberjoin'" style="color: blue; cursor: pointer;">가입하기</span>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
