<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PwFind</title>
<link href="resources/css/pw_find.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body style="background-color: #FFFBF2;">
	<jsp:include page="../common/header.jsp"/>
	<div id="container" class="text-center" style="padding-bottom: 3rem !important;">
		<div style="padding-top:1.5rem !important; padding-bottom:4rem !important;" class="row py-lg-5">
    			<div id="login_bar" class="col-lg-6 col-md-8">
       			<p>비밀번호 찾기</p>
     			</div><br>
     		</div>
     		
     		<div id="find_block">
     			<div id="find_idpw_box" class="find_select_box">
      			<div id="find_id" class="find_select">
      				<a href="${ contextPath }/findIdView.user" id="find_id_select" class="btn">
      					<label class="font_text">아이디 찾기</label>
      				</a>
      			</div><div id="find_pw" class="find_select">
      				<a href="${ contextPath }/findPwView.user" id="find_pw_select" class="btn">
      					<label class="font_text">비밀번호 찾기</label>
      				</a>
      			</div>
      		</div>
			<div id="find_info">
				<form>
					<div id="find_box">
						<table id="find_table">
							<tr class="table_label_box">
								<td class="table_label">이름</td>
								<td id="find_name" ><input type="text" id="name" name="name" class="find_content" placeholder="이름"></td>
							</tr>
							<tr class="table_label_box">
								<td class="table_label">핸드폰번호</td>
								<td id="find_phone"><input type="text" id="phone" name="phone" class="find_content" placeholder="휴대폰번호"></td>
							</tr>
							<tr>
								<td class="table_label">아이디</td>
								<td id="find_myId"><input type="text" id="id" name="id" class="find_content" required placeholder="아이디"></td>
							</tr>
						</table>
					</div>
					<div id="find_alert" style="text-align: left;"></div>
					<div id="find_check">
						<button type="button" id="find_check_button">비밀번호 찾기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"/>
	<script>
		window.onload = () => {
			const name = document.getElementById('name');
			const phone = document.getElementById('phone');
			const id = document.getElementById('id');
			const alertDiv = document.getElementById('find_alert');
			const form = document.querySelector('form');
			
			form.addEventListener('click', e => {
				const eventTarget = e.target;
				const targetTagName = eventTarget.tagName.toLowerCase();
				
				console.log(targetTagName);
				if(targetTagName == 'button'){
					if(name.value.trim() == ''){
						alertDiv.innerText = '이름을 입력하세요.';
						alertDiv.style.color = '#F24822';
						document.getElementById('find_name').style.border = '2px solid #F24822';
						document.getElementById('find_phone').style.border = 'none';
						document.getElementById('find_phone').style.borderBottom = '1px solid lightgray';
						document.getElementById('find_myId').style.border = 'none';
						name.focus();
						e.preventDefault();
					} else if (phone.value.trim() == ''){
						alertDiv.innerText = '전화번호를 입력하세요.';
						alertDiv.style.color = '#F24822';
						document.getElementById('find_name').style.border = 'none';
						document.getElementById('find_name').style.borderBottom = '1px solid lightgray';
						document.getElementById('find_phone').style.border = '2px solid #F24822';
						document.getElementById('find_myId').style.border = 'none';
						phone.focus();
						e.preventDefault();
					} else if (id.value.trim() == ''){
						alertDiv.innerText = '아이디를 입력하세요.';
						alertDiv.style.color = '#F24822';
						document.getElementById('find_name').style.border = 'none';
						document.getElementById('find_name').style.borderBottom = '1px solid lightgray';
						document.getElementById('find_phone').style.border = 'none';
						document.getElementById('find_phone').style.borderBottom = '1px solid lightgray';
						document.getElementById('find_myId').style.border = '2px solid #F24822';
						id.focus();
						e.preventDefault();
					} else{
						alertDiv.innerText = '';
						document.getElementById('find_name').style.border = 'none';
						document.getElementById('find_name').style.borderBottom = '1px solid lightgray';
						document.getElementById('find_phone').style.border = 'none';
						document.getElementById('find_phone').style.borderBottom = '1px solid lightgray';
						document.getElementById('find_myId').style.border = 'none';
						
						$.ajax({
							url: '${contextPath}/findPw.user',
							data: {
								name: name.value,
								phone: phone.value,
								id: id.value
							},
							success: data => {
								if(data != null){
									alert(data.name + '님의 임시 비밀번호는 ' + data.pwd + '입니다.\n로그인 후 새 비밀번호로 변경해주세요.');
									location.href="${contextPath}/loginView.user";
								} else{
									alert('일치하는 정보가 없습니다.\n다시 입력해주세요.');
									name.value = '';
									phone.value = '';
									id.value = '';
									name.focus();
								}
							},
							error: data => console.log(data)
						});
						
					}
				}
					
			});
		}
	</script>
</body>
</html>
