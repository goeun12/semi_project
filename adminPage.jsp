<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/adminPage.css" rel="stylesheet" type="text/css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body style="background-color: #FFFBF2; margin: 0;">
	<jsp:include page="../common/header.jsp"/>
		<div class="admin_container">
		<div class="admin_page">
			<div class="title_user">
				<h2><label class="title_text">사용자 정보 조회</label></h2>
			</div>
			<div class="user_category">
				<div class="select_botton">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" id="inlineCheckbox1" name="search" value="total" checked>
						<label class="form-check-label" for="inlineCheckbox1">전체</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" id="inlineCheckbox2" name="search" value="N">
						<label class="form-check-label" for="inlineCheckbox2">일반</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" id="inlineCheckbox3" name="search" value="Y">
						<label class="form-check-label" for="inlineCheckbox3">관리자</label>
					</div>
				</div>
				<div class="search_user">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="사용자 이름" aria-label="Recipient's username" aria-describedby="button-addon2" id="searchInput">
						<button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
					</div>
				</div>
			</div>
			<div class="user_table_div">
				<div class="user_table">
					<table class="table">
						<thead>
					    	<tr>
					      		<th scope="col" style="width: 13%;">아이디</th>
					      		<th scope="col" style="width: 8%;">이름</th>
					      		<th scope="col" style="width: 15%;">전화번호</th>
					      		<th scope="col" style="width: 37%;">주소</th>
					      		<th scope="col" style="width: 10%;">가입날짜</th>
					      		<th scope="col" style="width: 8%;">활동 여부</th>
					      		<th scope="col" style="width: 15%;">관리자 여부</th>
					    	</tr>
					  	</thead>
					  	<tbody>
					  		<c:if test="${ empty userList }">
					  			<tr>
					  				<td colspan="6">사용자 정보가 없습니다.</td>
					  			</tr>
					  		</c:if>
					  		<c:if test="${ !empty userList }">
					  			<c:forEach items="${ userList }" var="l">
							    	<tr>
							      		<td>${ l.id }</td>
							      		<td>${ l.name }</td>
							      		<td>${ l.phone }</td>
							      		<td>${ fn:split(l.address, '§§●')[0] } ${ fn:split(l.address, '§§●')[1] }</td>
							      		<td>${ l.joinDate }</td>
							      		<td>${ l.status }</td>
							      		<td>
							      			<div class='${ l.isAdmin == "Y" ? "selectState" : "unselectState" }'>Y</div>
							      			<div class='${ l.isAdmin == "N" ? "selectState" : "unselectState" }'>N</div>
							      		</td>
							    	</tr>
					  			</c:forEach>
					  		</c:if>
					  </tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		window.onload = () => {
			const checkes = document.getElementsByName('search');
			
			for(const check of checkes){
				check.addEventListener('change', function(){
					if(check.checked){
						$.ajax({
							url: "${contextPath}/adminUserList.user",
							data: {
								admin: check.value
							},
							dataType: 'json',
							success: data => {
								console.log(data);
								const tbody = document.querySelector('tbody');
								tbody.innerHTML = '';
								
								if(data != null){
									console.log('adsf');
									for(const d of data){
										const tr = document.createElement('tr');
										
										const idTd = document.createElement('td');
										idTd.innerText = d.id;
										
										const nameTd = document.createElement('td');
										nameTd.innerText = d.name;
										
										const phoneTd = document.createElement('td');
										phoneTd.innerText = d.phone;
										
										const addressTd = document.createElement('td');
										const arrAdd = d.address.split('§§●');
										console.log(arrAdd[1]);
										if(arrAdd[1] != null){
											addressTd.innerText = arrAdd[0] + ' ' + arrAdd[1];
										} else{
											addressTd.innerText = arrAdd[0];
										}
										
										const joinDateTd = document.createElement('td');
										joinDateTd.innerText = d.joinDate;
										
										const statusTd = document.createElement('td');
										statusTd.innerText = d.status;
										
										const isAdminTd = document.createElement('td');
										isAdminTd.innerText = d.isAdmin;
										
										tr.append(idTd);
										tr.append(nameTd);
										tr.append(phoneTd);
										tr.append(addressTd);
										tr.append(joinDateTd);
										tr.append(statusTd);
										tr.append(isAdminTd);
										
										tbody.append(tr);
									}
								} else{
									console.log('else');
									tbody.innerHTML = '<tr><td colspan="6">사용자 정보가 없습니다.</td></tr>';
								}
							},
							error: data => console.log('error')
						});
					}
				});
			}
			
			const btn = document.getElementById('button-addon2');
			const input = document.getElementById('searchInput');
			const tbody = document.querySelector('tbody');
			
			btn.addEventListener('click', function(){
				if(input.value != ''){
					$.ajax({
						url: "${contextPath}/searchUser.user",
						data: {
							search: input.value
						},
						dataType: 'json',
						success: data => {
							console.log (data);
							tbody.innerHTML = '';
							
							if(data != null){
								console.log('adsf');
								for(const d of data){
									const tr = document.createElement('tr');
									
									const idTd = document.createElement('td');
									idTd.innerText = d.id;
									
									const nameTd = document.createElement('td');
									nameTd.innerText = d.name;
									
									const phoneTd = document.createElement('td');
									phoneTd.innerText = d.phone;
									
									const addressTd = document.createElement('td');
									const arrAdd = d.address.split('§§●');
									if(arrAdd[1] == null){
										addressTd.innerText = arrAdd[0];
									} else{
										addressTd.innerText = arrAdd[0] + ' ' + arrAdd[1];
									}
									
									const joinDateTd = document.createElement('td');
									joinDateTd.innerText = d.joinDate;
									
									const statusTd = document.createElement('td');
									statusTd.innerText = d.status;
									
									const isAdminTd = document.createElement('td');
									isAdminTd.innerText = d.isAdmin;
									
									tr.append(idTd);
									tr.append(nameTd);
									tr.append(phoneTd);
									tr.append(addressTd);
									tr.append(joinDateTd);
									tr.append(statusTd);
									tr.append(isAdminTd);
									
									tbody.append(tr);
								}
							} else{
								console.log('else');
								tbody.innerHTML = '<tr><td colspan="6">사용자 정보가 없습니다.</td></tr>';
							}
						},
						error: data => console.log('error')
					});
				}
			});
			
			const divs = tbody.querySelectorAll('div');
			for(const div of divs){
				div.addEventListener('click', function(){
					if(this.className == 'unselectState'){
						console.log(this.value);
						let answer;
						if(this.innerText == 'Y'){
							answer = window.confirm("관리자로 임명하시겠습니까?");
						} else {
							answer = window.confirm("관리자 임명을 취소하시겠습니까?");
						}
						
						if (answer == true){
							const myTd = this.parentElement;
							const myTr = myTd.parentElement;
							const id = myTr.children[0].innerText;
							
							
							$.ajax({
								url: "${contextPath}/adminUpdateStatus.user",
								data: {
									id: id,
									isAdmin: this.innerText
								},
								success: data => {
									if(data == "success"){
										this.className = 'selectState';
										for(const siblings of myTd.children){
											if(siblings != this){
												siblings.className = 'unselectState';
											}
											
										}
									} else{
										alert('상태 변경을 실패하였습니다.');
									}
								},
								error: data => console.log('error')
							});
						}
					}
				});
			}
			
			
		}
	</script>
</body>
</html>