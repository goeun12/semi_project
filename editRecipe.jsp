<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 수정중입니다</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>    
<link href='<c:url value="/resources/css/allCss.css"/>' rel="stylesheet" type="text/css">

<style>
#edit-div{font-family:'MinSans-Regular';}
.border-lr-radius{border-top-left-radius:10px; border-top-right-radius:10px;}
</style>

</head>
<body id="recipe-body">
	<jsp:include page="../common/header.jsp"/>
	<div style="margin-left: 10rem !important; margin-right: 10rem !important; margin-top:7rem !important;" class="row py-lg-5">
	   
	</div>
	
	<!-- 1번째 칸 -->
<form action="${contextPath }/editRecipe.re" method="POST" id="recipeForm" enctype="multipart/form-data" onsubmit="return doNot();">	
	<div id="edit-div">
		<div id="tbdiv3" class="row text-center div-flex col div-min-width">
	
			<table class="tbround bgcw" style="width:100%;">
				<tr>
					<td class="td-rightline" colspan='2' rowspan='3' style="width:26%">
						<input class="form-control form-control-lg td-input" id="formFileLg" type="file" name="file" accept="image/*" onchange="previewIMG(this);">
						<c:forEach items="${ iList }" var="i">
							<c:if test="${ i.titleImg == 0 }">
								<img src="" id="firImg" width="350px" height="350px">
							</c:if>
						</c:forEach>
					</td>
					<td class="td-bottomline" colspan='3' height="44px" width="50px">
						<input class="td-input" type="text" name="title" style="font-size:20px;width:100%;height:40px; border: 0; text-align:center;" placeholder="요리명" value="${ b.title }"/>
					</td>
				</tr>
				<tr style="display:flex;justify-content:center;">
					<td>
						<div class="recipe-option">	
							<select id="sel-nation" class="form-select form-select-sm" name="nation">
								<c:choose>
									<c:when test="${ r[0].nation eq 'kr' }">
										<option value="kr" selected>한식</option>
										<option value="cn">중식</option>
										<option value="us">양식</option>
										<option value="jp">일식</option>
										<option value="no">분식</option>
									</c:when>
									<c:when test="${ r[0].nation eq 'cn' }">
										<option value="ko">한식</option>
										<option value="cn" selected>중식</option>
										<option value="us">양식</option>
										<option value="jp">일식</option>
										<option value="no">분식</option>
									</c:when>
									<c:when test="${ r[0].nation eq 'us' }">
										<option value="ko">한식</option>
										<option value="cn">중식</option>
										<option value="us" selected>양식</option>
										<option value="jp">일식</option>
										<option value="no">분식</option>
									</c:when>
									<c:when test="${ r[0].nation eq 'jp' }">
										<option value="ko">한식</option>
										<option value="cn">중식</option>
										<option value="us">양식</option>
										<option value="jp" selected>일식</option>
										<option value="no">분식</option>
									</c:when>
									<c:when test="${ r[0].nation eq 'no' }">
										<option value="ko">한식</option>
										<option value="cn">중식</option>
										<option value="us">양식</option>
										<option value="jp">일식</option>
										<option value="no" selected>분식</option>
									</c:when>
								</c:choose>
							</select>	
						</div>
					</td>
					<td>
						<div class="recipe-option">
							<select id="sel-easy"class="form-select form-select-sm" name="difficulty">
								<c:if test="${ r[0].difficulty eq 'easy' }">
									<option value="easy" selected>하</option>
									<option value="mid">중</option>
									<option value="hard">상</option>
								</c:if>
								<c:if test="${ r[0].difficulty eq 'mid' }">	
									<option value="easy">하</option>
									<option value="mid" selected>중</option>
									<option value="hard">상</option>
								</c:if>
								<c:if test="${ r[0].difficulty eq 'hard' }">
									<option value="easy">하</option>
									<option value="mid">중</option>
									<option value="hard" selected>상</option>
								</c:if>
							</select>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td class="td-underline td-rlline td-topline" colspan="3" height="300px" width="50px">
						<textarea name="ingredients" class="td-textarea"rows='5' placeholder="요리 재료" style="width:100%;height:90%;padding-left:30px;">${ r[0].ingredients }</textarea>
					</td>
				</tr>
			</table>
		</div>
	
	
	
	
	
	
	<!-- 2번째 칸 -->
		<div class="row mb-3 text-center div-min-width" style="margin-bottom:1rem !important;margin-left:auto; margin-right:auto; height:100px;width:70%">
			<table class="tbround bgcw">
				<tr>
					<td width="200px" height="50px" style="border-right:0.5px solid black;text-align:center;">요리 소개</td>
					<td width="" height="60px" style="padding-left:50px">
						<textarea id="text-ingre" name="intro" class="td-textarea" rows='2' placeholder="요리에 대한 간단한 소개">${ r[0].intro }</textarea>
					</td>
				</tr>
			</table>
		</div>
	
	
	
		<div class="row text-center div-min-width" style="margin-left:auto; margin-right:auto;width:70%;">
			<table class="tbround bgcw">
				<!-- 아래 버튼 클릭 -> tr부분 테이블 안에 추가 -->
				<tbody id="table_body">
					<c:forEach items="${ iList }" var="i" varStatus="status">
						<c:if test="${ i.titleImg == 1 }">
								<tr>
									<td style="width:150px; text-align:center;font-size:30px">step${status.index }</td>
									<td class="td-jus-con previewImg">
										<div class="slim-border mb-3 text-center td-div-img">
											<input class="form-control form-control-lg" type="file" accept="image/*" name="file">
											<img src="" class="preview"/>
										</div>
									</td>
									<td>
										<div class="slim-border mb-3 text-center div-textarea pad-top50">
											<textarea class="making-num " placeholder="번호 없이 해당 순서의 레시피를 작성해 주세요">${ contents[status.index - 1] }</textarea>
										</div>
									</td>
								</tr>
							</c:if>
					</c:forEach>
				</tbody>
			</table>
			<div>&nbsp;</div>
			<div class="div-flex div-center" style="height: 50px">
				<div>
					<button class="btn btn-primary me-md-2" id="plus-level" type="button" onclick="add_tr('table_body')">단계 추가</button>
				</div>
				<div>
					<button class="btn btn-primary me-md-2" id="minus-level" type="button" onclick="delete_tr('this')">단계 삭제</button>
				</div>
		   </div>
		</div>
		<input type="hidden" name="content" id="inputContent"/>
	
		<script>
			window.onload=()=>{
				const tbody = document.getElementById("table_body");
				tbody.addEventListener('mouseout',e=>{
					const eventTarget = e.target;
					
					const targetTagName = eventTarget.tagName.toLowerCase();
					let targetSVG = null;
					switch(targetTagName){
					case 'tr' : targetInput = eventTarget.children[1].children[0].children[0];break;
					case 'td' : targetInput = eventTarget.parentElement.children[1].children[0].children[0];break;
					case 'div' : targetInput = eventTarget.parentElement.parentElement.children[1].children[0].children[0];break;
					case 'textarea' : targetInput = eventTarget.parentElement.parentElement.parentElement.children[1].children[0].children[0];break;
					}
					console.log(targetInput);
					const imgPre = targetInput.nextElementSibling;
					var fReader = new FileReader();
					fReader.onload = function(event){
						imgPre.src = event.target.result;
						imgPre.style.width = '250px';
						impPre.style.height = '250px';
					};
					fReader.readAsDataURL(targetInput.files[0]);
				});
				
				
				
			}
			
			function previewIMG(This){
				var firImg = document.getElementById("firImg");
				if(This.files[0]){
					var reader = new FileReader();
					reader.onload = function(e){
						firImg.src = e.target.result;
						firImg.style.width = '350px';
						firImg.style.height= '350px';
					};
					reader.readAsDataURL(This.files[0]);
				}else{
					firImg.src = "";
				}
			}
			function getAllMaking(){
				const textareas = document.getElementsByClassName("making-num");
				let textvalue = "";
				for(const i of textareas){
					textvalue += i.value+'§§●';
				}
				document.getElementById("inputContent").value = textvalue;
				
			}
			
			function doNot(){
				const inputs = document.getElementsByName("file");
				let count = 0;
				for(const f of inputs){
					console.log(f.value);
					if(f.value == ""){
						count = count + 1;
					}
				}
				if(count>0){ // count>0 -> 이미지 빈칸이 있다
					alert("이미지를 모두 넣어주세요");
					return false;
				} else{
					const title = document.getElementsByName("title")[0].value;
					const ingredients = document.getElementsByName("ingredients")[0].value;
					if(title.trim() == '' || ingredients.trim() == ''){ // 제목이 없거나 내료가 없으면
						alert("요리명 또는 재료를 입력해 주세요.")
						return false;
					}else{
						return true;
					}
				}
				
			}
			
			function add_tr(table_body){
				let tbody = document.getElementById("table_body");
				const newTr = document.createElement('tr');
				newTr.innerHTML = '<td style="width:150px; text-align:center;font-size:30px"></td><td class="td-jus-con previewImg"><div class="slim-border mb-3 text-center td-div-img border-lr-radius"><input class="form-control form-control-lg input-image" type="file" accept="image/*" name="file"><img class="preview" /></div></td><td><div class="slim-border mb-3 text-center div-textarea pad-top50"><textarea class="making-num " placeholder="번호 없이 해당 순서의 레시피를 작성해 주세요"></textarea></div></td>';
				tbody.append(newTr);
				let trCount = tbody.childElementCount;
				tbody.lastElementChild.children[0].innerText = 'step' + trCount;
			}
			
			function clean_first_tr(firstTr){
				let children = firstTr.children;
				
				children = Array.isArray(children) ? children :
				Object.values(children);
				children.forEach(x=>{
					if(x !== firstTr.latsElementChild){
						x.firstElementChild.value='';
					}
				});
			}
			
			function delete_tr(This){
				var trs = document.getElementById("table_body");
				if(trs.childElementCount<=1){
					alert("1개 이상의 순서를 적어주세요.");
				} else{
					trs.lastChild.remove();
				}
			}
		</script>
	
		<input type="hidden" name="boardNo" value="${ b.boardNo }">
		<input type="hidden" name="recipeNo" value="${ r[0].recipeNo }">
		<div>&nbsp;</div>
		
		<div class="mx-auto" style="width:80px;">
			<button class="btn btn-primary me-md-2" type="submit" id="go_list_button" onclick="getAllMaking();">등록</button>
		</div>
		<div>&nbsp;</div>
	</div>
</form>	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>
