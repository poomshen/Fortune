<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="scurity" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 ${sessionScope.info.user_id} 님 안녕 하세요\^0^/
 <br>
 <scurity:authentication property="name" var="LoginUser"/>
 <scurity:authentication property="authorities" var="LoginUser2"/>
 ${LoginUser}아아아아아아아아
 ${LoginUser2}아아아아아아아아
 
 ${pageContext.request.userPrincipal.name}
 부서번호 : ${sessionScope.info.dept_no}
 직함번호 : ${sessionScope.info.position_no}
 팀번호    : ${sessionScope.info.team_no}
 
</body>
</html>