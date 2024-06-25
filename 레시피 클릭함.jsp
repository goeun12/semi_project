<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 클릭했음</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>    
<link href="allCSS.css" rel="stylesheet" type="text/css">
<style>

.container{border-radius:10px; min-width:1250px;}


</style>
</head>
<body id="clickbody">
	
<!-- header 자리 -->











<!-- 
		검색창
		
		밸류 가져와서 필터링
 -->
<div style="margin-left: 10rem !important; margin-right: 10rem !important; margin-top:7rem !important;" class="row py-lg-5">
   <div class="div-center div-flexible" style="padding-top:10px;padding-bottom:10px; ">
	<div class="input-group mb-3" style="width:70%">
	  <input type="text" class="form-control searchbar" placeholder="찾고자 하는 단어를 입력해주세요.">
	  <button class="btn btn-outline-secondary searchButton" type="button" id="search_button">검색</button>
	</div>
     </div>
</div>







<div class="div-min-width">
	<div id="notice_up_del float-sm-end"><!--  style="float:right;" -->
	
		<c:if test="${ loginUser.id == recipe.writer }">
			<a class="btn btn-primary me-md-2" href="#" role="button" id="recipe-up-btn">수정</a>
			<a class="btn btn-primary me-md-2" href="#" role="button" id="recipe-del-btn">삭제</a>
		</c:if>
	</div>
	<div id="tbdiv3" class="row text-center div-flexible col">
		<table class="tbround bgcw">
			<tr>
				<td class="td-rightline text-center" colspan='2' rowspan='3' style="width:40%">
					<p>사진</p>
				</td>
				<td class="td-bottomline" colspan='3' height="100px" style="text-align:center;">
					<div>요리명</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="recipe-option">	
						<select id="sel-nation" class="form-select form-select-sm" disabled>
			<!-- 현재 선택한 레시피 정보여야 함 -->
							<c:if test="${ recipe.nation =='kr' }">
								<option value="kr" selected>#한식</option>
							</c:if>
							<c:if test="${ recipe.nation =='cn' }">
								<option value="cn" selected>#중식</option>
							</c:if>
							<c:if test="${ recipe.nation =='us' }">
								<option value="us" selected>#양식</option>
							</c:if>
							<c:if test="${ recipe.nation =='jp' }">
								<option value="jp" selected>#일식</option>
							</c:if>
							<c:if test="${ recipe.nation =='no' }">
								<option value="no" selected>#분식</option>
							</c:if>
						</select>	
					</div>
				</td>
				<td>
					<div class="recipe-option">
						<select id="sel-easy"class="form-select form-select-sm" disabled>
							<c:if test="${ recipe.diffi =='easy' }">
								<option value="easy" selected>하</option>
							</c:if>
							<c:if test="${ recipe.diffi =='mid' }">	
								<option value="mid" selected>중</option>
							</c:if>
							<c:if test="${ recipe.diffi =='hard' }">
								<option value="hard" selected>상</option>
							</c:if>
						</select>
					</div>
				</td>
				<td id="recipe-own" style="font-size:15px;">작성자 이름</td>
			</tr>
			<tr>
				<td class="td-topline" colspan="3" height="300px" width="50px">
					<div>크기 보여주려고 테두리 넣어둠. 엔터는 안들어가지고, 글이 길어지면
					끝에 가면 알아서 줄바뀜.    요리 재료</div>
				</td>
			</tr>
		</table>
	</div>









	<div class="row mb-3 text-center div-min-width" style="margin-bottom:2rem !important; justify-content:center;">
		<table class="tbround bgcw" style="width:70%">
			<tr height="100px">
				<!-- <td width="200px" height="50px" style="border-right:0.5px solid black">재료</td> -->
				<td>요리에 대한 간단 소개</td>
			</tr>
		</table>
	</div>







	<div class="row mb-3 text-center div-min-width" style="margin-left:auto; margin-right:auto; justify-content:center;">
		<table class="tbround bgcw" style="width:70%">
			<tr>
				<td style="width:300px;">
					<div class="mb-3 text-center" style="margin:auto;width:250px;height:250px;">
						<img src="감사콩.png" height="250px" width="250px"/>
					</div>
				</td>
				<td>
					<div class=" mb-3 text-center" style="padding-top:70px;margin-left:50px;margin-right:30px;margin-top:30px;height:250px;">요리순서</div>
				</td>
			</tr>
			<tr>
				<td style="width:300px;">
					<div class=" mb-3 text-center" style="margin:auto;width:250px;height:250px;">
						<img src="감사콩.png" height="250px" width="250px"/>
					</div>
				</td>
				<td>
					<div class=" mb-3 text-center" style="padding-top:70px;margin-left:50px;margin-right:30px;margin-top:30px;height:250px;">요리순서</div>
				</td>
			</tr>
			<tr>
				<td style="width:300px;">
					<div class=" mb-3 text-center" style="margin:auto;width:250px;height:250px;">
						<img src="감사콩.png" height="250px" width="250px"/>
					</div>
				</td>
				<td>
					<div class=" mb-3 text-center" style="padding-top:70px;margin-left:50px;margin-right:30px;height:250px;">요리순서</div>
				</td>
			</tr>
		</table>
		<div>&nbsp;</div>
		<div></div>
	</div>
