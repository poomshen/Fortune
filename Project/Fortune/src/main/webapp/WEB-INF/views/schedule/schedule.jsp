<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>


$(document).ready(function() {

//화면 로드시 일정을 DB에서 불러오는 코드 
 	$.ajax({
		url : 'calendarload.ajax',
		type : 'post',
		data : 'collabo_no=${collabo_no}',
		success : function(data) {
			console.log(data)
			$.each(data.schedulelist, function(index, obj) {
				var item = {
						id : obj.schedule_no,
						title : obj.work_title,
						start : obj.schedule_start,
						end: obj.schedule_end
				};
				array.push(item);
				
		        content += '<tr id=tr' +obj.schedule_no+ '><td>**일정(미구현)</td><td>' + obj.work_title;
		        content += '</td><td><a';
		        content += ' onclick="detail(' + obj.schedule_no;
		        content += ",'" + obj.work_title + "','" + obj.work_text +"','" + obj.schedule_start +"','" + obj.schedule_end;
		        content += "','" + obj.users + "'";
		        content += ')" >상세보기</a></td></tr>';
		        
			});
	        $('#content').html(content)
	        //fullcalendar 불러오는 함수
			loadCalendar();
		}
	});
});

function detail(id, title, text, start, end, userids){
	//온클릭 함수에 가져올 데이터들
	$('#content').empty();
	$('#content_detail').css("display", "block");
 	$('#detail_id').val(id);
	$('#detail_title').val(title);
	$('#detail_text').val(text);
	$('#detail_start').val(start);
	$('#detail_end').val(end);
	
	//상세보기 내용에 참가자 인원 뿌려주는 코드
	var userid = userids.split("/");
	var contentck = "";
	
	for(var i =0; i<userid.length-1; i++){
		contentck += "<input type='checkbox' name='userchk' value='" +userid[i]+ "'>" + userid[i] + " &nbsp;&nbsp;";
	}
	
 	$('#cbdiv').html(contentck)
 	
 	
 	//상세보기 내용에 comment 뿌려주는 내용
	var comment_text = "";
 	$.ajax({
		url : 'select_comment.ajax',
		type : 'post',
		data : 'schedule_no='+ id,
		success : function(data) {
			console.log(data)
 			$.each(data, function(index, obj) {
 				if(index%2==0){
 					comment_text += '<li class="left clearfix"><span class="chat-img pull-left">';
 					comment_text += '<input type="button" value="수정"><br><button type="button" value="'+obj.work_comment_no;
 					comment_text += '">삭제</span><div class="chat-body clearfix"><div class="header">';
 					comment_text += '<strong class="primary-font">아이디 : '+obj.user_id+'</strong><small class="pull-right text-muted">'
 					comment_text += '<i class="fa fa-clock-o fa-fw"></i>등록시간 : '+obj.work_comment_date+'</small></div><p>';
 					comment_text += obj.work_comment_text+'</p></div></li>';
 				}else{
 					comment_text += '<li class="right clearfix"><span class="chat-img pull-right">';
 					comment_text += '<input type="button" value="수정"><br><button type="button" value="'+obj.work_comment_no;
 					comment_text += '">삭제</span><div class="chat-body clearfix"><div class="header">';
 					comment_text += '<small class=" text-muted"><i class="fa fa-clock-o fa-fw"></i>등록시간 : '+obj.work_comment_date;
 					comment_text += '</small> <strong class="pull-right primary-font">아이디 : '+obj.user_id+'</strong></div><p>';
 					comment_text += obj.work_comment_text+'</p></div></li>'
 				}
 				$('#comment_text').html(comment_text);
			});
		}
	});
 	
 	
}

//수정하기 버튼 클릭시 readonly속성 없애줌
function work_update(){
	$('#update_btn').attr('type','hidden');
	$('#updateok_btn').attr('type','button');
	document.getElementById("detail_title").readOnly = false;
	document.getElementById("detail_text").readOnly = false;
}

