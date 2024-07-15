<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="resources/css/tipComment.css" rel="stylesheet" type="text/css">
</head>
<body style="background-color:#fffbf2;">
	<jsp:include page="../common/header.jsp"/>
	<div style="margin-left: 10rem !important; margin-right: 10rem !important; margin-top:2rem !important; background-color:white;" class="row py-lg-5" >
		<form>
			<div class="input-group mb-3" id="search_receipe">
	 			<input type="text" class="form-control" name="noticeKey" placeholder="레시피를 찾아보세요" aria-label="Recipient's username" aria-describedby="search_button">
	 			<button class="btn btn-outline-secondary" id="search_button">검색</button>
			</div>
		</form>
			
			
			<table class="comment_table " border="1"  style="width: 1000px; margin-left:215px;">
				<thead>
					<tr>
						<th style="text-align: center;">${ b.writer }</th>
					    <th>${ b.boardTitle }</th>
					    <th style="text-align: center;">${ b.boardCreateDate }</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
					<tr>
						<td colspan="3" >${ b.boardContent }</td>
					</tr>
				</tbody>
			</table>
		
	
	
	<form>
		<div>
			<div class="input-group mb-3" id="comment">
	 			<input type="text" class="form-control" id="replyContent" name="noticeKey" placeholder="댓글을 적어주세요">
	 			<button class="btn btn-outline-secondary" id="search_button">등록</button>
			</div>	
		</div>
	</form>	

	<div class="div-flexible div-center" style="height: 50px"></div>



	<div id="honey_table_div">	
			<div id="honey_table">
				<table class="table table-hover " style="width: 1300px; margin-left:50px;" >
				  <thead>
				    <tr>
						<th scope="col" style="width: 100px; font-weight:700; text-align: center; ">글번호</th>
						<th scope="col" style="width: 200px; font-weight:700; text-align: center;">ID</th>
						<th scope="col" style="width: 600px; font-weight:700; ">댓글 내용</th>
						<th scope="col" style="width: 100px; font-weight:700; text-align: center;">작성일</th>
						<th scope="col" style="width: 300px; font-weight:700; text-align: center;">수정/삭제</th>
				    </tr>
				  </thead>
				  <tbody class="table-group-divider" >
				    
				    	<c:forEach items="${ list }" var="r">
							<tr>
								<td>${ r.replyNo }</td>
								<td>${ r.replyWriter }</td>
								<td>${ r.replyContent }</td>
								<td>${ r.replyCreateDate }</td>
								<td>${ r.replyStatus }</td>
								<td>
									<input type="hidden" value="${r.replyId }" name="replyId">
									<c:if test="${ r.replyWriter eq loginUser.id }">
										<span class="updel">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16"><path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/></svg>
										</span> 
										&nbsp;
										<span class="updel">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16"><path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5"/></svg>
										</span> 
									</c:if>
									<input type="hidden" value="${ r.replyContent }" id="replyContent">
								</td>
							</tr>
						</c:forEach>
				  </tbody>
				</table>			
			</div>
			<div class = "honeyWritePage-container">
				<a class="btn btn-primary me-md-3" href="${ contextPath }/write.tip" role="button" id ="honey_write_button">글쓰기</a>
			</div>
			<div class="mx-auto" id="page_navigation" style="width: 230px;">
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
	<div class="mx-auto" style="margin-top: 20px; width:100px; height: 100px;">
		<a class="btn btn-primary me-md-2" role="button" id="plus-level" href="#">목록으로</a>
	</div>
	<jsp:include page="../common/footer.jsp"/>
	<script>
		window.onload = () =>{
			document.getElementById('search_button').addEventListener('click', () =>{
				$.ajax({
					uri: '${contextPath}/insertReply.bo',
					data: {replyContent: document.getElementById('replyContent').value}
					dataType: 'json', 
					success: data => {
						console.log(data);
						
					},
				});
			});
		}
	</script>
</body>
</html>
