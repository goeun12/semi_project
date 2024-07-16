<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<jsp:include page="../common/header.jsp"/>
	
	<div id="container" class="text-center" style="padding-bottom: 3rem !important;">
		<div style="padding-top:1.5rem !important; padding-bottom:4rem !important;" class="py-lg-5">
   			<div id="login_bar">
     			<p>로그인</p>
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
					<input type="hidden" name="change"/>
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
	<jsp:include page="../common/footer.jsp"/>
	<script>
		window.onload = () => {
			const login = document.getElementById('login_check_button');
			const alertDiv = document.getElementById('login_alert');
			const id = document.getElementById('id');
			const pwd = document.getElementById('pwd');
			
			const findJoinBtn = document.getElementsByClassName('button_find_join');
			for(const btn of findJoinBtn){
				btn.addEventListener('mouseover', function(){
					const text = btn.children[0];
					text.style.cursor = 'pointer';
				});
			}
			
			if(${ !empty loginUser }){
				alert('로그인이 되어있습니다.');
				location.href="${contextPath}/recipe.re";
			}
			
			const msg = '${msg}';
			console.log(msg);
			if(msg != ''){
				alert(msg);
			}
	
			if(document.referrer == 'http://localhost:8088/aloneBab/findPwView.user'){
				document.getElementsByName('change')[0].value = 'Y';
			}
			
			login.onclick = e => {
				if(id.value.trim() == ''){
					alertDiv.innerText = '아이디를 입력하세요.';
					alertDiv.style.color = 'red';
					document.getElementById('login_id').style.border = '2px solid #F24822';
					document.getElementById('login_pwd').style.border = '1px solid lightgray';
					id.focus();
					e.preventDefault();
				} else if(pwd.value.trim() == ''){
					alertDiv.innerText = '비밀번호를 입력하세요.';
					alertDiv.style.color = 'red';
					document.getElementById('login_id').style.border = '1px solid lightgray';
					document.getElementById('login_pwd').style.border = '2px solid #F24822';
					pwd.focus();
					e.preventDefault();
				}
			};
			
			
		}
	</script>
	<% session.removeAttribute("msg"); %>
</body>
</html>