<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Error 500</title>
<style type="text/css">
#content {
	margin-top: 50px;
	text-align: center;
}

h1 {
	color: gray;
	margin: auto;
}
</style>
</head>
<body>
	<div id="content">
		<img src="${pageContext.request.contextPath}/images/fix.jpg" alt="공사중"><br />
		<h1>Error 500 : 찾으시는 페이지는 존재하지 않습니다.</h1>
	</div>
</body>
</html>