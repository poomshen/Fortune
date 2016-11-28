<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
function refuse() {
		if($('#collabo_req_text').val() == "") {
			alert("거절 사유를 입력하세요. ");
			$('#collabo_req_text').focus();
			return false;
		}else{
				alert("완료");
				refuseform.submit(); 
				return true;
		}
}
		
		</script>
<title>Insert title here</title>
</head>
<body>

	<div>
		<dl>
			<dt>프로젝트 제목</dt>
			<dd>${list.collabo_req_title}</dd>
		</dl>
		<c:choose>
		<c:when test="${list.collabo_req_state != '거절'}">
		<dl>
			<dt>프로젝트 내용</dt>
			<dd>${list.collabo_req_text}</dd>
		</dl>
		</c:when>
		<c:otherwise>
		<dl>
			<dt>거절사유 내용</dt>
			<dd>${list.collabo_req_text}</dd>
		</dl>
		</c:otherwise>
		</c:choose>
		<dl>
			<dt>프로젝트 작성자</dt>
			<dd>${list.user_ID}</dd>
		</dl>
		<dl>
			<dt>프로젝트 전송받을 사람</dt>
			<dd>${list.collabo_req_ID}</dd>
		</dl>
		<dl>
			<dt>프로젝트 작성일</dt>
			<dd>${list.collabo_req_date}</dd>
		</dl>
		<dl>
			<dt>프로젝트 진행상태</dt>
			<dd>${list.collabo_req_state}</dd>
		</dl>
		<dl>
			<dt>프로젝트 첨부파일</dt>
			<dd>
				<a href="download.htm?p=upload&f=${list.collabo_req_filesrc}">${list.collabo_req_filesrc}</a>
			</dd>
		</dl>
	</div>
	<p>
		<a href="requestList.htm">목록</a>
	</p>


	<c:choose>
		<c:when test="${list.collabo_req_state == '수락'}">
			<p>수락완료</p>
		</c:when>

		<c:when test="${list.collabo_req_state == '거절'}"></c:when>

		<c:otherwise>
			<c:if test="${sessionScope.info.user_id == list.collabo_req_ID}">
				<p>
					<a href="accept.htm?collabo_req_index=${list.collabo_req_index}"
						name="collabo_req_state">수락</a>
				</p>
				<p>
					<a data-toggle="modal" data-target="#myModal2"
						class="btn btn-default btn-md">거절</a>
				</p>
			</c:if>
		</c:otherwise>

	</c:choose>


	<div class="container">
		<!-- Modal -->
		<div class="modal fade" id="myModal2" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">협업모음 프로젝트</h4>

					</div>
					<div class="modal-body">
						<div>
							<!-- CSS 구성  -->
						
							<form action="refuse.htm" method="get" name="refuseform">
							<div class="col-sm-6"></div>
							<br>
							<div>
								<input type="hidden" name="collabo_req_index"  value="${list.collabo_req_index}">
								<dl>
									<dt>거절 사유</dt>
									<dd>
										<textarea class="form-control" name="collabo_req_text" id="collabo_req_text" rows="3" cols="20"></textarea>
									</dd>
								</dl>
							<br/>
							<div class="col-sm-2"></div>
							<div class="col-sm-10">
								
							</div>
							</div>
							
						</div>
							
						<br><br>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<input type="button"  class="btn btn-default" value="거절 완료" onclick="refuse()">
					</div>
					</form>
				</div>

			</div>
		</div>

	</div>

	<%-- <p><a href="proEdit.htm?collabo_req_index=${list.collabo_req_index}">수정</a></p> --%>


</body>
</html>