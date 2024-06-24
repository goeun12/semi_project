<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<style>
	<%--헤더의 모든 요소 감싸기--%>
	#header{min-width: 1250px; background: #F24822; height: 60px; width: 100%; position: fixed; top: 0px; left: 0px; right: 0px;}
	
 	<%--로고 이미지--%>
	#logoImg{width:35px; height: 38px; margin-left: 20px; margin-right: 20px; float: left; margin-top: 10px;}
 	<%--레시피~공지사항 감싸는 div--%>
	#header_menu{margin-left:10px; float: left; margin-top: 17px;}
	<%--로고~공지사항까지 각각의 a태그 class="button"--%>
 	.button{color: white; text-decoration: none; font-size: 18px; margin-right: 30px;}
	.button:hover{font-weight: 600;}
	<%--로고~공지사항 버튼의 a태그들--%>
	.button a{color: black; text-decoration: none;}
	
	<%--로그인 o, x 전부 감싸는--%>
	#header_user{margin-right: 25px; float: right; margin-top: 14px;}   <%--학원 컴퓨터로는 #header_user{margin-right: 20px; float: right; margin-top: 14px;}--%>
	#header_user>div:hover, #header_user button:hover, #header_user label:hover{cursor: pointer;}
	<%--로그인 안 되어있을 시의 로그인+회원가입 각각의 a태그--%>
 	.button_user{color: white; text-decoration: none; font-size: 18px;}
 	.button_user:hover{font-weight: 600;}
	<%--로그인 o 감싸는 div--%>
	#user_login_complete{border: 4px solid #FFFBF2; width: 200px; background: #FFFBF2; color: black;}
	<%--이름 왼쪽 역삼각형 button--%>
	#mypage_list{border: 0px; background: #FFFBF2; color: #FFC7C2; font-size: 17px;}
	<%--toggle 메뉴 리스트 감싸는 div--%>
	#mypage_Menu{display: none; height: 150px; border: 1px solid lightgray; background: white;}
	#mypage_Menu li {margin-bottom: 15px; margin-top: 23px;}
	#mypage_Menu a{color: black; text-decoration: none;}
	#mypage_Menu a:hover{color: #0080ff; font-weight: 600;}
</style>
</head>
<body>
	<!-- c:set은 대문 만들어지면 그쪽으로 옮기기? -> 근데 이러면 대문에서 시작하지 않은 페이지들은 c:set 적용안됨 -->
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>
	<header id="header">
		<a href="#" class="button" id="logoImg_A"><img src="resources/image/logo.png" id="logoImg" alt="로고"></a>
		<div id="header_menu" class="header_common">
			<a href="../board/recipe.html" id="main" class="button">레시피</a>
			<a href="#" id="tip" class="button">꿀팁</a>
			<a href="../recommend/randomMainPage.html" id="comm" class="button">메뉴 추천</a>
			<a href="../notice/noticeMainPage.html" id="notice" class="button">공지사항</a>
		</div>
		<!-- 로그인 했을 때 다르게 바뀌게도 해야 됨 -->
		<div id="header_user" class="header_common">
			<!-- 로그인 x -->
			<c:if test="${ empty loginUser }">
				<div id="header_user_noUser">
	 				<a href="${ contextPath }/loginView.user" id="user_login" class="button_user">로그인</a>&nbsp;&nbsp;&nbsp;
	 				<a href="${ contextPath }/joinView.user" id="user_join" class="button_user">회원가입</a>
 				</div>			
 			</c:if>
			<!-- 로그인 o -->
			<c:if test="${ !empty loginUser }">
				<div id="user_login_complete">
					<button id="mypage_list" class="mypageMenu">▼</button>
					<label class="mypageMenu">신짱구님, 환영합니다&nbsp;</label>
				</div>
				<div id="mypage_Menu">
					<ul>
						<li><a href="${ contextPath }/write.user">작성한 게시글 보기</a></li>
						<li><a href="${ contextPath }/edit.user">회원정보 조회 / 수정</a></li>
						<li><a href="${ contextPath }/logout.user">로그아웃</a></li>
					</ul>
				</div>
			</c:if>
		</div>
	</header>
	
	<script>
		$(()=>{
			$('#user_login_complete').click(function() {
				$(this).next().slideToggle();
			});
		})
	</script>
</body>
</html>
