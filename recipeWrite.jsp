<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 적는중</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>    
<!-- <link href="../../../resources/css/allCss.css" rel="stylesheet" type="text/css"/> -->

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


.pad-top50{padding-top:50px;}
.pad20{padding:20px;}
.pagination-sm .page-link {background: none;
							border: none;
							color:black;}
.page-link:hover{color:black; font-size:large; text-decoration:underline;}







</style>

</head>
<body id="recipe-body">
	<jsp:include page="../common/header.jsp"/>
	<div style="margin-left: 10rem !important; margin-right: 10rem !important; margin-top:7rem !important;" class="row py-lg-5">
	   
	</div>
	
	<!-- 1번째 칸 -->
<form action="${contextPath }/insertRecipe.re" method="POST" id="recipeForm" enctype="multipart/form-data">	
	<div>
		<div id="tbdiv3" class="row text-center div-flexible col div-min-width">
	
			<table class="tbround bgcw" style="width:100%;">
				<tr>
					<td class="td-rightline" colspan='2' rowspan='3' style="width:28%">
						<input class="form-control form-control-lg td-input" id="formFileLg" type="file" name="file" accept="image/*" onchange="previewIMG(this);">
						<img id="firImg">
					</td>
				<td class="td-bottomline" colspan='3' height="44px" width="50px">
					
					<input class="td-input" type="text" name="title" style="font-size:20px;width:100%;height:40px; border: 0; text-align:center;" placeholder="요리명"/>
					
				</td>
				</tr>
				<tr style="display:flex;justify-content:center;">
					<td>
						<div class="recipe-option">	
							<select id="sel-nation" class="form-select form-select-sm" name="nation">
							  <option value="all" disabled>국가</option>
							  <option value="kr" selected>한식</option>
							  <option value="cn">중식</option>
							  <option value="us">양식</option>
							  <option value="jp">일식</option>
							  <option value="no">분식</option>
							</select>	
						</div>
					</td>
					<td>
						<div class="recipe-option">
							<select id="sel-easy"class="form-select form-select-sm" name="difficulty">
							  <option value="all" disabled>난이도</option>
							  <option value="easy" selected>하</option>
							  <option value="mid">중</option>
							  <option value="hard">상</option>
							</select>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td class="td-underline td-rlline td-topline" colspan="3" height="300px" width="50px">
						<textarea name="ingredients" class="td-textarea"rows='5' placeholder="요리 재료" style="width:100%;height:90%;padding-left:30px;"></textarea>
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
					<textarea id="text-ingre" name="intro" class="td-textarea" rows='2' placeholder="요리에 대한 간단한 소개"></textarea>
				</td>
			</tr>
		</table>
	</div>
	
	
	<!-- 3번째 칸 -->
	<div class="row text-center div-min-width" style="margin-left:auto; margin-right:auto;width:70%;">
		<table class="tbround bgcw">
			<!-- 아래 버튼 클릭 -> tr부분 테이블 안에 추가 -->
			<tbody id="table_body">
				<tr>
					<td class="td-jus-con previewImg">
						<div class="slim-border mb-3 text-center td-div-img">
							<input class="form-control form-control-lg input-image" type="file" accept="image/*" name="file" onchange="readURL(this);">
							<img class="preview" />
						</div>
					</td>
					<td>
						<div class="slim-border mb-3 text-center div-textarea pad-top50">
							<textarea class="making-num " placeholder="한 단계씩 추가해 주세요"></textarea>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	<script>
	window.onload=()=>{
		const tbody = document.getElementById("table_body");
		tbody.addEventListener('click',e=>{
			
			const eventTarget = e.target;
			console.log(eventTarget);
			
			const targetTagName = eventTarget.tagName.toLowerCase();
			let targetSVG = null;
			switch(targetTagName){
			case 'tr' : targetInput = eventTarget.children[0].children[0].children[0];break;
			case 'td' : targetInput = eventTarget.parentElement.children[0].children[0].children[0];break;
			case 'div' : targetInput = eventTarget.parentElement.parentElement.children[0].children[0].children[0];break;
			case 'textarea' : targetInput = eventTarget.parentElement.parentElement.parentElement.children[0].children[0].children[0];break;
			}
			const imgPre = targetInput.nextElementSibling;
			console.log(targetInput.value);
			
			
		})
	}
	
		function readURL(input){
			var imgArr = document.getElementsByClassName("preview");
				if(input.files[0]){
					var trNo = document.getElementById("table_body").childElementCount;
					if(imgArr.length == trNo){
						var reader = new FileReader();
						reader.onload = function(e){
							imgArr[trNo-1].src = e.target.result;
							imgArr[trNo-1].style.width = '250px';
							imgArr[trNo-1].style.height = '250px';
						};
					reader.readAsDataURL(input.files[0]);
					} else{
					imgArr[0].src = "";
					}
				}		
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
	</script>
	
		
		<div>&nbsp;</div>
		<div class="div-flexible div-center" style="height: 50px">
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
		function getAllMaking(){
			const textareas = document.getElementsByClassName("making-num");
			let textvalue = "";
			for(const i of textareas){
				textvalue += i.value+'§§●';
			}
			document.getElementById("inputContent").value = textvalue;
			console.log(document.getElementById("inputContent").value);
		}
		
		function add_tr(table_body){
			let tbody = document.getElementById("table_body");
			const newTr = document.createElement('tr');
			newTr.innerHTML = '<td class="td-jus-con previewImg"><div class="slim-border mb-3 text-center td-div-img"><input class="form-control form-control-lg input-image" type="file" accept="image/*" name="file" onchange="readURL(this);"><img class="preview" /></div></td><td><div class="slim-border mb-3 text-center div-textarea pad-top50"><textarea class="making-num " placeholder="한 단계씩 추가해 주세요"></textarea></div></td>';
			tbody.append(newTr);
		}
		
		function clean_first_tr(firstTr){
			let children = firstTr.children;
			
			children = Array.isArray(children) ? children :	Object.values(children);
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
