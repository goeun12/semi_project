<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>혼밥심 메인</title>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body style="background-color: #FFFBF2;">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div id="wrap" class="wrap">

		<div id="container" class="py-5 text-center container">
			<form action="">
				<div style="padding-top:1rem !important; padding-bottom:1rem !important;" class="row py-lg-5">
	     			<div id="bar" class="col-lg-6 col-md-8 mx-auto">
	        			<h3 class="fw-bold"><a href="#" class="button"><img src="${contextPath}/resources/image/logo.png" id="logoImg" alt="로고"></a><label class="fo_text">혼밥심</label></h3>
	      			</div><br>
	      		</div>
			</form>	
			<br>
			
					
			<div id="main">
				<div id="main_box">
					<c:if test="${ empty loginUser }">
						<div id="recipy" class="find_join_in">
							<button class="button_find_join btn" id="recipy_link" type="button" onclick="location.href='${contextPath}/recipe.re'">레시피 게시판</button>
						</div>
						<div id="join_user" class="find_join_in"></div>
						<div id="honey" class="find_join_in">
							<button class="button_find_join btn" id="honey_link" type="button" onclick="location.href='${contextPath}/tip.tip'">꿀팁 게시판</button>
						</div>
						<div id="join_user" class="find_join_in"></div>
						<div id="menu" class="find_join_in">
							<button class="button_find_join btn" id="menu_link" type="button" onclick="location.href='${contextPath}/random.re'">메뉴 추천</button>
						</div>
					</c:if>
					<c:if test="${ !empty loginUser }">
						<div id="recipy" class="find_join_in">
							<button class="button_find_join btn" id="recipy_link" type="button" onclick="location.href='${contextPath}/recipe.re'">레시피 게시판</button>
						</div>
						<div id="join_user" class="find_join_in"></div>
						<div id="honey" class="find_join_in">
							<button class="button_find_join btn" id="honey_link" type="button" onclick="location.href='${contextPath}/tip.tip'">꿀팁 게시판</button>
						</div>
						<div id="join_user" class="find_join_in"></div>
						<div id="menu" class="find_join_in">
							<button class="button_find_join btn" id="menu_link" type="button" onclick="location.href='${contextPath}/random.re'">메뉴 추천</button>
						</div>
					</c:if>
					
				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>
