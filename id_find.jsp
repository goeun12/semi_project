<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>IdFind</title>
<link href="resources/css/id_find.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body style="background-color: #FFFBF2;">
	<div id="wrap" class="wrap">
		<%@ include file="../common/header.jsp" %>
		
		<div id="container" class="text-center container" style="padding-bottom: 3rem !important;">
			<div style="padding-top:1rem !important; padding-bottom:2rem !important;" class="row py-lg-5">
     			<div id="login_bar" class="col-lg-6 col-md-8">
        			<h3 class="fw-bold">아이디 찾기</h3>
      			</div><br>
      		</div>
      		
      		<div id="find_block">
      			<div id="find_idpw_box" class="find_select_box">
	      			<div id="find_id" class="find_select">
	      				<a href="id_find.html" id="find_id_select" class="btn">
	      					<label class="font_text">아이디 찾기</label>
	      				</a>
	      			</div><div id="find_pw" class="find_select">
	      				<a href="pw_find.html" id="find_pw_select" class="btn">
	      					<label class="font_text">비밀번호 찾기</label>
	      				</a>
	      			</div>
	      		</div>
				<div id="find_info">
					<form action="" method="post">
						<div id="find_box">
							<table id="find_table">
								<tr class="table_label_box">
									<td class="table_label">이름</td>
									<td id="find_name" ><input type="text" id="name" name="name" class="find_content" placeholder="이름"></td>
								</tr>
								<tr>
									<td class="table_label">핸드폰번호</td>
									<td id="find_phone"><input type="text" id="phone" name="phone" class="find_content" placeholder="휴대폰번호"></td>
								</tr>
							</table>
							<div id="find_alert" style="text-align: left;"></div>		
							<div id="find_check">
								<button type="submit" id="find_check_button">아이디 찾기</button>
							</div>
						</div> 
					</form>
				</div>
			</div>
			
		</div>
		<%@ include file="../common/footer.jsp" %>
	</div>
	
	<script>
		window.onload = () => {
			const name = document.getElementById('name');
			const phone = document.getElementById('phone');
			const alert = document.getElementById('find_alert');
			// const find = document.getElementById('find_check_button');
			const form = document.querySelector('form');
			
			form.addEventListener('submit', e => {
				if(name.value.trim() == ''){
					alert.innerText = '이름을 입력하세요.';
					alert.style.color = '#F24822';
					console.log(document.getElementById('find_name').parentElement);
					document.getElementById('find_name').style.border = '2px solid #F24822';
					document.getElementById('find_phone').style.border = '1px solid lightgray';
					name.focus();
					e.preventDefault();
				} else if (phone.value.trim() == ''){
					alert.innerText = '핸드폰번호를 입력하세요.';
					alert.style.color = '#F24822';
					document.getElementById('find_name').style.border = '1px solid lightgray';
					document.getElementById('find_phone').style.border = '2px solid #F24822';
					phone.focus();
					e.preventDefault();
				}
				
			});
		}
	</script>
</body>
</html>