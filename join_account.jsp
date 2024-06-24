<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/joinAcc.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:include page="WEB-INF/views/header.jsp"/>
	<div class="mainDiv">
		<div class="join title">
			<p>회원가입</p>
		</div>
		<form action="" method="post">
			<div class="join account_table_div">
				<table class="join account_table" border="1">
					<tr>
						<th>아이디 : </th>
						<td>
							<input type="text" id="join_id" class="joinInput" name="joinId" placeholder="(필수 입력)"/>
						</td>
						<td class="infor_Td" style="text-align: right">
							<span class="table_In_Infor" id="inforId">중복된 아이디입니다 &nbsp;</span>
						</td>
					</tr>
					<tr>
						<th>비밀번호 : </th>
						<td colspan="2"><input type="password" id="join_pwd" class="joinInput" name="joinPwd" placeholder="(필수 입력)"/></td>
					</tr>
					<tr>
						<th>비밀번호 확인 : </th>
						<td>
							<input type="password" id="join_rePwd" class="joinInput" name="joinRePwd" placeholder="(필수 입력)"/>
						</td>
						<td class="infor_Td" style="text-align: right">
							<label class="table_In_Infor" id="inforPwd"> &nbsp;</label>
						</td>
					</tr>
					<tr>
						<th>이름 : </th>
						<td colspan="2"><input type="text" id="join_name" class="joinInput" name="joinName" placeholder="(필수 입력)"/></td>
					</tr>
					<tr>
						<th>주민등록번호 : </th>
						<td colspan="2"><input type="text" id="join_no" class="joinInput" name="joinIdenNum" placeholder="(필수 입력)"/></td>
					</tr>
					<tr>
						<th class="lastTr">휴대폰번호 : </th>
						<td class="lastTr" colspan="2"><input type="text" id="join_phone" class="joinInput" name="joinPhone" placeholder="(필수 입력)"/></td>
					</tr>
				</table>
			</div>
			<div>
				<button id="join_button">회원가입</button>
			</div>
		</form>
	</div>	
	<jsp:include page="WEB-INF/views/footer.jsp"/>
	
	<script>
		const inputs = document.getElementsByClassName('joinInput');
		const button = document.getElementById('join_button');
		let pwd = document.getElementById('join_pwd');
		let rePwd = document.getElementById('join_rePwd');
		const inforPwd = document.getElementById('inforPwd');
		let id = document.getElementById('join_id');
		
		
		button.addEventListener('click', e => {			
			let count = 0;
			for(const input of inputs){
				if(input.value.trim() == ''){
					count++;
				}
			}
			if(count <= 6 && count > 0){
				e.preventDefault();
				alert('필수 항목을 입력해 주세요.');
			} else if(!pwdCheck()){
				alert('비밀번호가 일치하지 않습니다.');
				e.preventDefault();
			} else if(count == 0 && pwdCheck()) {
				alert('성공!');
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
		pwd.addEventListener('focusout', pwdCheck);
		rePwd.addEventListener('focusout', pwdCheck);
		
	</script>
</body>
</html>