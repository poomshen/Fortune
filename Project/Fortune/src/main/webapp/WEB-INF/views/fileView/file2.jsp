<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료실</title>
	<link rel="shortcut icon" href="../favicon.ico"> 
	<link rel="stylesheet" type="text/css" href="dist/css/normalize.css">
	<link rel="stylesheet" type="text/css" href="dist/fonts/font-awesome-4.2.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="dist/css/icons.css">
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
		
	<script src="dist/js/modernizr.custom.js"></script>
<!-- jQuery Form Plugin import -->
<script src="<%=request.getContextPath() %>/js/jquery.form.min.js"></script>
<!-- jQuery MultiFile Plugin import -->
<script src="<%=request.getContextPath() %>/js/jQuery.MultiFile.min.js"></script>
<!-- 중간 백업 -->
</head>
<body class="skin-4">
	<form name="multiform" id="multiform" action="uploadfile.ajax" method="POST" enctype="multipart/form-data">
		<label class="btn btn-primary" for="my-file-selector">
    		<input id="my-file-selector" type="file" name="file" style="display:none;" onchange="$('#upload-file-info').html($(this).val());">
    		파일 선택
    	</label>
		<span class='label label-info' id="upload-file-info"></span>
		<input type="submit" class="btn btn-primary" id="upload_btn" value="업로드"/>
	</form>

	<form name="deleteform" id="deleteform" action="deletefile.ajax" method="POST">
		<input type="submit" class="btn btn-primary" id="delete_btn" value="삭제"/><br>
	</form>
	
	<form name="searchform" id="searchform" action="searchfile.htm" method="get">
		<select name="selectvalue" id="selectvalue" class="cd-select">
			<option style="text-align:center" value="file_room_name">파일이름</option>
			<option style="text-align:center" value="file_room_date">등록날짜</option>
		</select>
		<input type="text" name="searchvalue">
		<input type="submit" class="btn btn-primary" id="search_btn" value="검색">
	</form>
	<hr>
	<div id="result" class="container">
			<div id="divrow1" class="content">				
				<c:forEach items="${list}" var="flist">
				<div class="col-lg-2" style="float: left">
					<div class="thumbnail bootsnipp-thumb">
							<!-- <p class="lead snipp-title"> --><input type="checkbox" name="filename" id="filename" value="${flist.file_room_name}">
						<a href="downloadfile.htm?filename=${flist.file_room_name}">${flist.file_room_name}</a><!-- </p> -->
						<div class="drag">
							<c:choose>
								<c:when test="${flist.file_room_ext == '.docx'}">
									<input type="hidden" id="deletefilename" name="deletefilename" value="${flist.file_room_name}"><img class=lazy src="images/docx.jpg" onmouseup="" style="width: 100px; height: 100px">
								</c:when>
								<c:when test="${flist.file_room_ext == '.xlsx'}">
									<input type="hidden" id="deletefilename" name="deletefilename" value="${flist.file_room_name}"><img class=lazy src="images/xlsx.jpg" style="width: 100px; height: 100px">
								</c:when>
								<c:when test="${flist.file_room_ext == '.hwp'}">
									<input type="hidden" id="deletefilename" name="deletefilename" value="${flist.file_room_name}"><img class=lazy src="images/hwp.jpg" style="width: 100px; height: 100px">
								</c:when>
								<c:when test="${flist.file_room_ext == '.pptx'}">
									<input type="hidden" id="deletefilename" name="deletefilename" value="${flist.file_room_name}"><img class=lazy src="images/pptx.jpg" style="width: 100px; height: 100px">
								</c:when>
								<c:when test="${flist.file_room_ext == '.zip'}">
									<input type="hidden" id="deletefilename" name="deletefilename" value="${flist.file_room_name}"><img class=lazy src="images/zip.jpg" style="width: 100px; height: 100px">
								</c:when>
								<c:when test="${flist.file_room_ext == '.jpg' || flist.file_room_ext == '.png' || flist.file_room_ext == '.bmp' || flist.file_room_ext == '.gif'}">
									<input type="hidden" id="deletefilename" value="${flist.file_room_name}"><img class=lazy src="upload/${flist.file_room_name}" style="width: 150px; height: 100px" >
								</c:when>
								<c:otherwise>
									<input type="hidden" id="deletefilename" name="deletefilename" value="${flist.file_room_name}"><img class=lazy src="images/file.jpg" style="width: 100px; height: 100px">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
				<!-- Related demos -->
	
			<!-- /content -->
		<!-- /container -->
		<div id="divrow2" class="content">
			<table width="600">
				<tr>
					<td align="center">
					<c:if test="${pg>block}">
						[<a href="mainfile.htm?pg=1">◀◀</a>]
						[<a href="mainfile.htm?pg=${from_page-1}">◀</a>]		
					</c:if> <c:if test="${pg<=block}">
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
					</c:if> <c:if test="${to_page>=all_page}">
						[<span style="color: gray">▶</span>]
						[<span style="color: gray">▶▶</span>]
					</c:if>
					</td>
				</tr>
			</table>
		</div>
		<div id="drop-area" class="drop-area">
			<div class="drop-area__item"><i class="fa fa-fw fa-archive"></i></div>
