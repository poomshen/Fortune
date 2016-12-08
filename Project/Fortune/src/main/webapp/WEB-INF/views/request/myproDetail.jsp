<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <td class="title">예상수익</td>
    <td class="tg-baqh">${mylist.collabo_sal}</td>
    <td class="title">프로젝트 기간</td>
    <td class="tg-baqh">${mylist.collabo_start} - ${mylist.collabo_end}</td>

  </tr>
  <tr>
    <td class="title">수신자</td>
    <td class="tg-baqh">${list.collabo_req_ID}</td>
    <td class="title">첨부파일</td>
    <td class="tg-baqh"><a class="w3-small" href="download.htm?p=upload&f=${list.collabo_req_filesrc}">${list.collabo_req_filesrc}</a></td>

  </tr>
</table>