<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/layout/header.jsp"%>

<section>
    <h1>결제 성공</h1>
    <h3>강의명 : ${viewInfo.viewLecture.lectureTitle}</h3>
    <h3>강의가격 : ${viewInfo.viewLecture.lecturePrice}</h3>
    <h3>주문번호 : ${orderId}</h3>
    <br><br><hr>
    <h4> 강의 정보 확인 링크 만드셈</h4>
    <h4> 강사와 소통하는 그 덕년님이 만든 방 링크 가기 만드셈</h4>
 
</section>




<%@ include file="/resources/layout/footer.jsp"%>
</html>