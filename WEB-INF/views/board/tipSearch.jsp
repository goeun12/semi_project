<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="resources/css/tipList.css" rel="stylesheet" type="text/css"/>
<title>Insert title here</title>
<style>
</style>

</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	<div class="container-fluid">
		
		<div id="honey_title">
    		<p>꿀팁 게시판</p>
  		</div>
		<br>
  		
  		<!-- 최근 공지 출력바  -->
		<div id="notice_recent">
	  		 <input class="form-control" id="loud_speaker" type="text" value="최근 공지사항이에요." aria-label="readonly input example" readonly>
		</div>
  		
  		<br>
 		
		<!-- 검색창 -->
		<form>
			<div class="input-group mb-3" id="search_receipe">
	 			<input type="text" class="form-control" name="honeyKey" id="search_receipe2" placeholder="꿀팁 검색" aria-label="Recipient's username" aria-describedby="search_button">
	 			<button class="btn btn-outline-secondary" id="search_button">검색</button>
			</div>
		</form>	
	
		<!-- 글 작성 페이지 이동 버튼 -->
		<c:if test="${ !empty loginUser }">
			<div id="honey_write_div">
				<a class="btn btn-primary me-md-2" href="${contextPath }/write.tip" role="button" id ="honey_write_button">글쓰기</a>
			</div>			
		</c:if>
		
		<div id="honey_table_div">	
			<div id="honey_table">
				<table class="table table-hover ">
					<thead>
				    	<tr>
				   		   	<th scope="col" style="width: 10%; font-weight:550; text-align:center;">번호</th>
							<th scope="col" style="width: 40%; font-weight:550; text-align:center;">제목</th>
							<th scope="col" style="width: 20%; font-weight:550; text-align:center;">아이디</th>
							<th scope="col" style="width: 20%; font-weight:550; text-align:center;">작성일</th>
							<th scope="col" style="width: 10%; font-weight:550; text-align:center;">조회수</th>
				   		</tr>
					</thead>
					<tbody class="table-group-divider" style="text-align:center;">
						<c:forEach items="${ list }" var="b">
							<tr>
								<td scope="row">${b.boardNo}</td>
								<td style="text-align:left; scope="row">${b.title}</td>
								<td scope="row">${b.writer }</td>
								<td style="text-align:center;">${ b.createDate }</td>
								<td scope="row">${b.boardCount }</td>
							</tr>
						</c:forEach>    
					</tbody>
				</table>			
			</div>
		<jsp:include page="../common/pagination.jsp"/>			
		</div>
		<jsp:include page="../common/topButton.jsp"/>
	</div>
	<jsp:include page="../common/footer.jsp"/>
	<script>
	
	   window.onload = () => {
	       const tbody = document.querySelector('tbody');
	       const tds = tbody.querySelectorAll('td');
	       for(const td of tds) {
	           td.addEventListener('click', function() {
	               const boardNo = this.parentElement.querySelector('td:first-child').innerText;
	               
	               location.href = "${contextPath}/detail.tip?bNo=" + boardNo + "&page=" + '${pi.currentPage}';
	           });
	       }
	   };
	   
		document.getElementById("searchButton").onclick = function () {
			let searchType = document.getElementsByName("searchType")[0].value;
			let keyword = document.getElementsByName("honeyKeyword")[0].value;

			//url생성하고
let url = "/aloneBab/tip.tip?searchType=" + searchType + "&honeyKeyword=" + encodeURIComponent(keyword);
			// url 인코딩
			url = encodeURI(url);
			// 페이지 이동
			location.href = url;
			
		};
	</script>

</body>
</html>