<!-- 			<div class="drop-area__item"><i class="fa fa-fw fa-star"></i></div>
			<div class="drop-area__item"><i class="fa fa-fw fa-exclamation-triangle"></i></div>
			<div class="drop-area__item"><i class="fa fa-fw fa-envelope"></i></div> -->
			<div class="drop-area__item" id="trash"><i class="fa fa-fw fa-trash"></i></div>
		</div>
		<div class="drop-overlay"></div>
	</div>
		<script src="dist/js/draggabilly.pkgd.min.js"></script>
		<script src="dist/js/dragdrop.js"></script>
		<script>
(function() {
	var body = document.body,
		dropArea = document.getElementById( 'drop-area' ),
		droppableArr = [], dropAreaTimeout;

	// initialize droppables
	[].slice.call( document.querySelectorAll( '#drop-area .drop-area__item' )).forEach( function( el ) {
		droppableArr.push( new Droppable( el, {
			onDrop : function( instance, draggableEl ) {
				//console.log(instance.el.id);
				if(instance.el.id == 'trash'){
					console.log('삭제 들어가자');
				}

				console.log(draggableEl);
				//console.log(draggableEl.class);
				
				var deletefilename = $('#deletefilename').val();
				alert(deletefilename);
				// show checkmark inside the droppabe element
				classie.add( instance.el, 'drop-feedback' );
				clearTimeout( instance.checkmarkTimeout );
				instance.checkmarkTimeout = setTimeout( function() { 
					classie.remove( instance.el, 'drop-feedback' );
				}, 800 );
				// ...
			}
		} ) );
	} );

	// initialize draggable(s)
	[].slice.call(document.querySelectorAll( '.drag' )).forEach( function( el ) {
		new Draggable( el, droppableArr, {
			draggabilly : { containment: document.body },
			onStart : function() {
				// add class 'drag-active' to body
				classie.add( body, 'drag-active' );
				// clear timeout: dropAreaTimeout (toggle drop area)
				clearTimeout( dropAreaTimeout );
				// show dropArea
				classie.add( dropArea, 'show' );
			},
			onEnd : function( wasDropped ) {
				
				var afterDropFn = function() {
					// hide dropArea
					
					classie.remove( dropArea, 'show' );
					// remove class 'drag-active' from body
					classie.remove( body, 'drag-active' );
				};

				if( !wasDropped ) {
					afterDropFn();
				}
				else {
					// after some time hide drop area and remove class 'drag-active' from body
					clearTimeout( dropAreaTimeout );
					dropAreaTimeout = setTimeout( afterDropFn, 400 );
				}
			}
		} );
	} );
})();

	
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
		$('#divrow1').empty();
		$('#divrow2').empty();
		$('#upload-file-info').html("");
		if (data.file && data.file.length != 0) {
			$.each(data.file, function(index, item) {
				if(item.file_room_ext == ".docx"){
					var result = "<a href='downloadfile.htm?filename=" + item.file_room_name + "'>" + "<img class=lazy src=images/docx.jpg style=width:400px;height:200px>" + "</a></div></div></div>";
				}else if(item.file_room_ext == ".hwp"){
					var result = "<a href='downloadfile.htm?filename=" + item.file_room_name + "'>" + "<img class=lazy src=images/hwp.jpg style=width:400px;height:200px>" + "</a></div></div></div>";
				}else if(item.file_room_ext == ".xlsx"){
					var result = "<a href='downloadfile.htm?filename=" + item.file_room_name + "'>" + "<img class=lazy src=images/xlsx.jpg style=width:400px;height:200px>" + "</a></div></div></div>";
				}else if(item.file_room_ext == ".pptx"){
					var result = "<a href='downloadfile.htm?filename=" + item.file_room_name + "'>" + "<img class=lazy src=images/pptx.jpg style=width:400px;height:200px>" + "</a></div></div></div>";
				}else if(item.file_room_ext == ".zip"){
					var result = "<a href='downloadfile.htm?filename=" + item.file_room_name + "'>" + "<img class=lazy src=images/zip.jpg style=width:400px;height:200px>" + "</a></div></div></div>";
				}else if(item.file_room_ext == ".jpg" || item.file_room_ext == ".png" || item.file_room_ext == ".bmp" || item.file_room_ext == ".gif"){
					var result = "<a href='downloadfile.htm?filename=" + item.file_room_name + "'>" + "<img class=lazy src=upload/"+ item.file_room_name +" style=width:400px;height:200px>" + "</a></div></div></div>";
				}else{
					var result = "<a href='downloadfile.htm?filename=" + item.file_room_name + "'>" + "<img class=lazy src=images/file.jpg style=width:400px;height:200px>" + "</a></div></div></div>";
				}
				$("#divrow1").append("<div class=col-lg-4 style=float:left>"+
						"<div class=thumbnail bootsnipp-thumb>"+
						"<div><input type=checkbox name=filename id=filename value='" + item.file_room_name + "'>" + item.file_room_name + /* <p class=lead snipp-title> *//* "</p>"+ */
						result);
			});
		}
		
		$("#divrow2").append("<table width=600>");
		$("#divrow2").append("<tr>");
		$("#divrow2").append("<td align=center>");
		
		if(data.pg > data.block){
			$("#divrow2").append("[<a href=mainfile.htm?pg=1>◀◀</a>]");
			$("#divrow2").append("[<a href=mainfile.htm?pg="+data.from_page-1+">◀</a>]");		
		}else if(data.pg <= data.block){
			$("#divrow2").append("[<span style=color: gray>◀◀</span>]");
			$("#divrow2").append("[<span style=color: gray>◀</span>]");
		}
		
		for(var i = data.from_page; i <= data.to_page; i++){
			if(data.pg == i){
				$("#divrow2").append("["+i+"]");
			}else if(data.pg != i){
				$("#divrow2").append("[<a href=mainfile.htm?pg="+i+">"+i+"</a>]");
			}
		}
		
		if(data.to_page < data.all_page){
			$("#divrow2").append("[<a href=mainfile.htm?pg="+data.to_page+1+">▶</a>]");
			$("#divrow2").append("[<a href=mainfile.htm?pg="+data.all_page+">▶▶</a>]");
		}else if(data.to_page >= data.all_page){
			$("#divrow2").append("[<span style=color: gray>▶</span>]");
			$("#divrow2").append("[<span style=color: gray>▶▶</span>]");
		}
		
		$("#divrow2").append("</td>");
		$("#divrow2").append("</tr>");
		$("#divrow2").append("</table>");
	}
</script>
</body>
</html>