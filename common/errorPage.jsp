<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style type="text/css">
	@font-face {
	    font-family: 'MinSans-Regular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/MinSans-Regular.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	@font-face {
	    font-family: 'MinSans-Bold';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/MinSans-Bold.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	.container-fluid{background:#fffbf2; padding-top:100px; min-width: 1250px; min-height:1000px; font-family: 'MinSans-Regular';}
						
	#title{
		background:#f9ae98;
		width: 50%; height:50px;
		margin-left:25%;
		margin-block-end:0;
		text-align:center;
		text-decoration:none;
		font-size: 25px; font-family: 'MinSans-Bold';
		line-height:50px; border-radius:5px;
	}
	
	#word{background:white;
		width:50%;
		margin-top:80px;
		margin-left:25%;
		padding:5%;
		border: 1px solid lightgray;
		border-radius:10px;}
	
	
	#msg_div{margin-top:50px;}
	
	#msg{color: red; font-family: 'MinSans-Bold';}
	
	#button_div{margin-top:50px; text-align: center;}
	
	.btn{
		background: #b3b3b3; color:white; 
		border: none; border-radius:10px;
		width:140px; height:60px;
		font-family: 'MinSans-Bold'; font-size: 30px;
	}
	
	#back_button{margin-left:80px;}
</style>
</head>
<body>
	<div class="container-fluid">

		<div id="title">
    		<p>페이지 오류</p>
  		</div>
		
		<div id="word">
			<h5>페이지가 정상적으로 동작하지 않았습니다.</h5>
			<h5>Home 또는 이전 화면으로 돌아가 다시 시도해주세요. </h5>
			<h5>불편을 드려 죄송합니다. </h5>
			<div id="msg_div">
				<p id="msg"> 오류 원인 : </p>
				<p>${requestScope['javax.servlet.error.message']}</p>
			</div>
		</div>
		
		<div id ="button_div" >
			<a class="btn btn-primary me-md-2" href="${contextPath}/" role="button" id ="home_button">Home</a>
			<a class="btn btn-primary me-md-2" href="javascript:history.back();" role="button" id ="back_button">Back</a>
		</div>
	
	</div>
	
	
	<script type="text/javascript">
	
	const as = document.getElementsByTagName("a")
	for(a of as){
		a.addEventListener('mouseover',function(){
			this.style.background ="#b3b3b3";			
		})
	}
	</script>	
</body>
</html>
