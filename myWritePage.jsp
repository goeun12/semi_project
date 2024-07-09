<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="resources/css/myWritePage.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>My Write Page</title>
<style type="text/css">
	
	#pagination{font-size:15px;
				text-align:center;}
	
	.pageItem{margin-right:10px;}
	
	.pageLink{color:black;
			text-decoration-color:black;
			text-decoration-line:none;}

</style>
</head>
<body style="background:#FFFBF2;">
	<jsp:include page="../common/header.jsp"/>
	<div id="wrap" class="wrap">
		<div id="container">
			<div style="padding-top:1rem !important; padding-bottom:5rem !important;" class="py-lg-5">
     			<div id="login_bar" class="col-lg-6 col-md-8">
        			<p>내가 쓴 글 목록</p>
      			</div><br>
      		</div>
			<div id="board_table_div" style="min-width:1000px;">	
				<div id="board_table">
					<table class="table table-hover table_hover" id="table">
					  <thead>
					    <tr>
					      <th scope="col" style="width: 5%; text-align: center;">번호</th>
					      <th scope="col" style="width: 10%; text-align: center;">게시판
					      <th scope="col" style="width: 55%; text-align: center;">제목</th>
					      <th scope="col" style="width: 10%; text-align: center;">작성일</th>
					    </tr>
					  </thead>
					  <tbody class="table-group-divider table_body">
					  	<c:forEach items="${ list }" var="b">
						  	<tr>
						      <td scope="row" class="board_num">${ b.boardNo }</td>
						      <td class="board_num">${ b.boardGenre }</td>
						      <td>${ b.title }</td>
						      <td class="board_num">${ b.updateDate }</td>
						    </tr>
					  	</c:forEach>
					  </tbody>
					</table>			
				</div>
				<div class="mx-auto" id="pagination" style="width: 210px;">
					<ul class="pagination">
						<li class="pageItem">
					 		<c:url value="${loc}" var="goBack">
					 			<c:param name="page" value="${ pi.currentPage-1 }"/>
					 		</c:url>
					 	 	<a class="pageLink" href="${goBack}">이전</a>
					 	</li>
					 	<c:forEach begin ="${ pi.startPage }" end="${pi.endPage}" var="p" >
					 		<c:url value="${loc}" var="goCurr">
					 			<c:param name="page" value="${p}"/>
					 		</c:url>
					 	 	<li class="pageItem">
					 			<a class="pageLink pNum" href="${goCurr}">${p}</a>
					 	 	</li>				 	 
					 	</c:forEach>
					  	<li class="pageItem">
					 		<c:url value="${loc}" var="goNext">
					 			<c:param name="page" value="${pi.currentPage+1}"/>
					 		</c:url>
					 	 	<a class="pageLink" href="${goNext}">이후</a>
					 	</li>
					</ul>
				</div>				
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
					
					location.href="${contextPath}/selectMyBoard.bo?boardNo=" + boardNo + "&page=" + ${ pi.currentPage };
				});
			}
		
			const pageItems = document.getElementsByClassName("pageItem");
			for(const pageItem of pageItems){
				pageItem.addEventListener('focus', function(){
					this.style.background='white';
					this.style.color='black';
					this.stylw.border='none';
				});	
				
				pageItem.addEventListener("click", function(){
					this.style.textDecoration = 'underline'; 
					this.style.fontWeight= 'bold';
					this.style.boxShadow = 'none';
					this.style.color='black';
				});				
				
			}
			
			const pNums = document.getElementsByClassName("pNum");
			for(const pNum of pNums){
				if(pNum.innerHTML == '${pi.currentPage}'){
					pNum.style.textDecoration = 'underline';
					pNum.style.fontWeight= 'bold';
				}
			}
			
			
			
		}
	</script>
</body>
</html>
