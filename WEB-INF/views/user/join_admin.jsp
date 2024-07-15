<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/joinAdmin.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> 
<style>
	@font-face {
	    font-family: 'MinSans-Regular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/MinSans-Regular.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	@font-face {
	    font-family: 'MinSans-Bold';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/MinSans-Bold.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
</style>
</head>
<body style="margin: 0px; background-color: #FFFBF2;">
	<jsp:include page="../common/header.jsp"/>
	<div class="mainDiv">
		<div class="joinAdmin title">
			<p>관리자 회원가입</p>
		</div>
		<form action="${contextPath}/signUpAdmin.user" method="post" id="joinAdminForm">
			<div class="join admin_table_div">
				<table class="join admin_table" border="1">
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" id="admin_id" class="joinInput" name="id" placeholder="영문이나 숫자만 입력"/>
						</td>
						<td class="infor_Td" style="text-align: right">
							<span class="table_In_Infor" id="inforId"></span>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td colspan="2"><input type="password" id="admin_pwd" class="joinInput" name="pwd" autocomplete="off" placeholder="필수 입력"/></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<input type="password" id="admin_rePwd" class="joinInput" name="rePwd" autocomplete="off" placeholder="필수 입력"/>
						</td>
						<td class="infor_Td" style="text-align: right; width: 200px;">
							<label class="table_In_Infor" id="inforPwd"></label>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td colspan="2"><input type="text" id="admin_name" class="joinInput" name="name" placeholder="필수 입력"/></td>
					</tr>
					<tr>
						<th>휴대폰번호</th>
						<td colspan="2">
							<input type="text" id="phone" class="joinInput" name="phone" placeholder="- 포함 입력"/>
							<input type="hidden" name="address" value="여기는 혼밥심"/>
							<input type="hidden" name="signupPath" value="ADMIN"/>
						</td>
					</tr>
					<tr>
						<th id="lastTrBTh">관리자 비밀번호 인증</th>
						<td id="lastTrBTd" colspan="2"><input type="text" id="adminPwd" class="joinInput" placeholder="관리자 인증 비밀번호를 입력해 주세요."/></td>
					</tr>
				</table>
			</div>
			<div>
				<button id="admin_button" type="button">관리자 가입</button>
			</div>
		</form>
	</div>	
	<jsp:include page="../common/footer.jsp"/>

	<script>
		const inputs = document.getElementsByClassName('joinInput');
		let pwd = document.getElementById('admin_pwd');
		let rePwd = document.getElementById('admin_rePwd');
		const inforPwd = document.getElementById('inforPwd');
		const inforId = document.getElementById('inforId');
		let idInput = document.getElementById('admin_id');
		const regId = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		const adminPwd = document.getElementById('adminPwd');
		
		function checkId(){
			let id = idInput.value;
			if(id.trim() != ''){
				$.ajax({
					url: 'checkId.user',
					data: {id:id},
					success: (data) => {
						if(data == 0 && !regId.test(id)){
							inforId.innerText = '사용 가능한 아이디입니다';
							inforId.style.color = 'green'
							return true;
						} else {
							inforId.innerText = '사용 불가한 아이디입니다';
							inforId.style.color = 'red';
							return false;
						}
					},
					error: data => console.log(data)
				});
			}
		}
		
		document.getElementById('admin_button').addEventListener('click', e => {			
			let count = 0;
			for(const input of inputs){
				if(input.value.trim() == ''){
					count++;
				}
			}
			
			let phone = document.getElementById('phone');
			const regPho = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
			let nameInput = document.getElementById('admin_name');
			const regName = /[^가-힣a-zA-Z]/g;
			
			if(count <= 6 && count > 0){
				alert('필수 항목을 입력해 주세요.');
				for(input of inputs){
					if(input.value == ''){
						input.focus();
					}
				}
			} else if(!pwdCheck()){
				alert('비밀번호가 일치하지 않습니다.');
				pwd.focus();
			} else if(inforId.innerText.includes('불가한')){
				alert('다른 아이디를 입력해 주세요.');
				idInput.focus();
			} else if(!regPho.test(phone.value)){
				alert('유효한 전화번호가 아닙니다. 다시 입력해 주세요.');
				phone.focus();
			} else if(regName.test(nameInput.value)) {
				alert('이름을 다시 입력해 주세요.');
				nameInput.focus();
			} else if(adminPwd.value != '0321admin0719') {
				alert('관리자 인증 비밀번호가 일치하지 않습니다.');
				adminPwd.focus();
			} else if(count == 0 && pwdCheck() && inforId.innerText.includes('사용 가능한')) {
				alert(nameInput.value + ' 관리자님 환영합니다!');
				document.querySelector("#joinAdminForm").submit();
			}
		});
		
		function pwdCheck(){
			if(pwd.value === rePwd.value && (pwd.value.trim() != '' || rePwd.value.trim() != '')){
				inforPwd.innerText = '비밀번호가 일치합니다';
				inforPwd.style.color = 'green';
				return true;
			} else {
				inforPwd.innerText = '비밀번호가 일치하지 않습니다';
				inforPwd.style.color = 'red';
				return false;
			}
		};
		
		idInput.addEventListener('focusout', checkId);
		pwd.addEventListener('focusout', pwdCheck);
		rePwd.addEventListener('focusout', pwdCheck);
		
	</script>
	
</body>
</html>