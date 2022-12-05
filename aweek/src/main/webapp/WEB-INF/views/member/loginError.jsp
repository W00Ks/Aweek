<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- SweetAlert2 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>

<!-- 로그인 상태에서 로그인 페이지를 다시 접속했을 경우 띄우는 알럿 -->
<script type="text/javascript">
$(document).ready(function() {
	swal("이미 로그인 상태입니다.", "", "error").then(function() {
		history.go(-1);
	});
});
</script>