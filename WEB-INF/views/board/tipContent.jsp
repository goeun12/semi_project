<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<link href="resources/css/tipContent.css" rel="stylesheet" type="text/css"/>
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div class="container-fluid">
				
		<div id="honey_title">
    		<p>꿀팁 게시판</p>
  		</div>
  		
  		

  	<c:if test="${ !empty loginUser && loginUser.id eq b.writer}">	 	
		<div id ="honey_up_del" >
			<button class="btn btn-primary me-md-2" role="button" id ="updateButton">수정</button>
			<button class="btn btn-primary me-md-2" role="button" id ="deleteButton">삭제</button>
		</div>			
	</c:if>
				
	<div>
		<form method="POST" id="detailForm"	>	
			<input type="hidden" value="${ b.boardNo }" name="bNo"/>
			<input type="hidden" value="${ page }" name="page"/>
				<div class="input-group mb-3" id="content_title">
		 			<span style="width:12%;" class="form-control" id="notic_content_writer" aria-label="Username" aria-describedby="basic-addon1">${b.writer }</span>
		 			<span style="width:73%;"class="form-control" id="notic_content_title" aria-label="Username" aria-describedby="basic-addon1">${b.title }</span>
		 			<span style="width:15%;"class="form-control" id="notic_content_createDate" aria-label="Username" aria-describedby="basic-addon1">${b.createDate }</span>
				</div>

				<div>
					<p id="notic_content_text" style="resize: none;" readonly>${b.content }</p>
				</div>		
			</form>
	</div>

		<div class="mx-auto" style="width:80px;">
			<a class="btn btn-primary me-md-2" href="'${contextPath}/tip.tip'" role="button" id ="go_list_button">목록</a>
		</div>
	
	<div class="modal fade" tabindex="-1" role="dialog" id="modalChoice">
			<div class="modal-dialog" role="document">
	    		<div class="modal-content rounded-3 shadow">
	      			<div class="modal-body p-4 text-center">
	        			<h3 class="mb-0">정말로 삭제하시겠습니까?</h3>
	        			<p class="mb-0">삭제 후 게시글은 복구할 수 없습니다.</p>
	      			</div>
	      			<div class="modal-footer flex-nowrap p-0">
	        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" id="delete">네</button>
	        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니오</button>
	      			</div>
	    		</div>
	  		</div>
		</div>
		
		<a class="btn" href="#hearder" role="button" id ="go_top_button">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-up-fill" viewBox="0 0 16 16">
  			<path d="m7.247 4.86-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z"/>
			</svg>
			TOP
		</a>
		
	<div>
		<jsp:include page="../common/footer.jsp"/>
	</div>
	
	<script>
		window.onload=()=>{
			
			const update = document.getElementById('updateButton')
			const form = document.getElementById('detailForm')
			if(update != null){
				update.addEventListener('click', ()=>{
					form.action = '${contextPath}/updateForm.tip';
						form.submit();
				});
			}

			if(document.getElementById('deleteButton') != null){
				document.getElementById('deleteButton').addEventListener('click',() => {
					$('#modalChoice').modal('show');
				});
			}
			
			// 모달에서 네 누르면 딜리트 넘어가기
			document.getElementById('delete').addEventListener('click',()=>{
				form.action = '${contextPath}/delete.tip';
				form.submit();
			});
		}
			
			
		
		
		
			
			
			
			
	</script>
	
	</div>
		
	
	
	
			
			
			
	
</body>
</html>