<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType= "text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<script>

function join_input_check(){
	
	var name = document.getElmentById('join_name');
	var id = document.getElmentById('join_id');
	var pw = document.getElmentById('join_pw');
	var pw_check = document.getElmentById('join_pw_check');
	var birth = document.getElmentById('join_birth');
	var sex = document.getElmentById('join_sex');
	var phone = document.getElmentById('join_phone');
	
	// 1) null check
	if (name.value == '' || name.value = null){
		alert('이름을 입력하세요');
		return false;
	} else if (id.value == '' || id.value = null){
		alert('아이디를 입력하세요');
		return false;
	} else if (pw.value == '' || pw.value = null){
		alert('비밀번호를 입력하세요');
		return false;
	} else if (pw_check.value == '' || pw_check.value = null){
		alert('비밀번호 확인란을 입력하세요');
		return false;
	} else if (birth.value == '' || birth.value = null){
		alert('생년월일을 입력하세요');
		return false;
	} else if (sex.value == '' || sex.value = null){
		alert('성별을 입력하세요');
		return false;
	} else if (phone.value == '' || phone.value = null){
		alert('전화번호를 입력하세요');
		return false;
	}
	
	// 2) password check
	if (pw.value != pw_check.value){
		alert('비밀번호가 서로 일치하지 않습니다');
		return false;
	} else if(){
		alert('비밀번호는 영문과 숫자 조합으로 입력해주세요');
		return false;
	}
	
	// 3) space or tab check
	var pattern = /\s/g; // regexp for tab and space
	
	if (name.vaule.match(pattern)){
		alert('이름에 공백을 입력할 수 없습니다');
		return false;
	} else if (id.vaule.match(pattern)){
		alert('아이디에 공백을 입력할 수 없습니다');
		return false;
	} else if (pw.vaule.match(pattern)){
		alert('비밀번호에 공백을 입력할 수 없습니다');
		return false;
	} else if (pw_check.vaule.match(pattern)){
		alert('비밀번호 확인란에 공백을 입력할 수 없습니다');
		return false;
	} else if (birth.vaule.match(pattern)){
		alert('생년월일에 공백을 입력할 수 없습니다');
		return false;
	} else if (sex.vaule.match(pattern)){
		
		//시스템 장해이므로 별도의 처리 필요
		
		return false;
	} else if (phone.vaule.match(pattern)){
		alert('전화번호에 공백을 입력할 수 없습니다');
		return false;
	}
	
	// 4) number of characters check
	var id_min = 6;
	var id_max = 18;
	var name_min = 2;
	var name_max = 5;
	var pw_min = 8;
	var pw_max = 18;
	var birth_number_check = 8;
	var sex_min = 4;
	var sex_max = 6;
	var phone_number_check = 11;
	
	if (id.value.length < id_min || id.value.length > id_max){
		alert('아이디는 ' + id_min +'자 이상, ' + id_max + '자 이내로 입력해 주세요');
		return false;
	} else if (name.value.length < name_min || name.value.length > name_max){
		alert('이름은 ' + name_min +'자 이상, ' + name_max + '자 이내로 입력해 주세요');
		return false;
	} else if (pw.value.length < pw_min || pw.value.length > pw_max){
		alert('비밀번호는 ' + pw_min +'자 이상, ' + pw_max + '자 이내로 입력해 주세요');
		return false;
	} else if (sex.value.length < sex_min || sex.value.length > sex_max){
		alert('성별은 ' + sex_min +'자 이상, ' + sex_max + '자 이내로 입력해 주세요');
		return false;
	} else if (birth.value.length != birth_number_check){
		alert('생년월일은 ' + birth_number_check + '자로 입력해 주세요');
		return false;
	} else if (phone.value.length != phone_number_check){
		alert('전화번호는 ' + phone_number_check + '자로 입력해 주세요');
		return false;
	}
	
	
	 
	
	
}

</script>
<head>
	<title>회원가입</title>
</head>
<body>
<div style='margin-top: 40px'>
<form action="memberjoin" method="post" onsubmit="return join_input_check()">
	<table>
		<tr>
			<td>이름</td><%-- 한글만 입력 가능하도록 upgrade --%>
			<td><input type="text" id="join_name" name="join_name" maxlength="5"></td>
		</tr>
		<tr>
			<td>아이디</td><%-- 6-18자, 영어 대소문자, 숫자만 입력 가능하도록 upgrade --%>
			<td><input type="text" id="join_id" name="join_id" maxlength="18"></td>
		</tr>
		<tr>
			<td>비밀번호</td><%-- 8-18자, 영문 대소문+숫자만 입력 가능하도록 upgrade --%>
			<td><input type="password" id="join_pw" name="join_pw" maxlength="18" placeholder="영문+숫자 조합으로 입력"></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td><%-- 8-18자, 영문 대소문+숫자만 입력 가능하도록 upgrade --%>
			<td><input type="password" id="join_pw_check" name="join_pw_check" maxlength="18" placeholder="영문+숫자 조합으로 입력"></td>
		</tr>
		<tr>
			<td>생년월일</td><%-- 6자만 가능, 숫자만 입력하도록 upgrade --%>
			<td><input type="text" id="join_birth" name="join_birth" maxlength="6" placeholder="yymmdd형식으로 6자리 입력"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				남<input type="radio" name="join_sex" value="male">
				여<input type="radio" name="join_sex" value="female">
			</td>
		</tr>
		<tr>
			<td>휴대전화</td><%-- 11자만 가능, 숫자만 입력하도록 upgrade --%>
			<td><input type="tel" id="join_phone" name="join_phone" maxlength="11" placeholder="'-'없이 번호만 입력"></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2" align="center"><input type="submit" value="회원 등록"></td>
		</tr>
	</table>
</form>
</div>
</body>
</html>
