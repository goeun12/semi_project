<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 상세조회</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>    
<link href='<c:url value="/resources/css/allCss.css"/>' rel="stylesheet" type="text/css">
<style>
#clickbody{font-family: 'MinSans-Regular';}

</style>
</head>
<body id="clickbody">
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/topButton.jsp"/>
	<div style="margin-left: 10rem !important; margin-right: 10rem !important; margin-top:7rem !important;" class="row py-lg-5">
		<form action="${contextPath }/bunryuRecipe.re" id="searchForm" onsubmit="return false"">
			<div class="div-center div-flex" style="padding-top:10px;padding-bottom:10px;">
				<div class="input-group mb-3" style="width:70%">
					<input name="searchWord" id="searchWord" type="text" class="form-control searchbar"
					onkeyup="if(event.keyCode=='13'){event.preventDefault(); fnSearch();}" placeholder="찾고자 하는 단어를 입력해주세요.">
					<input type="hidden" name="difficulty" value="all">
					<input type="hidden" name="nation" value="all">
					<button class="btn btn-outline-secondary searchButton" id="search_button" type="button">검색</button>
				</div>
			</div>
		</form>
	</div>
	<form method="POST" id="updelForm">
		<div class="div-min-width">
			<div class="div-flex text-center" id="up-del-btn">
				<c:if test="${ loginUser.id == b.writer }">
					<button class="btn btn-primary me-md-2" type="button" id="recipe-up-btn">수정</button>
					<button class="btn btn-primary me-md-2" type="button" id="recipe-del-btn">삭제</button>
					<input type="hidden" name="bNumber" id="bNo" value="${ b.boardNo }">
					<input type="hidden" name="rNumber" id="rNo" value="${ r[0].recipeNo }">
				</c:if>
				
			</div>
			<div id="tbdiv3" class="row text-center div-flex col">
				<table class="tbround bgcw">
					<tr>
						<c:forEach items="${ iList }" var="i">
							<c:if test="${ i.titleImg == 0 }">
								<td class="td-rightline text-center" colspan='2' rowspan='3' style="width:30%">
									<img src="${ contextPath }/resources/image/${ i.imageName }" width="400px" height="400px">
								</td>
								<td class="td-bottomline" colspan='4' height="47px">
									<div>${ b.title }</div>
								</td>
							</c:if>
						</c:forEach>
					</tr>
					<tr>
						<td style="width:100px">
							<div class="recipe-option">	
								<c:choose>
									<c:when test="${ r[0].nation eq 'kr' }">한식</c:when>
									<c:when test="${ r[0].nation eq 'cn' }">중식</c:when>
									<c:when test="${ r[0].nation eq 'us' }">양식</c:when>
									<c:when test="${ r[0].nation eq 'jp' }">일식</c:when>
									<c:when test="${ r[0].nation eq 'no' }">분식</c:when>
								</c:choose>
							</div>
						</td>
						<td style="width:130px">
							<div class="recipe-option">
								<c:if test="${ r[0].difficulty eq 'easy' }">난이도 : 하</c:if>
								<c:if test="${ r[0].difficulty eq 'mid' }">난이도 : 중</c:if>
								<c:if test="${ r[0].difficulty eq 'hard' }">난이도 : 상</c:if>
							</div>
						</td>
						<td id="recipe-own" style="font-size:20px;">작성자 : ${ b.writer }</td>
						<td style="font-size:20px;">조회수 : ${ b.boardCount }</td>
					</tr>
					<tr>
						<td class="td-topline" colspan="4" height="300px" width="50px">
							<div>${ r[0].ingredients }</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="row mb-3 text-center div-min-width" style="margin-bottom:2rem !important; justify-content:center;">
				<table class="tbround bgcw" style="width:70%">
					<tr height="100px">
						<td>${ r[0].intro }</td>
					</tr>
				</table>
			</div>
			<div class="row mb-3 text-center div-min-width" style="margin-left:auto; margin-right:auto; justify-content:center;">
				<table class="tbround bgcw" style="width:70%">
					<c:forEach items="${ iList }" var="i" varStatus="status">
						<c:if test="${i.titleImg == 1 }">
							<tr style="border-bottom: 0.5px solid lightgray;">
								<td style="width:400px;">
									<div class="mb-3 text-center" style="margin-left:auto;margin-right:auto;margin-top:1rem !important;width:250px;height:250px;">
										<img src="${ contextPath }/resources/image/${ i.imageName }" height="250px" width="250px"/>
									</div>
								</td>
								<td>
									<div class=" mb-3 text-center" style="padding-top:70px;margin-left:50px;margin-right:30px;margin-top:30px;height:250px;">
										${ status.index }. ${ contents[status.index - 1] }
									</div>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
				<div>&nbsp;</div>
				<div>&nbsp;</div>
				
			</div>
		</div>
	</form>
	
	<jsp:include page="../common/reply.jsp"/>
	<br><br>
	
	<div class="mx-auto" style="display:flex; justify-content:center;">
           <c:if test="${ empty myPage }">
            <a class="btn btn-primary me-md-2" href="${ contextPath }/recipe.re" role="button" id="go_list_button" style="width:80px;">목록</a>
         </c:if>
         <c:if test="${ !empty myPage }">
            <a class="btn btn-primary me-md-2" href="${ contextPath }/myBoardList.user?page=${page}" role="button" id="go_list_button" style="width:80px;">목록</a>
         </c:if>
      </div>
	
	<div class="div-flex div-center" style="height: 50px"></div>


	
	
	
	
	
	<hr>
	<div class="grid text-center div-flex div-center div-min-width" style="margin-left:50px;margin-right:50px;">
		<div class="g-col-6 div-center div-flex" id="recipe-recommend">
			<span>
				<c:choose>
					<c:when test="${ r[0].nation eq 'kr' }">한식</c:when>
					<c:when test="${ r[0].nation eq 'cn' }">중식</c:when>
					<c:when test="${ r[0].nation eq 'us' }">양식</c:when>
					<c:when test="${ r[0].nation eq 'jp' }">일식</c:when>
					<c:when test="${ r[0].nation eq 'no' }">분식</c:when>
				</c:choose>
			</span> 레시피를 조회하셨네요. 다른 메뉴는 어떠세요?
		</div>
		<form action="${contextPath }/searchRecipe.re">
			<div class="div-center div-flex slim-border" id="show-more">
				<button style="border:none; background-color:white;">더보기</button>
				<input type="hidden" name="nation" value="${ r[0].nation }">
			</div>
		</form>
	</div>
	<div class="py-5 div-min-width">
		<div class="container" style="padding-bottom:15px; width:70%;">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<c:forEach items="${ bList }" var="bList" varStatus="status">
					<c:if test="${ status.index < 4 }">
						<c:forEach items="${ rList }" var="rList">
							<c:if test="${ rList.boardNo == bList.boardNo }">
								<div class="col pad20 width25" style="padding-left:20px;padding-right:20px; width:25%">
									<div class="card shadow-sm">
										<c:forEach items="${iListAll }" var="ila">
											<c:if test="${ ila.recipeNo == rList.recipeNo }">
												<img src="${ contextPath }/resources/image/${ ila.imageName }" width="100%" height="225px"/>
												<div class="card-body">
													<p class="card-text" style="text-align:center;height:15px;">${ bList.title }</p>
													<div class="d-flex justify-content-between align-items-center">
														<div class="btn-group"></div>
														<small class="text-body-secondary"></small>
													</div>
												</div>
												<input type="hidden" name="bNo" class="bNo" value="${ bList.boardNo }">
												<input type="hidden" name="rNo" class="rNo" value="${ rList.recipeNo }">
											</c:if>
										</c:forEach>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>	
	
	<div class="modal fade" tabindex="-1" role="dialog" id="modalEdit">
		<div class="modal-dialog" role="document">
    		<div class="modal-content rounded-3 shadow">
      			<div class="modal-body p-4 text-center">
        			<h3 class="mb-0">정말 수정하시겠습니까?</h3>
        			<p class="mb-0">수정 시 기존 이미지들은 다시 입력해야 합니다.</p>
      			</div>
      			<div class="modal-footer flex-nowrap p-0">
        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" id="edit">
        				<strong>네</strong>
        			</button>
        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니오</button>
      			</div>
    		</div>
  		</div>
	</div>
	
	<div class="modal fade" tabindex="-1" role="dialog" id="modalChoice">
		<div class="modal-dialog" role="document">
    		<div class="modal-content rounded-3 shadow">
      			<div class="modal-body p-4 text-center">
        			<h3 class="mb-0">정말로 삭제하시겠습니까?</h3>
        			<p class="mb-0">삭제 후 글은 복구할 수 없습니다.</p>
      			</div>
      			<div class="modal-footer flex-nowrap p-0">
        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" id="delete">
        				<strong>네</strong>
        			</button>
        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니오</button>
      			</div>
    		</div>
  		</div>
	</div>
	
	
		
	<div>&nbsp;</div>
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		window.onload=()=>{
			const divs = document.getElementsByClassName('card');
			for(const div of divs){
				div.addEventListener('click',function(){
					const bNo = this.querySelector('.bNo').value; 
					const rNo = this.querySelector('.rNo').value;
					console.log(bNo);
					console.log(rNo);
					location.href = '${contextPath}/recipeContent.re?bNo='+bNo+'&rNo='+rNo+'&page=1';
				});
			}
			
			const form = document.getElementById('updelForm');
			
			if(document.getElementById('recipe-up-btn') != null){
				document.getElementById('recipe-up-btn').addEventListener('click',() => {
					$('#modalEdit').modal('show');
				});
			}
			
			const goEdit = document.getElementById('edit');
			goEdit.addEventListener('click',()=>{
				form.action = '${contextPath}/updateRecipe.re';
				form.submit();
			});
			
			
			if(document.getElementById('recipe-del-btn') != null){
				document.getElementById('recipe-del-btn').addEventListener('click',() => {
					$('#modalChoice').modal('show');
				});
			}
			
			const del = document.getElementById('delete');
			
				del.addEventListener('click',()=>{
					
					form.action = '${contextPath}/deleteRecipe.re';
					form.submit();
				});
			
			
			const search = document.getElementById('search_button');
			search.addEventListener('click',()=>{
				const searchWord = document.getElementById('searchWord').value;
				const nation = "all";
				const difficulty = "all";
				location.href = '${contextPath}/searchRecipe.re?searchWord='+searchWord+'&nation='+nation+'&difficulty='+difficulty;
			});
		}
		
		function fnSearch(){
			location.href = '${contextPath}/searchRecipe.re?searchWord='+document.getElementById('searchWord').value + '&nation=all&difficulty=all';
		}
		
	</script>
	
	
	
</body>
</html>
