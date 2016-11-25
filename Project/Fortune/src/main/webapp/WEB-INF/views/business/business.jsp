<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>같은 부서인 사람들 아이디 뽑기</h3>
<!-- <input type="button" onclick="deptshow()" value="같은 부서원 정보 뿌리기"> -->
<h2>deptno 확인 : ${sessionScope.info.dept_no}</h2>
<c:forEach var="i" items="${deptlist}">
	<c:out value="${i.user_id}"></c:out><br>
</c:forEach>

<!-- 
<script type="text/javascript">
function deptshow(){
	
	var deptno = ${sessionScope.info.dept_no};

	$.ajax({
		type:"get",
		url:"deptinfo.ajax",
		data:{"dept_no": deptno },
		success:function(data){
			if(data != null){
				
				console.log(data.length);
				 for(var i=0; i<data.length; i++){
					console.log(data[i].user_id);
				} 
			}
			else{
				alert('실패함');
			}
		},
		error:function(){
			alert('이건 에러');
		}
	});
}
	
</script> -->
</body>
</html>