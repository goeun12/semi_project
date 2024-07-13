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
				font-weight:100; }
	
				
	#reply_write_button{background:#f24822; 
					color: white;
					width:120px;
					border:none; 
					border-radius:10px;
					height:40px;
					text-decoration:none; 
					font-size:18px
					}
	
	#reply_update_button, #reply_delete_button{background:#b3b3b3; 
												color:white; 
												width:55px;
												height:40px;
												margin-right:2px;
												border:none; 
												border-radius:10px;
												text-decoration:none; 
												font-size:20px;
												font-size:16px;}
												
</style>
<title>Insert title here</title>
</head>
<body>
			
	<div id="reply_table">
		<table class="table">
			<thead>
				<c:if test="${ !empty loginUser}">
					<tr class="replyListTr">
						<td style="width:15%; font-weight:550; text-align:center;" scope="row">${loginUser.id}</td>
						<td style="width:65%;" class="listContent" colspan="2"><input type="text" class="form-control" name="content" placeholder="댓글을 입력하세요"></td>
						<td style="width:15%;text-align:center;" scope="col">
							<button class="btn btn-primary me-md-2" role="button" id ="reply_write_button">등록</button>
						</td>
					</tr>
				</c:if>
				<c:if test="${ empty loginUser }">
			    	<tr>
			    		<th scope="col" style="width:15%; font-weight:550; text-align:center;">아이디</th>
			      		<th scope="col" colspan="2" style="width:65%; font-weight:550; text-align:center;">댓글</th>
			      		<th scope="col" style="width: 20%; font-weight:550; text-align:center;">등록일</th>				      	
			    	</tr>
		    	</c:if>
		    </thead>
		    <tbody class="table-group-divider" style="text-align:center;">
				<c:forEach items="${rList}" var="rl">
					<tr id="replyListTr">		
						<c:if test="${ !empty loginUser && loginUser.id == rl.writer}">				
					    	<td style="width:15%;" scope="row">${rl.writer}</td>
					    	<td	style="width:45%; text-align:left;" class="rListContent" >${rl.content}</td>			   
					    	<td style="width:20%; min-width:115px; text-align:right;">
					    		<button class="btn btn-primary me-md-2" role="button" id ="reply_update_button">수정</button>
								<button class="btn btn-primary me-md-2" role="button" id ="reply_delete_button">삭제</button>
							</td>
							<td style="width:20%;" class="rListDate">${rl.updateDate}</td>	
						</c:if>
						<c:if test="${ (!empty loginUser || empty loginUser )&& loginUser.id != rl.writer}">
							<td style="width:15%;" scope="row">${rl.writer}</td>
					    	<td	style="width:65%; text-align:left;" colspan="2"class="rListContent">${rl.content}</td>	
					    	<td style="width:20%;" class="rListDate">${rl.updateDate}</td>			   	
						</c:if>							
					</tr>
				</c:forEach>
			</tbody>
		</table>		
	</div>						

	
	<script>
		window.onload = () => {

			const writeButton = document.getElementById("reply_write_button");
			
			writeButton.addEventListener('mouseover',function(){
				this.style.background = "#a5250a";
				this.style.fontWeight = "600";
			});
			writeButton.addEventListener('mouseout',function(){
				this.style.fontWeight = "400";
				this.style.background ="#f24822";
			});
			
			
			const inputs = document.getElementsByTagName("input")
			for(const input of inputs ){
				input.addEventListener('focus', function(){
					this.style.boxShadow = 'none';
					this.style.borderColor = "#b3b3b3";
				});
			}

			
		
			
			
			
			
			
		}
	</script>
</body>
</html>