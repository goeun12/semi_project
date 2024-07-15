<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>

	#reply_table{background:white;
				width: 70%; 
				margin-top:15px;
				margin-left:15%;		
				padding: 20px;			
				border: 1px solid lightgray; border-radius:10px;
				font-weight:100;}
	
	tbody{font-size:18px;
	}
				
	#reply_write_button{background:#f24822; 
					color: white;
					width:110px;
					border:none; 
					border-radius:10px;
					height:40px;
					text-decoration:none; 
					font-size:18px
					}
	
	.reply_{background:#b3b3b3; 
						color:white; 
						width:60px;
						height:35px;
						border:none; 
						border-radius:10px;
						text-decoration:none; 
						font-size:20px;
						font-size:10px;}


</style>





<title>Insert title here</title>
</head>
<body>
			
	<div id="reply_table">	
		<table class="table">
			<thead>
				<c:if test="${!empty loginUser}">
					<tr id="replyInsertTr">
						<td style="width:15%; font-weight:550; text-align:center;" scope="row">${loginUser.id}</td>
						<td style="width:65%;" colspan="2">						
							<input type="text" class="form-control" name="content" id="insertReply" size="40" placeholder="40자 이내의 댓글을 입력하세요">
						</td>
						<td style="width:15%;text-align:center;" scope="col">
							<button class="btn btn-primary me-md-2" type="button" id ="reply_write_button">등록</button>
						</td>
					</tr>
				</c:if>
				<c:if test="${empty loginUser}">
			    	<tr>
			    		<th scope="col" style="width:15%; font-weight:550; text-align:center;">아이디</th>
			      		<th scope="col" colspan="2" style="width:65%; font-weight:550; text-align:center;">댓글</th>
			      		<th scope="col" style="width: 20%; font-weight:550; text-align:center;">등록일</th>				      	
			    	</tr>
		    	</c:if>
		    </thead>
		    <tbody id="replyTbody" class="table-group-divider" style="text-align:center;">
				<c:forEach items="${rpList}" var="rl">
					<tr id="replyListTr">		
						<c:if test="${ !empty loginUser && loginUser.id == rl.writer}">				
					    	<td style="width:15%;" scope="row">${rl.writer}</td>
					    	<td	style="width:45%; text-align:left;" >${rl.content}</td>			   
					    	<td style="width:20%; min-width:160px; text-align:right;">
					    		<input type="hidden" name="replyNo" value="${rl.replyNo}">
					    		<button class="btn btn-primary me-md-2 reply_ update_" role="button">수정</button>
								<button class="btn btn-primary me-md-2 reply_ delete_" role="button">삭제</button>
							</td>
							<td style="width:20%;" class="rListDate">${rl.updateDate}</td>	
						</c:if>
						<c:if test="${ (!empty loginUser || empty loginUser )&& loginUser.id != rl.writer}">
							<td style="width:15%;" scope="row">${rl.writer}</td>
					    	<td	style="width:65%; text-align:left;" colspan="2">${rl.content}</td>	
					    	<td style="width:20%;" class="rListDate">${rl.updateDate}</td>			   	
						</c:if>							
					</tr>
				</c:forEach>
			</tbody>
		</table>		
	</div>						

	
	<script>

			const replyWriteButton = document.getElementById("reply_write_button");		
			
			
			const inputCSS = function(){
				const inputs = document.getElementsByTagName("input")
				if(inputs != null){
					for(const input of inputs ){
						input.addEventListener('focus', function(){
							this.style.boxShadow = 'none';
							this.style.borderColor = "#b3b3b3";
						});
					}				
				}				
			}
			
						
			inputCSS();
			
			if(replyWriteButton != null){
				replyWriteButton.addEventListener('mouseover',function(){
					this.style.background = "#a5250a";
					this.style.fontWeight = "600";
				});
				replyWriteButton.addEventListener('mouseout',function(){
					this.style.fontWeight = "400";
					this.style.background ="#f24822";
				});	
			}
			

					
			if(replyWriteButton != null){ 
				replyWriteButton.addEventListener('click',()=>{
					$.ajax({
						url : '${contextPath}/insertReply.bo',
						data : { boardNo : ${no.boardNo}, rpWriter :'${loginUser.id}', rpContent : document.getElementById("insertReply").value},
						dataType : 'json',
						success : data =>{
							console.log(data)
							const replyTbody = document.getElementById('replyTbody');							
							const replyTbodyFirstChlidren = replyTbody.firstElementChild;
							const insertTr = document.createElement('tr'); 
							
							
							let inner =	'<td style="width:15%;" scope="row">'+data.writer+'</td>'
									+'<td style="width:45%; text-align:left;">'+data.content+'</td>'
									+'<td style="width:20%; min-width:160px; text-align:right;">'
									+'<input type="hidden" size="40" name="replyNo" value="'+data.replyNo+'">'
									+'<button class="btn btn-primary me-md-2 reply_ update_" style="background:#b3b3b3; width:60px; border-color:#b3b3b3;" role="button">수정</button>&nbsp'
									+'<button class="btn btn-primary me-md-2 reply_ delete_" style="background:#b3b3b3; width:60px; border-color:#b3b3b3;" role="button">삭제</button></td>'
									+'<td style="width:20%;">'+data.updateDate+'</td>'
														
					    	insertTr.innerHTML = inner;
					    	replyTbody.insertBefore(insertTr, replyTbodyFirstChlidren);			
					    	document.getElementById("insertReply").value='';
					    	
					
						},						
						error : data => {
							console.log(data)
						}
					});
				});
					
			}
		
			
			const replyUpButtons = document.getElementsByClassName("reply_ update_");	
			const replyDelButtons = document.getElementsByClassName("reply_ delete_");				
			const upDelButtons = document.getElementsByClassName('reply_');
			
			for(const upDelButton of upDelButtons){
				upDelButton.style.background = "#b3b3b3";
				upDelButton.style.borderColor = '#b3b3b3';
			}
						
			
			const replyTbody = document.querySelector('#replyTbody');
			if(replyTbody){
				replyTbody.addEventListener('click', (e)=>{
					const eventTarget = e.target;
					console.log(eventTarget)
					
					const tagetTagName = eventTarget.tagName.toLowerCase();
					if(tagetTagName == 'button'){
						const targetButton = eventTarget;	
						console.log("타겟" + targetButton)
						
						if(targetButton != null){
							if(targetButton.className.includes('delete_')){
								console.log("딜" + targetButton)
								const delTr = targetButton.parentElement.parentElement;
								$.ajax({
									url : '${contextPath}/deleteReply.bo',
									data : {replyNo : targetButton.previousElementSibling.previousElementSibling.value},
									dataType : 'json',
									success : data =>{								
										if(data == "0"){
											delTr.remove();									
										}		
									},
									error : data => {
										console.log(data)
									}
								});
									
								
							}else if(targetButton.className.includes('update_')){
								console.log("업" + targetButton)	
									if(targetButton.innerText != '등록'){
										const contentTd = targetButton.parentElement.previousElementSibling;
										const contentTdVal = contentTd.innerText;
										const inputTag = document.createElement('input');
										inputTag.className = 'form-control';
										inputTag.value = contentTdVal;
										
										contentTd.innerHTML='';
										contentTd.appendChild(inputTag);	
										
										
										targetButton.innerText = '등록'
										inputCSS();
										
										
										if(targetButton.innerText == '등록'){
											const contentTd = targetButton.parentElement.previousElementSibling;
											targetButton.addEventListener('click', function(){
												if(contentTd){
													 if(contentTd.firstElementChild != null){
														 $.ajax({
																url: '${contextPath}/updateReply.bo',
																data : {replyNo : targetButton.previousElementSibling.value , content :contentTd.firstElementChild.value},
															 	dataType : 'json',
															 	success : data => {
															 		
															 		contentTd.innerHTML='';
															 		contentTd.innerText = data.content;
															 		this.innerText = '수정';
															 		//location.reload()
														 										 		
															 	},
															 	error : data => {
																	console.log(data)
																}
															});				
														 													 
													 }								
														
										
												}
											});
										}
									
									}	
							}						
						}							
					}
															
				});
				
			}
		
	</script>
</body>
</html>
