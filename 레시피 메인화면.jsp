<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 메인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>    
<link href="allCSS.css" rel="stylesheet" type="text/css">

<style>




.top-padding{padding-top:3rem !important;}
.bottom-padding{padding-bottom:1rem !important;}
.searchbar{margin-left:20%;}
.searchButton{margin-right:20%;}

.notice_title{background:#f9ae98;
			width: 50%; height:50px;
			margin-left:25%;
			margin-block-end:0;
			text-align: center;
			text-decoration:none;
			font-size:35px;}


.everybox{min-width:1250px;}


.py-5{margin-left:100px;margin-right:200px;background-color:#fffbf2;}





</style>
</head>
<body>

<div id="header">
	<div id="header_menu" class="header_common">
		<a href="#" class="button"><img src="#" id="logo"></a>
		<a href="#" id="main" class="button">레시피</a>	
		<a href="#" id="tip" class="button">꿀팁</a>
		<a href="#" id="comm" class="button">메뉴 추천</a>
		<a href="#" id="notice" class="button">공지사항</a>
	</div>
	<!-- 로그인 했을 때 다르게 바뀌게도 해야 됨 -->
	<div id="header_user" class="header_common">
		<!-- 로그인 x 상태 -->
		<div id="header_user_noUser">
			<a href="#" id="user_login" class="button_user">로그인</a>&nbsp;&nbsp;&nbsp;
			<a href="#" id="user_join" class="button_user">회원가입</a>
		</div>
		<!-- 로그인 o 상태 -->
		<!-- 클릭시 아래에 팝업 만들어지게 해야됨 -->
		<!-- <div id="user_login_complete" class="button"><button id="mypage_list">▼</button><label for="mypage_list">신짱구님, 환영합니다.&nbsp;</label></div> -->
	</div>
</div>

<div id="gotop-button"><a href=""><img src="topButton.png" style="width:50px; height:50px;"></a></div>

<div class="container-fluid">
	<section class="text-center container top-padding">
		<div style="margin-top: 3rem !important; padding-top:1rem !important;" class="row py-lg-5">
			<div class="notice_title" style="border-radius:15px;">
				<h1 class="fw-light">레시피 게시판</h1>
			</div>
			<br>
			<div class="div-flexible div-center" style="padding-top:50px;padding-bottom:10px;">
				<div class="div-flexible" style="width: 70%; height: 30px;border:1px solid red;">
					<div class="bgcw" style="width:10%"><img src="as">&nbsp;공지</div>
					<div class="bgcw" style="width:100%;text-align:left; padding-left:100px;">공지사항 제목</div>
				</div>
			</div>
		</div>
		<div class="div-center div-flexible" style="padding-top:10px;padding-bottom:10px; ">
			<div class="input-group mb-3">
				<input type="text" class="form-control searchbar" placeholder="찾고자 하는 단어를 입력해주세요.">
				<button class="btn btn-outline-secondary searchButton" type="button" id="search_button" onclick="searchWord();">검색</button>
			</div>
		</div>

		<div class="container text-center">
			<div class="div-flexible  div-center">
				<div class="recipe-option">
					<select id="sel-nation" class="form-select form-select-sm" aria-label="Small select example">
					  <option value="all"selected>국가</option>
					  <option value="kr">한식</option>
					  <option value="cn">중식</option>
					  <option value="us">양식</option>
					  <option value="jp">일식</option>
					  <option value="no">분식</option>
					</select>
				</div>
				
				<div class="recipe-option">
					<select id="sel-easy"class="form-select form-select-sm" aria-label="Small select example">
					  <option value="all"selected>난이도</option>
					  <option value="easy">하</option>
					  <option value="mid">중</option>
					  <option value="hard">상</option>
					</select>
				</div>
				
			</div>
		
		</div>

	<br>
<script>
	const searchWord =()=>{
		const word = document.getElementById("search_button").previousElementSibling.value;
		const nation = document.getElementById("sel-nation").value;
		const diffi = document.getElementById("sel-easy").value;
		console.log(word,nation,diffi);
	}
</script>



	</section>


	<div class="py-5 everybox">
		<div class="everybox">
		
	<!-- container -->
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3 everybox">
				<div class="col pad20">
					<div class="card shadow-sm">
						<a href="recipeClick.jsp"><img src="flower1.png" width="100%" height="225px"/></a>
						<div class="card-body">
							<p class="card-text" style="text-align:center"><a href="#">소떡소떡</a></p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group"></div>
								<small class="text-body-secondary"></small>
							</div>
						</div>
					</div>
				</div>
				<div class="col pad20">
					<div class="card shadow-sm">
						<a href="#"><img src="flower2.png" width="100%" height="225px"/></a>
						<div class="card-body">
							<p class="card-text" style="text-align:center"><a href="#">요리명</a></p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group"></div>
								<small class="text-body-secondary"></small>
							</div>
						</div>
					</div>
				</div>
				<div class="col pad20">
					<div class="card shadow-sm">
						<a href="#"><img src="asd.jpg" width="100%" height="225px"/></a>
						<div class="card-body">
							<p class="card-text" style="text-align:center"><a href="#">요리명</a></p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group"></div>
								<small class="text-body-secondary"></small>
							</div>
						</div>
					</div>
				</div>
				<div class="col pad20">
					<div class="card shadow-sm">
						<a href="#"><img src="asd.jpg" width="100%" height="225px"/></a>
						<div class="card-body">
							<p class="card-text" style="text-align:center"><a href="#">요리명</a></p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group"></div>
								<small class="text-body-secondary"></small>
							</div>
						</div>
					</div>
				</div>
				<div class="col pad20">
					<div class="card shadow-sm">
						<a href="#"><img src="asd.jpg" width="100%" height="225px"/></a>
						<div class="card-body">
							<p class="card-text" style="text-align:center"><a href="#">요리명</a></p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group"></div>
								<small class="text-body-secondary"></small>
							</div>
						</div>
					</div>
				</div>
				<div class="col pad20">
					<div class="card shadow-sm">
						<a href="#"><img src="asd.jpg" width="100%" height="225px"/></a>
						<div class="card-body">
							<p class="card-text" style="text-align:center"><a href="#">요리명</a></p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group"></div>
								<small class="text-body-secondary"></small>
							</div>
						</div>
					</div>
				</div>
				<div class="col pad20">
					<div class="card shadow-sm">
						<a href="#"><img src="asd.jpg" width="100%" height="225px"/></a>
						<div class="card-body">
							<p class="card-text" style="text-align:center"><a href="#">요리명</a></p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group"></div>
								<small class="text-body-secondary"></small>
							</div>
						</div>
					</div>
				</div>
				<div class="col pad20">
					<div class="card shadow-sm">
						<a href="#"><img src="asd.jpg" width="100%" height="225px"/></a>
						<div class="card-body">
							<p class="card-text" style="text-align:center"><a href="#">요리명</a></p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group"></div>
								<small class="text-body-secondary"></small>
							</div>
						</div>
					</div>
				</div>
				<div class="col pad20">
					<div class="card shadow-sm">
						<a href="#"><img src="asd.jpg" width="100%" height="225px"/></a>
						<div class="card-body">
							<p class="card-text" style="text-align:center"><a href="#">요리명</a></p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group"></div>
								<small class="text-body-secondary"></small>
							</div>
						</div>
					</div>
				</div>
				<div class="col pad20">
					<div class="card shadow-sm">
						<a href="#"><img src="asd.jpg" width="100%" height="225px"/></a>
						<div class="card-body">
							<p class="card-text" style="text-align:center"><a href="#">요리명</a></p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group"></div>
								<small class="text-body-secondary"></small>
							</div>
						</div>
					</div>
				</div>
				<div class="col pad20">
					<div class="card shadow-sm">
						<a href="#"><img src="asd.jpg" width="100%" height="225px"/></a>
						<div class="card-body">
							<p class="card-text" style="text-align:center"><a href="#">요리명</a></p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group"></div>
								<small class="text-body-secondary"></small>
							</div>
						</div>
					</div>
				</div>
				<div class="col pad20">
					<div class="card shadow-sm">
						<a href="#"><img src="asd.jpg" width="100%" height="225px"/></a>
						<div class="card-body">
							<p class="card-text" style="text-align:center"><a href="#">요리명</a></p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group"></div>
								<small class="text-body-secondary"></small>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="div-flexible div-center" style="height: 50px">
				<div>
					<button id="write-button" style="border-radius:10px;">글 작성</button>
				</div>
			</div>
			<br>
			<div class="mx-auto" id="page_navigation" style="width: 210px;">
				<ul class="pagination pagination-sm">
					<li class="page-item"><a class="page-link" href="#">이전</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">다음</a></li>
				</ul>
			</div>
		</div>
	</div>


	<div id="footer">
		<div id="footer_inner">
			<div id="company" class="font">사업자: (주) 혼밥심</div>
			<div id="leader" class="font">대표: 김남희</div>
			<div id="address" class="font">주소: 서울특별시 을지로입구역 근처</div>
		</div>
	</div>
</div>
</body>
</html>
