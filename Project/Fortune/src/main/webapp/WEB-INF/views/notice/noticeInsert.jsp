<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 글쓰기</title>
</head>
<body>
	<form action="" method="post" enctype="multipart/form-data">
		<table width="500" cellpadding="0" cellspacing="0" border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="notice_title" id="notice_title" size="100"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="notice_text" id="notice_text" size="300"></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="file" id="file" ></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="저장">
				<a href="notice/noticeList.htm">공지사항 목록보기</a></td>
			</tr>
		</table>
	</form>
</body>
</html>