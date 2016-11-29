<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>
<script>
	window.parent.CKEDITOR.tools.callFunction(${nfdto.CKEditorFuncNum}, '${nfdto.imageUrl}', '이미지를 업로드 하였습니다.');
</script>