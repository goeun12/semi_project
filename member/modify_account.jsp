<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/modifyAcc.css" rel="stylesheet" type="text/css">
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
		<div class="modify title">
			<p>회원정보 수정</p>
		</div>
		<form action="${ contextPath }/modify.user" method="post">
			<div class="modify_account_div">
				<table class="modify_account_table" border="1">
					<tr>
						<th>아이디</th>
						<td><input type="text" id="modify_id" class="modifyInput" name="id" value="${ loginUser.id }" readonly/></td>
						<td style="text-align: right">
							<span class="table_In_Infor" id="inforId">아이디는 수정이 불가합니다</span>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" id="modify_pwd" class="modifyInput" name="pwd" placeholder="비밀번호 변경 시 입력"/></td>
						<td class="infor_Td" style="text-align: right; width: 225px;"><label class="table_In_Infor" id="inforPwd"></label></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<input type="password" id="modify_rePwd" class="modifyInput" name="rePwd" placeholder="비밀번호 변경 시 입력"/>
						</td>
						<td class="infor_Td" style="text-align: right; width: 200px;">
							<label class="table_In_Infor" id="inforRePwd"></label>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td colspan="2"><input type="text" id="modify_name" class="modifyInput" name="name" value="${ loginUser.name }" placeholder="필수 입력"/></td>
					</tr>
					<tr>
						<th>휴대폰번호</th>
						<td colspan="2"><input type="text" id="modify_phone" class="modifyInput" name="phone" value="${ loginUser.phone }" placeholder="- 포함 입력"/></td>
					</tr>
					<tr>
						<th style="border-bottom: none;">주소</th>
						<td style="border-bottom: none; width: 450px;">
							<input type="text" class="modifyInput" id="sample4_roadAddress" value="${ fn:split(loginUser.address, '§§●')[0] }" readonly>
							<input type="text" class="modifyInput" id="sample4_detailAddress" placeholder="상세 주소 입력" value="${ fn:split(loginUser.address, '§§●')[1] }" required="required">
							<input type="hidden" value="" name="address"/>
						</td>
						<td style="border-bottom: none;">
							<input type="button" id="addressSearch" onclick="sample4_execDaumPostcode()" value="주소 찾기">
						</td>
					</tr>
				</table>
			</div>
			<div>
				<button type="button" id="modify_button">회원정보 수정</button>
				<button type="button" id="delete_button">회원탈퇴</button>
			</div>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp"/>	
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
	<script>
		function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var detailAddress = ''; // 상세 주소 변수
	
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                	detailAddress += (detailAddress !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("sample4_roadAddress").value = roadAddr;
	                document.getElementById("sample4_detailAddress").value = detailAddress;
	              	
					document.getElementById('sample4_detailAddress').addEventListener('focusout', function() {
						if(document.getElementById("sample4_roadAddress").value !== '' && document.getElementById('sample4_detailAddress').value != ''){
							document.getElementsByName('address')[0].value = roadAddr + '§§●' + document.getElementById('sample4_detailAddress').value;
						}
					})
	            },
	            theme: {
					bgColor: "#FFFBF2", //바탕 배경색
					searchBgColor: "#F24822", //검색창 배경색
					//contentBgColor: "", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
					pageBgColor: "#F9AE98", //페이지 배경색
					textColor: "#000000", //기본 글자색
					queryTextColor:  "#FFFFFF", //검색창 글자색
					postcodeTextColor:  "#FB9374", //우편번호 글자색
					emphTextColor: "#000000" //강조 글자색
				}
	        }).open();
	    }
		
		const inputs = document.getElementsByClassName('modifyInput');
		const button = document.getElementById('modify_button');
		let phone = document.getElementById('modify_phone');
		const regPho = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
		let nameInput = document.getElementById('modify_name');
		const regName = /^([가-힣]{2,6}|[a-zA-Z]{2,18})$/ 
		
		button.addEventListener('click', e => {			
			let count = 0;
			for(const input of inputs){
				if(input.value.trim() == '' && input != pwd && input != rePwd){
					count++;
				}
			}
			
			if(count <= 3 && count > 0){
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
			} else if(!regPho.test(phone.value)){
				alert('유효한 전화번호가 아닙니다. 다시 입력해 주세요.');
				phone.focus();
			} else if(!regName.test(nameInput.value)) {
				alert('이름을 다시 입력해 주세요.');
				nameInput.focus();
			} else if(count == 0 && ((pwd.value.trim() == '' && rePwd.value.trim() == '') || (pwd.value.trim() != '' && pwdCheck()))) {
				alert("회원정보가 수정되었습니다.");
				document.querySelector('form').submit();
			}
		});
		
		
		document.getElementById('delete_button').addEventListener('click', e => {
			if(confirm('정말 탈퇴하시겠습니까?')){
				alert('그동안 혼밥심을 이용해 주셔서 감사합니다.');
				location.href="${contextPath}/delete.user?id=" + document.getElementById('modify_id').value;
			} else{
				console.log('좋은 선택하셨습니다.');
			}
		});
		
		let pwd = document.getElementById('modify_pwd');
		let rePwd = document.getElementById('modify_rePwd');
		let inforPwd = document.getElementById('inforPwd');
		let inforRePwd = document.getElementById('inforRePwd');
		const regPwd = /^[A-Za-z0-9@.]{6,15}$/;
		
		pwd.addEventListener('focusout', pwdReg);
		rePwd.addEventListener('focusout', pwdCheck);
		
		function pwdCheck(){
			if(pwd.value === rePwd.value && pwd.value.trim() != ''){
				inforRePwd.innerText = '비밀번호가 일치합니다';
				inforRePwd.style.color = 'green';
				return true;
			} else if(pwd.value.trim() != '' && rePwd.value.trim() != '' && pwd.value != rePwd.value) {
				inforRePwd.innerText = '비밀번호가 일치하지 않습니다';
				inforRePwd.style.color = 'red';
				return false;
			} else if(pwd.value.trim() == '' && rePwd.value.trim() == ''){
				return true;
			}
		}
		
		function pwdReg(){
			if(pwd.value.trim() != '' && !regPwd.test(pwd.value)){
				inforPwd.innerText = '비밀번호는 6~15자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요';
				inforPwd.style.color = 'red';
				return false;
			} else {
				inforPwd.innerText = '';
				return true;
			}
		}
		
	</script>
</head>
<body>
