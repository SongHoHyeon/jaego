<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>수정</title>
</head>
<body>
	<form:form commandName="lectureroomDto" method="POST">
	<table border="1">
		<tr>
			<th><form:label path="lectureroomTitle">제목</form:label></th>
			<td><form:input path="lectureroomTitle" />
			<form:errors path="lectureroomTitle" /></td>
		</tr>
		<tr>
			<th><form:label path="lectureroomContent">내용</form:label></th>
			<td><form:input path="lectureroomContent" />
			<form:errors path="lectureroomContent" /></td>
		</tr>
		<tr>
			<th><form:label path="memberId">작성자</form:label></th>
			<td><form:input path="memberId" />
			<form:errors path="memberId" /></td>
		</tr>
		<tr>
		<th><form:label path="lectureroomPassword">비밀번호</form:label></th>
			<td><input type="password" id="pwd" name="pwd" />${msg}</td>
		</tr>
		
		
		
	</table>
	<div>
		<input type="submit" value="등록">
		<a href="<c:url value="/lectureroom/list" />">목록</a>
	</div>
	
</form:form>	
</body>




</html>