//저장하기 버튼 클릭시 DB에 update작업
function work_updateok(){
	$('#update_btn').attr('type','button');
	$('#updateok_btn').attr('type','hidden');
	document.getElementById("detail_title").readOnly = true;
	document.getElementById("detail_text").readOnly = true;
	
}

//댓글 등록 버튼 클릭시 insert 작업
function insert_comment(){
 	$.ajax({
		url : 'insert_comment.ajax',
		type : 'post',
		data : {"schedule_no" : $('#detail_id').val(),
				"work_comment_text" : $('#comment_textarea').val()
				},
		success : function(data) {
			console.log('comment 등록 성공')
		}
	});
}


</script>


<style>
 body {
	margin: 0px 0px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}
 
#calendar {
	width: 100%;
	height: 100%;
	margin: 0 auto;
}

div{
	padding-left: 0px;
	padding-right: 5px;
}

input:read-only {
    background-color: rgb(234,234,234);
}
textarea:read-only{
	background-color: rgb(234,234,234);
}

.nav-tabs {
    margin-bottom: 15px;
}
.sign-with {
    margin-top: 25px;
    padding: 20px;
}
div#OR {
    height: 30px;
    width: 30px;
    border-radius: 50%;
    font-weight: bold;
    line-height: 28px;
    text-align: center;
    font-size: 12px;
    float: right;
    position: absolute;
    right: -16px;
    top: 40%;
    z-index: 1;
    background: #DFDFDF;
}

.dropdown_s {
  position: absolute;
  top:50%;
  transform: translateY(-50%);
}

a {
  color: #ddd;
}

.dropdown_s dd,
.dropdown_s dt {
  margin: 0px;
  padding: 0px;
}

.dropdown_s ul {
  margin: -1px 0 0 0;
}

.dropdown_s dd {
  position: relative;
}

.dropdown_s a,
.dropdown_s a:visited {
  color: #fff;
  text-decoration: none;
  outline: none;
  font-size: 12px;
}

.dropdown_s dt a {
  background-color: #ddd;
  display: block;
  padding: 8px 20px 5px 10px;
  min-height: 25px;
  line-height: 24px;
  overflow: hidden;
  border: 0;
  width: 272px;
}

.dropdown_s dt a span,
.multiSel span {
  cursor: pointer;
  display: inline-block;
  padding: 0 3px 2px 0;
}

.dropdown_s dd ul {
  background-color: #ddd;
  border: 0;
  color: #fff;
  display: none;
  left: 0px;
  padding: 2px 15px 2px 5px;
  position: absolute;
  top: 2px;
  width: 280px;
  list-style: none;
  height: 100px;
  overflow: auto;
}

.dropdown_s span.value {
  display: none;
}

.dropdown_s dd ul li a {
  padding: 5px;
  display: block;
}

.dropdown_s dd ul li a:hover {
  background-color: #fff;
}



</style>
</head>
<body>
<input type="hidden" id="collabo_no" value="${collabo_no}">

	<br>
	<br>
	<div class="container-fluid">
		<div class="row" style="padding-right: 0px;">

			<!-- calendar 보여 주는 div 영역 -->
			<div class="col-sm-7" style="padding-left: 0px;">
					<div id='calendar'></div>
			</div>



<input type="hidden" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" id="modal_btn" >

