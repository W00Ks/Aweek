<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Class Add Remove Includes Example</title>
</head>
<body>
    <h1>안녕하세요</h1>
    <h2 class="good memory">메모를 메모하다</h2>
    <h3>티스토리에 오신 것을 환영합니다</h3>
    <p class="welcome">https://goodmemory.tistory.com</p>
    <script>
        const h1Tag = document.querySelector('h1');
        const h2Tag = document.querySelector('h2');
        const h3Tag = document.querySelector('h3');
        const pTag = document.querySelector('p.welcome');
	
    	//클래스 추가
        h1Tag.classList.add('Hello');
        //클래스 삭제
        h2Tag.classList.remove('memory');
        //클래스 추가
        h3Tag.classList.add('memory');
        //클래스 포함 여부 확인
        console.log(h1Tag.className, h2Tag.className, h3Tag.className, pTag.classList.contains('welcome'));
    </script>
</body>
</html>