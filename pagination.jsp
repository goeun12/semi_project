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
<link href="resources/css/pagination.css" rel="stylesheet" type="text/css"/>
<title>Insert title here</title>
<style type="text/css">

#pagination{font-size:15px;
			text-align:center;}

.pageItem{margin-right:10px;}

.pageLink{color:black;
		text-decoration-color:black;
		text-decoration-line:none;}

</style>

</head>
<body>

	<div class="mx-auto" id="pagination" style="width: 210px;">
		<ul class="pagination">
			<li class="pageItem">
		 		<c:url value="${loc}" var="goBack">
		 			<c:param name="page" value="${pi.currentPage-1 }"/>
		 		</c:url>
		 	 	<a class="pageLink" href="${goBack}">이전</a>
		 	</li>
		 	<c:forEach begin ="${pi.startPage }" end="${pi.endPage}" var="p" >
		 		<c:url value="${loc}" var="goCurr">
		 			<c:param name="page" value="${p}"/>
		 		</c:url>
		 	 	<li class="pageItem">
		 			<a class="pageLink pNum" href="${goCurr}">${p}</a>
		 	 	</li>				 	 
		 	</c:forEach>
		  	<li class="pageItem">
		 		<c:url value="${loc}" var="goNext">
		 			<c:param name="page" value="${pi.currentPage+1 }"/>
		 		</c:url>
		 	 	<a class="pageLink" href="${goNext}">이후</a>
		 	</li>
		</ul>
	</div>	
						

	<script>
		window.onload = () => {
		
			const pageItems = document.getElementsByClassName("pageItem");
			for(const pageItem of pageItems){
				pageItem.addEventListener('focus', function(){
					this.style.background='white';
					this.style.color='black';
					this.stylw.border='none';
				});	
				
				pageItem.addEventListener("click", function(){
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
			
			
			
		}
	</script>
</body>
</html>