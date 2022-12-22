<%@page import="diary.dto.DiaryPaging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 모델값 전달받기 --%> <!-- model.addAttribute로 추가한것도 똑같이 적용되네? -->
<%	DiaryPaging paging = (DiaryPaging) request.getAttribute("paging"); %>    

<style type="text/css">
.pagingblock {
	display: flex;
	width: 25px;
	height: 25px;
	border: 1px solid #C7D1CA;
	justify-content: center;
	align-items: center;
}
</style>
    
<div class="text-center" style="display: flex; justify-content: center;">
	
		<div class="pagingblock">
		<%-- 첫 페이지로 이동 --%>
		<%-- <%	if( paging.getCurPage() != 1) { %> --%>
		<a href="./mydiary">&#171;</a>
		<%-- <%	} %> --%>
		</div>
	
		<div class="pagingblock">
		<%-- 이전 페이지로 이동 --%>
		<%-- <%	if( paging.getCurPage() != 1) { %> --%>
		<a href="./mydiary?curPage=<%=paging.getCurPage() - 1 %>">&lt;</a>
		<%-- <%	} %> --%>
		</div>
		
	
		<%-- 페이지 번호 리스트 --%>
		<%	for(int i=paging.getStartPage(); i<=paging.getEndPage(); i++) { %>
			<%		if( i == paging.getCurPage() ) { %>
			<div class="pagingblock" style="background-color: var(--baby-pink);">
			<a href="./mydiary?curPage=<%=i %>"><%=i %></a>
			</div>
			<%		} else { %>
			<div class="pagingblock">
			<a href="./mydiary?curPage=<%=i %>"><%=i %></a>
			</div>
			<%		} %>
		<%	} %>

		<div class="pagingblock">
		<%-- 다음 페이지로 이동 --%>
		<%-- <%	if( paging.getCurPage() != paging.getTotalPage() ) { %> --%>
		<a href="./mydiary?curPage=<%=paging.getCurPage() + 1 %>">&gt;</a>
		<%-- <%	} %> --%>
		</div>
		
		<div class="pagingblock">
		<%-- 마지막 페이지로 이동 --%>
		<%-- <%	if( paging.getCurPage() != paging.getTotalPage() ) { %> --%>
		<a href="./mydiary?curPage=<%=paging.getTotalPage() %>">&#187;</a>
		<%-- <%	} %> --%>
		</div>
		
</div>