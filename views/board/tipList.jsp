<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="resources/css/tipList.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
		<jsp:include page="../common/header.jsp"/>
		<div id="honey_title">
    			<p>꿀팁 게시판</p>
  		</div>
		<br><br>
		<!-- 최근 공지 출력바  -->
		<div id="notice_recent">
				<input class="form-control" type="text" value="최근 공지사항이에요." aria-label="readonly input example" readonly>
		</div>
		<br>
		<!-- 레시피 검색바 -->
		<form>
			<div class="input-group mb-3" id="search_receipe">
	 			<input type="text" class="form-control" name="noticeKey" placeholder="레시피를 찾아보세요" aria-label="Recipient's username" aria-describedby="search_button">
	 			<button class="btn btn-outline-secondary" id="search_button">검색</button>
			</div>
		</form>	
		
		<!-- 글쓰기 페이지 이동 버튼 -->
		<div class = "honeyWritePage-container">
			<a class="btn btn-primary me-md-3" href="${ contextPath }/write.tip" role="button" id ="honey_write_button">글쓰기</a>
		</div>
		<br>	
		
		
		<!-- 게시판 테이블 -->
		<div id="honey_table_div">	
			<div id="honey_table">
				<table class="table table-hover ">
				  <thead>
				    <tr >
					      <th scope="col" style="width: 100px; font-weight:700; text-align: center; ">글번호</th>
					      <th scope="col" style="width: 200px; font-weight:700; text-align: center;">ID</th>
					      <th scope="col" style="width: 1000px; font-weight:700; ">제목</th>
					      <th scope="col" style="width: 200px; font-weight:700; text-align: center;">작성일</th>
				    </tr>
				  </thead>
				  <tbody class="table-group-divider">
				    <tr>
					      <td scope="row" style="text-align: center;">10</td>
					      <td style="text-align: center;">Mark</td>
					      <td>Otto</td>
					      <td style="text-align: center;">Otto</td>
				    </tr>
				    <tr>
					      <td scope="row"  style="text-align: center;">9</td>
					      <td style="text-align: center;">Jacob</td>
					      <td>Otto</td>
					      <td style="text-align: center;">Otto</td>
				    </tr>
				    <tr>
					      <td scope="row" style="text-align: center;">8</td>
					      <td style="text-align: center;">Jacob</td>
					      <td>Otto</td>
					      <td style="text-align: center;">Otto</td>
				    </tr>
					<tr>
					      <td scope="row" style="text-align: center;">7</td>
					      <td style="text-align: center;">Jacob</td>
					      <td>Otto</td>
					      <td style="text-align: center;">Otto</td>
				    </tr>
				    <tr>
					      <td scope="row" style="text-align: center;">6</td>
					      <td style="text-align: center;">Jacob</td>
					      <td>Otto</td>
					      <td style="text-align: center;">Otto</td>
				    </tr>
				    <tr>
					      <td scope="row"  style="text-align: center;">5</td>
					      <td style="text-align: center;">acob</td>
					      <td>Otto</td>
					      <td style="text-align: center;">Otto</td>
				    </tr>
				    <tr>
					      <td scope="row" style="text-align: center;">4</td>
					      <td style="text-align: center;">Jacob</td>
					      <td>Otto</td>
					      <td style="text-align: center;">Otto</td>
				    </tr>
				    <tr>
					     <td scope="row" style="text-align: center;">3</td>
					      <td style="text-align: center;">Jacob</td>
					      <td>Otto</td>
					      <td style="text-align: center;">Otto</td>
				    </tr>
				    <tr>
					      <td scope="row" style="text-align: center;">2</td>
					      <td style="text-align: center;">Jacob</td>
					      <td>Otto</td>
					      <td style="text-align: center;">Otto</td>
				    </tr>
				    <tr>
				  	 	  <td scope="row" style="text-align: center;">1</td>
					      <td style="text-align: center;">Jacob</td>
					      <td>Otto</td>
					      <td style="text-align: center;">Otto</td>
				    </tr>
				  </tbody>
				</table>			
			</div>
 	<br><br>
 	<!-- 글쓰기 페이지 이동 버튼 -->
 
	<br><br><br>
				
		<!-- 페이징 -->
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
	<jsp:include page="../common/footer.jsp"/>
	<script>
		window.onload = () => {
			const writeButton = document.getElementById("honey_write_button");
			if(false){
				writeButton.style.display ='none';				
			}
		}
	</script>
</body>
</html>