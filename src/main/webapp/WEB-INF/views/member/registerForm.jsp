<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/layout/header.jsp"%>
<script>
function check(){
    var email1=$("#email1").val();
    var email2=$("#email2").val();
    if(email1==''){
   	 alert("ID를 입력하세요");
   	 return;
    }
    $.ajax({
       type:"post",
       async:false,  
       url:"${contextPath}/Jaego/check.do",
       dataType:"text",
       data: {email1:email1,
    	   	email2:email2
       },
       success:function (data,textStatus){
          if(data=='false'){
       	    alert("사용할 수 있는 ID입니다.");
       	    $('#duplicateCheck').prop("disabled", true);
          }else{
        	  alert("존재하는 이메일 입니다.");
          }
       },
       error:function(data,textStatus){
          alert("에러가 발생했습니다.");
       },
       complete:function(data,textStatus){
       }
    });  
 }	

</script>

<body>
	
	<div class="container mt-3">	
		<div class="context">
			<h1>회원가입</h1>
			<hr>
<!-- 		<div class="naverLogin">
			<a href="#" class="btn btn-block btn-social btn-naver btn-flat">
				<i class="fa fa-naver"></i> 네이버로 회원가입</a>
			<h3><button id="naverLogin">네이버 회원가입</button></h3>
		</div> -->
		
		
		<form:form commandName="memberDto" method="POST">
		<div class="mb-3 mt-3">
		<h3><strong>회원 정보 입력</strong></h3>
		
			<div class="register">
					
					<form:label path="memberName" class="form-label">이름</form:label><form:errors class="mx-3" path="memberName" />
					<form:input path="memberName" class="form-control" style="width:20%;"/>
					
					
					<label class="mt-3">이메일 주소</label>	<button id="duplicateCheck" class ="btn btn-outline-primary m-2" type="button" onClick="check()">중복확인</button>
					<form:errors path="memberEmail1"/>
					
					 <div class="row mt-1">
						 <div class="col-md-3 mb-3">
						<form:input path="memberEmail1" id="email1" class="form-control"/>
						</div>
						<div class="col-md-4 ">
							<div class="input-group mb-3">	
							<span class="input-group-text">@</span>
							<form:select path="memberEmail2" class="form-select" id="email2">
								<form:option value="naver.com" label="naver.com"/>
								<form:option value="gmail.com" label="gmail.com"/>
								<form:option value="hanmail.net" label="hanmail.net"/>
								<form:option value="nate.com" label="nate.com"/>
								<form:option value="hotmail.com" label="hotmail.com"/>
							</form:select>
						</div>
						</div>
					</div>							

					<form:label path="memberPassword" class="form-label">비밀번호 입력</form:label>		<form:errors class="mx-3" path="memberPassword"/>
					
					<form:input path="memberPassword" type="password" class="form-control"/>
					
					<label class="form-label mt-3">비밀번호 확인</label>
					<input name="confirmPassword" type="password" class="form-control"> <!-- 비밀번호 확인 ==> AJAX -->
				
				
					<label class="mt-3">연락처</label>
					<div class="row mt-1">
							 <div class="col-md-2 mb-3">
							<form:select path="memberPhone1" class="form-select">	
								<form:option value="010" label="010"/>
								<form:option value="011" label="011"/>
								<form:option value="016" label="016"/>
								<form:option value="017" label="017"/>
								<form:option value="016" label="018"/>
								<form:option value="017" label="019"/>
							</form:select>
							</div>
							<div class="col-md-2 mb-3">
								<div class="input-group">	
								<span  class="input-group-text">-</span>
								<form:input path="memberPhone2" maxlength="4" class="form-control"/>
								<form:errors path="memberPhone2"/>
								</div>
							</div>
							<div class="col-md-2 mb-3">
								<div class="input-group">	
								<span  class="input-group-text">-</span>	
								<form:input path="memberPhone3"  maxlength="4" class="form-control"/>
								<form:errors path="memberPhone3"/>		
								</div>
							</div>
						</div>
					<form:label path="memberGender" class="form-check-label">성별</form:label><form:errors path="memberGender"/>
						<form:select path="memberGender" class="form-select"  style="width:20%;">	
							<form:option value="남" label="남자"/>
							<form:option value="여" label="여자"/>
					</form:select>
				
		
					<form:label path="memberAge" class="form-check-label mt-3">나이</form:label>
						<form:select path="memberAge" class="form-select"  style="width:30%;">	<form:errors path="memberAge"/>
						
							<form:option value="1" label="20세 미만"/>
							<form:option value="2" label="20세 이상 25세 미만"/>
							<form:option value="3" label="25세 이상 30세 미만"/>
							<form:option value="4" label="30세 이상 35세 미만"/>
							<form:option value="5" label="35세 이상 40세 미만"/>
							<form:option value="6" label="40세 이상"/>
						</form:select>
		

			</div>
		
		</div> <!-- 회원정보 입력 끝 태그 -->
		
