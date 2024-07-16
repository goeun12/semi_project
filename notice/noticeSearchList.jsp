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
<style type="text/css">
	
	#pagination{width: 20%;
         margin-left:44%;
         font-size:15px;
         text-align:center;
         font-family: 'MinSans-Regular';}

	.pageItem{margin-right:10px; text-align:center;}

	.pageLink{color:black;
      text-decoration-color:black;
      text-decoration-line:none;
      text-align:center;}

	.pNum-c{
  			font-family: 'MinSans-Bold';
   			text-decoration: underline;
			}	

</style>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="container-fluid">
		<div id="notice_title">
    		<p>공지사항 게시판</p>
  		</div>
  		
		<form action="noticeSearch.no">
			<div class="input-group mb-3" id="search_notice" style="margin-top:50px;">
	 			<input type="text" class="form-control" name="key" value="${key}" placeholder="공지사항 검색" aria-label="Recipient's username" aria-describedby="search_button">	
	 			<button class="btn btn-outline-secondary" id="search_button">검색</button>
			</div>
		</form>	

			
		<div id="notice_table_div" >	
			<div id="notice_table">
				<c:if test="${listCount == 0}">
					<p>해당 키워드에 대한 검색 결과가 없습니다.<p>
					<p>다시 시도해 주세요.<p>				
				</c:if>
				
				<c:if test="${listCount > 0}">				
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
						  <c:forEach items="${noticeSearchList}" var="nsl">
						    <tr class="noticeListTr">
						      <td scope="row">${nsl.boardNo}</td>
						      <td class="listContent">${nsl.title}</td>
						      <td>${nsl.updateDate}</td>
						      <td>${nsl.boardCount}</td>
						    </tr>
					    </c:forEach>
					  </tbody>
					</table>
				</c:if>			
			</div>
			
			<div id="pagination">
				<ul class="pagination">
					<c:if test="${pi.currentPage > 1}">
						<li class="pageItem">
					 		<c:url value="${loc}" var="goBack">
					 			<c:param name="key" value="${key}"/>
					 			<c:param name="page" value="${pi.currentPage-1 }"/>
					 		</c:url>
					 	 	<a class="pageLink" href="${goBack}">이전</a>
					 	</li>
				 	</c:if>
				 	<c:forEach begin ="${pi.startPage }" end="${pi.endPage}" var="p" >
				 		<c:url value="${loc}" var="goCurr">
				 			<c:param name="key" value="${key}"/>
				 			<c:param name="page" value="${p}"/>
				 		</c:url>
				 	 	<li class="pageItem">
				 			<c:if test="${ p eq pi.currentPage }">
                    			<a class="pageLink pNum-c" href="${goCurr}">${p}</a>
                			 </c:if>
                			 <c:if test="${ p ne pi.currentPage }">
                  				 <a class="pageLink pNum" href="${goCurr}">${p}</a>
                			 </c:if>
				 	 	</li>				 	 
				 	</c:forEach>
				 	<c:if test="${pi.currentPage < pi.maxPage}">
					  	<li class="pageItem">
					 		<c:url value="${loc}" var="goNext">
					 			<c:param name="key" value="${key}"/>
					 			<c:param name="page" value="${pi.currentPage+1 }"/>
					 		</c:url>
					 	 	<a class="pageLink" href="${goNext}">이후</a>
					 	</li>
				 	</c:if>
				 	
				</ul>
			</div>	
						
		</div>
		<div class="mx-auto" style="width: 80px;">
			<a class="btn btn-primary me-md-2" href="${contextPath}/notice.no" role="button" id="go_list_button">목록</a>		
		</div>	
		
		<jsp:include page="../common/topButton.jsp"></jsp:include>	
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
	
	<script>
		window.onload = () => {
			const searchButton = document.getElementById("search_button");

			searchButton.addEventListener('mouseover',function(){
				this.style.background = "#a5250a";
				this.style.fontWeight = "600";
			});
			searchButton.addEventListener('mouseout',function(){
				this.style.fontWeight = "400";
				this.style.background ="#f24822";
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
					location.href='${contextPath}/noticeSelect.no?boardNo='+boardNo
				});				
			}

			
			
			
			

			
			
			
			
			
			
			
		}
	</script>
</body>
</html>