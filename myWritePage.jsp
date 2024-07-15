<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="resources/css/myWritePage.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>My Write Page</title>
</head>
<body style="background:#FFFBF2;">
	<jsp:include page="../common/header.jsp"/>
	<div id="wrap" class="wrap">
		<div id="container">
			<div style="padding-top:1rem !important; padding-bottom:5rem !important; min-width:1580px;" class="py-lg-5">
     			<div id="login_bar" class="col-lg-6 col-md-8">
        			<p>내가 쓴 글 목록</p>
      			</div><br>
      		</div>
			<div id="board_table_div">	
				<div id="board_table">
					<table class="table table-hover" id="table">
					  <thead>
					    <tr class="hoverOut">
					      <th scope="col" style="width: 5%; text-align: center;">번호</th>
					      <th scope="col" style="width: 10%; text-align: center;">게시판
					      <th scope="col" style="width: 55%; text-align: center;">제목</th>
					      <th scope="col" style="width: 10%; text-align: center;">작성일</th>
					    </tr>
					  </thead>
					  <tbody class="table-group-divider table_body table_hover">
					  	<c:if test="${ empty list }">
					  		<tr class="hoverOut">
					  			<td colspan="4" style="text-align: center;">작성한 게시글이 없습니다.</td>
					  		</tr>
					  	</c:if>
					  	<c:if test="${ !empty list }">
						  	<c:forEach items="${ list }" var="b">
							  	<tr>
							      <td scope="row" class="board_num">${ b.boardNo }</td>
							      <td class="board_num">${ b.boardGenre }</td>
							      <td>${ b.title }</td>
							      <td class="board_num">${ b.updateDate }</td>
							    </tr>
						  	</c:forEach>
					  	</c:if>
					  </tbody>
					</table>			
				</div>
				<jsp:include page="../common/pagination.jsp"/>			
			</div>
		</div>	
		<jsp:include page="../common/topButton.jsp"></jsp:include>	
	</div>
	<jsp:include page="../common/footer.jsp"/>
	<script>
		window.onload = () => {
			
			const tbody = document.querySelector('tbody');
			const tds = tbody.querySelectorAll('td');			
			
			for(const td of tds){
				td.addEventListener('click', function(){
					const trTds = this.parentElement.querySelectorAll('td');
					const boardNo = trTds[0].innerText;
					
					if(boardNo != '작성한 게시글이 없습니다.'){
						location.href="${contextPath}/selectMyBoard.bo?boardNo=" + boardNo + "&page=" + ${ pi.currentPage };
					} else{
						$('td:hover').css('background', 'none');
						$('td:hover').css('cursor', 'default');
					}
				});
			}
			
		}
	</script>
</body>
</html>
