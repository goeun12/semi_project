<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="resources/css/noticeContentPage.css" rel="stylesheet" type="text/css"/>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="container-fluid">
		<div id="notice_title">
    		<p>공지사항 게시판</p>
  		</div>
  		

		<c:if test="${loginUser.isAdmin == 'Y' }">
			<div id ="notice_up_del" >
				<a class="btn btn-primary me-md-2" href="${contextPath}/noticeUpdateView.no?boardNo=${no.boardNo}" role="button"  id ="notice_update_button">수정</a>
				<button class="btn btn-primary me-md-2" role="button" id ="notice_delete_button">삭제</button>
			</div>
		</c:if>
		
		<div>
			<div class="input-group mb-3" id="content_title">
	  			<span class="input-group-text" id="notic_content_title_">
  					&nbsp
		  			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
  					<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2m.995-14.901a1 1 0 1 0-1.99 0A5 5 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901"/>
					</svg>								  			
	  				&nbsp공지사항
		  		</span>
	 			<span class="form-control" id="notic_content_title">${no.title }</span>
			</div>
			<div>
				<p id="notic_content_text">${no.content }</p>
			</div>
		</div>


		<div id="notice_table">
			<table class="table table-hover ">
				<thead>
					 <tr>
				      <th scope="col" style="width: 10%; font-weight:550; text-align:center;">번호</th>
				      <th scope="col" style="width: 60%; font-weight:550; text-align:center;">
				      	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
  							<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2m.995-14.901a1 1 0 1 0-1.99 0A5 5 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901"/>
						</svg>	
				      	공지사항
				      </th>
				      <th scope="col" style="width: 20%; font-weight:550; text-align:center;">작성일</th>
				      <th scope="col" style="width: 10%; font-weight:550; text-align:center;">조회수</th>
				    </tr>
				  </thead>
				  <tbody class="table-group-divider" style="text-align:center;">
					  <c:forEach items="${noticeListMin}" var="nlm">
					    <tr class="noticeListTr">
					      <td scope="row">${nlm.boardNo}</td>
					      <td class="listContent">${nlm.title}</td>
					      <td>${nlm.updateDate}</td>
					      <td>${nlm.count}</td>
					    </tr>
				    </c:forEach>
				  </tbody>
			</table>
		</div>

		<div class="mx-auto" style="width: 80px;">
			<c:if test="${ empty myPage }">
				<a class="btn btn-primary me-md-2" href="${ contextPath }/notice.no" role="button" id="go_list_button">목록</a>
			</c:if>
			<c:if test="${ !empty myPage }">
				<a class="btn btn-primary me-md-2" href="${ contextPath }/write.user" role="button" id="go_list_button">목록</a>
			</c:if>
		</div>

		<jsp:include page="../common/topButton.jsp"></jsp:include>	
	</div>
	<jsp:include page="../common/footer.jsp" />
		
		
		
	<script>
		window.onload = () => {
			console.log('${myPage}');
			const goListButton = document.getElementById("go_list_button");
			const updateButton = document.getElementById("notice_update_button");
			const deleteButton = document.getElementById("notice_delete_button");
	
			goListButton.addEventListener('mouseover',function(){
				this.style.background = "#a5250a";
				this.style.fontWeight = "600";
			});
			goListButton.addEventListener('mouseout',function(){
				this.style.fontWeight = "400";
				this.style.background = "#f24822";
			});
			
			
			deleteButton.addEventListener('click',function(){
				const del = window.confirm("정말 게시글을 삭제하시겠습니까?")
				if(del){
					$.ajax({
						url: '${contextPath}/noticeDelete.no',
						data : {boardNo : '${no.boardNo}'},
						succesㄴ : data => {
							if(data > 0){
								alert("게시글 삭제를 성공하였습니다.");
								location.href="${contextPath}/notice.no";
							}							
						},
						error:data => {
							throw new AllException("공지사항 게시글을 삭제하지 못했습니다");
						}		
					});
										
				}else{
					alert("게시글 삭제를 취소하였습니다.");
				}
			});
			
			const tds = document.getElementsByTagName("td")
			for(td of tds){
				td.addEventListener('mouseover',function(){
					const tr = this.parentElement
					tr.style.cursor="pointer"	
				});
				td.addEventListener('mouseout',function(){
					const tr = this.parentElement
					tr.style.cursor="default"				
				});
			}
			
			const noticeListTrs = document.getElementsByClassName("noticeListTr");
			for(const noticeListTr of noticeListTrs){
		
				noticeListTr.addEventListener('click', function(){
					const boardNo = this.children[0].innerHTML;
					location.href='${contextPath}/noticeSelect.no?boardNo='+boardNo;					
				});				
			}
		}
	</script>
</body>
</html>
