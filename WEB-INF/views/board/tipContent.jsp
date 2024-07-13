<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="resources/css/tipContent.css" rel="stylesheet" type="text/css"/>
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div class="container-fluid">
				
		<div id="honey_title">
    		<p>꿀팁 게시판</p>
  		</div>
	<br>
  	<c:if test="${ !empty loginUser && loginUser.id eq b.writer }">	 	
		<div id ="honey_up_del" >
			<a class="btn btn-primary me-md-2" href="#" role="button" id ="updateTip">수정</a>
			<a class="btn btn-primary me-md-2" href="#" role="button" id ="honey_delete_button">삭제</a>
		</div>			
	</c:if>
			
		<div>
			<div class="input-group mb-3" id="content_title">
	 			<span class="form-control" id="notic_content_title" aria-label="Username" aria-describedby="basic-addon1">${b.title }</span>
			</div>
			<div>
				<p id="notic_content_text" style="resize: none;" readonly>${b.content }</p>
			</div>		
		</div>

		<div class="mx-auto" style="width:80px;">
			<a class="btn btn-primary me-md-2" href="'${contextPath}/tip.tip'" role="button" id ="go_list_button">목록</a>
		</div>
	
		<a class="btn" href="#hearder" role="button" id ="go_top_button">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-up-fill" viewBox="0 0 16 16">
  			<path d="m7.247 4.86-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z"/>
			</svg>
			TOP
		</a>
		
		
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>
	
	
	<div style="margin-left: 10rem !important; margin-right: 10rem !important; margin-top:7rem !important; background-color:white;" class="row py-lg-5" >
		<form>
			<div class="input-group mb-3" id="search_receipe">
	 			<input type="text" class="form-control" name="noticeKey" placeholder="레시피를 찾아보세요" aria-label="Recipient's username" aria-describedby="search_button">
	 			<button class="btn btn-outline-secondary" id="search_button">검색</button>
			</div>
		</form>
			
			
			<table class="comment_table " border="1">
				<thead>
					<tr>
						<th style="text-align: center;">euneundevdev</th>
					    <th>라면 끓이는 법</th>
					    <th style="text-align: center;">2024.06.10</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
					<tr>
						<td colspan="3" >이렇게 저렇게해서 만듦</td>
					</tr>
				</tbody>
			</table>
	<div>
		<jsp:include page="../common/footer.jsp"/>
	</div>


	</div>
	</div>
	
	
	
			
			
			
	
</body>
</html>