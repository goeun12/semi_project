<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<link href="resources/css/login_user.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body style="background-color: #FFFBF2;">
	<div id="wrap" class="wrap">
		<%@ include file="../common/header.jsp" %>
		
		<div id="container" class="text-center container" style="padding-bottom: 3rem !important;">
			<div style="padding-top:1rem !important; padding-bottom:2rem !important;" class="row py-lg-5">
     			<div id="login_bar" class="col-lg-6 col-md-8">
        			<h3 class="fw-bold">로그인</h3>
      			</div>
      		</div>
      		<div id="id_join_find">
      			<div id="id_join_find_box">
					<form action="${ contextPath }/login.user" method="post" id="login_form">
						<div id="login">
							<div id="login_box">
								<div id="login_id" class="login_content_name">
									<input type="text" id="id" name="id" class="login_content"placeholder="아이디">
								</div>
								<div id="login_pwd" class="login_content_name">
									<input type="password" id="pwd" name="pwd" class="login_content" placeholder="비밀번호">
								</div>
								<div id="login_alert" style="text-align: left;"></div>
							</div>
							
							<div id="login_check">
								<button id="login_check_button">로그인</button>
							</div>
						</div>
					</form>
					
					<div id="find_join">
						<div id="find_join_box">
							<div id="find_idpw" class="find_join_in">
								<a href="${ contextPath }/findInfo.user" id="find_idpw_link" class="btn button_find_join"><label class="font_text">아이디/비밀번호 찾기</label></a>
							</div>
							<div style="width: 40px; display: inline-block;"></div>
							<div id="join_user" class="find_join_in">
								<a href="${ contextPath }/joinView.user" id="join_user_link" class="button_find_join btn"><label class="font_text">회원가입</label></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../common/footer.jsp" %>
	</div>
	
	<script>
		window.onload = () => {
			const login = document.getElementById('login_check_button');
			const alert = document.getElementById('login_alert');
			const id = document.getElementById('id');
			const pwd = document.getElementById('pwd');
			
			login.onclick = e => {
				if(id.value.trim() == ''){
					alert.innerText = '아이디를 입력하세요.';
					alert.style.color = 'red';
					document.getElementById('login_id').style.border = '2px solid #F24822';
					document.getElementById('login_pwd').style.border = '1px solid lightgray';
					id.focus();
					e.preventDefault();
				} else if(pwd.value.trim() == ''){
					alert.innerText = '비밀번호를 입력하세요.';
					alert.style.color = 'red';
					document.getElementById('login_id').style.border = '1px solid lightgray';
					document.getElementById('login_pwd').style.border = '2px solid #F24822';
					pwd.focus();
					e.preventDefault();
				}
			};
		}
	</script>
</body>
</html>