<input type="hidden" class="btn btn-primary" id="modal_btn" data-toggle="modal" data-target="#myModal">
    Login modal</button>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg" style="height:500px">
        <div class="modal-content"style="height:500px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;</button>
                <h4 class="modal-title" id="myModalLabel">
                    일반/회의 업무 등록</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-8" style="border-right: 1px dotted #C2C2C2;padding-right: 30px;">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#Login" data-toggle="tab">일반 업무</a></li>
                            <li><a href="#Registration" data-toggle="tab">회의 업무</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane active" id="Login">
                                <form role="form" class="form-horizontal">
                                <div class="form-group">
                                    <label for="title" class="col-sm-2 control-label">일정제목</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="modal_title" placeholder="제목.." />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="content" class="col-sm-2 control-label">내용</label>
                                    <div class="col-sm-10">
                                    <textarea rows="5" cols="30" class="form-control" id="modal_text" placeholder="내용.." ></textarea><br>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-10" style="margin-top:50px">
                                        <button type="submit" class="btn hvr-forward"">
                                            업무등록</button>
                                        
                                    </div>
                                </div>
                                </form>
                            </div>
                            <div class="tab-pane" id="Registration">
                             <form role="form" class="form-horizontal">
                                <div class="form-group">
                                    <label for="title" class="col-sm-2 control-label">일정제목</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="modal_title" placeholder="제목.." />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="content" class="col-sm-2 control-label">내용</label>
                                    <div class="col-sm-10">
                                    <textarea rows="5" cols="30" class="form-control" id="modal_text" placeholder="내용.." ></textarea><br>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-10" style="margin-top:50px">
                                        <button type="submit" class="btn btn-primary btn-sm">
                                            업무등록</button>
                                        
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                        <div id="OR" class="hidden-xs" style="color:#fff">
                              >></div>
                    </div>
                    <div class="col-md-4">
           						
							<dl class="dropdown_s" style="margin-top: 50px;margin-left: 5px;"> 
  
    <dt>
    <a href="#"style="height: 43px;padding-right: 0px;">
      <span class="hida" style="width: 253px;">참가자 선택<span style="margin-left:170px"><i class="fa fa-sort-desc" aria-hidden="true"></i></span></span>    
      <p class="multiSel"></p>  
    </a>
    </dt>
  
    <dd>
        <div class="mutliSelect">
            <ul style="display: block;padding-right: 0px;height: 204px;width: 272px;">
        		<c:forEach items="${team_id}" var="obj" varStatus="status">
					<li><input type="checkbox" value="${obj}" name='userchk'>${obj}</li>
				</c:forEach>
            </ul>
        </div>
    </dd>

</dl>
						
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


			<!-- 업우상세 보여주는 div 영역 -->
			<div class="col-sm-5" style="padding-right: 0px;">
				<div class="row" style="padding-right: 0px;">
					<label style="height: 32px; margin-top: 10px;"> &nbsp;&nbsp;&nbsp; 일반 / 회의 (선택 미구현)</label>
				</div>

				<div id="content_parent" style="overflow: scroll; width: 100%; height: 560px; overflow-x: hidden; padding-left: 0px; padding-right: 0px;">
					<div id="content" style="padding-right:0px;">
					</div>
					<div id="content_detail" style="display: none; padding-right:0px;">
						<input type="button" value="일정 수정하기" id="update_btn" onclick="work_update()">
						<input type="hidden" value="일정 저장하기" id="updateok_btn" class="btn-success" onclick="work_updateok()">
						<input type="button" value="일정 삭제하기" id="delete_btn"><br>
						<label>제목 : </label> <input type="text" id="detail_title" readonly="readonly"><br>
						<label>내용 : </label> <textarea rows="5" cols="50" id="detail_text" readonly="readonly"></textarea><br>
						<div id="cbdiv" style="padding-right:0px;">담당자 : </div>
							<hr>
							<input type="hidden" id="detail_id">
							<input type="hidden" id="detail_start">
							<input type="hidden" id="detail_end">
			
			<!-- comment 보여주는 div영역 -->
			<!-- panel-heading -->	
			<div class="chat-panel panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i> Comment
				</div>
				<!-- panel-body -->
				<div class="panel-body">
					<!-- comment_text 내용추가 하는 영역 -->
					<ul class="chat" id="comment_text">
					</ul>
				</div>
				<!-- panel-footer -->
				<div class="panel-footer">
					<div class="input-group row">
						<input type="text" placeholder="Type your message here..." id="comment_textarea">
						<input type="button" value="등록" onclick="insert_comment()">
					</div>
				</div>
			</div>
						
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>