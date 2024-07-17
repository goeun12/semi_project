<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>



.div-flexible{font-family: 'MinSans-Regular'; font-size:17px;
			width:50% ; margin-left:auto; margin-right:auto;
			margin-top:60px; margin-bottom:60px; 
			height:35px; border:1px solid #f9ae98; border-radius:8px;
			background:white;
			line-height:30px;	
			}

.noticeCommon{height:30px;}

</style>

</head>
<body>

	<div class="div-flexible">
		<span class="bgcw noticeCommon" style="width:20%;text-align:left;">
			&nbsp
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
				<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2m.995-14.901a1 1 0 1 0-1.99 0A5 5 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901"/>
			</svg>								  			
			&nbsp공지사항&nbsp	|&nbsp&nbsp		
		</span>
		<span class="bgcw noticeCommon" id="noticeCommon" style="text-align:left;"></<span>
	</div>


	
	
	<script>
	
		const noticeCommon = document.getElementById("noticeCommon");
		
		$.ajax({
			url : '${contextPath}/noticeCommon.no',
			dataType : 'json',
			success: data =>{
				if(data != null){
					noticeCommon.innerText = data.boardTitle;
					noticeCommon.style.cursor='pointer'
					noticeCommon.addEventListener('click', ()=>{
						location.href='${contextPath}/noticeSelect.no?boardNo='+data.boardNo;
					});
					
				}
			},
			error:data => console.log(data)
		});
	
	
	</script>












</body>
</html>
