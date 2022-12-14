<%@page import="diary.dto.DiaryCategory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>

<%-- <c:import url="../layout/header.jsp" /> --%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<% List<DiaryCategory> categoryList = (List) request.getAttribute("categoryList"); %>  

<script type="text/javascript">
$(document).ready(function() {
/* 	$("#btnWrite").click(function() {
		location.href = "/board/write"
	}) */
	
/* 	$("#crecate").click(function() {
		$("#creform").submit();
		alert("생성이 완료되었습니다.")
	})
	
	$("#delcate").click(function() {
		$("#delform").submit();
		alert("삭제가 완료되었습니다.")
	}) */
	
})

var check_num = /[0-9]/;    // 숫자 
var check_eng = /[a-zA-Z]/;    // 문자 
var check_spc = /[~!@#$%^&*()_+|<>?:{},./]/; // 특수문자
var check_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크

function crecheck() {
	
	if(${fn:length(categoryList) } >= 10){
		alert("카테고리는 10개를 초과할 수 없습니다.");
		$(".crecate").val("");
		$(".crecate").focus();
		return false;
	}
	
	if($(".crecate").val() == ""){
		alert("카테고리 제목을 입력해주세요.");
		$(".crecate").focus();
		return false;
	}
	
	if($(".crecate").val().length < 2) {
		alert("최소 2글자 이상 입력해주세요.");
		$(".crecate").focus();
		return false;
	}
	
	if($(".crecate").val().length > 10) {
		alert("최대 10글자 까지만 가능합니다.");
		$(".crecate").focus();
		return false;
	}
	
	if(check_spc.test( $(".crecate").val() )){
		alert("특수 문자는 사용할 수 없습니다.");
		$(".crecate").focus();
		return false;
	}
	
	var cateNameArr = ''
	
	<c:forEach items="${categoryList}" var="c" varStatus="stat">
		cateNameArr += '${c.diaryCateName}'
		<c:if test="${not stat.last}"> // stat는 index를 말하는거네. 그러니까 마지막 인덱스가 아니면 ,를 붙여라? 그럼 a, b, c 이렇게 되겠네?
			cateNameArr += ','
		</c:if>
	</c:forEach>
	
	console.log(cateNameArr) // a,b,c,d
	
	var cateNames = cateNameArr.split(','); // ,를 기준으로 나눠서 배열로 만들어준다.
	
	console.log(cateNames) // ['a', 'b', 'c, 'd']
	
  	for(let i=0; i<cateNames.length; i++) {
  		
  		if(cateNames[i] == $(".crecate").val()) {
			alert("카테고리 제목은 중복될 수 없습니다.");
			$(".crecate").focus();
			return false;
  		}
	}
  	
/*   	$(".entirecate .container table tr td:nth-child(2)").each(function() {
  	  console.log($(this).html());
  	  console.log(  $(this).html() == $(".crecate").val()  );
  	});
	이렇게 table의 td값을 긁어와서 하는게 더 간편할것 같긴 하다.
	
  	*/

	
/* 	for(let i=0; i<${fn:length(categoryList) }; i++) {
  		
  		var test = ${categoryList[i].diaryCateName }
  		
  		jstl이 되지 않은 이유. jstl도 서버쪽 코드인데, 자바스크립트 for문의 [i]를 서버가 어떻게 안단 말인가?
  		
  		if(test == $(".crecate").val()) {
			alert("카테고리 제목은 중복될 수 없습니다.");
			$(".crecate").val("");
			return false;
  		}
	} */
	
<%-- 	<% for(int i=0; i<categoryList.size(); i++) { %>
		<% if(categoryList.get(i).getDiaryCateName() == $(".crecate").val()) { %>
		
		스크립틀릿이 되지 않은 이유. 스크립틀릿은 서버쪽 코드인데, 서버에서 $(".crecate").val() 이 jquery문을 어떻게 안단 말인가? 당연히 안되고.
	
			alert("카테고리 제목은 중복될 수 없습니다.");
			$(".crecate").val("");
			return false;
		<% } %>
	<% } %> --%>
	
	$("#creform").submit();
	
	alert("생성이 완료되었습니다.");
	
	opener.location.reload(); // 부모창 새로고침
	
	$.ajax({
		type: "get"
		, url: "./managecate"
		, data: {
			n1 : ${roomInfo.roomNo }
		}
		, dataType: "html"
		, success: function( res ) {
			console.log("AJAX 성공")
			$(".rightbox").html( res ) // .rightbox가 여기있는게 아니고 부모인 setting에 있는데 인식하는게 신기하네. 결국 이 페이지도 setting안이란 건가?
		}
		, error: function() {
			console.log("AJAX 실패")
		}
	})
	
}

function delcheck() {
	
	if($(".delcate").val() == ""){
		alert("카테고리 제목을 입력해주세요.")
		$(".delcate").focus();
		return false;
	}
	
	if($(".delcate").val() == "공지사항"){
		alert("공지사항 카테고리는 삭제할 수 없습니다.")
		$(".delcate").val("");
		$(".delcate").focus();
		return false;
	}
	
/* 	$.each(object, function(index, item){

		// object에 배열을 넣으면 index는 인덱스를, item은 배열값을 보여주며 반복한다.
		// object에 객체를 넣으면 index는 키를, item은 값을 보여주며 반복한다.
		
	});
	
	$(selector).each(function(index, item){
		
		// object에 배열을 넣으면 index는 인덱스를, item은 배열값을 보여주며 반복한다.
		// object에 객체를 넣으면 index는 키를, item은 값을 보여주며 반복한다.

	}) */
	
	var count;
	
	// .entirecate 자손의 .container 자손의 table 자손의 tr 자손의 td:nth-child(2)는 1개가 아니니까 배열로 나타나겠지?
	$(".entirecate .container table tr td:nth-child(2)").each(function() {
		  console.log($(this).html()); // .html 안붙이면 객체 째로 보여줌.
		  // .html() -> 안의 내용을 그대로 보여준다.
		  // .html(12345) -> 안의 내용을 12345로 바꾼 다음 보여준다.
		  
		  if($(this).html() == $(".delcate").val()) {
			  
				$("#delform").submit();
			 	 
				alert("삭제가 완료되었습니다.")
				
				$(".delcate").val("");
				$(".delcate").focus();
			  
				opener.location.reload(); // 부모창 새로고침
			 	 
				count = 1;
			 	 
		  }
		  
	});
	
	if(count != 1) {
		alert("해당하는 카테고리가 없습니다.")
		$(".delcate").focus();
		return false;	
	}
	
	$.ajax({
		type: "get"
		, url: "./managecate"
		, data: {
			n1 : ${roomInfo.roomNo }
		}
		, dataType: "html"
		, success: function( res ) {
			console.log("AJAX 성공")
			$(".rightbox").html( res )
		}
		, error: function() {
			console.log("AJAX 실패")
		}
	})
	
}
</script>

<style type="text/css">

th {
	text-align: center;
	border-bottom: 1px solid #C7D1CA;
	 border-bottom-width: thick;
}

td {
	text-align: center;
	border-bottom: 1px solid #C7D1CA;
}

</style>

<div class="entirecate">

<div class="container" style="height: 450px;">

<h1>${roomInfo.roomName } 카테고리</h1>
<hr>
<h5>카테고리는 모임당 최대 10개까지 추가할 수 있습니다.</h5>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 20%;">카테고리 번호</th>
		<th style="width: 60%;">카테고리 제목</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${categoryList }" var="data">
	<tr>
		<td>${data.diaryCateNo }</td>
		<td>${data.diaryCateName }</td>
<%-- 		<td>${board.hit }</td>
		<td><fmt:formatDate value="${board.writeDate }" pattern="yy-MM-dd HH:mm:ss"/></td> --%>
	</tr>
</c:forEach>
</tbody>
</table>

<br>

</div><!-- .container -->

<div>
<form action="./crecate" method="post" target="iframe1" id="creform">
	카테고리 생성 : <input type="text" name="crecate" class="crecate">
	<!-- <input type="button" name="crebutton" value="생성" id="crebutton"> -->
	<input style="display: none;" type="text" name="roomNo" value="${roomInfo.roomNo }">
	<input type="button" value="생성" onclick="crecheck()">
	<iframe id="iframe1" name="iframe1" style="display:none"></iframe> 
</form>

<form action="./delcate" method="post" target="iframe2" id="delform">
	카테고리 삭제 : <input type="text" name="delcate" class="delcate">
	<!-- <input type="button" name="delbutton" value="삭제" id="delbutton"> -->
	<input style="display: none;" type="text" name="roomNo" value="${roomInfo.roomNo }">
	<input type="button" value="삭제" onclick="delcheck()">
	<iframe id="iframe2" name="iframe2" style="display:none"></iframe>
</form>
</div>

<!-- <button id="btnWrite" class="btn btn-primary pull-left">글쓰기</button> -->
<%-- <span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div> --%>

<%-- <c:import url="/WEB-INF/views/layout/paging.jsp" /> --%>

<%-- <c:import url="../layout/footer.jsp" /> --%>

</div>