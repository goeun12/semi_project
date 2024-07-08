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
<link href="resources/css/allCss.css" rel="stylesheet" type="text/css">
<style>
.bgcw{background-color:white;}
.bottom-padding{padding-bottom:2rem !important;}


#clickbody{background-color:#fffbf2; font-size:20px;}
.card-text>a{text-decoration:none;color:black;}
.card-body>p{height:15px;}
.container{border-radius:10px; min-width:1250px;}
.container-fluid{background:#fffbf2; padding-bottom: 15%; min-width: 1200px;
					font-family: "나눔고딕"; font-size:20px}
.card-text{font-size:15px;}


.div-flexible{display:flex;}
.div-center{justify-content:center;}
.div-textarea{margin-left:100px;margin-top:30px;width:600px; height:300px;}
.div-min-width{min-width:1250px;}


#foodname{text-align:center;}


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
#text-ingre{width:90%; padding-left:30px;padding-right:30px;}
.top-padding{padding-top:3rem !important;}


#up-del-btn{width:70%; justify-content:flex-end; margin-right:auto; margin-left:auto; margin-bottom:15px;}


.pad-top70{padding-top:70px;}
.pad20{padding:20px;}
.pagination-sm .page-link {background: none;
							border: none;
							color:black;}
.page-link:hover{color:black; font-size:large; text-decoration:underline;}

</style>
</head>
<body id="clickbody">
		
	<jsp:include page="../common/header.jsp"/>
	<!-- 
			검색창
			
			밸류 가져와서 필터링
	 -->
	<div style="margin-left: 10rem !important; margin-right: 10rem !important; margin-top:7rem !important;" class="row py-lg-5">
		<form action="${contextPath }/bunryuRecipe.re">
			<div class="div-center div-flexible" style="padding-top:10px;padding-bottom:10px; ">
				<div class="input-group mb-3" style="width:70%">
					<input name="searchWord" type="text" class="form-control searchbar" placeholder="찾고자 하는 단어를 입력해주세요.">
					<button class="btn btn-outline-secondary searchButton" id="search_button">검색</button>
				</div>
			</div>
		</form>
	</div>
	<div class="div-min-width">
		<div class="div-flexible text-center" id="up-del-btn">
			<c:if test="${ loginUser.id == recipe.writer }">
				<a class="btn btn-primary me-md-2" href="${contextPath }/updateRecipe.re" role="button" id="recipe-up-btn">수정</a>
				<a class="btn btn-primary me-md-2" href="${contextPath }/deleteRecipe.re" role="button" id="recipe-del-btn">삭제</a>
			</c:if>
		</div>
		<div id="tbdiv3" class="row text-center div-flexible col">
			<table class="tbround bgcw">
				<tr>
					<!-- 사진리스트 = 클릭했던 게시글 번호를 가진 레시피 번호를 가진 사진들 -->
					<c:forEach items="${ iList }" var="i">
						<c:if test="${ i.titleImg == 0 }">
							<td class="td-rightline text-center" colspan='2' rowspan='3' style="width:40%">
								<img src="${ contextPath }/resources/uploadImgs/${ i.imageName }">
							</td>
							<td class="td-bottomline" colspan='3' height="100px">
								<div>${ b.title }</div>
							</td>
						</c:if>
					</c:forEach>
				</tr>
				<tr>
					<td style="width:100px">
						<div class="recipe-option">	
							<select id="sel-nation" class="form-select form-select-sm" disabled>
								<c:choose>
									<c:when test="${ r[0].nation eq 'kr' }"><option value="kr" selected>#한식</option></c:when>
									<c:when test="${ r[0].nation eq 'cn' }"><option value="cn" selected>#중식</option></c:when>
									<c:when test="${ r[0].nation eq 'us' }"><option value="us" selected>#양식</option></c:when>
									<c:when test="${ r[0].nation eq 'jp' }"><option value="jp" selected>#일식</option></c:when>
									<c:when test="${ r[0].nation eq 'no' }"><option value="no" selected>#분식</option></c:when>
								</c:choose>
							</select>	
						</div>
					</td>
					<td style="width:100px">
						<div class="recipe-option">
							<select id="sel-easy"class="form-select form-select-sm" disabled>
								<c:if test="${ r[0].difficulty eq 'easy' }">
									<option value="easy" selected>하</option>
								</c:if>
								<c:if test="${ r[0].difficulty eq 'mid' }">	
									<option value="mid" selected>중</option>
								</c:if>
								<c:if test="${ r[0].difficulty eq 'hard' }">
									<option value="hard" selected>상</option>
								</c:if>
							</select>
						</div>
					</td>
					<td id="recipe-own" style="font-size:15px;">${ b.writer }</td>
				</tr>
				<tr>
					<td class="td-topline" colspan="3" height="300px" width="50px">
						<div>요리 재료. ${ r[0].ingredients }</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="row mb-3 text-center div-min-width" style="margin-bottom:2rem !important; justify-content:center;">
			<table class="tbround bgcw" style="width:70%">
				<tr height="100px">
					<!-- <td width="200px" height="50px" style="border-right:0.5px solid black">재료</td> -->
					<td>${ r[0].intro }</td>
				</tr>
			</table>
		</div>
		<div class="row mb-3 text-center div-min-width" style="margin-left:auto; margin-right:auto; justify-content:center;">
			<table class="tbround bgcw" style="width:70%">
