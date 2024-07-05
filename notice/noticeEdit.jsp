<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" write="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="noticeWritePage.css" rel="stylesheet" type="text/css"/>
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="container-fluid">
		<div id="notice_title">
    		<p>공지사항 게시판</p>
  		</div>
		
		<form action="">
			<div>
				<div class="input-group mb-3" id="write_title">
		  			<span class="input-group-text" id="notic_write_title_">
		  				&nbsp
			  			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
	  					<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2m.995-14.901a1 1 0 1 0-1.99 0A5 5 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901"/>
						</svg>								  			
		  				&nbsp공지사항
		  			</span>
		 			<input type= "text" name="notic_write_title" value="" class="form-control" id="notic_write_title" aria-label="Username"/>
				</div>
				<div>
					 <textarea name="notic_write_text" value="" class="form-control" id="notic_write_text"></textarea>				
				</div>		
			</div>
				
			<div  class="mx-auto" style="width:80px;">
				<a class="btn btn-primary me-md-2" href="${ contextPath }/edit.no" role="button" id ="submit_button">수정</a>
			</div>
		</form>	

		<a class="btn" href="#hearder" role="button" id ="go_top_button">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-up-fill" viewBox="0 0 16 16">
  			<path d="m7.247 4.86-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z"/>
			</svg>
			TOP
		</a>	
	</div>
	<jsp:include page="../common/footer.jsp"/>
	<script>
		window.onload = () => {
			
			const submitButton = document.getElementById("submit_button");
			
			submitButton.addEventListener('mouseover',function(){
				this.style.background = "#a5250a";
				this.style.fontWeight = "600";
			})
			submitButton.addEventListener('mouseout',function(){
				this.style.fontWeight = "400";
				this.style.background ="#f24822";
			})	
		}
	</script>
</body>
</html>