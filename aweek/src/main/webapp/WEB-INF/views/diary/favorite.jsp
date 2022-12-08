<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#favorite2").click(function(){
		$.ajax({
			type: "get"
			, url: "./clear"
			, data: {}
			, dataType: "html"
			, success: function( res ) {
				console.log("AJAX 성공")
				$(".resultfavorite").html( res )
			}
			, error: function() {
				console.log("AJAX 실패")
			}
		})
	})
});
</script>

<div class="resultfavorite">
즐겨찾기 목록
<a id="favorite2" style="cursor: pointer;"><img alt="" src="/resources/diary/close_FILL0_wght400_GRAD0_opsz48.png" style="display: inline; float: right; width: 15px;"></a>
<hr>
<form action="./favorite" method="post">
	<c:forEach items="${userRoom }" var="data">
		${data.roomName } <input type="checkbox" name="roomnos" value="${data.roomNo }" style="float: right;">
		<hr>
	</c:forEach>
	<button style="float: right;">설정</button>
</form>
</div>