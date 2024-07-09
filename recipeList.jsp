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
<link href="../../../resources/css/allCss.css" rel="stylesheet" type="text/css">

<style>








.bgcw{background-color:white;}
.bottom-padding{padding-bottom:2rem !important;}


#clickbody{background-color:#fffbf2; font-size:20px;}
.card-text>a{text-decoration:none;color:black;}
.card-body>p{height:15px;}
.container{min-width:1250px;}
.container-fluid{background:#fffbf2; padding-bottom: 15%; min-width: 1200px;
					font-family: "나눔고딕"; font-size:20px}
.card-text{font-size:15px;}
.card:hover{cursor:pointer;}


.div-flexible{display:flex;}
.div-center{justify-content:center;}
.div-textarea{margin-left:100px;margin-top:30px;width:600px; height:300px;}
.div-min-width{min-width:1250px;}


#foodname{text-align:center;}
#formFileLg{position : relative; top:-185px;}


#gotop-button{position: fixed; right: 30px; bottom: 100px; z-index:99;}
#go_list_button:hover, #plus-level:hover{background-color:#a5250a;font-weight:600;}
#go_list_button, #plus-level{background-color:#f24822;border:0;font-weight:400;}
#go_list_button{margin-top:30px;}


#minus-level{background-color:#b3b3b3; font-weight:400;border:none}
#minus-level:hover{background-color:rgb(129,129,129)}
.making-num{border: 0; width:70%; height:80%;resize:none;}
.making-num:focus{outline:0}
.margin-lrt{margin-left: 10rem !important; margin-right: 10rem !important; margin-top:7rem !important;}
.margin-lrpx{margin-left:50px; margin-right:50px;}
#mypage_list{border: 0px; background: #FFFBF2; color: #FFC7C2; font-size: 17px;}
#mypage_Menu{display: none; height: 150px; border: 1px solid lightgray; background: white;}
#mypage_Menu li {margin-bottom: 15px; margin-top: 23px;}
#mypage_Menu a{color: black; text-decoration: none;}
#mypage_Menu a:hover{color: #0080ff; font-weight: 600;}


#notice_up_del{margin-bottom: 15px;}


.recipe-option{width:150px;padding-left:30px; padding-right:30px;padding-bottom:10px;padding-top:10px;}
.row-cols-md-3>*{flex:0 0 auto; width:25%;}
#recipe-recommend{border-radius:10px;}
#recipe-body{background-color:#fffbf2;}
#recipe-up-btn,#recipe-del-btn{background-color:#b3b3b3;border:none}
#recipe-title{font-size:40px;font-weight:300;}


.slim-border{border:0.5px solid lightgray;}
#search_button{width:80px;}
#show-more{margin-left:50px; height:30px; width:100px;background-color:white;border-radius:10px;}
#show-more>a{text-decoration:none;color:black;}
#search_button,#write-button{background:#f24822; color:white; border:none; 
							height:40px;
							text-decoration:none; 
							font-size:20px;
				 			width:80px;
					}
#search_button:hover,#write-button:hover{background:#a5250a;font-weight:700}
#sel-nation,#sel-easy{font-size:15px;}


.td-rightline{border-right: 0.5px solid lightgray;}
.td-topline{border-top: 0.5px solid lightgray;}
.td-leftline{border-left: 0.5px solid lightgray;}
.td-bottomline{border-bottom: 0.5px solid lightgray;}
.td-center{display:flex; text-align:center;}
#tbdiv3{margin-bottom:2rem !important;margin-left:auto;margin-right:auto;width:70%; justify-content:center;}
.td-input:focus{outline:none;}
.td-textarea{width:80%;height:80%;border:0;resize:none;font-size:20px;}
.td-textarea:focus{outline:none;}
.td-div-img{margin-left:50px;margin-top:30px;width:250px; height:300px;}
.tbround {
	border-collapse: collapse;
	border-radius: 10px;
	border-style: hidden;
	box-shadow: 0 0 0 1px lightgray;
}
.td-topline>div{border:1px solid black;
				width:95%;
				height:95%;
				margin-left:2%;
				display:flex;
				justify-content:center;
				align-items:center
}
.td-topline>div:hover{border:none}
#text-ingre{width:90%; padding-left:30px;padding-right:30px;}
.top-padding{padding-top:3rem !important;}


#up-del-btn{width:70%; justify-content:flex-end; margin-right:auto; margin-left:auto; margin-bottom:15px;}