<!-- forEach : 사진 + 요리순서들 -->				
				<c:forEach items="${ iList }" var="i" varStatus="status">
					<c:if test="${i.titleImg == 1 }">
						<tr>
							<td style="width:300px;">
								<div class="mb-3 text-center" style="margin:auto;width:250px;height:250px;">
									<img src="${ contextPath }/resources/uploadImgs/${ i.imageName }" height="250px" width="250px"/>
								</div>
							</td>
							<td>
								<div class=" mb-3 text-center" style="padding-top:70px;margin-left:50px;margin-right:30px;margin-top:30px;height:250px;">
									${ contents[status.index] }
								</div>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			<div>&nbsp;</div>
			<div></div>
		</div>
	</div>
	<hr>
	
	<form>
		<div style="margin-left: 10px;">
			<div class="input-group mb-3" id="comment">
	 			<input type="text" class="form-control" name="noticeKey" placeholder="댓글을 적어주세요" >
	 			<button class="btn btn-outline-secondary" id="search_button">등록</button>
			</div>	
		</div>
	</form>	

	<div class="div-flexible div-center" style="height: 50px"></div>


<%-- 댓글 --%>
	<div id="honey_table_div">	
		<div id="honey_table">
			<table class="table table-hover " style="width: 1300px; margin-left:120px;" border="1" >
			  <thead>
			    <tr>
					<th scope="col" style="width: 100px; font-weight:700; text-align: center; ">글번호</th>
					<th scope="col" style="width: 200px; font-weight:700; text-align: center;">ID</th>
					<th scope="col" style="width: 600px; font-weight:700; ">댓글 내용</th>
					<th scope="col" style="width: 100px; font-weight:700; text-align: center;">작성일</th>
					<th scope="col" style="width: 300px; font-weight:700; text-align: center;">수정/삭제</th>
			    </tr>
			  </thead>
			  <tbody class="table-group-divider" >
			    <tr>
				      <td scope="row" style="text-align: center;">1</td>
				      <td style="text-align: center;">yerin</td>
				      <td>인생은 무엇인가? </td>
				      <td style="text-align: center;">2024.06.10</td>
				      <td> </td>
			    </tr>
			    <tr>
				      <td scope="row"  style="text-align: center;">2</td>
				      <td style="text-align: center;">jungmin</td>
				      <td>피자나 시켜 먹자</td>
				      <td style="text-align: center;">2024.06.10</td>
				      <td> </td>
			    </tr>
			    <tr>
				      <td scope="row" style="text-align: center;">3</td>
				      <td style="text-align: center;">namhee</td>
				      <td>돈 없어서 못 먹음</td>
				      <td style="text-align: center;">2024.06.10</td>
				      <td> </td>
			    </tr>
				<tr>
				      <td scope="row" style="text-align: center;">4</td>
				      <td style="text-align: center;">goeun</td>
				      <td>집가고 싶다. </td>
				      <td style="text-align: center;">2024.06.10</td>
				      <td> </td>
			    </tr>
			    <tr>
				      <td scope="row" style="text-align: center;">5</td>
				      <td style="text-align: center;">iohc</td>
				      <td>졸림</td>
				      <td style="text-align: center;">2024.06.10</td>
				      <td> 
				      	<div id ="notice_up_del" >
							<a class="btn btn-primary me-md-2" href="#" role="button" id ="update_button">수정</a>
							<a class="btn btn-primary me-md-2" href="#" role="button" id ="delete_button">삭제</a>
						</div>
				      </td>
			    </tr>
			  </tbody>
			</table>			
		</div>
	</div>
	
	<hr>
	<div class="grid text-center div-flexible div-center div-min-width" style="margin-left:50px;margin-right:50px;">
		<div class="g-col-6 div-center div-flexible" id="recipe-recommend">
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
		<div class="div-center div-flexible slim-border" id="show-more"><a href="recipeMain.jsp">더보기</a></div>
	</div>
	<div class="py-5 div-min-width">
		<div class="container" style="padding-bottom:15px; width:70%;">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<div class="col pad20" style="padding-left:20px;padding-right:20px;">
					<c:forEach items="${ bList }" var="bList">
						<c:if test="${ status.index < 4 }">
							<c:forEach items="${ rList }" var="rList">
								<c:if test="${ rList.boardNo == bList.boardNo }">
									<div class="card shadow-sm">
										<c:forEach items="${iListAll }" var="ila">
											<c:if test="${ ila.recipeNo == rList.recipeNo }">
											<img src="저장소 그 긴거 /${ ila.imageName }" width="100%" height="225px"/>
											<div class="card-body">
												<p class="card-text" style="text-align:center;height:15px;">${ bList.title }</p>
												<div class="d-flex justify-content-between align-items-center">
													<div class="btn-group"></div>
													<small class="text-body-secondary"></small>
												</div>
											</div>
											<input type="hidden" name="bNo" value="${ bList.boardNo }">
											<input type="hidden" name="rNo" value="${ rList.recipeNo }">
											</c:if>
										</c:forEach>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>	
		
		
	<div class="mx-auto" style="display:flex; justify-content:center;">
		<a class="btn btn-primary me-md-2" href="recipeMain.jsp" role="button" id ="go_list_button" style="width:80px;">목록</a>
	</div>
	<div>&nbsp;</div>
	<div id="gotop-button"><a href="#top"><img src="topButton.png" style="width:50px; height:50px;"></a></div>
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
		}
	</script>
	
	
	
</body>
</html>
