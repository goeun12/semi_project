<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/joinAcc.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> 
</head>
<body style="margin: 0px; background-color: #FFFBF2;">
	<jsp:include page="../common/header.jsp"/>
	<div class="mainDiv">
		<div class="join title">
			<p>회원가입</p>
		</div>
		<form action="${contextPath}/joinMember.user" method="post" id="joinMemberForm">
			<div class="join account_table_div">
				<table class="join account_table" border="1">
					<tr>
						<th>아이디 : </th>
						<td>
							<input type="text" id="join_id" class="joinInput" name="id" placeholder="(영문이나 숫자만 입력)"/>
						</td>
						<td class="infor_Td" style="text-align: right">
							<span class="table_In_Infor" id="inforId"></span>
						</td>
					</tr>
					<tr>
						<th>비밀번호 : </th>
						<td colspan="2"><input type="password" id="join_pwd" class="joinInput" name="pwd" placeholder="(필수 입력)"/></td>
					</tr>
					<tr>
						<th>비밀번호 확인 : </th>
						<td>
							<input type="password" id="join_rePwd" class="joinInput" name="rePwd" placeholder="(필수 입력)"/>
						</td>
						<td class="infor_Td" style="text-align: right">
							<label class="table_In_Infor" id="inforPwd"></label>
						</td>
					</tr>
					<tr>
						<th>이름 : </th>
						<td colspan="2"><input type="text" id="join_name" class="joinInput" name="name" placeholder="(필수 입력)"/></td>
					</tr>
					<tr>
						<th id="lastTrBTh">휴대폰번호 : </th>
						<td id="lastTrBTd" colspan="2">
							<input type="text" id="phone" class="joinInput" name="phone" placeholder="(- 제외 입력)"/>
						</td>
					</tr>
				</table>
			</div>
			<div>
				<button id="join_button" type="button">회원가입</button>
			</div>
		</form>
	</div>	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		const inputs = document.getElementsByClassName('joinInput');
		const button = document.getElementById('join_button');
		let pwd = document.getElementById('join_pwd');
		let rePwd = document.getElementById('join_rePwd');
		const inforPwd = document.getElementById('inforPwd');
		const inforId = document.getElementById('inforId');
		let idInput = document.getElementById('join_id');
		const regId = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		const regName = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]
		
		function checkId(){
			let id = idInput.value;
			if(id.trim() != ''){
				$.ajax({
					url: 'checkId.user',
					data: {id:id},
					dataType: 'json',
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
		
		button.addEventListener('click', e => {			
			let count = 0;
			for(const input of inputs){
				if(input.value.trim() == ''){
					count++;
				}
			}
			
			
			let phone = document.getElementById('phone').value;
			const regPho = /\D/g;
			if(regPho.test(phone)){
				document.getElementById('phone').value = phone.replace(regPho, '');
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
			} else if(inforId.innerText.includes('불가한')){
				alert('다른 아이디를 입력해 주세요.');
				idInput.focus();
			} else if(count == 0 && pwdCheck() && inforId.innerText.includes('사용 가능한')) {
				alert(document.getElementById('join_name').value + '님 환영합니다!');
				document.querySelector("#joinMemberForm").submit();
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
		}
		idInput.addEventListener('focusout', checkId);
		pwd.addEventListener('focusout', pwdCheck);
		rePwd.addEventListener('focusout', pwdCheck);
		
	</script>
</body>
</html>
