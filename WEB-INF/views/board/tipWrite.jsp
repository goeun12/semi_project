<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    <link href="resources/css/tipWrite.css" rel="stylesheet">
    <title>Insert title here</title>
  
</head>
<body>
    
    <jsp:include page="../common/header.jsp"/>
    
    <div class="container-fluid">
        <br><br><br>
        <form>
            <div class="input-group mb-3" id="search_receipe">
                <input type="text" class="form-control" name="honeyKey" placeholder="레시피를 찾아보세요" aria-label="Recipient's username" aria-describedby="search_button">
                <button class="btn btn-outline-secondary" id="search_button">검색</button>
            </div>
        </form>
        <br><br>
        <form action="${contextPath }/insert.tip" method="POST">
            <div>
                <div class="input-group mb-3" id="write_title">
                    <input type="text" name="title" class="form-control" id="title" aria-label="Username" required aria-describedby="basic-addon1" placeholder="제목 입력란">
                </div>
                <div>
                    <textarea class="form-control" name="content" placeholder="내용을 입력해주세요." id="content" required></textarea>
                </div>
            </div>
            <br>
            <div class="mx-auto" style="width: 80px;">
                <input type="submit" value="등록" class="btn btn-primary me-md-2" id="submit_button">
            </div>
        </form>
        </div>
        
</body>
</html>
