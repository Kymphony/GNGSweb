<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType= "text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<title>회원가입</title>
</head>
<body>
<div style='margin-top: 40px'>
<form action="memberjoinverify" method="post" onsubmit="return join_input_check()">
	<table>
		<tr>
			<td>이름</td><%-- 한글만 입력 가능하도록 upgrade --%>
			<td><input type="text" id="join_name" name="join_name" maxlength="5"></td>
		</tr>
		<tr>
			<td>아이디</td><%-- 6-18자, 영어 대소문자, 숫자만 입력 가능하도록 upgrade --%>
			<td><input type="text" id="join_id" name="join_id" maxlength="18"></td>
			<td><input type="button" id="join_id_db_check" onclick="id_db_check()" value="중복확인"></td>
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
				남<input type="radio" name="join_gender" value="1" checked>
				여<input type="radio" name="join_gender" value="2">
			</td>
		</tr>
		<tr><%-- 휴대전화 본인인증 기능 추가 --%>
			<td>전화번호</td><%-- 11자만 가능, 숫자만 입력하도록 upgrade --%>
			<td><input type="tel" id="join_phone" name="join_phone" maxlength="11" placeholder="'-'없이 번호만 입력"></td>
			<td><input type="button" id="join_pb_db_check" onclick="pb_db_check()" value="중복확인"></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2" align="center"><input type="submit" value="회원 등록"></td>
		</tr>
	</table>
</form>
</div>
</body>
<script src ="resources/js/jquery-3.4.1.min.js"></script>
<script>

// 아이디 중복 확인 여부
var id_check_flg = false;
// 전화번호 중복 확인 여부
var pb_check_flg = false;
// 아이디 입력값 변경 여부 확인용 전역변수
var id_value_temp;
// 전화번호 입력값 변경 여부 확인용 전역변수
var pb_value_temp;


// 입력 체크
function join_input_check(){
	
	console.log('----FUNCTION START: join_input_check()----');
	
	var name = document.getElementById('join_name');
	var id = document.getElementById('join_id');
	var pw = document.getElementById('join_pw');
	var pw_check = document.getElementById('join_pw_check');
	var birth = document.getElementById('join_birth');
	var phone = document.getElementById('join_phone');
	
	var gender_length = document.getElementsByName('join_gender').length;
	var gender_value;
	
	for (var i = 0 ; i < gender_length ; i++){
		
		if (document.getElementsByName('join_gender')[i].checked == true){
			gender_value = document.getElementsByName('join_gender')[i].value;
		}
	}

	console.log('name: ' + name.value);
	console.log('id: ' + id.value);
	console.log('pw: ' + pw.value);
	console.log('pw_check: ' + pw_check.value);
	console.log('birth: ' + birth.value);
	console.log('phone: ' + phone.value);
	console.log('gender_value: ' + gender_value);
	
	
	
	// 1) null check
	if (name.value == '' || name.value == null){
		alert('이름을 입력하세요');
		name.focus();
		return false;
	} else if (id.value == '' || id.value == null){
		alert('아이디를 입력하세요');
		id.focus();
		return false;
	} else if (pw.value == '' || pw.value == null){
		alert('비밀번호를 입력하세요');
		pw.focus();
		return false;
	} else if (pw_check.value == '' || pw_check.value == null){
		alert('비밀번호 확인란을 입력하세요');
		pw_check();
		return false;
	} else if (birth.value == '' || birth.value == null){
		alert('생년월일을 입력하세요');
		birth.focus();
		return false;
	} else if (phone.value == '' || phone.value == null){
		alert('전화번호를 입력하세요');
		phone.focus();
		return false;
	}
	
	console.log(' 1) null check pass ');
	
	
	
	// 2) password check
	var regexp_for_engnum = /^[A-Za-z0-9+]*$/;
	

	if (pw.value != pw_check.value){
		console.log('비밀번호가 서로 일치하지 않습니다');
		alert('비밀번호가 서로 일치하지 않습니다');
		pw_check.focus();
		return false;
	}
	if (!pw.value.match(regexp_for_engnum)){
		console.log('비밀번호는 영문과 숫자 조합으로 입력해주세요');
		alert('비밀번호는 영문과 숫자 조합으로 입력해주세요');
		pw.focus();
		return false;
	}
	
	console.log(' 2) password check pass');
	
	
	// 3) space/tab check
	var regexp_for_gap = /\s/g; // regexp for tab and space
	
	if (name.value.match(regexp_for_gap)){
		alert('이름에 공백을 입력할 수 없습니다');
		name.focus();
		return false;
	} else if (id.value.match(regexp_for_gap)){
		alert('아이디에 공백을 입력할 수 없습니다');
		id.focus();
		return false;
	} else if (pw.value.match(regexp_for_gap)){
		alert('비밀번호에 공백을 입력할 수 없습니다');
		pw.focus();
		return false;
	} else if (pw_check.value.match(regexp_for_gap)){
		alert('비밀번호 확인란에 공백을 입력할 수 없습니다');
		pw_check.focus();
		return false;
	} else if (birth.value.match(regexp_for_gap)){
		alert('생년월일에 공백을 입력할 수 없습니다');
		birth.focus();
		return false;
	} else if (phone.value.match(regexp_for_gap)){
		alert('전화번호에 공백을 입력할 수 없습니다');
		phone.focus();
		return false;
	}
	
	console.log(' 3) space/tab check pass');
	
	
	// 4) number of characters check
	var id_min = 6;
	var id_max = 18;
	var name_min = 2;
	var name_max = 5;
	var pw_min = 8;
	var pw_max = 18;
	var birth_number_check = 6;
	var phone_number_check = 11;
	
	if (id.value.length < id_min || id.value.length > id_max){
		alert('아이디는 ' + id_min +'자 이상, ' + id_max + '자 이내로 입력해 주세요');
		id.focus();
		return false;
	} else if (name.value.length < name_min || name.value.length > name_max){
		alert('이름은 ' + name_min +'자 이상, ' + name_max + '자 이내로 입력해 주세요');
		name.focus();
		return false;
	} else if (pw.value.length < pw_min || pw.value.length > pw_max){
		alert('비밀번호는 ' + pw_min +'자 이상, ' + pw_max + '자 이내로 입력해 주세요');
		pw.focus();
		return false;
	} else if (birth.value.length != birth_number_check){
		alert('생년월일은 ' + birth_number_check + '자로 입력해 주세요');
		birth.focus();
		return false;
	} else if (phone.value.length != phone_number_check){
		alert('전화번호는 ' + phone_number_check + '자로 입력해 주세요');
		phone.focus();
		return false;
	}
	
	console.log(' 4) number of characters check pass');
	
	
	// 5) id duplication flag check
	if (id.value != id_value_temp || id_check_flg == false){
		// 확인 버튼 클릭시점의 아이디 값과 중복확인 버튼 입력시의 아이디 값이 동일한지 확인
		// flg가 true인지 확인
		
		alert('아이디 중복확인을 완료해 주세요');
		join_id_db_check.focus();
		
		return false;
	}
	
	console.log(' 5) id duplication flag check pass');
	
	// 6) phone number duplication flag check
	if (phone.value != pb_value_temp || pb_check_flg == false){
		// 확인 버튼 클릭시점의 전화번호 값과 중복확인 버튼 입력시의 전화번호 값이 동일한지 확인
		// flg가 true인지 확인
		
		alert('전화번호 중복확인을 완료해 주세요');
		join_pb_db_check.focus();
		
		return false;
	}
	
	console.log(' 6) phone number duplication flag check pass');
	
	console.log('ALL PASS!! RETURN TRUE!');
	return true;
}

