<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="resources/css/myWritePage.css" rel="stylesheet" type="text/css">
<title>My Write Page</title>
</head>
<body style="background:#FFFBF2;">
	<div id="wrap" class="wrap">
		<jsp:include page="../common/header.jsp"/>
		<div id="container">
			<div style="padding-top:1rem !important; padding-bottom:5rem !important;" class="row py-lg-5">
     			<div id="login_bar" class="col-lg-6 col-md-8">
        			<h3 class="fw-bold">내가 쓴 글 목록</h3>
      			</div><br>
      		</div>
			<div id="board_table_div" style="min-width:1000px;">	
				<div id="board_table">
					<table class="table table-hover table_hover" id="table">
					  <thead>
					    <tr>
					      <th scope="col" style="width: 5%;">번호</th>
					      <th scope="col" style="width: 10%;">게시판
					      <th scope="col" style="width: 55%;">제목</th>
					      <th scope="col" style="width: 10%;">작성일</th>
					    </tr>
					  </thead>
					  <tbody class="table-group-divider table_body">
					    <tr>
					      <td scope="row" class="board_num">10</td>
					      <td class="board_num">꿀팁</td>
					      <td>꿀팁 게시글 5입니다.</td>
					      <td class="board_num">2024-06-17</td>
					    </tr>
					    <tr>
					      <td scope="row" class="board_num">9</td>
					      <td class="board_num">레시피</td>
					      <td>계란찜</td>
					      <td class="board_num">2024-06-10</td>
					    </tr>
					    <tr>
					      <td scope="row" class="board_num">8</td>
					      <td class="board_num">꿀팁</td>
					      <td>밥 먹기 전에 해두면 좋은 것들</td>
					      <td class="board_num">2024-06-04</td>
					    </tr>
						<tr>
					      <td scope="row" class="board_num">7</td>
					      <td class="board_num">레시피</td>
					      <td>김치찌개</td>
					      <td class="board_num">2024-06-04</td>
					    </tr>
					    <tr>
					      <td scope="row" class="board_num">6</td>
					      <td class="board_num">레시피</td>
					      <td>딸기 탕후루</td>
					      <td class="board_num">2024-05-30</td>
					    </tr>
					    <tr>
					      <td scope="row" class="board_num">5</td>
					      <td class="board_num">꿀팁</td>
					      <td>의외로 집에 있으면 좋은 조미료</td>
					      <td class="board_num">2024-05-27</td>
					    </tr>
					    <tr>
					      <td scope="row" class="board_num">4</td>
					      <td class="board_num">레시피</td>
					      <td>매운 짜장면</td>
					      <td class="board_num">2024-05-20</td>
					    </tr>
					    <tr>
					      <td scope="row" class="board_num">3</td>
					      <td class="board_num">꿀팁</td>
					      <td>꿀팁 쓸만한 게 뭐가 있다고</td>
					      <td class="board_num">2024-05-19</td>
					    </tr>
					    <tr>
					      <td scope="row" class="board_num">2</td>
					      <td class="board_num">꿀팁</td>
					      <td>나 계란찜 좋아하는데</td>
					      <td class="board_num">2024-05-17</td>
					    </tr>
					    <tr>
					      <td scope="row" class="board_num">1</td>
					      <td class="board_num">레시피</td>
					      <td>소세지가 들어간 계란말이</td>
					      <td class="board_num">2024-05-13</td>
					    </tr>
					  </tbody>
					</table>			
				</div>
				<div class="mx-auto" id="page_navigation" style="width: 210px;">
					  <ul class="pagination pagination-sm">
					    <li class="page-item"><a class="page-link" href="#">이전</a></li>
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item"><a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item"><a class="page-link" href="#">4</a></li>
					    <li class="page-item"><a class="page-link" href="#">5</a></li>
					    <li class="page-item"><a class="page-link" href="#">다음</a></li>
					  </ul>
				</div>				
			</div>
		</div>	
		<jsp:include page="../common/footer.jsp"/>
	</div>
</body>
</html>
</body>
</html>