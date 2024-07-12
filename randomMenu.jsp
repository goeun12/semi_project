<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
<link href="resources/css/randomMainPage.css" rel="stylesheet" type="text/css"/>
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="container-fluid">
		
		<div id="random_title">
    		<p>오늘의 혼밥심</p>
  		</div>

		<form id="form">
			<div id = "choice">					
				<p id="info">선택한 카테고리에 맞는 혼밥 메뉴 레시피를 추천해드립니다.</p>
				
				<div id = "nation">
					<input type="checkbox" name="nation" value="kr" class="btn-check" id="nation1" autocomplete="off">
					<label class="btn" for="nation1">한식</label>
					
					<input type="checkbox" name="nation" value="cn" class="btn-check" id="nation2" autocomplete="off">
					<label class="btn" for="nation2">중식</label>
					
					<input type="checkbox" name="nation" value="jp" class="btn-check" id="nation3" autocomplete="off">
					<label class="btn" for="nation3">일식</label>
					
					<input type="checkbox" name="nation" value="us" class="btn-check" id="nation4" autocomplete="off">
					<label class="btn" for="nation4">양식</label>
					
					<input type="checkbox" name="nation" value="no" class="btn-check" id="nation5" autocomplete="off">
					<label class="btn" for="nation5">분식</label>
				</div>
				<div id = "difficulty">
					<input type="checkbox" name="difficulty" value="easy" class="btn-check" id="difficulty1" autocomplete="off">
					<label class="btn" for="difficulty1">손쉬움</label>
					
					<input type="checkbox" name="difficulty" value="mid" class="btn-check" id="difficulty2" autocomplete="off">
					<label class="btn" for="difficulty2">평범함</label>
					
					<input type="checkbox" name="difficulty" value="hard" class="btn-check" id="difficulty3" autocomplete="off">
					<label class="btn" for="difficulty3">어려움</label>				
				</div>			
			</div>
			<div class="mx-auto" id="img_div">
			</div>
			<div class="mx-auto" style="width:160px;">
				<button class="btn btn-primary me-md-2" type="button" id ="submit_button">?</button>
			</div>
		</form>	
		
		<jsp:include page="../common/topButton.jsp"></jsp:include>	
	
	</div>
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		window.onload=()=>{
			const checkboxs = document.querySelectorAll('input[type=checkbox]');
			
			for(checkbox of checkboxs){		
				checkbox.addEventListener('change', function(){
					const label = this.nextElementSibling;
	
					if(this.checked){									
						label.style.border = '4px solid #f24822';					
					}else{
						label.style.border = '2px solid lightgray';
					}	
					
				});
			}
			
			const submitButton = document.getElementById("submit_button");
			
			submitButton.addEventListener('mouseover',function(){
				this.style.fontSize = "65px";
			})
			submitButton.addEventListener('mouseout',function(){
				this.style.fontSize = "55px";
			})
			
			
			submitButton.addEventListener('click', ()=>{				
				var form = $("#form").serialize();	
				$.ajax({
					
					url : '${contextPath}/randomChoice.re',
					type : 'GET',
					data : {form:form},
					dataType : 'json',
					success : data => {	
						if(data == "0"){
							const string = '<p id="not">카테고리를 선택해주세요.</p>';
							$('#img_div').html(string);	
							
							$('#img_div').css('border','1px solid lightgray');
							$('#img_div').css('background','white');
							$('#img_div').css('border-radius','10px');
							$('#img_div').css('width','54%');
							$('#img_div').css('height','60px');
							$('#img_div').css('margin-left','23%');
							$('#img_div').css('margin-top','15px');
							$('#img_div').css('font-size','23px');
							$('#img_div').css('font-weight','700');
							$('#img_div').css('text-align','center');
							$('#img_div').css('line-height','60px');
														
						}else{
						
							const string = '<p id="img_title">'+data.title+'</p><img id="img" width="350px" height="350px" src="${contextPath}/resources/image/' +data.imageName+'"/>';
							$('#img_div').html(string);					
							
							$('#img_div').css('border','1px solid lightgray');
							$('#img_div').css('background','white');
							$('#img_div').css('border-radius','10px');
							$('#img_div').css('width','54%');
							$('#img_div').css('min-width','400px');
							$('#img_div').css('height','450px');
							$('#img_div').css('margin-left','23%');
							$('#img_div').css('margin-top','20px');
							$('#img_div').css('font-size','15px');
							$('#img_div').css('font-weight','700');
							$('#img_div').css('text-align','center');
							
							$('#img_title').css('margin-top','15px');
							$('#img_title').css('color','black');
							$('#img').css('height','350px');
							$('#img').css('margin-top','5px');
							
							const img = document.querySelector('#img');
							
							img.addEventListener('click', function(){
								location.href='${contextPath}/recipeContent.re?bNo='+data.boardNo+'&rNo='+data.recipeNo
								
							})
							
						}
					},
					error : data => {

					}
										
				});			
			});

			
			
			
		
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
				
		}
	</script>

</body>
</html>
