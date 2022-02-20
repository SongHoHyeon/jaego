<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri ="http://www.springframework.org/tags/form" %>
<%@ include file="/resources/layout/header.jsp"%>


<body>
	<form:form commandName="lectureroomDto" method="POST">
				<h1>${lectureroom.lectureId}</h1>
				<h1>클래스룸 Notice</h1>
		
		<table border="1" style="width: 700px">
		<colgroup>
			<col>
			<col width="30%">
			<col>
			<col>
			<col>
		</colgroup>
		
			<thead>
				<tr>
					<td colspan="5">전체 게시글 : ${totCount} 개</td>
				</tr>
			</thead>
			<tbody>			
			<tr style="text-align: center;">
				<th>NO</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>첨부파일</th>
			</tr>
			<c:forEach var="lectureroom" items="${lectureroomList}" varStatus="loop">
		
			<tr style="text-align: center;">
					<td>${(totCount+1)-lectureroom.rn}</td>
					<td style="text-align: center;"><a href="<c:url value="/lectureroom/read/${lectureroom.lectureroomId}" />">
							${lectureroom.lectureroomTitle}</a></td>
					<td>${lectureroom.memberId}</td>
					<td>${lectureroom.lectureroomRegdate}</td>
					<td><a href="${pageContext.request.contextPath}/displayFile2?fileName=${lectureroom.lectureroomFname}&orignalName=${lectureroom.lectureroomFname}"  >${lectureroom.lectureroomFname}</a></td>
			</tr>
		
			</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5" style="text-align: center; padding-top: 30px">${pagination}</td>
				</tr>
			</tfoot>
		</table>
	
	<a href="<c:url value="/lectureroom/write"/>" class="btn btn-dark mr-3">글쓰기</a>
	<a href="<c:url value="/review/list/" />"  class="btn btn-dark mr-3">리뷰보기</a>

	
</form:form>
</body>

<%@ include file="/resources/layout/footer.jsp"%>

</html>
