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
<link href="allCSS.css" rel="stylesheet" type="text/css">
<style>

</style>
</head>
<body id="recipe-body">

<div id="header">
		<a href="#" class="button" id="logoImg_A"><img src="img/logo.png" id="logoImg" alt="로고"></a>
		<div id="header_menu" class="header_common">
			<a href="../board/recipe.html" id="main" class="button">레시피</a>
			<a href="#" id="tip" class="button">꿀팁</a>
			<a href="../recommend/randomMainPage.html" id="comm" class="button">메뉴 추천</a>
			<a href="../notice/noticeMainPage.html" id="notice" class="button">공지사항</a>
		</div>
		<!-- 로그인 했을 때 다르게 바뀌게도 해야 됨 -->
		<div id="header_user" class="header_common">
			<!-- 로그인 x 상태 -->
<!-- 			<div id="header_user_noUser"> -->
<!-- 				<a href="user_login.html" id="user_login" class="button_user">로그인</a>&nbsp;&nbsp;&nbsp; -->
<!-- 				<a href="join_account.html" id="user_join" class="button_user">회원가입</a> -->
<!-- 			</div> -->
			<!-- 로그인 o 상태 -->
			<div id="user_login_complete">
				<button id="mypage_list" class="mypageMenu">▼</button>
				<label class="mypageMenu">신짱구님, 환영합니다&nbsp;</label>
			</div>
			<div id="mypage_Menu">
				<ul>
					<li><a href="">작성한 게시글 보기</a></li>
					<li><a href=""><label>회원정보 조회 / 수정</label></a></li>
					<li><label>로그아웃</label></li>
				</ul>
			</div>
		</div>
	</div>
	

	
<div style="margin-left: 10rem !important; margin-right: 10rem !important; margin-top:7rem !important;" class="row py-lg-5">
   
</div>

<!--  style="min-width:1250px; background-color:lightgray;padding:10px;margin-left:5%;margin-right:5%;width:85%; margin-bottom:150px;" -->
<!-- 1번째 칸 -->
<div class="container">
	<div id="tbdiv3" class="row text-center div-flexible col div-min-width">

		<table class="tbround bgcw" style="width:95%;">
			<tr>
				<td class="td-rightline" colspan='2' rowspan='3' style="width:40%">
					<input class="form-control form-control-lg td-input" id="formFileLg" type="file" onchange="previewIMG(this);">
					<img id="firImg">
				</td>
			<td class="td-bottomline" colspan='3' height="100px" width="50px">
				<input class="td-input" type="text" name="text" style="font-size:20px;width:100%;height:40px; border: 0; text-align:center;" placeholder="요리명"/>
			</td>
			</tr>
			<tr style="display:flex;justify-content:center;">
				<td>
					<div class="recipe-option">	
						<select id="sel-nation" class="form-select form-select-sm">
						  <option value="all"selected>국가</option>
						  <option value="kr">한식</option>
						  <option value="cn">중식</option>
						  <option value="us">양식</option>
						  <option value="jp">일식</option>
						  <option value="no">분식</option>
						</select>	
						</div>
				</td>
				<td>
					<div class="recipe-option">
						<select id="sel-easy"class="form-select form-select-sm">
						  <option value="all"selected>난이도</option>
						  <option value="easy">하</option>
						  <option value="mid">중</option>
						  <option value="hard">상</option>
						</select>
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td class="td-underline td-rlline td-topline" colspan="3" height="400px" width="50px">
					<textarea class="td-textarea"rows='5' placeholder="요리 재료" style="width:100%;height:90%;padding-left:30px;"></textarea>
				</td>
			</tr>
		</table>
	</div>






<!-- 2번째 칸 -->
<div class="row mb-3 text-center div-min-width" style="margin-bottom:1rem !important;margin-left:20px; margin-right:50px; height:100px;width:100%">
	<table class="tbround bgcw" style="width:95%;">
		<tr>
			<td width="200px" height="50px" style="border-right:0.5px solid black;text-align:center;">요리 소개</td>
			<td width="" height="60px" style="padding-left:50px">
				<textarea  id="text-ingre" class="td-textarea" rows='2' placeholder="요리에 대한 간단한 소개"></textarea>
			</td>
		</tr>
	</table>
</div>


<!-- 3번째 칸 -->
<div class="row text-center div-min-width" style="margin-left:20px; margin-right:50px;width:100%;">
	<table class="tbround bgcw" style="width:95%;">
		<!-- 아래 버튼 클릭 -> tr부분 테이블 안에 추가 -->
		<tbody id="table_body">
			<tr>
				<td class="td-jus-con previewImg">
					<div class="slim-border mb-3 text-center td-div-img">
						<input class="form-control form-control-lg" type="file" onchange="readURL(this);">
						<img class="preview" />
					</div>
				</td>
				<td>
					<div class="slim-border mb-3 text-center div-textarea pad-top45">
						<textarea class="making-num " placeholder="1. ㅇㅇㅇ"></textarea>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
<script>
	function readURL(input){
		var imgArr = document.getElementsByClassName("preview");
			if(input.files[0]){
				var trNo = document.getElementById("table_body").childElementCount;
				console.log(trNo);
				if(imgArr.length == trNo){
					var reader = new FileReader();
					reader.onload = function(e){
						imgArr[trNo-1].src = e.target.result;
						imgArr[trNo-1].style.width = '300px';
						imgArr[trNo-1].style.height = '300px';
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
				firImg.style.width = '500px';
				firImg.style.height= '500px';
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
			<button class="btn btn-primary me-md-2" id="plus-level" onclick="add_tr('table_body')">단계 추가</button>
		</div>
		<div>
			<button class="btn btn-primary me-md-2" id="minus-level" onclick="delete_tr('this')">단계 삭제</button>
		</div>
   </div>
</div>


<script>
	function add_tr(table_body){
		let tbody = document.getElementById("table_body");
		let tr = tbody.firstElementChild;
		let tr_clone = tr.cloneNode(true);
		
		tbody.append(tr_clone);
		clean_first_tr(tbody.firstElementChild);
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



<div>&nbsp;</div>
<div id="gotop-button"><a href="#top"><img src="topButton.png" style="width:50px; height:50px;"></a></div>
	
<div class="mx-auto" style="width:80px;">
	<a class="btn btn-primary me-md-2" role="button" id="go_list_button">등록</a>
</div>
<div>&nbsp;</div>
	
	
</div>	
		<div id="footer">
		<div id="footer_inner">
			<span id="company" class="font">사업자 : (주)혼밥심 &nbsp;&nbsp;&nbsp;</span> 
			<span id="leader" class="font">대표 : 김남희 외 5명 &nbsp;&nbsp;&nbsp;</span>
			<span id="address" class="font">주소 : 서울특별시 을지로입구역 근처</span>
		</div>
	</div>
</body>
</html>
