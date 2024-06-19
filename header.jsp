<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link href="../css/header.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header id="header">
		<div id="header_menu" class="header_common">
			<a href="#" class="button"><img src="#" id="logo"></a>
			<a href="../board/recipe.jsp" id="main" class="button">레시피</a>
			<a href="#" id="tip" class="button">꿀팁</a>
			<a href="../recommend/randomMainPage.jsp" id="comm" class="button">메뉴 추천</a>
			<a href="../notice/noticeMainPage.jsp" id="notice" class="button">공지사항</a>
		</div>
		<!-- 로그인 했을 때 다르게 바뀌게도 해야 됨 -->
		<div id="header_user" class="header_common">
			<!-- 로그인 x 상태 -->
			<div id="header_user_noUser">
				<a href="user_login.jsp" id="user_login" class="button_user">로그인</a>&nbsp;&nbsp;&nbsp;
				<a href="join_account.jsp" id="user_join" class="button_user">회원가입</a>
			</div>
			<!-- 로그인 o 상태 -->
			<!-- 클릭시 아래에 팝업 만들어지게 해야됨 -->
			<!-- <div id="user_login_complete" class="button"><button id="mypage_list">▼</button><label for="mypage_list">신짱구님, 환영합니다.&nbsp;</label></div> -->
		</div>
	</header>
</body>
</html>