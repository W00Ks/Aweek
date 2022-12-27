<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	$("input[type=button]").click(function(){
		
		if($(".number").val() == "") {
			alert("추천수를 입력해야 합니다.")
			
			$(".number").focus();
			
			return false;
		}
		
		if($(".number").val() < 5 || $(".number").val() > 50) {
			alert("값의 범위가 유효하지 않습니다.")
			
			$(".number").focus();
			
			return false;
		}
		
		var regNumber = /^[0-9]*$/;
		
		// .number의 값이 regNumber 안에 있으면 true, 없으면 false
		// 즉 regNumber.test( $(".number").val() )가 false라면 if문이 실행됨.
	    if(!regNumber.test( $(".number").val() )){
	        alert("정수만 입력이 가능합니다.");
	        
	        $(".number").focus();
	        
	        return false;
	    }
		
		$("form").submit();
		
		alert("설정이 완료되었습니다.")
		
		opener.location.reload(); // 부모창 새로고침
		
		/* history.back(); */
	});
	
});
</script>

</head>
<body>

<h1>추천수</h1>
<hr>
<h5>추천글로 등록되기 위한 추천 수를 설정할 수 있습니다.</h5>
<h5>최소 5에서 최대 50까지 설정할 수 있습니다.</h5>

<form action="./hot" method="post" target="iframe1">
	<input class="number" type="number" name="hot" value="${mydiaryHot.diaryHot }">

	<input type="button" value="설정">
	
	<iframe id="iframe1" name="iframe1" style="display:none"></iframe>
</form>

</body>
</html>