<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>${lectureroomDto.lectureroomTitle}&nbsp내용</title>
<style type="text/css">
.pagination li{
	margin-right: 10px
} 
.pagination li.active a{
	color:red;
} 
  .pagination{
  	display:inline-flex;
    justify-content: center;
      list-style:none;
  }
  table{
  	margin-bottom: 50px;
  }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(document).ready(function(){
        
        //listReply(); // **댓글 목록 불러오기
        listReply2('${param.page}'); // ** json 리턴방식
        
        // ** 댓글 쓰기 버튼 클릭 이벤트 (ajax로 처리)
        $("#btnReply").click(function(){
            var replytext=$("#replytext").val();
            var replyer=$("#replyer").val();
            if(replytext==""){
            	alert("댓글을 입력해 주세요.");            	
            	$("#replytext").focus();
            	return;
            }
            if(replyer==""){
            	alert("작성자를 입력해 주세요.");
            	$("#replyer").focus();
            	return;
            }
            
            var param=$("#frm1").serialize();
            $.ajax({                
                type: "post",
                url: "${pageContext.request.contextPath}/reply/insert",
                data: param,
                success: function(res){
                	console.log(res);
                    alert("댓글이 등록되었습니다.");                    
                    listReply2(1);
                    $("#replytext").val("");
                    $("#replyer").val("");
                },
                error:function(error){
                	console.log("에러 :");
                	console.log(error);
                }
            });
        });
        
 

        
    });
    
    // Controller방식
    // **댓글 목록1
    function listReply(page){
        $.ajax({
            type: "get",
            url: "${pageContext.request.contextPath}/reply/list?lectureroomId=${lectureroomDto.lectureroomId}&page="+page,
            success: function(result){
            // responseText가 result에 저장됨.
                $("#listReply").html(result);
            }
        });
    }
    
    // RestController방식 (Json)
    // **댓글 목록2 (json)
    function listReply2(page){
    	console.log(page);
    	if(page==""){
    		page=1;
    	}
        $.ajax({
            type: "get",
            //contentType: "application/json", ==> 생략가능(RestController이기때문에 가능)
           					//	 http://localhost:8080/Jaego/reply/listJson/list?lectureroomId=257
			//http://localhost:8080/Jaego/reply/listJson?lectureroomId=257&page=2           							
            url: "${pageContext.request.contextPath}/reply/listJson?lectureroomId=${lectureroomDto.lectureroomId}&page="+page,
            success: function(result){

                //console.dir(result.totCount);
                var output = " <table border='1'>";
                	output += " <thead>";
                	output += " <tr>";
                	output += " 	<td>댓글수 : "+result.totCount+" 개</td>";
                	output += " 	</tr>";
                	output += " </thead>";
                	output += " <tbody>";
               
                for(var i in result.list){
                    output += "<tr>";
                    output += "<td style='width:500px;'>작성자: "+result.list[i].replyer;
                    output += "&nbsp;&nbsp;&nbsp;("+result.list[i].regdate+")<br><br>";
                    output += result.list[i].replytext+"<br></td>";
                    output += "<tr>";
                }
                output += " </tbody>";
                output += " <tfoot>";
                output += " <tr>";
                output += " <td colspan='5' style='text-align: center; padding-top: 30px'>"+result.pagination+"</td>";
                output += " </tr>";
                output += " </tfoot>";
                output += "</table>";
                $("#listReply").html(output);
            },error:function(error){
            	console.log("error");
            	console.log(error);
            }
        });
    }
    // **날짜 변환 함수 작성
    function changeDate(date){
        date = new Date(parseInt(date));
        year = date.getFullYear();
        month = date.getMonth();
        day = date.getDate();
        hour = date.getHours();
        minute = date.getMinutes();
        second = date.getSeconds();
        strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
        return strDate;
    }
    
</script>
</head>
<body>
	<table border="1">
		<tr>
			<th>제목</th>
			<td>${lectureroomDto.lectureroomTitle}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${lectureroomDto.lectureroomContent}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${lectureroomDto.memberId}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${lectureroomDto.lectureroomRegdate}</td>
		</tr>
		
		
		
	</table>
	
	<div>
		<a href="<c:url value="/lectureroom/edit/${lectureroomDto.lectureroomId}"/>">수정</a>
		<a href="<c:url value="/lectureroom/delete/${lectureroomDto.lectureroomId}"/>">삭제</a>
		<a href="<c:url value="/lectureroom/list" />">목록</a>
		<!--  <a href="<c:url value="/lectureroom/reply/${lectureroomDto.lectureroomId}"/>">답글</a>-->
	</div>
	<div>
	
<%-- 	<form:form commandName="lectureroomDto" method="POST">
		<table border="1">
			<tr>
				<th><form:label>댓글 작성자</form:label></th>
				<td><form:input type="text" />
			</tr>
		</table>
	</form:form>
		 --%>
		
	
	</div>
	
	
	<form id="frm1">
	<div style="width:650px; text-align: center;">
	        <br>

	        <textarea rows="5" cols="80" id="replytext" name="replytext" placeholder="댓글을 작성해주세요"></textarea>
	        <br>
	        <input type="number" name="replyer" id="replyer"  placeholder="작성자">
	        <input type="hidden" name="lectureroomId" value="${lectureroomDto.lectureroomId}" >
	        <br>
	        <button type="button" id="btnReply">댓글 작성</button>

   </div>
   </form>
	    <!-- **댓글 목록 출력할 위치 -->
   <div id="listReply"></div>	
		
</body>




</html>
