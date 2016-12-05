<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;width:100%;height:350px}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
.tg .tg-baqh{text-align:center;}
.tg .title{text-align:center;font-weight:900;}
</style>
<table class="tg">
  <tr>
    <th class="title">상태</th>
    <th class="tg-baqh">${list.collabo_req_state}</th>
    <th class="title">작성일</th>
    <th class="tg-baqh">${list.collabo_req_date}</th>
  
  </tr>
  <tr>
    <td class="title">제목</td>
    <td class="tg-baqh">${list.collabo_req_title}</td>
    <td class="title">작성자</td>
    <td class="tg-baqh">${list.user_ID}</td>
 
  </tr>
  <tr>
    <td class="title" rowspan="3"><br><br><br>내용</td>
    <td class="tg-baqh" colspan="3" rowspan="3">${list.collabo_req_text}</td>

  </tr>
  <tr>
  </tr>
  <tr>
   
  </tr>
  <tr>
    <td class="title">수신자</td>
    <td class="tg-baqh"></td>
    <td class="title">첨부파일</td>
    <td class="tg-baqh"><a href="download.htm?p=upload&f=${list.collabo_req_filesrc}">${list.collabo_req_filesrc}</a></td>

  </tr>
</table>