</div>




<hr>
<div>댓글이 추가될 자리</div>
<hr>





<div class="grid text-center div-flexible div-center div-min-width" style="margin-left:50px;margin-right:50px;">
	<div class="g-col-6 div-center div-flexible" id="recipe-recommend">
		<span>"${ recipe.nation }"</span> 레시피를 조회하셨네요. 다른 메뉴는 어떠세요?
	</div>
	<div class="div-center div-flexible slim-border" id="show-more"><a href="recipeMain.jsp">더보기</a></div>
</div>




<div class="py-5 div-min-width">
	<div class="container" style="padding-bottom:15px; width:70%;">
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
			<div class="col pad20" style="padding-left:20px;padding-right:20px;">
				<div class="card shadow-sm">
					<a href="#"><img src="떡볶이1.jpg" width="100%" height="225px" style=/></a>
					<div class="card-body">
						<p class="card-text" style="text-align:center;height:15px;"><a href="#">요리명</a></p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group"></div>
							<small class="text-body-secondary"></small>
						</div>
					</div>
				</div>
			</div>
			<div class="col pad20" style="padding-left:20px;padding-right:20px;">
				<div class="card shadow-sm">
					<a href="#"><img src="감사콩.png" width="100%" height="225px"/></a>
					<div class="card-body">
						<p class="card-text" style="text-align:center;height:15px;"><a href="#">요리명</a></p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group"></div>
							<small class="text-body-secondary"></small>
						</div>
					</div>
				</div>
			</div>
			<div class="col pad20" style="padding-left:20px;padding-right:20px;">
				<div class="card shadow-sm">
					<a href="#"><img src="감사콩.png" width="100%" height="225px"/></a>
					<div class="card-body">
						<p class="card-text" style="text-align:center;height:15px;"><a href="#">요리명</a></p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group"></div>
							<small class="text-body-secondary"></small>
						</div>
					</div>
				</div>
			</div>
			<div class="col pad20" style="padding-left:20px;padding-right:20px;">
				<div class="card shadow-sm">
					<a href="#"><img src="감사콩.png" width="100%" height="225px"/></a>
					<div class="card-body">
						<p class="card-text" style="text-align:center;height:15px;"><a href="#">요리명</a></p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group"></div>
							<small class="text-body-secondary"></small>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	
	
	
<div class="mx-auto" style="width:80px;">
	<a class="btn btn-primary me-md-2" href="noticeMainPage.html" role="button" id ="go_list_button">목록</a>
</div>
<div>&nbsp;</div>
	
	
	
	
	
	
<div id="gotop-button"><a href="#top"><img src="topButton.png" style="width:50px; height:50px;"></a></div>
	
	
	
<div id="footer">
	<div id="footer_inner">
		<div id="company" class="font">사업자: (주) 혼밥심</div>
		<div id="leader" class="font">대표: 김남희</div>
		<div id="address" class="font">주소: 서울특별시 을지로입구역 근처</div>
	</div>
</div>
</body>
</html>