<!-- 		<p class="check"><span>이용약관에 동의하십니까?</span></p>
			<div class="form-check">
			
			<input name="agreeCheck" value="1" type="checkbox" class="form-check-input" required/>
			<label class="form-check-label">동의함</label> 
				
			
			</div>

			
			<div class="agree"><h3><strong>[필수] 개인정보 수집 및 이용 동의 </strong></h3>
				<div class="content">
		        	<p>1. 개인정보의 수집 및 이용목적</p><br><br>
		            <p>회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.</p><p>ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송</p><p>ο 회원 관리</p><p>회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인 , 고지사항 전달</p><p>ο 마케팅 및 광고에 활용</p><p>접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계</p><p><br></p>
		            <p>2. 수집하는 개인정보 항목</p><p><span style="font-size: 9pt;">회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.</span></p><p>ο 수집항목 : 이름 , 생년월일&nbsp; , 로그인ID , 비밀번호 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일,<span style="font-size: 9pt;">14세미만 가입자의 경우 법정대리인의 정보</span><span style="font-size: 9pt;">, 서비스 이용기록 , 접속 로그 , 접속 IP 정보 , 결제기록</span></p><p>ο 개인정보 수집방법 : 홈페이지(회원가입) , 서면양식</p><p><br></p><p>3. 개인정보의 보유 및 이용기간</p><p>회사는 고객의 개인정보는 회원탈퇴 등 수집 및 이용목적이 달성되거나 동의철회 요청이 있는 경우 지체없이 파기됩니다.</p><p><br></p><p class="0" style="line-height: 20.4px;"><font face="함초롬바탕"><span style="font-family: 돋움, dotum;"> 단,「전자상거래 등에서의 소비자보호에 관한 법률」 등 관련법령의 규정에 의하여 다음과 같이 거래 관련 권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 그 기간동안 보유합니다.</span></font></p><p class="0" style="line-height: 20.4px;"><br></p><p>가. 회사 내부 방침에 의한 정보 보유 사유</p><p>o 부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : 5년</p><p>나. 관련 법령에 의한 정보보유 사유</p><p>o 계약 또는 청약철회 등에 관한 기록</p><p>-보존이유 : 전자상거래등에서의소비자보호에관한법률</p><p>-보존기간 : 5년</p><p>o 대금 결제 및 재화 등의 공급에 관한 기록</p><p>-보존이유: 전자상거래등에서의소비자보호에관한법률</p><p>-보존기간 : 5년</p><p>o 소비자 불만 또는 분쟁처리에 관한 기록</p><p>-보존이유 : 전자상거래등에서의소비자보호에관한법률</p><p>-보존기간 : 3년</p><p>o 로그 기록</p><p>-보존이유: 통신비밀보호법</p><p>-보존기간 : 3개월</p><p><br></p><p>※ 동의를 거부할 수 있으나 거부시 회원 가입이 불가능합니다.</p><p><br></p><p><br></p><p><br></p>
		            <p># 개인정보의 위탁 처리<br>“회사”는 서비스 향상을 위해 관계법령에 따라 회원의 동의를 얻거나 관련 사항을 공개 또는 고지 후 회원의 개인정보를 외부에 위탁하여 처리하고 있습니다. “회사”의 개인정보처리 수탁자와 그 업무의 내용은 다음과 같습니다.</p><p><br>- 수탁자 : (주)루나소프트<br>- 위탁 업무 내용 : 카카오톡 알림톡 발송 및 톡 기반 상담 서비스 제공<br>- 수집항목 : 휴대폰번호, 주문정보, 배송정보, 생년월일 <br>- 보유기간 : 회원 탈퇴 시 혹은 법정 보유기간</p>		
		        </div>
		   		<p class="check"><span>개인정보 수집 및 이용에 동의하십니까?</span></p>
		   		
		   		<input name="agreeCheck" value="1" type="checkbox" class="form-check-input" required/>
		   		<label class="form-check-label">동의함</label>
	   		</div> -->
	   		<!-- 약관 끝 태그 -->
	   	
	   		<br><hr>
	   	<div class="submit">
	   		
	   		<input type="submit" value="회원가입" class="btn btn-primary">
	   		<input type="reset" value="리셋" class="btn btn-warning mx-2">
	   		<input type="button" value="취소" class="btn btn-danger mx-2" onclick="history.back()">													
	   	</div>
		</form:form>
		
		
	</div>
	</div>

	
</body>

<%@ include file="/resources/layout/footer.jsp"%>
</html>