<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">

$(document).ready(function(){
	
	function Checkform() {

	    if( frm.name.value == "" ) {
	    
	        frm.name.focus();
	        alert("성명을 입력해 주십시오.");
	        
	        return false;
	        
	    }
	    
	}
	
});

</script>    
    

<form name="frm" method="post" action="UserServlet" onSubmit="return Checkform()">

    성명 : <input type="text" name="name">
    
    <button>전송</button>
    
</form>