.pad-top70{padding-top:70px;}
.pad20{padding:20px;}
.pagination-sm .page-link {background: none;
							border: none;
							color:black;}
.page-link:hover{color:black; font-size:large; text-decoration:underline;}


#logoImg{width:35px; height: 38px; margin-left: 20px; margin-right: 20px; float: left; margin-top: 10px;}






























.searchbar{margin-left:20%;}
.searchButton{margin-right:20%;}
.notice_title{background:#f9ae98;
			width: 50%; height:50px;
			margin-left:25%;
			margin-block-end:0;
			text-align: center;
			text-decoration:none;
			font-size:35px;
}
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
				<h1 id="recipe-title">레시피 게시판</h1>
			</div>
			<br>
			<div class="div-flexible div-center" style="padding-top:50px;padding-bottom:10px;">
				<div class="div-flexible" style="width: 50%; height: 30px;border:1px solid red;">
					<div class="bgcw" style="width:15%"><img src="as">&nbsp;공지</div>
					<div class="bgcw" style="width:100%;text-align:left; padding-left:100px;">공지사항 제목</div>
				</div>
			</div>
		</div>
		
		<form action="${contextPath }/bunryuRecipe.re">
			<div class="div-center div-flexible" style="padding-top:10px;padding-bottom:10px; ">
				<div class="input-group mb-3" style="width:85%;">
					<input type="text" class="form-control searchbar" name="searchWord" placeholder="찾고자 하는 단어를 입력해주세요.">
					<button class="btn btn-outline-secondary searchButton" type="button" id="search_button" name="searchButton">검색</button>
				</div>
			</div>
	
			<div class="container text-center">
				<div class="div-flexible  div-center">
					<div class="recipe-option">
						<select id="sel-nation" class="form-select form-select-sm" name="nation" aria-label="Small select example">
						  <option value="all"selected>국가</option>
						  <option value="kr">한식</option>
						  <option value="cn">중식</option>
						  <option value="us">양식</option>
						  <option value="jp">일식</option>
						  <option value="no">분식</option>
						</select>
					</div>
					
					<div class="recipe-option">
						<select id="sel-easy"class="form-select form-select-sm" name="difficulty" aria-label="Small select example">
						  <option value="all"selected>난이도</option>
						  <option value="easy">하</option>
						  <option value="mid">중</option>
						  <option value="hard">상</option>
						</select>
					</div>
					
				</div>
			
			</div>
		</form>
	<br>
	</section>


	<div class="py-5 everybox">
		<div class="container">
			<div class="div-flexible text-center" style="height: 50px;width:70%; justify-content:flex-end; margin-left:auto; margin-bottom:15px;">
				<div>
					<a href="write.re"><button id="write-button" style="border-radius:10px; width:120px;">글쓰기</button></a>
				</div>
			</div>





			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3 everybox">
				<c:forEach items="${ bList }" var="b">
					<div class="col pad20" style="padding-left:20px;padding-right:20px;">
						<div class="card shadow-sm">
							<c:forEach items="${ rList }" var="r">
								<c:if test="${ b.boardNo == r.boardNo }">
									<c:forEach items="${ iList }" var="i">
										<c:if test="${ r.recipeNo == i.recipeNo }">
											<img src="${contextPath }/resources/image/${ i.imageName }" width="100%" height="225px"/>     <!-- 이미지가 저장되는 경로 -->
											<div class="card-body">
											<input type="hidden" name="bNo" class="bNo" value="${ b.boardNo }">
											<input type="hidden" name="rNo" class="rNo" value="${ r.recipeNo }">
												<p class="card-text" style="text-align:center;height:15px;">${ b.title }</p><!-- b.title = 요리명 -->
												<div class="d-flex justify-content-between align-items-center">
												</div>
											</div>
										</c:if>
									</c:forEach>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
			</div>
			<br>
			<br>
	
	<script>
		window.onload=()=>{
			const divs = document.getElementsByClassName('card');
			for(const div of divs){
				div.addEventListener('click',function(){
					const bNo = this.querySelector('.bNo').value; 
					const rNo = this.querySelector('.rNo').value;
					console.log(bNo);
					location.href = '${contextPath}/recipeContent.re?bNo='+bNo+'&rNo='+rNo+'&page='+${pi.currentPage};
				});
			}
		}
	</script>
	
	
	
			
<!-- 
	수업시간에 한 pagination 써먹기
 -->
			
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
