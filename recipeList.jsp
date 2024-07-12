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
<link href='<c:url value="/resources/css/allCss.css"/>' rel="stylesheet" type="text/css">

<style></style>
</head>
<body>



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
		
		<form>
			<div class="div-center div-flexible" style="padding-top:10px;padding-bottom:10px; ">
				<div class="input-group mb-3" style="width:85%;">
					<input type="text" class="form-control searchbar" id="searchWord" name="searchWord" placeholder="카테고리 선택도 검색버튼을 눌러주세요">
					<button class="btn btn-outline-secondary searchButton" type="button" id="search_button">검색</button>
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
			
			const search = document.getElementById('search_button');
			search.addEventListener('click',()=>{
				const searchWord = document.getElementById('searchWord').value;
				const nation = document.getElementById('sel-nation').value;
				const difficulty = document.getElementById('sel-easy').value;
				
				console.log(searchWord);
				console.log(nation);
				console.log(difficulty);
				
				location.href = '${contextPath}/searchRecipe.re?searchWord='+searchWord+'&nation='+nation+'&difficulty='+difficulty;
			})
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
