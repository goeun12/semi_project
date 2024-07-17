<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/common/errorPage.jsp" %>
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
							<input type="text" id="admin_id" class="joinInput" name="id" placeholder="영문 대/소문자, 숫자로 이루어진 4~10글자"/>
						</td>
						<td class="infor_Td" style="text-align: right">
							<span class="table_In_Infor" id="inforId"></span>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" id="admin_pwd" class="joinInput" name="pwd" autocomplete="off" placeholder="영문 대/소문자, 숫자, 특수문자로 이루어진 6~15글자"/></td>
						<td class="infor_Td" style="text-align: right; width: 225px;"><label class="table_In_Infor" id="inforPwd"></label></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<input type="password" id="admin_rePwd" class="joinInput" name="rePwd" autocomplete="off" placeholder="필수 입력"/>
						</td>
						<td class="infor_Td" style="text-align: right;">
							<label class="table_In_Infor" id="inforRePwd"></label>
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
							<input type="hidden" name="address" value="여기는§§●혼밥심"/>
							<input type="hidden" name="signupPath" value="ADMIN"/>
						</td>
					</tr>
					<tr>
						<th id="lastTrBTh">관리자 비밀번호 인증</th>
						<td id="lastTrBTd" colspan="2"><input type="password" id="adminPwd" class="joinInput" name="adminPwd" placeholder="관리자 인증 비밀번호를 입력해 주세요."/></td>
					</tr>
				</table>
			</div>
			<div>
				<button id="admin_button" type="button">관리자 가입</button>
				<button id="join_go_button" type="button">일반회원 가입</button>
			</div>
		</form>
	</div>	
	<jsp:include page="../common/footer.jsp"/>

	<script>
		window.onload = () => {
			document.getElementById('join_go_button').addEventListener('click', () => {
				location.href="${ contextPath }/joinView.user";
			});
			
			const inputs = document.getElementsByClassName('joinInput');
			let phone = document.getElementById('phone');
			const regPho = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
			let nameInput = document.getElementById('admin_name');
			const regName = /^([가-힣]{2,6}|[a-zA-Z]{2,18})$/ 
		
			document.getElementById('admin_button').addEventListener('click', e => {			
				let count = 0;
				for(const input of inputs){
					if(input.value.trim() == ''){
						count++;
					}
				}
				
				
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
				} else if(inforPwd.innerText.includes('특수문자')){
					alert('다른 비밀번호를 입력해 주세요.');
					pwd.focus();
				} else if(inforId.innerText.includes('불가한')){
					alert('다른 아이디를 입력해 주세요.');
					idInput.focus();
				} else if(!regPho.test(phone.value)){
					alert('유효한 전화번호가 아닙니다. 다시 입력해 주세요.');
					phone.focus();
				} else if(!regName.test(nameInput.value)) {
					alert('이름을 다시 입력해 주세요.');
					nameInput.focus();
				} else if(count == 0 && pwdCheck() && inforId.innerText.includes('사용 가능한')) {
					document.querySelector("#joinAdminForm").submit();
					
				}
			});
		}
		
		let pwd = document.getElementById('admin_pwd');
		let rePwd = document.getElementById('admin_rePwd');
		let inforPwd = document.getElementById('inforPwd');
		let inforRePwd = document.getElementById('inforRePwd');
		const inforId = document.getElementById('inforId');
		let idInput = document.getElementById('admin_id');
		const regId = /^[A-Za-z0-9]{4,10}$/;
		const regPwd = /^[A-Za-z0-9@.]{6,15}$/;
		
		idInput.addEventListener('focusout', checkId);
		pwd.addEventListener('focusout', pwdCheck);
		rePwd.addEventListener('focusout', pwdCheck);
		
		function checkId(){
			let id = idInput.value;
			if(id.trim() != ''){
				$.ajax({
					url: 'checkId.user',
					data: {id:id},
					success: (data) => {
						if(data == 0 && regId.test(id)){
							inforId.innerText = '사용 가능한 아이디입니다';
							inforId.style.color = 'green';
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
		
		function pwdCheck(){
			if(pwd.value === rePwd.value && (pwd.value.trim() != '' || rePwd.value.trim() != '')){
				inforRePwd.innerText = '비밀번호가 일치합니다';
				inforRePwd.style.color = 'green';
				return true;
			} else {
				inforRePwd.innerText = '비밀번호가 일치하지 않습니다';
				inforRePwd.style.color = 'red';
				return false;
			}
			
		}
		
		function pwdReg(){
			if(!regPwd.test(pwd.value)){
				inforPwd.innerText = '비밀번호는 6~15자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요';
				inforPwd.style.color = 'red';
				return false;
			} else {
				inforPwd.innerText = '';
				return true;
			}
		}
		
	</script>
	
</body>
</html>