//아이디 중복 체크(pk)
function id_db_check(){
	
	console.log('start to id_database_check through ajax');
	
	var id_for_check = document.getElementById('join_id').value;
	
	
	// id 입력 여부 체크
	if(id_for_check == '' || id_for_check == null){
		
		alert('아이디를 입력해주세요');
		return false;
	}
	
	// ID체크 이후 ID값 변경 했는지 확인하기 위한 id_value_temp
	id_value_temp = id_for_check;
	
	
	$.ajax({
		url:		'idDbCheck',
		type:		'POST',
		dataType:	'text',
		data:		{id: id_for_check},
		success:	function(data){
								
						// json값 판별 '2': 사용 가능, '1': 사용 불가
						if (data == '2'){
							// 등록된 아이디가 없는 경우(사용 가능한 아이디)
							alert('사용 가능한 아이디 입니다');
							id_check_flg = true;
							
						} else{
							// 등록된 아이디가 존재하는 경우
							alert('이미 등록된 아이디 입니다');
							id_check_flg = false;
						}
						
					},
		error:		function(e){
						alert('네트워크에 문제가 발생했습니다');
					}
		
	});
}

//전화번호 중복 체크(unique)
function pb_db_check(){
	
console.log('start to pb_database_check through ajax');
	
	var pb_for_check = document.getElementById('join_phone').value;
	
	
	// id 입력 여부 체크
	if(pb_for_check == '' || pb_for_check == null){
		
		alert('전화번호를 입력해주세요');
		return false;
	}
	
	// ID체크 이후 ID값 변경 했는지 확인하기 위한 id_value_temp
	pb_value_temp = pb_for_check;
	
	
	$.ajax({
		url:		'pbDbCheck',
		type:		'POST',
		dataType:	'text',
		data:		{pb: pb_for_check},
		success:	function(data){
								
						// json값 판별 '2': 사용 가능, '1': 사용 불가
						if (data == '2'){
							// 등록된 전화번호가 없는 경우(사용 가능한 전화번호)
							alert('사용 가능한 전화번호 입니다');
							pb_check_flg = true;
							
						} else{
							// 등록된 전화번호가 존재하는 경우
							alert('이미 등록된 전화번호 입니다');
							pb_check_flg = false;
						}
						
					},
		error:		function(e){
						alert('네트워크에 문제가 발생했습니다');
					}
		
	});	
	
	
}

</script>
</html>
