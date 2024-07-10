<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/index.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body style="background-color: #FFFBF2;">
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>
	<div id="header">
		<div id="header_user">
			<div id="find_join_box">
				<div id="login" class="find_join_in">
					<a href="${ contextPath }/loginView.user" id="login_link" class="button_find_join btn"><label class="font_text">로그인</label></a>
				</div>
				<div id="joi_user" class="find_join_in"></div>
				<div id="join" class="find_join_in">
					<a href="${ contextPath }/joinView.user" id="insert_link" class="btn button_find_join"><label class="font_text">회원가입</label></a>
				</div>
			</div>
		</div>
	</div>
	<div id="container" class="py-5 text-center container">
		<div style="padding-top:1rem !important; padding-bottom:1rem !important;" class="py-lg-5">
   			<div id="bar" class="col-lg-6 col-md-8 mx-auto">
     			<h3 class="fw-bold"><a href="${ contextPath }/recipe.re" class="button"><img src="#" id="logo"></a><label class="fo_text">혼밥심</label></h3>
   			</div><br>
   		</div>
		<br>
		<div id="main">
			<div id="main_box">
				<div id="recipy" class="find_join_in">
					<a href="${ contextPath }/recipe.re" id="recipy_link" class="button_find_join btn"><label class="font_text">레시피 게시판</label></a>
				</div>
				<div id="join_user" class="find_join_in"></div>
				<div id="honey" class="find_join_in">
					<a href="${ contextPath }/tip.tip" id="honey_link" class="button_find_join btn"><label class="font_text">꿀팁 게시판</label></a>
				</div>
				<div id="join_user" class="find_join_in"></div>
				<div id="menu" class="find_join_in">
					<a href="${ contextPath }/random.re" id="menu_link" class="button_find_join btn"><label class="font_text">메뉴 추천</label></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>