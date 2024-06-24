<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/modifyAcc.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="../js/jquery-3.7.1.min.js"></script>
<style>
	.nanum-gothic-regular {
	  font-family: "Nanum Gothic", sans-serif;
	  font-weight: 700;
	  font-style: normal;
}
</style>
</head>
<body>
	<jsp:include page="WEB-INF/views/header.jsp"/>
	<div class="mainDiv">
		<div class="modify title">
			<p>회원정보 수정</p>
		</div>
		<form action="" method="post">
			<div class="modify account_table_div">
				<table class="modify account_table" border="1">
					<tr>
						<th>아이디 : </th>
						<td><input type="text" id="modify_id" class="modifyInput" name="modifyId" value="사용자아이디" readonly/></td>
						<td style="text-align: right">
							<span class="table_In_Infor" id="inforId">아이디는 수정이 불가합니다 &nbsp;</span>
						</td>
					</tr>
					<tr>
						<th>비밀번호 : </th>
						<td colspan="2"><input type="password" id="modify_pwd" class="modifyInput" name="modifyPwd" placeholder="(비밀번호 변경 시 입력)"/></td>
					</tr>
					<tr>
						<th>비밀번호 확인 : </th>
						<td>
							<input type="password" id="modify_rePwd" class="modifyInput" name="modifyRePwd" placeholder="(비밀번호 변경 시 입력)"/>
						</td>
						<td style='text-align: right'>
							<span class="table_In_Infor" id="inforPwd"> &nbsp;</span>
						</td>
					</tr>
					<tr>
						<th>이름 : </th>
						<td colspan="2"><input type="text" id="modify_name" class="modifyInput" name="modifyName" value="사용자이름"/></td>
					</tr>
					<tr>
						<th>주민등록번호 : </th>
						<td colspan="2"><input type="text" id="modify_no" class="modifyInput" name="modifyIdenNum" placeholder="(주민등록번호 변경 시 입력)"/></td>
					</tr>
					<tr>
						<th class="lastTr">휴대폰번호 : </th>
						<td class="lastTr" colspan="2"><input type="text" id="modify_phone" class="modifyInput" name="modifyPhone" value="사용자휴대폰번호"/></td>
					</tr>
				</table>
			</div>
			<div>
				<button id="modify_button">회원정보 수정</button>
				<button type="button" id="delete_button">회원탈퇴</button>
			</div>
		</form>
	</div>
	<jsp:include page="WEB-INF/views/footer.jsp"/>	
	
	<script>
		const inputs = document.getElementsByClassName('modifyInput');
		const button = document.getElementById('modify_button');
		let pwd = document.getElementById('modify_pwd');
		let rePwd = document.getElementById('modify_rePwd');
		let idenNo = document.getElementById('modify_no');
		const inforPwd = document.getElementById('inforPwd');
		
		button.addEventListener('click', e => {			
			let count = 0;
			for(const input of inputs){
				if(input.value.trim() == '' && input != pwd && input != rePwd && input != idenNo){
					count++;
				}
			}
			if(count <= 3 && count > 0){
				e.preventDefault();
				alert('필수 항목을 입력해 주세요.');
			} else if(pwd.value.trim() != '' && !pwdCheck()){
				alert('비밀번호가 일치하지 않습니다.');
				e.preventDefault();
			} else if(count == 0 && ((pwd.value.trim() == '' && rePwd.value.trim() == '') || (pwd.value.trim() != '' && pwdCheck()))) {
				alert('회원정보 수정 성공!');
			}
		});
		
		
		const pwdCheck = () => {
			if(pwd.value === rePwd.value && pwd.value.trim() != ''){
				inforPwd.innerText = '사용 가능한 비밀번호입니다';
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
		
		document.getElementById('delete_button').addEventListener('click', e => {
			if(confirm('정말 탈퇴하시겠습니까?')){
				console.log('안타깝지만 대문으로 나가 주셔야 되겠습니다.');
			} else{
				console.log('좋은 선택하셨습니다.');
			}
		});
		
		$(()=>{
			$('#user_login_complete').click(function() {
				$(this).next().slideToggle();
			});
		})
		
	</script>
	
</head>
<body>

</body>
</html>