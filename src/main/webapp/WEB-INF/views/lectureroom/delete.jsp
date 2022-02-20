<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html><head><title>삭제</title></head>
<body>
	<form name="deleteForm"
		action="<c:url value="/lectureroom/delete" />" method="POST">
		<input size="1" name="lectureroomId" value="${lectureroomId}"/>
		번 글을 삭제하시겠습니까?<br>
		비밀번호<input name="pwd" />
		<input type="submit" value="삭제">
		<a href="<c:url value="/lectureroom/read/${lectureroomId}" />">취소</a>
	</form>
	<div>${msg}</div>
</body>



</html>
