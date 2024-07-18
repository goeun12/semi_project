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
#searchWord{box-shadow:none; border-color:rgb(179,179,179)}
#pagination{width: 20%;
			margin-left:44%;
			font-size:15px;
			text-align:center;}

.pageItem{margin-right:10px; text-align:center;}

.pageLink{color:black;
		text-decoration-color:black;
		text-decoration-line:none;
		text-align:center;}
.container-fluid{font-family:'MinSans-Regular';}
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
			<div class="input-group mb-3" style="width:65%;">
				<c:if test="${ empty find }">
					<input type="text" class="form-control searchbar" id="searchWord" name="searchWord" placeholder="카테고리 선택도 검색버튼을 눌러주세요">
				</c:if>
				<c:if test="${ not empty find }">
					<input type="text" class="form-control searchbar" id="searchWord" name="searchWord" placeholder="카테고리 선택도 검색버튼을 눌러주세요" value="${find }">
				</c:if>
				<button class="btn btn-outline-secondary searchButton" id="search_button">검색</button>
			</div>
		</div>

		<div class="container text-center">
			<div class="div-flex div-center">
				<div class="recipe-option">
					<select id="sel-nation" class="form-select form-select-sm" name="nation" aria-label="Small select example">
					  <c:choose>
							<c:when test="${ nation eq 'all' or empty nation}">
								<option value="all" selected>국가</option>
								<option value="kr">한식</option>
								<option value="cn">중식</option>
								<option value="us">양식</option>
								<option value="jp">일식</option>
								<option value="no">분식</option>
							</c:when>
							<c:when test="${ nation eq 'kr' }">
								<option value="all">국가</option>
								<option value="kr" selected>한식</option>
								<option value="cn">중식</option>
								<option value="us">양식</option>
								<option value="jp">일식</option>
								<option value="no">분식</option>
							</c:when>
							<c:when test="${ nation eq 'cn' }">
								<option value="all">국가</option>
								<option value="ko">한식</option>
								<option value="cn" selected>중식</option>
								<option value="us">양식</option>
								<option value="jp">일식</option>
								<option value="no">분식</option>
							</c:when>
							<c:when test="${ nation eq 'us' }">
								<option value="all">국가</option>
								<option value="ko">한식</option>
								<option value="cn">중식</option>
								<option value="us" selected>양식</option>
								<option value="jp">일식</option>
								<option value="no">분식</option>
							</c:when>
							<c:when test="${ nation eq 'jp' }">
								<option value="all">국가</option>
								<option value="ko">한식</option>
								<option value="cn">중식</option>
								<option value="us">양식</option>
								<option value="jp" selected>일식</option>
								<option value="no">분식</option>
							</c:when>
							<c:when test="${ nation eq 'no' }">
								<option value="all">국가</option>
								<option value="ko">한식</option>
								<option value="cn">중식</option>
								<option value="us">양식</option>
								<option value="jp">일식</option>
								<option value="no" selected>분식</option>
							</c:when>
						</c:choose>
					</select>
				</div>
				
				<div class="recipe-option">
					<select id="sel-easy"class="form-select form-select-sm" name="difficulty" aria-label="Small select example">
						<c:if test="${ difficulty eq 'all' or empty difficulty}">
							<option value="all" selected>난이도</option>
							<option value="easy">하</option>
							<option value="mid">중</option>
							<option value="hard">상</option>
						</c:if>
						<c:if test="${ difficulty eq 'easy' }">
					  		<option value="all">난이도</option>
							<option value="easy" selected>하</option>
							<option value="mid">중</option>
							<option value="hard">상</option>
						</c:if>
						<c:if test="${ difficulty eq 'mid' }">	
							<option value="all">난이도</option>
							<option value="easy">하</option>
							<option value="mid" selected>중</option>
							<option value="hard">상</option>
						</c:if>
						<c:if test="${ difficulty eq 'hard' }">
							<option value="all">난이도</option>
							<option value="easy">하</option>
							<option value="mid">중</option>
							<option value="hard" selected>상</option>
						</c:if>
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




			
			<c:if test="${ empty bList }">
				<div class="div-flex" style="justify-content:center">
					<p>해당하는 결과가 없습니다.</p>
				</div>
			</c:if>
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3 everybox">
				<c:forEach items="${ bList }" var="b">
					<div class="col pad20" style="padding-left:20px;padding-right:20px; width:25%">
						<div class="card shadow-sm">
							<c:forEach items="${ rList }" var="r">
								<c:if test="${ b.boardNo == r.boardNo }">
									<c:forEach items="${ iList }" var="i">
										<c:if test="${ r.recipeNo == i.recipeNo }">
											<img src="${contextPath }/resources/image/${ i.imageName }" width="100%" height="225px"/>     <!-- 이미지가 저장되는 경로 -->
											<div class="card-body row">
												<input type="hidden" name="bNo" class="bNo" value="${ b.boardNo }">
												<input type="hidden" name="rNo" class="rNo" value="${ r.recipeNo }">
												<div class="d-flex col-8 align-items-center">
													<p class="card-text" style="text-align:left; font-weight:500; font-size:20px;">${ b.title }</p>
												</div>
												<div class="col-4 d-flex align-items-center" style="flex-direction:row-reverse">
													<small>${ b.boardCount }&nbsp;</small>
													<svg style="" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
														<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
														<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
													</svg>
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
	
			<div id="pagination">
				<ul class="pagination">
					<c:if test="${pi.currentPage > 1}">
						<li class="pageItem">
					 		<c:url value="${loc}" var="goBack">
					 			<c:param name="page" value="${pi.currentPage-1 }"/>
					 			<c:param name="searchWord" value="${find}"/>
					 			<c:param name="nation" value="${nation}"/>
					 			<c:param name="difficulty" value="${difficulty}"/>
					 		</c:url>
					 	 	<a class="pageLink" href="${goBack}">이전</a>
					 	</li>
				 	</c:if>
				 	<c:forEach begin ="${pi.startPage }" end="${pi.endPage}" var="p" >
				 		<c:url value="${loc}" var="goCurr">
				 			<c:param name="page" value="${p}"/>
				 			<c:param name="searchWord" value="${find}"/>
				 			<c:param name="nation" value="${nation}"/>
				 			<c:param name="difficulty" value="${difficulty}"/>
				 		</c:url>
				 	 	<li class="pageItem">
				 			<a class="pageLink pNum" href="${goCurr}">${p}</a>
				 	 	</li>				 	 
				 	</c:forEach>
				 	<c:if test="${pi.currentPage < pi.maxPage}">
					  	<li class="pageItem">
					 		<c:url value="${loc}" var="goNext">
					 			<c:param name="page" value="${pi.currentPage+1 }"/>
					 			<c:param name="searchWord" value="${find}"/>
					 			<c:param name="nation" value="${nation}"/>
					 			<c:param name="difficulty" value="${difficulty}"/>
					 		</c:url>
					 	 	<a class="pageLink" href="${goNext}">이후</a>
					 	</li>
				 	</c:if>
				 	
				</ul>
			</div>	
			
	<%-- <jsp:include page="../common/pagination.jsp"/> --%>
			
		</div>
	</div>

</div>
<jsp:include page="../common/footer.jsp"/>
	<script>
		window.onload=()=>{
			
			const pageItems = document.getElementsByClassName("pageItem");
			for(const pageItem of pageItems){
				pageItem.addEventListener('focus', function(){
					this.style.background='white';
					this.style.color='black';
					this.stylw.border='none';
				});	
				
				pageItem.addEventListener("click", function(){
					this.style.textDecoration = 'underline'; 
					this.style.fontWeight= 'bold';
					this.style.boxShadow = 'none';
					this.style.color='black';
				});				
				
			}
			
			const pNums = document.getElementsByClassName("pNum");
			for(const pNum of pNums){
				if(pNum.innerHTML == '${pi.currentPage}'){
					pNum.style.textDecoration = 'underline';
					pNum.style.fontWeight= 'bold';
				}
			}
			
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
