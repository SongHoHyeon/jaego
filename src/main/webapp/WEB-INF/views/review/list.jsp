<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/resources/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
<style type="text/css">
#content {
 display: block;
  width: 250px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  margin: 0;
}
.pagination li {
    margin-right: 30px;
}
table{
	margin-bottom: 20px !important;
}
.pagination {
    display: flex;
    padding-left: 0;
    list-style: none;
    flex-wrap: nowrap;
    justify-content: center;
}
.pagination .active a{
	color: red;
}
</style>
</head>
<body>
	<table border="1" style="width: 700px; margin:auto;">
		
		
			<thead>
				<tr>
					<td colspan="5">전체 리뷰 : ${totCount} 개</td>
				</tr>
			</thead>
			
		<tbody>	
		<tr style="text-align: center;">
			<th>번호 </th>
			<th>별점</th>
			<th>내용</th>
			<th>작성날짜</th>
		</tr>
		<c:forEach var="review" items="${reviewList}" varStatus="loop">
		<tr style="text-align: center;">
			
			<td>${review.reviewId }</td>
			<td style = "color : red;">
			<c:choose>
			<c:when test = "${review.reviewScore eq 1 }">
			★☆☆☆☆
			</c:when>
			<c:when test = "${review.reviewScore eq 2 }">
			★★☆☆☆
			</c:when>
			<c:when test = "${review.reviewScore eq 3 }">
			★★★☆☆
			</c:when>
			<c:when test = "${review.reviewScore eq 4 }">
			★★★★☆
			</c:when>
			<c:otherwise>
			★★★★★
			</c:otherwise>
			</c:choose>
			</td>
			<td id="content">
			
			<a href="<c:url value="/review/read/${review.reviewId}" />">
							${review.reviewContent}
							
							</a>
			<td>
			<fmt:formatDate pattern = "yyyy/MM/dd" value = "${review.reviewRegdate}"/>
			</td>
			
		</tr>
		</c:forEach>
		</tbody>
	
	</table>
			<tfoot>
				<tr>
					<td colspan="5" style="text-align: center; padding-top: 30px">${pagination}</td>
				</tr>
			</tfoot>
	<br>
	<a type="button" style='float:right;'  href ="<c:url value="/review/write"/>">리뷰 등록</a>
	<br><br><br>
</body>
			
<%@ include file="/resources/layout/footer.jsp"%>
</html>