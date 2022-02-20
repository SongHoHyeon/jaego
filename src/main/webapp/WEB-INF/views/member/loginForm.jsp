<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/layout/header.jsp"%>


<body>
<br><hr>

	<div class="title"><h1><strong>로그인</strong></h1></div>
		<form:form commandName="loginDto" method="POST">	<!-- 로그인시 무조건 메인화면으로??! 이전페이지로 돌아가는게 좋을듯 --> 
			${msg2}
			<div class="login">
				<form:label path="memberEmail" class="form-label">이메일</form:label>
				<form:input path="memberEmail" class="form-control"/><form:errors path="memberEmail"/>
				
				
				<!-- 이메일 <input name="memberEmail" id="memberEmail" type="text" placeholder="이메일">  -->
				<form:label path="memberPassword" class="form-label">비밀번호</form:label>
				<form:password path="memberPassword" class="form-control"/><form:errors path="memberPassword"/>
				
				<input type="submit" value="로그인" class="btn btn-primary">
				
<!-- 			
				<div class="naverLogin">
					<h3><button id="naverLogin"><strong>네이버 로그인</strong></button></h3>
				</div> -->
				
				<div class="find">
					<input type="button" value="이메일 찾기" class="btn btn-primary">
					<input type="button" value="비밀번호 찾기" class="btn btn-primary">
					<input type="button" value="회원가입" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/register'">
				</div>
			
			</div>
		</form:form>
			
</body>



<%@ include file="/resources/layout/footer.jsp"%>		
</html>