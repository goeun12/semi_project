<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="resources/css/noticeMainPage.css" rel="stylesheet" type="text/css"/>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="container-fluid">
		<div id="notice_title">
    		<p>공지사항 게시판</p>
  		</div>
  		
		<form>
			<div class="input-group mb-3" id="search_notice">
	 			<input type="text" class="form-control" name="noticeKey" placeholder="공지사항 검색" aria-label="Recipient's username" aria-describedby="search_button">
	 			<button class="btn btn-outline-secondary" id="search_button">검색</button>
			</div>
		</form>	
		
			<div id="write_div">
				<a class="btn btn-primary me-md-2" href="${ contextPath }/noticeWriteView.no" role="button" id ="notice_write_button">글쓰기</a>
			</div>	
		
		<div id="notice_table_div">	
			<div id="notice_table">
				<table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col" style="width: 10%; font-weight:550; text-align:center;">번호</th>
				      <th scope="col" style="width: 60%; font-weight:550; text-align: center;">
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
					  <c:forEach items="${noticeList}" var="nl">
					    <tr class="noticeListTr">
					      <td scope="row">${nl.boardNo}</td>
					      <td class="listContent">${nl.title}</td>
					      <td>${nl.updateDate}</td>
					      <td>${nl.count}</td>
					    </tr>
				    </c:forEach>
				  </tbody>
				</table>			
			</div>
			
			<jsp:include page="../common/pagination.jsp"></jsp:include>
						
		</div>	
		
		<jsp:include page="../common/topButton.jsp"></jsp:include>	
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
	
	<script>
		window.onload = () => {
			const searchButton = document.getElementById("search_button");
			const writeButton = document.getElementById("notice_write_button");
			
			const buttons = [searchButton, writeButton];
			for(button of buttons){
				button.addEventListener('mouseover',function(){
					this.style.background = "#a5250a";
					this.style.fontWeight = "600";
				})
				button.addEventListener('mouseout',function(){
					this.style.fontWeight = "400";
					this.style.background ="#f24822";
				})
			}
			
			
			const tds = document.getElementsByTagName("td")
			for(td of tds){
				td.addEventListener('mouseover',function(){
					const tr = this.parentElement
					tr.style.cursor="pointer"
					
				})
				td.addEventListener('mouseout',function(){
					const tr = this.parentElement
					tr.style.cursor="default"
					
				})
			}
			
			const inputs = document.getElementsByTagName("input")
			for(const input of inputs ){
				input.addEventListener('focus', function(){
					this.style.boxShadow = 'none';
					this.style.borderColor = "#b3b3b3";
				});
			}
			
			
			const pageItems = document.getElementsByClassName("pageItem");
			for(const pageItem of pageItems){
				pageItem.addEventListener('focus', function(){
					this.style.background='white';
					this.style.color='black';
					this.stylw.border='none';
				});	
				
				pageItem.addEventListener('click', function(){
					this.style.textDecoration = 'underline'; 
					this.style.fontWeight= 'bold';
					this.style.boxShadow = 'none';
					this.style.color='black';
				});				
				
			}
			
			const pNums = document.getElementsByClassName("pNum");
			for(const pNum of pNums){
				if(pNum.innerHTML == '${pi.currentPage}'){
					pNum.style.textDecoration = 'underline';
					pNum.style.fontWeight= 'bold';
				}
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