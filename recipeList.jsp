<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼밥심 입니다</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>    
<link href="resources/css/allCss.css" rel="stylesheet" type="text/css"/>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
#notice_title{background:#f9ae98;
		width: 50%; height:50px;
		margin-left:25%;
		margin-block-end:0;
		text-align:center;
		text-decoration:none;
		font-size:25px; font-weight:700;
		line-height:50px; border-radius:5px;}
.container-fluid{background:#fffbf2; 
				 min-width: 1250px;
				 padding-top:80px;
				 padding-bottom:10%;
				font-family: "MinSans-Regular;"; font-size:20px}
.py-5{margin-right:auto;margin-left:auto;}
</style>
</head>
<body>

<jsp:include page="../common/header.jsp"></jsp:include>

<jsp:include page="../common/topButton.jsp"/>

<div class="container-fluid">
	<div class="row">
		<div id="notice_title">
   		<p>레시피 게시판</p>
 		</div>
	
			
		<jsp:include page="../notice/noticeCommon.jsp"/>
	</div>
		
	<form id="searchForm" action="${contextPath }/searchRecipe.re">
		<div class="div-center div-flex" style="padding-top:10px;padding-bottom:10px; ">
			<div class="input-group mb-3" style="width:85%;">
				<input type="text" class="form-control searchbar" id="searchWord" name="searchWord" placeholder="카테고리 선택도 검색버튼을 눌러주세요"">
				<button class="btn btn-outline-secondary searchButton" id="search_button">검색</button>
			</div>
		</div>

		<div class="container text-center">
			<div class="div-flex div-center">
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


	<div class="py-5 everybox">
		<div class="container">
			<div class="div-flex text-center" style="height: 50px;width:70%; justify-content:flex-end; margin-left:auto; margin-bottom:15px;">
				<c:if test="${ not empty loginUser }">
					<div>
						<a href="write.re"><button id="write-button" style="border-radius:10px; width:120px;">글쓰기</button></a>
					</div>
				</c:if>
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
	
	
	
	
			
<!-- 
	수업시간에 한 pagination 써먹기
 -->
			
			<jsp:include page="../common/pagination.jsp"/>
		</div>
	</div>

</div>
<jsp:include page="../common/footer.jsp"/>
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
				console.log(nation);
				location.href = '${contextPath}/searchRecipe.re?searchWord='+searchWord+'&nation='+nation+'&difficulty='+difficulty;
					
			});
		}
		
		
		
		
		
		
	</script>

</body>
</html>
