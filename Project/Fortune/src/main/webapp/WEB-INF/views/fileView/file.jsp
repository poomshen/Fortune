<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- jQuery Form Plugin import -->
<script src="<%=request.getContextPath() %>/js/jquery.form.min.js"></script>
<!-- jQuery MultiFile Plugin import -->
<script src="<%=request.getContextPath() %>/js/jQuery.MultiFile.min.js"></script>

<script>
	$(function() {
		$('#upload_btn').click(function() {
			$('#multiform').ajaxForm({
				cache : false,
				dataType : "json",
				success : function(data, statusText) {
					console.log("success");
					console.log(data);
					output(data);
				},
				error : function(e) {
					console.log("error");
					console.log(e);
				}
			});
		})
		
		$('#delete_btn').click(function() {
			var checkboxValues = [];
				$("input[name='filename']:checked").each(function(i) {
				checkboxValues.push($(this).val());
			});
				
			//console.log(allData);
			$('#deleteform').ajaxForm({
				cache : false,
				data : {"checkArray": checkboxValues},
				dataType : "json",
				success : function(data, statusText) {
					console.log("success");
					console.log(data);
					output(data);
				},
				error : function(e) {
					console.log("error");
					console.log(e);
				}
			});
		});
	});

	function output(data) {
		$('#result').empty();
		if (data.file && data.file.length != 0) {
			$.each(data.file, function(index, item) {
				$("#result").append("<input type=checkbox name=filename id=filename value="+ item.file_room_name +">");
				if(item.file_room_ext == ".docx"){
					$("#result").append("<a href=downloadfile.htm?filename=" + item.file_room_name + ">" + "<img src=images/docx.jpg style=width:100px;height:100px>" + "</a>");
				}else if(item.file_room_ext == ".hwp"){
					$("#result").append("<a href=downloadfile.htm?filename=" + item.file_room_name + ">" + "<img src=images/hwp.jpg style=width:100px;height:100px>" + "</a>");
				}else if(item.file_room_ext == ".pptx"){
					$("#result").append("<a href=downloadfile.htm?filename=" + item.file_room_name + ">" + "<img src=images/pptx.jpg style=width:100px;height:100px>" + "</a>");
				}else if(item.file_room_ext == ".zip"){
					$("#result").append("<a href=downloadfile.htm?filename=" + item.file_room_name + ">" + "<img src=images/zip.jpg style=width:100px;height:100px>" + "</a>");
				}else{
					$("#result").append("<a href=downloadfile.htm?filename=" + item.file_room_name + ">" + "<img src=upload/"+ item.file_room_name +" style=width:100px;height:100px>" + "</a>");
				}
				$("#result").append(item.file_room_name);
				//$("#result").append("<a href=filedelete.htm?filename=" + item.filesrc + ">" + item.filesrc + "</a>");
				$("#result").append("<br/>");
			});
		}
		
		$("#result").append("<table width=600>");
		$("#result").append("<tr>");
		$("#result").append("<td align=center>");
		
		if(data.pg > data.block){
			$("#result").append("[<a href=mainfile.htm?pg=1>◀◀</a>]");
			$("#result").append("[<a href=mainfile.htm?pg="+data.from_page-1+">◀</a>]");		
		}else if(data.pg <= data.block){
			$("#result").append("[<span style=color: gray>◀◀</span>]");
			$("#result").append("[<span style=color: gray>◀</span>]");
		}
		
		for(var i = data.from_page; i <= data.to_page; i++){
			if(data.pg == i){
				$("#result").append("["+i+"]");
			}else if(data.pg != i){
				$("#result").append("[<a href=mainfile.htm?pg="+i+">"+i+"</a>]");
			}
		}
		
		if(data.to_page < data.all_page){
			$("#result").append("[<a href=mainfile.htm?pg="+data.to_page+1+">▶</a>]");
			$("#result").append("[<a href=mainfile.htm?pg="+data.all_page+">▶▶</a>]");
		}else if(data.to_page >= data.all_page){
			$("#result").append("[<span style=color: gray>▶</span>]");
			$("#result").append("[<span style=color: gray>▶▶</span>]");
		}
		
		$("#result").append("</td>");
		$("#result").append("</tr>");
		$("#result").append("</table>");
		
		//$('#multiform')[0].reset();
		//$('#multiform input:file').MultiFile('reset');
	}
</script>
</head>
<body>
		<form name="multiform" id="multiform" action="uploadfile.ajax" method="POST" enctype="multipart/form-data">
			<input type="file" name="file" />
			<input type="submit" id="upload_btn" value="업로드"/>
		</form>
		<form name="deleteform" id="deleteform" action="deletefile.ajax" method="POST">
			<input type="submit" id="delete_btn" value="삭제"/><br>
		</form>
	
	<hr>
	<div id="result">
		<c:forEach items="${list}" var="flist">
		<input type="checkbox" name="filename" id="filename" value="${flist.file_room_name}">
			<c:choose>
				<c:when test="${flist.file_room_ext == '.docx'}">
           			<a href="downloadfile.htm?filename=${flist.file_room_name}"><img src="images/docx.jpg" style="width:100px;height:100px"></a>
       			</c:when>
       			<c:when test="${flist.file_room_ext == '.hwp'}">
           			<a href="downloadfile.htm?filename=${flist.file_room_name}"><img src="images/hwp.jpg" style="width:100px;height:100px"></a>
				</c:when>
       			<c:when test="${flist.file_room_ext == '.pptx'}">
           			<a href="downloadfile.htm?filename=${flist.file_room_name}"><img src="images/pptx.jpg" style="width:100px;height:100px"></a>
				</c:when>
				<c:when test="${flist.file_room_ext == '.zip'}">
           			<a href="downloadfile.htm?filename=${flist.file_room_name}"><img src="images/zip.jpg" style="width:100px;height:100px"></a>
				</c:when>
       			<c:otherwise>
           			<a href="downloadfile.htm?filename=${flist.file_room_name}"><img src="upload/${flist.file_room_name}" style="width:100px;height:100px"></a>
				</c:otherwise>
			</c:choose>
			${flist.file_room_name}<br>
			<%-- <a href="filedelete.htm?filename=${flist.filesrc}">${flist.filesrc}</a><br> --%>
		</c:forEach>
		<table width="600">
			<tr>
				<td align="center">
					<c:if test="${pg>block}">
						[<a href="mainfile.htm?pg=1">◀◀</a>]
						[<a href="mainfile.htm?pg=${from_page-1}">◀</a>]		
					</c:if> 
					<c:if test="${pg<=block}">
						[<span style="color: gray">◀◀</span>]	
						[<span style="color: gray">◀</span>]
					</c:if>
					<c:forEach begin="${from_page}" end="${to_page}" var="i">
						<c:if test="${i==pg}">[${i}]</c:if>
						<c:if test="${i!=pg}">
							[<a href="mainfile.htm?pg=${i}">${i}</a>]
						</c:if>
					</c:forEach>
					<c:if test="${to_page<all_page}">
						[<a href="mainfile.htm?pg=${to_page+1}">▶</a>]
						[<a href="mainfile.htm?pg=${all_page}">▶▶</a>]
					</c:if>
					<c:if test="${to_page>=all_page}">
						[<span style="color: gray">▶</span>]
						[<span style="color: gray">▶▶</span>]
					</c:if>
				</td>
			</tr>
		</table>

		<!-- 		<hr>
		<form name="downform" id="downform" action="filedownload.htm" method="POST">
			<input type="button" id="btnSubmit" value="전송"/><br/>
		</form>
		<hr> -->
	</div>
</body>
</html>