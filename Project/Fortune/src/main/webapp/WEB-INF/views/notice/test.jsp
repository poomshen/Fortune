<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>













<!DOCTYPE HTML>
<html lang="ko" class="no-js modern">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta charset="UTF-8">
	<meta name="viewport" content="initial-scale=1.0, width=device-width, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<link rel="stylesheet" href="/web/css/font.css" />
	<link rel="stylesheet" href="/web/css/style.css" />
	<!-- 20160705 추가css :S -->
	<link rel="stylesheet" href="/web/css/layout_2016.css" />
	<link rel="stylesheet" href="/web/css/cardinfo.css" />
	<link rel="stylesheet" href="/web/css/jquery.bxslider.css" />
	<!-- 20160705 추가css :E -->
	<link rel="shortcut icon" href="/web/images/comm/favicon.ico" type="image/xicon" />
	<link rel="shortcut icon" href="/web/images/comm/android_favicon.ico" type="image/x-icon" />
	<link rel="apple-touch-icon" href="/web/images/comm/iphone_favicon.png" type="image/x-icon" />
 	<script src="/web/js/jquery-1.8.3.min.js" type="text/javascript" ></script>
	<script src="/web/js/jquery.maskedinput-1.3.min.js" type="text/javascript" ></script>
	<!-- 20160705 추가js :S -->
	<script src="/web/js/jquery.easing.1.3.js"></script>
	<script src="/web/js/common_2016.js"></script>
	<!-- 20160705 추가js :E -->
	<!-- datepicker -->
	<link href="/web/js/jquery-ui-1.10.3.custom/css/smoothness/jquery-ui-1.10.3.custom.min.css" rel="stylesheet">
	<script src="/web/js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script src="/web/js/jquery-ui-1.10.3.custom/js/jquery.ui.datepicker-ko.js"></script>
	<!-- CKEditor  -->
	<script src="/ckeditor/ckeditor.js" type="text/javascript"></script>
	<script src="/web/js/editor.js" type="text/javascript"></script>
	<script src="/web/js/video.js" type="text/javascript"></script>

	<script type="text/javascript">
	// errorMsg 변수 체크
	(function() {
		var errorMsg='';
		if (errorMsg) {
			alert(errorMsg);
			var loc=location.href.replace(/errorMsg=[^&]*&?/g,'').replace(/&&+/g,'');
			location.replace(loc);
		}
	})();
	// #BaseModul start
	var BaseModule={
		// #CKEditor start
		ckeditor: function(baseConf, datepickerConf) {
			var config={
				endDateId: 'endDate'
				, startDateId: 'startDate'
				, regDateId: 'regDate'
				, contentId: 'content'
				, maskFormat: '9999-99-99'
			};
			$.extend(config, baseConf||{});

			if ($('#'+config.contentId).size()) {
				initEditor(config.contentId);
			}

			if ($('#'+config.endDateId).size()) {
				$('#'+config.endDateId).mask(config.maskFormat);
			}
			if ($('#'+config.startDateId).size()) {
				$('#'+config.startDateId).mask(config.maskFormat);
			}
			if ($('#'+config.regDateId).size()) {
				$('#'+config.regDateId).mask(config.maskFormat);
			}
			BaseModule.datepicker(datepickerConf);
		}
		// @CKEditor end
		, datepicker: function(datepickerConf) {
			var datepickerConfig={
				showOn: 'button'
				, buttonImageOnly : true
				, buttonImage : "/web/images/btn/btn06_clnt.gif"
				, buttonText : "Calendar"
				, duration : "fast"
				, changeMonth: true
				, changeYear: true
				, endDateId: 'endDate'
				, startDateId: 'startDate'
				, regDateId: 'regDate'
			};
			$.extend(datepickerConfig, datepickerConf||{});
			$('#'+datepickerConfig.startDateId).datepicker(datepickerConfig);
			$('#'+datepickerConfig.endDateId).datepicker(datepickerConfig);
			$('#'+datepickerConfig.regDateId).datepicker(datepickerConfig);
			$("img.ui-datepicker-trigger").wrap("<a href='#this'/>");
		}

		// #파일관련처리 start
		, fileAttach : function(conf) {
			var config={
				fileIdPrefix: 'attFile'
				, disposableClassName: 'disposable'
				, checkboxClassName: 'file_cb'
				, hiddenDelSeqsId: 'attDelSeqs'
				, baseTableId: 'baseTable'
				, attTemplateId: 'attTemplate'
				, fileAttLimit: 1
				, btnFileClassName: 'btnFile'
				, btnFileAddClassName: 'btnFileAdd'
				, btnFileDeleteClassName: 'btnFileDelete'
			}
			$.extend(config, conf||{});

			var getCurTpl=function() {
				return tpl.replace(/#/g,curFileAttSize);
			}
			var addAtt=function() {
				curFileAttSize++;
				$t.append(getCurTpl());
			}
			var deleteAtt=function() {
				var $$=$('#'+config.fileIdPrefix+curFileAttSize);
				if ($$.closest('tr').hasClass(config.disposableClassName)) {
					$$.closest('tr').remove();
					curFileAttSize--;
				}
			}
			// 체크박스 클릭: 기존 첨부파일 삭제 및 새 입력 폼 토글
			$('.'+config.checkboxClassName).click(function() {
				var $file=$('#'+config.fileIdPrefix+$(this).attr('id').replace(/\D/g,''));
				var flag=this.checked ? 'visible' : 'hidden';
		 		$file.css('visibility', flag);
				if (flag=='hidden') {
					$file.val('');
				}
				var seqs=[];
				$(':checkbox.'+config.checkboxClassName).each(function() {
					if (this.checked) {
						seqs.push(this.value);
					}
				});
				$('#'+config.hiddenDelSeqsId).val(seqs.join(','));
			});
			var $t=$('#'+config.baseTableId+' tbody');
			var tpl=$('#'+config.attTemplateId).val();
			var fileAttLimit=config.fileAttLimit;
			var curFileAttSize=fileAttLimit;
			$('.'+config.btnFileClassName).click(function() {
				var $$=$(this);
				var isAdd=$$.hasClass(config.btnFileAddClassName);
				isAdd ? addAtt() : deleteAtt();
				$('.'+config.btnFileDeleteClassName).css('visibility', curFileAttSize > fileAttLimit ? 'visible' : 'hidden');
			});
		}

		// 게시판리스트 체크박스 일괄 토글
		, replaceDelSeqStatus: function () {
			$('input[name=delSeq]').attr('checked', $(this).is(':checked'));
		}
		// 게시판리스트 선택삭제시 기본동작
		, checkDelSrl: function () {
			var isDelChecked = false;
			$('input[name=delSeq]').each(function(){
				if ($(this).is(':checked')) {
					isDelChecked = true;
					return;
				}
			});
			if (isDelChecked == false) {
				alert('삭제할 게시물을 선택해주세요.');
				return false;
			} else {
				var msg = '데이터를 삭제하시겠습니까?';
				return confirm(msg);
			}
		}
		// 삭제 in viewpage
		, delConfirm: function() {
			var msg = '데이터를 삭제하시겠습니까?';
			return confirm(msg);
		}
		// @파일관련처리 end

		// #통합게시판 '분류' 검색기능 확장
		, installTypeSearch: function() {
			var toggle=function(removeCls, addCls) {
				$('#txBox3')
					.removeClass(removeCls)
					.addClass(addCls)
				;
				try {
					if (removeCls=='txHide') {	// 구분 <select/> 활성화
						$('#s_text').val('');
					} else {						// #s_text 활성화
						$('#type')
							.trigger('change');
					}
				} catch(e) {}
			}
			$('#s_type').change(function() {
				if (this.value=='type') {
					toggle('selHide', 'txHide');
				} else {
					toggle('txHide', 'selHide');
				}
			});
			$('#type').change(function() {
				$('#s_text').val(this.value);
			});
			try {
				if ($('#s_type').val()=='type') {
					toggle('selHide', 'txHide');
				}
			} catch(e) {}
		}
		, prependSelectHeader: function() {
			$("select").each(function() {
				try {
					if ($("option:first", this).attr("value") !="all") {
						$(this).prepend("<option value='all'>전체</option>");
					}
				} catch(e) {}
			});
		}
		, phoneMask: function(selector) {
			var $obj=$(selector);
			$obj.attr("maxlength", 13);
			var chkSeoul=function(obj) {
				return obj.value.indexOf("02")===0;
			}
			var chkKey=function(e) {
				var key=e.keyCode;
				if (!e.target.value && key !=48 && key !=96) {	// 첫글자는 무조건 '0'
					return false;
				}
				var result=(key==45 || key==109 || (key>=48 && key<=57) || (key>=96 && key<=105));

				return result;
			}
			$obj
				.bind('keypress', function(e) {

					return chkKey(e);
				})
				.bind('keyup', function(e) {
					if (!chkKey(e)) return true;
					var obj=e.target;
					var val=obj.value.replace(/\D/g,'');
					if (val.length<3) return true;
					var newVal=null;
					if (chkSeoul(obj)) {
						newVal=val.substr(0,2)+'-'+val.substr(2);
					} else {
						newVal=val.substr(0,3)+'-'+val.substr(3);
					}
					var format=[];
					format=newVal.split('-');
					if (format[1].length>=4) {
						var tmp=format[1];
						format[1]=tmp.substr(0,4);
						format[2]=tmp.substr(4);
					}
					obj.value=format.join('-');
				})
				.bind("blur", function() {
					var val=this.value||'';
					if (!val) return;
					var isSeoul=chkSeoul(this);
					// 11자리 이하이거나, 11자리이면서 서울지역번호(02) 가 아닌 경우
					if (val.length<11 || (!isSeoul && val.length==11) || (isSeoul && val.length>12) || val.indexOf('0') !==0 || val.indexOf('00')===0) {
						this.value='';
						return;
					}
					var format=[];
					val=val.replace(/\D/g,'');
					// 서울
					format[0]=isSeoul ? '02' : val.substring(0,3);
					format[1]='';
					format[2]=val.replace(/^.*(\d{4})$/, "$1");
					val=val.replace(new RegExp('^'+format[0]), '');
					val=val.replace(new RegExp(format[2]+'$'), '');
					format[1]=val;
					var result=format.join('-');
					this.value=result;
				});
		}
		, mailMask: function(selector) {
			var re=/^[0-9a-z\-_\.]+@([0-9a-z\-\_]+\.)+[a-z]+$/i;
			var $obj=$(selector);
			var chkEmail=function(obj) {
				var val=obj.value;
				if (!val) return true;
				return re.test(val);
			}
			var prevent=function(e, obj) {
				if (!chkEmail(obj)) {
					alert("유효하지 않은 이메일 형식 입니다.");
					obj.value='';
					e.preventDefault();
					return false;
				}
				return true;
			}
			$obj
				.bind('keypress', function(e) {
					if (e.keyCode==13) {
						if (!prevent(e, this)) {
							return;
						}
					}
				})
				.bind('blur', function(e) {
					if (!prevent(e, this)) {
					}
				})
			;
		}
		, checkMaxlength: function(selector, maxlength) {
			var $obj=$(selector);
			var isKorean = function(str) {
				var kor_regex = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
				return kor_regex.test(str);
			}
			var getByteSize = function(str) {
				var i = 0,
	        		byte_size = 0,
	        		str_len = str.length;
				
				for ( i=0; i < str_len; i++ ) {
		        	if (isKorean(str.charAt(i))) {
		        		byte_size += 2;
		        	} else {
		        		byte_size += 1;
		        	}
		        }
				return byte_size;
			}
			$obj
				.bind('change keyup', function(e) {
					if (!$obj.size() || !$obj.val()) return;
					
					var contents = $obj.val();
			        var	limit = parseInt(maxlength);
			        var byte_size = getByteSize(contents);
			        var lastCharIdx = limit;
			        var i = 0,
		        		byte_size = 0,
		        		contents_len = contents.length;
				
					for ( i=0; i < contents_len; i++ ) {
			        	if (isKorean(contents.charAt(i))) {
			        		byte_size += 2;
			        	} else {
			        		byte_size += 1;
			        	}
			        	if (byte_size <= limit) {
			        		lastCharIdx = i;
			        	}
			        }
			        
			       if(byte_size > limit){  
						$obj.val(contents.substr(0, lastCharIdx+1));
						alert(maxlength+'byte 이하까지만 작성 가능합니다.');
			       } 
				});
		}
	}	// @BaseModule end

	$(function() {
		
		
		// 최상단 체크박스 찍으면 모두 선택/해제 토글
		var monitoredCheckbox=$('#delAll');
		if (monitoredCheckbox.size()==1) monitoredCheckbox.on('click', $.proxy(BaseModule.replaceDelSeqStatus, monitoredCheckbox));

		var thumbnailId="thumbnail";
		var $thumbnail=$('#'+thumbnailId);
		// thumbnail 확장자 제한
		$thumbnail.change(function() {
			if (!this.value) return;
			var ext=(this.value.replace(/^.*(\.[a-zA-Z0-9]+)$/, '$1')||'').toLowerCase();
			if (!ext || !(ext=='.jpg' || ext=='.gif')) {
				alert('Not allowed image extension.');
				this.value='';
			}
		});

		var s_text="검색어를 입력하세요.";

		// thumbnail이 첨부가 안된 경우 업로드시 에러 발생
		$('form').bind('submit', function() {
			$(':file', this).each(function(i, o) {
				if (!$(o).val()) {
					$(o).attr('disabled', true);
				}
			});
			var $st=$('#s_text');
			if ($st.size()>0 && $st.val()==s_text) {
				$st.val('');
			}
			return true;
		});
		
		// 목록화면 페이징 처리 공통 - IE 일부 하위 버전의 호환성 이슈로 인해 기능 추가
		(function() {
			var paging=['.numBox', '.mobileNumBox'];
			for (var i=0; i<paging.length; i++) {
				var $numDiv=$(paging[i]);
				if (!$numDiv.size()) break;
				var $table=$(paging[i].replace('.','#')+'Tb');
				var $tr = $('<tr>');
				var $p=$(paging[i]+' > div.list-page-num');
				$p.children().each(function(i, tagObj) {
					var $tagObj = $(tagObj);
					var $td = $('<td>');
					var cls=$tagObj.prop('class')||'';
					if (cls != '') {
						$td.prop({'class':cls});
					}
					if ($tagObj.prop('tagName') == 'A') {
						var href = $tagObj.prop('href')||'#';

						if (href.indexOf('?') != -1) {
							var params = href.replace(/[^?]+\?(.*)/, '$1');
							
							if (params.indexOf('&amp;') != -1) {
								params = params.split('&amp;');
							} else {
								params = params.split('&');
							}
							
							if (params && (/.*[가-힣].*/g).test(params)) {
								var newParams = '?';
								for (var i=0; i < params.length; i++) {
									var p = params[i].split('=');
									if (p[1]) {
										if (!(/.*\?pageNo/).test(p[1])) {
											newParams += p[0] + '=' + encodeURIComponent(p[1]).replace('%C2%A7', '');
										} else {
											newParams += p[0] + '=' + encodeURIComponent(p[1].replace(/(.*)\?pageNo/,'$1')).replace('%C2%A7', '');
										}
									} else {
											newParams += params[i];
									}
									if ((i+1) != params.length) newParams += '&';
								}
								href = href.replace(/([^?]+)\?.*/, '$1') + newParams.replace('%23', '#');
							}
						}
						var $a = $('<a>').attr({'href':href, 'title':($tagObj.prop('title')||'')}).text($tagObj.text()||'');
					} else {
						var $a = $('<a>').attr({'title':'현재페이지','href':'#this'}).text($tagObj.text()||'');
					}
					
					$td.append($a);
					$tr.append($td);
				});
				$table.append($tr);
			}
			$("div.list-page-num").css("display", "none");
		})();
		
		// 게시판 조회 정렬방식
		(function() {
			var orderByField=""||"SEQ";	// SEQ|HITS
			var orderByDirection=""||"DESC";
			$('a.orderByForm').each(function(i, o) {
				var $o=$(o);
				$o.addClass($o.hasClass(orderByField) ? 'on' : 'last');
			})
			.bind('click', function() {
				var $form=$('form.orderByForm');
				if ($form.size()) {
					$('input[name="orderByField"]', $form).val($(this).hasClass('SEQ') ? 'SEQ' : 'HITS');
					$('input[name="orderByDirection"]', $form).val('DESC');	// 고정
					$form.submit();
				}
			})
			;
		})();

		// View페이지에서 "삭제" 실행
		(function() {
			$("#deleteLink").click(function(e) {
				var $pw=$("#pwDiv");
				var cls="invisible";
				var isVisible=!$pw.hasClass(cls);
				if (isVisible) {
					$pw.addClass(cls);
				} else {
					$pw.removeClass(cls);
					$("input.regPw:first").focus();
				}
			});
		})();

		// Write 페이지에서 "등록" 링크 클릭시 form submit
		(function() {
			$("a.submit").click(function(e) {
				$("input.submit:first").trigger("click");
			});
		})();

		// title 을 동일 포맷화
		var titleChange=function(isBonbuEvent) {
			var $title  = $("div#contents div.path:first strong:first");
			var $tabBtn = $("div#contents .tabBtn a.on");
			var $tabBar = $("div#contents .tabBar a.on");
			var $custMap = $("div#contents .custMap");
			var $tourTitle = $(".mapTit");
			
			if (!$title.size()) {
				return;
			}
			var suffix=' | Kwater';
			var title=$title.text();
			title+=suffix;
			
			/* 탭 있는 경우 */
			if($tabBtn.size()){
				title=$tabBtn.text()+' - '+ title;
			}else if($tabBar.size()){
				title=$tabBar.text()+' - '+ title;
			}
			/* 견학안내 */
			if($custMap.size() || $tourTitle.size()){
				title=$tourTitle.text()+' - '+ title;
			}
			if (isBonbuEvent) {
				var $h2=$("div#contents h2:first");
				var $tab=$("div#contents #subTab a.on");
				if ($h2.size()) {
					title=$tab.text()+' - '+$h2.text()+ ' '+suffix;
				}
			}
			document.title=title;
		};
		titleChange();
		$("div#contents div.path").bind('redraw', function(e) {
			titleChange(true);
		});

		// maxlength
		(function() {
			var dic={s_text: 100};	// 검색어

			if (location.href.indexOf('brdId=') >=0) {
				$.extend(dic, {
					regName: 		10
					, regPw:			20
					, regTel:			13
					, regEmail:		50
					, title:				200
					, url:				200
					, thumbnailDesc:	100
				});
			}
			for (key in dic) {
				$("#"+key).attr("maxlength", dic[key]);
			}
		})();
	});

	function goJusoPopup(){
		var pop = window.open("/common/jusoPop.jsp","jusoPopup","width=570,height=420, scrollbars=yes, resizable=yes");
	}

	function goDeptPopup(){
		var pop = window.open("/cust/offer/deptPop.do","deptPopup","width=570,height=420, scrollbars=yes, resizable=yes");
	}
	</script>

	<style type='text/css'>
	.invisible 			{display:none;}
	/* 	div.list-page-num {display:none;} */
	
	.listSearchBox{border:1px solid #fff;}
	div.list-page-num{display:block;text-align:center;margin-top:30px;}
	div.list-page-num span.on,
	div.list-page-num a{padding:0 15px;}
	.numBox a.BtnNext1{background:url(/web/images/list/btn_wNext01.gif) 7px 5px no-repeat;}
	.numBox a.BtnNext2{background:url(/web/images/list/btn_wNext02.gif) 7px 5px no-repeat;}
	.numBox a.BtnPrev1{background:url(/web/images/list/btn_wPrev01.gif) 7px 5px no-repeat;}
	.numBox a.BtnPrev2{background:url(/web/images/list/btn_wPrev02.gif) 7px 5px no-repeat;}

	.mobileNumBox a.BtnNext1{background:url(/web/images/list/btn_wNext01.gif) 7px 5px no-repeat;}
	.mobileNumBox a.BtnNext2{background:url(/web/images/list/btn_wNext02.gif) 7px 5px no-repeat;}
	.mobileNumBox a.BtnPrev1{background:url(/web/images/list/btn_wPrev01.gif) 7px 5px no-repeat;}
	.mobileNumBox a.BtnPrev2{background:url(/web/images/list/btn_wPrev02.gif) 7px 5px no-repeat;}
	

	input.file_att			{visibility:hidden}
	input.base_font_color		{color: #494949 !important}
	.ui-datepicker select.ui-datepicker-year { width:37%;}
	.ui-datepicker select.ui-datepicker-month { width:35%;}
	.ui-datepicker-trigger {padding-left: 5px;padding-bottom: 2px;cursor: pointer;vertical-align: middle;}
	p.err-msg		{color:red}
	
	/*
	input.att		{width: 50% !important}
	td.flat_file	{display: inline !important}
	input.file_cb	{width:15px !important; vertical-align:middle !important}
	.invisible2	{visibility:hidden}
	.float_right	{float: right}
	*/
	</style>
	<title>새소식 공지사항 리스트 - Kwater</title>
<script type='text/javascript' defer='defer'>
$(function() {
	BaseModule.installTypeSearch();
})
</script>
<script type="text/javascript">
$(function() {
	$('#regDate').datepicker({
		showOn: 'button'
		, buttonImageOnly : true
		, buttonImage : "/web/images/btn/btn06_clnt.gif"
		, buttonText : "Calendar"
		, duration : "fast"
		, changeMonth: true
		, changeYear: true,
		onClose: function(selectedDate){
			$('#endDate').datepicker("option", "minDate", selectedDate);
		}
	});
	
	$('#endDate').datepicker({
		showOn: 'button'
		, buttonImageOnly : true
		, buttonImage : "/web/images/btn/btn06_clnt.gif"
		, buttonText : "Calendar"
		, duration : "fast"
		, changeMonth: true
		, changeYear: true,
		onClose: function(selectedDate){
			$('#regDate').datepicker("option", "maxDate", selectedDate);
		}
	});
});
</script>
<meta name="robots" content="noindex,nofollow">
</head>
<body class="sub">


<a href="#contents" class="skipNav">본문바로가기(Skip to contents)</a>



<div class="totalTopBg"></div>


<div id="wrap">
		







<!-- 20160705 header :S -->
<div id="header_2016">
	<div id="toputil">
		<div class="al_box">
			<h1 class="logo"><a href="/"><span>K water</span></a></h1>
			<div class="my_water">
				<a href="http://www.water.or.kr/" target="_blank" title="새창이동, MY WATER 홈페이지"><span>MY WATER</span>물에 대한 모든 것 물정보포털</a>
			</div>
			<ul id="sns_link">
				<li><a href="http://www.blogkwater.or.kr/" target="_blank" title="새창이동, 블로그 홈페이지" class="blog"><span>블로그</span></a></li>
				<li><a href="https://www.facebook.com/kwaterworld" target="_blank" title="새창이동, 페이스북 홈페이지" class="facebook"><span>페이스북</span></a></li>
				<li><a href="https://twitter.com/kwater_twitt" target="_blank" title="새창이동, 트위터 홈페이지" class="twitter"><span>트위터</span></a></li>
				<li class="eng"><a href="http://english.kwater.or.kr/eng/main.do" target="_blank" title="새창이동, ENGLISH 홈페이지">ENGLISH</a></li>
			</ul>
			
			<a href="#link" class="mob_btn"><span>모바일 메뉴 열기</span></a>
		</div>	
	</div>

	<!-- gnb -->
	<div id="gnb">	
		<div id="blind"><span></span></div>  
		<div class="al_box">
			<nav id="nav">
				<ul class="group">
					
					
					
					
					
					
					
					
					<li class="menu1">
					<a href="/gov3/sub01/gov3/gov01Page.do?s_mid=15" >열린경영</a>
					
					
					
					
					
					<ul class="menuBox group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/gov3/sub01/gov3/gov01Page.do?s_mid=15"  class="depth" target="_self"><strong>정부3.0</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/gov3/sub01/gov3/gov01Page.do?s_mid=15"  class="depth" target="_self"><strong>정부3.0 이란?</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/gov3/sub02/intro0101Page.do?s_mid=1465"  class="depth" target="_self"><strong>K-water 3.0</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/gov3/sub02/intro0101Page.do?s_mid=1465"  class="depth" target="_self"><strong>개요</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/gov3/sub02/intro0201Page.do?s_mid=1469"  class="depth" target="_self"><strong>중점과제</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/gov3/sub02/intro0301Page.do?s_mid=1470"  class="depth" target="_self"><strong>실행과제</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/news/repoList.do?brdId=KO70&s_mid=1463"  class="depth" target="_self"><strong>홍보&amp;자료</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/gov3/sub03/sub01/guidPage.do?s_mid=53"  class="depth" target="_self"><strong>정보공개</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/gov3/sub03/sub01/guidPage.do?s_mid=53"  class="depth" target="_self"><strong>제도안내</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/gov3/sub03/askWrite.do?s_mid=56"  class="depth" target="_self"><strong>정보공개 청구</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/gov3/sub03/claimList.do?s_mid=893"  class="depth" target="_self"><strong>불복구제절차 및 방법</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/gov3/sub03/infoList.do?s_mid=55"  class="depth" target="_self"><strong>정보목록</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/gov3/sub03/publicList.do?s_mid=1664"  class="depth" target="_self"><strong>사전정보공표</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/gov3/pubdataPage.do?s_mid=52"  class="depth" target="_self"><strong>공공데이터개방</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/gov3/policy01Page.do?s_mid=1566"  class="depth" target="_self"><strong>사업실명제</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/gov3/policy01Page.do?s_mid=1566"  class="depth" target="_self"><strong>사업실명제 개요</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/gov3/policyList.do?brdId=KO71&s_mid=1568&type=2016"  class="depth" target="_self"><strong>대상사업</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub02/total01Page.do?s_mid=45"  class="depth" target="_self"><strong>경영공시</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub04/sub03/repoPage.do?s_mid=375"  class="depth" target="_self"><strong>지속가능경영</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub04/sub03/repoPage.do?s_mid=375"  class="depth" target="_self"><strong>체계</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub03/sub01/systPage.do?s_mid=46"  class="depth" target="_self"><strong>윤리경영</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub04/sub00/courPage.do?s_mid=1293"  class="depth" target="_self"><strong>환경경영</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub04/sub00/courPage.do?s_mid=1293"  class="depth" target="_self"><strong>소개</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub04/sub01/renePage.do?s_mid=151"  class="depth" target="_self"><strong>기후변화 대응</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub04/sub02/gnetPage.do?s_mid=152"  class="depth" target="_self"><strong>환경가치 창출</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="http://www.water.or.kr/sharedgrowth/sharedsupport/main.do?s_mid=48"  class="depth" target="_blank" title="새창으로 이동"><strong>동반성장</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub05/sub01/systPage.do?s_mid=378"  class="depth" target="_self"><strong>사회공헌</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub05/sub01/systPage.do?s_mid=155"  class="depth" target="_self"><strong>개요</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub05/sub02/sharePage.do?s_mid=1614"  class="depth" target="_self"><strong>주요활동</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub05/sub05/intrPage.do?s_mid=390"  class="depth" target="_self"><strong>물사랑나눔단</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub05/sub05/intrPage.do?s_mid=390"  class="depth" target="_self"><strong>소개</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub05/sub06/expeList.do?brdId=KO25&s_mid=394"  class="depth" target="_self"><strong>나눔활동</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub05/sub06/calendar.do?s_mid=395"  class="depth" target="_self"><strong>사랑나눔캘린더</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/info/waterInfoPage.do?s_mid=10"  class="depth" target="_self"><strong>물 이야기</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/info/sub01/healthPage.do?s_mid=1588"  class="depth" target="_self"><strong>물과 생활</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/info/wstats01Page.do?s_mid=1705&amp;gbn=A"  class="depth" target="_self"><strong>물과 통계</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/info/wstats01Page.do?s_mid=1705&amp;gbn=A"  class="depth" target="_self"><strong>쉬운 물통계</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/info/wstats02Page.do?s_mid=1706"  class="depth" target="_self"><strong>우리나라 물통계</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/info/sub01/sub06/sub02/contPage.do?s_mid=1716"  class="depth" target="_self"><strong>웹툰</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/info/sub01/sub06/sub02/contPage.do?s_mid=1716"  class="depth" target="_self"><strong>스노우달</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="http://www.water.or.kr/realtime/sub01/sub01/dam/hydr.do?s_mid=1323&seq=1408&p_group_seq=1407&menu_mode=3"  class="depth" target="_blank" title="새창으로 이동"><strong>실시간정보</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/info/sub01/sub06/sub01/contPage.do?s_mid=1579"  class="depth" target="_self"><strong>인포그래픽</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					<li class="menu2">
					<a href="/cust/sub01/charPage.do?s_mid=687" class="depth">고객센터</a>
					
					
					
					
					
					<ul class="menuBox group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub01/charPage.do?s_mid=687"  class="depth" target="_self"><strong>고객헌장</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub01/charPage.do?s_mid=687"  class="depth" target="_self"><strong>고객헌장전문</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub01/norm01Tab.do?s_mid=1150"  class="depth" target="_self"><strong>서비스이행표준</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub02/squarePage.do?s_mid=690"  class="depth" target="_self"><strong>고객광장</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub02/sub01/infoPage.do?s_mid=699"  class="depth" target="_self"><strong>민원</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub02/sub01/infoPage.do?s_mid=699"  class="depth" target="_self"><strong>민원이용안내</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub02/sub01/online/mypgWrite.do?s_mid=702"  class="depth" target="_self"><strong>신청</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub02/sub01/faqList.do?s_mid=700&s_faqId=cust"  class="depth" target="_self"><strong>민원FAQ</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub02/sub03/corr/intrPage.do?s_mid=720"  class="depth" target="_self"><strong>신고센터</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub02/sub03/corr/intrPage.do?s_mid=720"  class="depth" target="_self"><strong>부조리신고</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub02/sub03/inte/descPage.do?s_mid=725"  class="depth" target="_self"><strong>내부부패공익신고</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub02/sub03/waste/intrPage.do?s_mid=728"  class="depth" target="_self"><strong>예산낭비신고</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub02/sub03/contract/intrPage.do?s_mid=731"  class="depth" target="_self"><strong>불공정하도급해소센터</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/prohibitLawPage.do?s_mid=1717"  class="depth" target="_self"><strong>청탁금지법위반신고</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub02/sub02/sub01/guidPage.do?s_mid=708"  class="depth" target="_self"><strong>고객참여</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub02/sub02/sub01/guidPage.do?s_mid=708"  class="depth" target="_self"><strong>고객제안</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub02/sub02/sub02/compList.do?s_mid=1221"  class="depth" target="_self"><strong>직원칭찬</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub04/sub05/explPage.do?s_mid=1123"  class="depth" target="_self"><strong>증명서신청</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub02/sub02/sub03/tour1Page.do?s_mid=1032"  class="depth" target="_self"><strong>견학안내</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/ombu/guidPage.do?s_mid=696"  class="depth" target="_self"><strong>옴부즈만</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/ombu/guidPage.do?s_mid=696"  class="depth" target="_self"><strong>소개</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/ombu/ombu03List.do?s_mid=698&brdId=KO58"  class="depth" target="_self"><strong>자료실</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/ombu/objectionWrite.do?s_mid=1320"  class="depth" target="_self"><strong>이의신청</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub04/supportIntroPage.do?s_mid=22"  class="depth" target="_self"><strong>고객지원</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub04/sub04/wsupportPage.do?s_mid=1670"  class="depth" target="_self"><strong>물산업지원센터</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub04/sub02/inspPage.do?s_mid=200"  class="depth" target="_self"><strong>수질검사의뢰</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub04/sub04/procPage.do?s_mid=78"  class="depth" target="_self"><strong>교정검사의뢰</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub04/sub03/suppPage.do?s_mid=204"  class="depth" target="_self"><strong>수도설비 기술지원</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub04/sub06/compIntroPage.do?s_mid=80"  class="depth" target="_self"><strong>보상정보</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub04/sub01/char/char09Page.do?s_mid=1585"  class="depth" target="_self"><strong>수도·댐용수 요금</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub04/sub01/char/char09Page.do?s_mid=1585"  class="depth" target="_self"><strong>요금안내</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub04/sub01/calinputPage.do?s_mid=198"  class="depth" target="_self"><strong>간편조회</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub04/rateconsumerPage.do?s_mid=1548"  class="depth" target="_self"><strong>요금상식</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					<li class="menu3">
					<a href="/news/sub01/noti01List.do?s_mid=105&brdId=KO27" class="depth">새소식</a>
					
					
					
					
					
					<ul class="menuBox group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/news/sub01/noti01List.do?s_mid=105&brdId=KO27"  class="depth" target="_self"><strong>게시판</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/news/sub01/noti01List.do?s_mid=105&brdId=KO27"  class="depth" target="_self"><strong>공지사항</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/news/event/eventList.do?type=C&notiYn=Y&s_mid=1678"  class="depth" target="_self"><strong>이벤트안내</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/recr/sub01/hrsys/hrs01TabPage.do?s_mid=119"  class="depth" target="_self"><strong>채용정보</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/recr/sub01/hrsys/hrs01TabPage.do?s_mid=119"  class="depth" target="_self"><strong>정규채용</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/recr/sub01/hrsys/hrs01TabPage.do?s_mid=119"  class="depth" target="_self"><strong>인사제도</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/recr/sub01/system/sys01TabPage.do?s_mid=118"  class="depth" target="_self"><strong>채용제도</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/recr/sub01/recruitPage.do?s_mid=1306"  class="depth" target="_self"><strong>채용공고</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/recr/sub01/faqList.do?s_mid=120"  class="depth" target="_self"><strong>채용FAQ</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/recr/sub02/notiList.do?s_mid=123"  class="depth" target="_self"><strong>비정규채용</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/recr/sub02/notiList.do?s_mid=123"  class="depth" target="_self"><strong>채용공고</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/news/repoList.do?brdId=KO26&s_mid=36"  class="depth" target="_self"><strong>뉴스룸</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/news/repoList.do?brdId=KO26&s_mid=36"  class="depth" target="_self"><strong>보도자료</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/news/nletter/nletterList.do?s_mid=37&type=K"  class="depth" target="_self"><strong>뉴스레터</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/news/busiCardList.do?brdId=KO74&s_mid=1667"  class="depth" target="_self"><strong>카드뉴스</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/news/sub03/mediaList.do?s_mid=112&s_cateId=MO02"  class="depth" target="_self"><strong>동영상뉴스</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/news/sub03/sub01/webzList.do?s_mid=231"  class="depth" target="_self"><strong>홍보광장</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/news/sub03/sub01/webzList.do?s_mid=231"  class="depth" target="_self"><strong>사보</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/news/sub03/videoList.do?s_cateId=MO01&s_mid=1619"  class="depth" target="_self"><strong>영상자료</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/news/sub03/sub01/landList.do?s_mid=113"  class="depth" target="_self"><strong>인쇄자료</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/news/sub03/musicPage.do?s_mid=115"  class="depth" target="_self"><strong>홍보음악</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/news/bannerList.do?s_mid=1125&type=A"  class="depth" target="_self"><strong>배너존</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/news/bannerList.do?s_mid=1125&type=A"  class="depth" target="_self"><strong>알림</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/news/bannerList.do?s_mid=1653&type=B"  class="depth" target="_self"><strong>공유</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					<li class="menu4">
					<a href="/busi/introBusiPage.do?s_mid=9" class="depth">주요사업</a>
					
					
					
					
					
					<ul class="menuBox group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/busi/introWaterCirclePage.do?s_mid=1711"  class="depth" target="_self"><strong>Water Circle</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/busi/sub02/controloutlinePage.do?s_mid=1509"  class="depth" target="_self"><strong>물관리사업</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/busi/sub02/outlinePage.do?s_mid=1515"  class="depth" target="_self"><strong>건강한물공급사업</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/busi/introWaterValuePage.do?s_mid=1712"  class="depth" target="_self"><strong>Water Value</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/busi/futu01Page.do?s_mid=1520"  class="depth" target="_self"><strong>수변사업</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/busi/rene06Page.do?s_mid=28"  class="depth" target="_self"><strong>청정에너지사업</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/busi/introWaterPlatformPage.do?s_mid=1713"  class="depth" target="_self"><strong>Water Platform</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/busi/glob01Page.do?s_mid=1525"  class="depth" target="_self"><strong>해외사업</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/cust/sub04/sub04/wsupportPage.do?s_mid=1670"  class="depth" target="_self"><strong>물산업지원센터</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="http://www.water.or.kr/sharedgrowth/sharedsupport/main.do?s_mid=1714"  class="depth" target="_blank" title="새창으로 이동"><strong>동반성장</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					<li class="menu5">
					<a href="/water/sub01/sub02/purpPage.do?s_mid=237" class="depth">기관소개</a>
					
					
					
					
					
					<ul class="menuBox group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub01/sub02/purpPage.do?s_mid=237"  class="depth" target="_self"><strong>일반현황</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub01/sub01/greePage.do?s_mid=234"  class="depth" target="_self"><strong>CEO</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub01/sub05/contact.do?s_mid=247"  class="depth" target="_self"><strong>조직 및 연락처</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub01/sub05/contact.do?s_mid=247"  class="depth" target="_self"><strong>조직도</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub01/sub05/000/center.do?brdId=KO27&s_flag=1&s_mid=248&s_officecode=000"  class="depth" target="_self"><strong>부서 안내</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub01/sub06/explPage.do?s_mid=129"  class="depth" target="_self"><strong>CI</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub01/sub07/runn.do?s_mid=251&seq=1"  class="depth" target="_self"><strong>선수단</strong></a>
					
							
					
					
					
					<ul class="group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub01/sub07/runn.do?s_mid=251&seq=1"  class="depth" target="_self"><strong>선수단소개</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub01/sub07/tnewList.do?brdId=KO31&s_mid=252"  class="depth" target="_self"><strong>선수단소식</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/water/sub01/sub09/contact.do?s_mid=132"  class="depth" target="_self"><strong>찾아오시는길</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					
					
					
					
					
					
					
					
					
					<li class="menu6">
					<a href="/guid/sitemapPage.do?s_mid=1710" class="depth">사이트안내</a>
					
					
					
					
					
					<ul class="menuBox group">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/guid/sitemapPage.do?s_mid=1710"  class="depth" target="_self"><strong>사이트맵</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<li>		
					<a href="/guid/infoV99Page.do?s_mid=1560"  class="depth" target="_self"><strong>개인정보처리방침</strong></a>
					
					
					</li>
							
					
					
					
					
					
					
					
					
					
					
					
					</ul>
					</li>
					
					
					
				</ul>
				 
			</nav>
		</div>		
	</div>
	<!-- //gnb ul -->
	
	
	<script type="text/javascript">
		function fn_TopSearch() {
			var f = document.topSearchForm;
			if (f) {
				f.searchTerm.value = f.searchTerm.value.replace(/^\s+|\s+$/g,"");
				if (f.searchTerm.value == "") { // 검색어 체크
					alert("검색어를 입력 해주세요.");
					f.searchTerm.focus();
					return;
				}
				var wWidth = $(window).width();
				var wHeight = $(window).height();
				var shape = "width=" + wWidth + ", height=" + wHeight;
				shape = shape + ",scrollbars=yes,toolbar=yes,location=yes,resizable=yes,status=yes,menubar=yes,resizable=yes";
				/* var srchWin = window.open("","homesrchkor",shape); */
				f.target = "homesrchkor";
				f.submit();
			}
		}
		/*
		 * 엔터 기능
		 */
		function fn_TopEnter() {
			var key = event.keyCode;
			if (key == 13) {
				fn_TopSearch();
			}
		}
	</script>
	<div class="totalsearch">
		<a href="#link" class="btn"><span>검색열기</span></a>
		<form name="topSearchForm" action="http://www.kwater.or.kr/search/TotalSearchKor.do" method="post" onsubmit="return false;" >
			<div>
				<label for="totalSearchInp" class="hidden">통합검색</label>
				<input type="text" name="searchTerm" id="totalSearchInp" class="input_val" value="검색어를 입력하세요." onfocus="this.value=''"/>
				<input type="submit" value="검색" onclick="fn_TopSearch();"/>
			</div>
		</form>
	</div>
	<div id="blind_mob"></div>  
</div>
<!-- 20160705 header :E -->
		
<div id="sVisual">
	<div class="inner"></div>
</div>


		<div id="container">
		<div class="inner group">
			








<div id="lnb">
	<h2 class="h2"><a href="/news/sub01/noti01List.do?s_mid=105&brdId=KO27" >새소식</a></h2>
	<ul class="lnb group">
	
		
		
		
			
		
		<li><a href="/news/sub01/noti01List.do?s_mid=105&brdId=KO27" target="_self">게시판<b></b></a>
		
		
		
		
		
		
			<ul class="group">
		
		
		
		
			
			
				
			
		
		
		
	
		
		
		
			
		
		<li><a href="/news/sub01/noti01List.do?s_mid=105&brdId=KO27" target="_self">공지사항</a>
		
		
		
		</li>
		
		
		
		
		
		
		
			
			
				
			
		
		
		
	
		
		
		
			
		
		<li><a href="/news/event/eventList.do?type=C&notiYn=Y&s_mid=1678" target="_self">이벤트안내</a>
		
		
		
		</li>
		
		
		
		
		
		
		
			
			
				
			
		
		
		
			</ul>
			</li>
		
		
		
	
		
		
		
			
		
		<li><a href="/recr/sub01/hrsys/hrs01TabPage.do?s_mid=119" target="_self">채용정보<b></b></a>
		
		
		
		
		
		
			<ul class="group">
		
		
		
		
			
			
				
			
		
		
		
	
		
		
		
			
		
		<li><a href="/recr/sub01/hrsys/hrs01TabPage.do?s_mid=119" target="_self">정규채용<b></b></a>
		
		
		
		
		
		
			<ul class="group">
		
		
		
		
			
			
				
			
		
		
		
	
		
		
		
			
		
		<li><a href="/recr/sub01/hrsys/hrs01TabPage.do?s_mid=119" target="_self">인사제도</a>
		
		
		
		</li>
		
		
		
		
		
		
		
			
			
				
			
		
		
		
	
		
		
		
			
		
		<li><a href="/recr/sub01/system/sys01TabPage.do?s_mid=118" target="_self">채용제도</a>
		
		
		
		</li>
		
		
		
		
		
		
		
			
			
				
			
		
		
		
	
		
		
		
			
		
		<li><a href="/recr/sub01/recruitPage.do?s_mid=1306" target="_self">채용공고</a>
		
		
		
		</li>
		
		
		
		
		
		
		
			
			
				
			
		
		
		
	
		
		
		
			
		
		<li><a href="/recr/sub01/faqList.do?s_mid=120" target="_self">채용FAQ</a>
		
		
		
		</li>
		
		
		
		
		
		
		
			
			
				
			
		
		
		
			</ul>
			</li>
		
		
		
	
		
		
		
			
		
		<li><a href="/recr/sub02/notiList.do?s_mid=123" target="_self">비정규채용<b></b></a>
		
		
		
		
		
		
			<ul class="group">
		
		
		
		
			
			
				
			
		
		
		
	
		
		
		
			
		
		<li><a href="/recr/sub02/notiList.do?s_mid=123" target="_self">채용공고</a>
		
		
		
		</li>
		
		
		
		
		
		
		
			
			
				
			
		
		
		
			</ul>
			</li>
		
			</ul>
			</li>
		
		
		
	
		
		
		
			
		
		<li><a href="/news/repoList.do?brdId=KO26&s_mid=36" target="_self">뉴스룸<b></b></a>
		
		
		
		
		
		
			<ul class="group">
		
		
		
		
			
			
				
			
		
		
		
	
		
		
		
			
		
		<li><a href="/news/repoList.do?brdId=KO26&s_mid=36" target="_self">보도자료</a>
		
		
		
		</li>
		
		
		
		
		
		
		
			
			
				
			
		
		
		
	
		
		
		
			
		
		<li><a href="/news/nletter/nletterList.do?s_mid=37&type=K" target="_self">뉴스레터</a>
		
		
		
		</li>
		
		
		
		
		
		
		
			
			
				
			
		
		
		
	
		
		
		
			
		
		<li><a href="/news/busiCardList.do?brdId=KO74&s_mid=1667" target="_self">카드뉴스</a>
		
		
		
		</li>
		
		
		
		
		
		
		
			
			
				
			
		
		
		
	
		
		
		
			
		
		<li><a href="/news/sub03/mediaList.do?s_mid=112&s_cateId=MO02" target="_self">동영상뉴스</a>
		
		
		
		</li>
		
		
		
		
		
		
		
			
			
				
			
		
		
		
			</ul>
			</li>
		
		
		
	
		
		
		
			
		
		<li><a href="/news/sub03/sub01/webzList.do?s_mid=231" target="_self">홍보광장<b></b></a>
		
		
		
		
		
		
			<ul class="group">
		
		
		
		
			
			
				
			
		
		
		
	
		
		
		
			
		
		<li><a href="/news/sub03/sub01/webzList.do?s_mid=231" target="_self">사보</a>
		
		
		
		</li>
		
		
		
		
		
		
		
			
			
				
			
		
		
		
	
		
		
		
			
		
		<li><a href="/news/sub03/videoList.do?s_cateId=MO01&s_mid=1619" target="_self">영상자료</a>
		
		
		
		</li>
		
		
		
		
		
		
		
			
			
				
			
		
		
		
	
		
		
		
			
		
		<li><a href="/news/sub03/sub01/landList.do?s_mid=113" target="_self">인쇄자료</a>
		
		
		
		</li>
		
		
		
		
		
		
		
			
			
				
			
		
		
		
	
		
		
		
			
		
		<li><a href="/news/sub03/musicPage.do?s_mid=115" target="_self">홍보음악</a>
		
		
		
		</li>
		
		
		
		
		
		
		
			
			
				
			
		
		
		
			</ul>
			</li>
		
		
		
	
		
		
		
			
		
		<li><a href="/news/bannerList.do?s_mid=1125&type=A" target="_self">배너존<b></b></a>
		
		
		
		
		
		
			<ul class="group">
		
		
		
		
			
			
				
			
		
		
		
	
		
		
		
			
		
		<li><a href="/news/bannerList.do?s_mid=1125&type=A" target="_self">알림</a>
		
		
		
		</li>
		
		
		
		
		
		
		
			
			
				
			
		
		
		
	
		
		
		
			
		
		<li><a href="/news/bannerList.do?s_mid=1653&type=B" target="_self">공유</a>
		
		
		
		</li>
		
		
		
		
		
		
		
			
				
			
			
		
		
		
			</ul>
			</li>
		
		
		
	
	</ul>
	
</div><!-- //lnb -->



			<div id="contents">
				<div class="path"><span>HOME</span><b></b><span class="depth01">새소식</span><b></b><span class="depth02">게시판</span><b></b><strong>공지사항</strong></div>
				<h1 class="h1">공지사항</h1>

				<div class="conInner">
					<div class="group">
						<div class="tableTotalNum mobileOff">
							<p>총 게시물 <span class="orangePoint">258</span>건</p>
						</div>
						<div class="alignBox mobileOff">
							<strong>정렬</strong>
								<a href="#this" class="orderByForm SEQ">등록순</a>
								<a href="#this" class="orderByForm HITS">조회순</a>
						</div>
					</div>

					<!-- 웹 리스트 -->
					<table class="listTable mobileOff">
					<caption>새소식 공지사항 목록으로 번호, 구분, 제목, 첨부파일, 작성자, 작성일, 조회수를 보여줌</caption>
					<colgroup>
						<col width="10.91%" />
						<col width="6.09%" />
						<col width="15%" />
						<col width="*" />
						<col width="7.45%" />
						<col width="13.43%" />
						<col width="10%" />
						<col width="11.96%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">구분</th>
							<th scope="col">부서</th>
							<th scope="col">제목</th>
							<th scope="col">첨부파일</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>

				
				
					<tr>
					
					
					
						<td>258</td>
					

						<td>
						
							
							
							
							
								기타
							
						
						</td>
						<td>K-water교육원</td>
						<td class="taLeft28">
							<a href="/news/sub01/noti01View.do?seq=84814&brdId=KO27&orderByField=&orderByDirection=&s_mid=105" title="2016 대한민국 행복교육박람회 유공자 교육부장관 표창 후보자 공개검증">
								2016 대한민국 행복교육박람회 유공자 교육부...
							</a>
							
								<span class="txNew"><img src="/web/images/list/ico_new.gif" alt="새로운 글" /></span>
							
						</td>
						<td>
						
							<img src="/web/images/list/file.gif" alt="첨부파일" />
						
						</td>
						<td>
							
							
								<a href="mailto:kwtgid@kwater.or.kr" alt="email">이주환</a>
							
						</td>
						<td>2016-11-29</td>
						<td>16</td>
					</tr>
				
					<tr>
					
					
					
						<td>257</td>
					

						<td>
						
							
							
							
							
								기타
							
						
						</td>
						<td>금산권관리단</td>
						<td class="taLeft28">
							<a href="/news/sub01/noti01View.do?seq=84794&brdId=KO27&orderByField=&orderByDirection=&s_mid=105" title="2016년 11월 금산정수장 정수 및 수도꼭지 수질검사 결과 알림">
								2016년 11월 금산정수장 정수 및 수도꼭지...
							</a>
							
								<span class="txNew"><img src="/web/images/list/ico_new.gif" alt="새로운 글" /></span>
							
						</td>
						<td>
						
							<img src="/web/images/list/file.gif" alt="첨부파일" />
						
						</td>
						<td>
							
							
								<a href="mailto:klyw5384@kwater.or.kr" alt="email">이유완</a>
							
						</td>
						<td>2016-11-29</td>
						<td>8</td>
					</tr>
				
					<tr>
					
					
					
						<td>256</td>
					

						<td>
						
							
							
							
							
								기타
							
						
						</td>
						<td>경남서부권관리단</td>
						<td class="taLeft28">
							<a href="/news/sub01/noti01View.do?seq=84774&brdId=KO27&orderByField=&orderByDirection=&s_mid=105" title="2016년 11월 사천시 상수도 수질 검사 결과 공고">
								2016년 11월 사천시 상수도 수질 검사 결...
							</a>
							
								<span class="txNew"><img src="/web/images/list/ico_new.gif" alt="새로운 글" /></span>
							
						</td>
						<td>
						
							<img src="/web/images/list/file.gif" alt="첨부파일" />
						
						</td>
						<td>
							
							
								<a href="mailto:ky4509@partner.kwater.or.kr" alt="email">김미영</a>
							
						</td>
						<td>2016-11-29</td>
						<td>37</td>
					</tr>
				
					<tr>
					
					
					
						<td>255</td>
					

						<td>
						
							
							
							
							
								기타
							
						
						</td>
						<td>충청지역본부</td>
						<td class="taLeft28">
							<a href="/news/sub01/noti01View.do?seq=84734&brdId=KO27&orderByField=&orderByDirection=&s_mid=105" title="2016년 11월 논산시 상수도 수질검사 결과 안내해 드립니다.">
								2016년 11월 논산시 상수도 수질검사 결과...
							</a>
							
								<span class="txNew"><img src="/web/images/list/ico_new.gif" alt="새로운 글" /></span>
							
						</td>
						<td>
						
							<img src="/web/images/list/file.gif" alt="첨부파일" />
						
						</td>
						<td>
							
							
								<a href="mailto:s080722@kwater.or.kr" alt="email">이선옥</a>
							
						</td>
						<td>2016-11-28</td>
						<td>75</td>
					</tr>
				
					<tr>
					
					
					
						<td>254</td>
					

						<td>
						
							
							
							
							
								기타
							
						
						</td>
						<td>경남서부권관리단</td>
						<td class="taLeft28">
							<a href="/news/sub01/noti01View.do?seq=84714&brdId=KO27&orderByField=&orderByDirection=&s_mid=105" title="(고성수도센터) 2016년 11월 수질검사 결과 안내">
								(고성수도센터) 2016년 11월 수질검사 결...
							</a>
							
						</td>
						<td>
						
							<img src="/web/images/list/file.gif" alt="첨부파일" />
						
						</td>
						<td>
							
							
								<a href="mailto:sjlee2@kwater.or.kr" alt="email">이성준</a>
							
						</td>
						<td>2016-11-25</td>
						<td>81</td>
					</tr>
				
					<tr>
					
					
					
						<td>253</td>
					

						<td>
						
							
							
							
							
								기타
							
						
						</td>
						<td>본사</td>
						<td class="taLeft28">
							<a href="/news/sub01/noti01View.do?seq=84676&brdId=KO27&orderByField=&orderByDirection=&s_mid=105" title="[K-water연구원] 위촉연구직 1차전형(서류합격자) 발표">
								[K-water연구원] 위촉연구직 1차전형(서...
							</a>
							
						</td>
						<td>
						
							<img src="/web/images/list/file.gif" alt="첨부파일" />
						
						</td>
						<td>
							
							
								<a href="mailto:ff0604@kwater.or.kr" alt="email">이종현</a>
							
						</td>
						<td>2016-11-25</td>
						<td>97</td>
					</tr>
				
					<tr>
					
					
					
						<td>252</td>
					

						<td>
						
							
							
							
								보상
							
							
						
						</td>
						<td>수도권수도건설단</td>
						<td class="taLeft28">
							<a href="/news/sub01/noti01View.do?seq=84654&brdId=KO27&orderByField=&orderByDirection=&s_mid=105" title="한강하류권(3차)급수체계 조정사업(본구간) 편입토지 등 보상계획 공고">
								한강하류권(3차)급수체계 조정사업(본구간) 편...
							</a>
							
						</td>
						<td>
						
							<img src="/web/images/list/file.gif" alt="첨부파일" />
						
						</td>
						<td>
							
							
								<a href="mailto:donghoon@kwater.or.kr" alt="email">한동훈</a>
							
						</td>
						<td>2016-11-24</td>
						<td>109</td>
					</tr>
				
					<tr>
					
					
					
						<td>251</td>
					

						<td>
						
							
							
							
							
								기타
							
						
						</td>
						<td>보령권관리단</td>
						<td class="taLeft28">
							<a href="/news/sub01/noti01View.do?seq=84634&brdId=KO27&orderByField=&orderByDirection=&s_mid=105" title="보령댐 방호능력 제고를 위한 CCTV 설치에 따른 행정예고">
								보령댐 방호능력 제고를 위한 CCTV 설치에 ...
							</a>
							
						</td>
						<td>
						
							<img src="/web/images/list/file.gif" alt="첨부파일" />
						
						</td>
						<td>
							
							
								<a href="mailto:jywtweety@kwater.or.kr" alt="email">정예원</a>
							
						</td>
						<td>2016-11-24</td>
						<td>63</td>
					</tr>
				
					<tr>
					
					
					
						<td>250</td>
					

						<td>
						
							
							
							
							
								기타
							
						
						</td>
						<td>금산권관리단</td>
						<td class="taLeft28">
							<a href="/news/sub01/noti01View.do?seq=84537&brdId=KO27&orderByField=&orderByDirection=&s_mid=105" title="2016년 10월 금산정수장 정수 및 수도꼭지 수질검사 결과알림">
								2016년 10월 금산정수장 정수 및 수도꼭지...
							</a>
							
						</td>
						<td>
						
							<img src="/web/images/list/file.gif" alt="첨부파일" />
						
						</td>
						<td>
							
							
								<a href="mailto:klyw5384@kwater.or.kr" alt="email">이유완</a>
							
						</td>
						<td>2016-11-23</td>
						<td>122</td>
					</tr>
				
					<tr>
					
					
					
						<td>249</td>
					

						<td>
						
							
							
							
							
								기타
							
						
						</td>
						<td>금산권관리단</td>
						<td class="taLeft28">
							<a href="/news/sub01/noti01View.do?seq=84536&brdId=KO27&orderByField=&orderByDirection=&s_mid=105" title="2016년 9월 금산정수장 정수 및 수도꼭지,급수과정별 수질검사 결과알림">
								2016년 9월 금산정수장 정수 및 수도꼭지,...
							</a>
							
						</td>
						<td>
						
							<img src="/web/images/list/file.gif" alt="첨부파일" />
						
						</td>
						<td>
							
							
								<a href="mailto:klyw5384@kwater.or.kr" alt="email">이유완</a>
							
						</td>
						<td>2016-11-23</td>
						<td>70</td>
					</tr>
				
				


					</tbody>
					</table>
					<!-- //웹 리스트 -->


					
					

					<!-- 모바일 리스트 -->
					<div class="listMobile mobileOn">
						<ul>
							<!-- 모바일 리스트 6개씩 뿌립니다 -->
							
							<li>
								<div class="group">
								
									<div class="th02">
										<p class="txPoint01">
						
							
							
							
							
								기타
							
						
										</p>
										<p>
											<a href="/news/sub01/noti01View.do?seq=84814&brdId=KO27&mobileYn=Y&orderByField=&orderByDirection=&s_mid=105" title="2016 대한민국 행복교육박람회 유공자 교육부장관 표창 후보자 공개검증">
												2016 대한민국 행복교육박람회 유공자 교육부장관 표창...
											</a>
										
											<span class="txNew"><img src="/web/images/list/ico_new.gif" alt="새로운 글" /></span>
										
										</p>
									</div>
								</div>
								<div>
									<span class="sName">이주환</span>
								
									<span class="sName"><img src="/web/images/list/file.gif" alt="첨부파일" /></span>
								
									<span class="sName">2016-11-29</span>
									<span>조회수 </span><span>16</span>
								</div>
							</li>
							
							<li>
								<div class="group">
								
									<div class="th02">
										<p class="txPoint01">
						
							
							
							
							
								기타
							
						
										</p>
										<p>
											<a href="/news/sub01/noti01View.do?seq=84794&brdId=KO27&mobileYn=Y&orderByField=&orderByDirection=&s_mid=105" title="2016년 11월 금산정수장 정수 및 수도꼭지 수질검사 결과 알림">
												2016년 11월 금산정수장 정수 및 수도꼭지 수질검사...
											</a>
										
											<span class="txNew"><img src="/web/images/list/ico_new.gif" alt="새로운 글" /></span>
										
										</p>
									</div>
								</div>
								<div>
									<span class="sName">이유완</span>
								
									<span class="sName"><img src="/web/images/list/file.gif" alt="첨부파일" /></span>
								
									<span class="sName">2016-11-29</span>
									<span>조회수 </span><span>8</span>
								</div>
							</li>
							
							<li>
								<div class="group">
								
									<div class="th02">
										<p class="txPoint01">
						
							
							
							
							
								기타
							
						
										</p>
										<p>
											<a href="/news/sub01/noti01View.do?seq=84774&brdId=KO27&mobileYn=Y&orderByField=&orderByDirection=&s_mid=105" title="2016년 11월 사천시 상수도 수질 검사 결과 공고">
												2016년 11월 사천시 상수도 수질 검사 결과 공고
											</a>
										
											<span class="txNew"><img src="/web/images/list/ico_new.gif" alt="새로운 글" /></span>
										
										</p>
									</div>
								</div>
								<div>
									<span class="sName">김미영</span>
								
									<span class="sName"><img src="/web/images/list/file.gif" alt="첨부파일" /></span>
								
									<span class="sName">2016-11-29</span>
									<span>조회수 </span><span>37</span>
								</div>
							</li>
							
							<li>
								<div class="group">
								
									<div class="th02">
										<p class="txPoint01">
						
							
							
							
							
								기타
							
						
										</p>
										<p>
											<a href="/news/sub01/noti01View.do?seq=84734&brdId=KO27&mobileYn=Y&orderByField=&orderByDirection=&s_mid=105" title="2016년 11월 논산시 상수도 수질검사 결과 안내해 드립니다.">
												2016년 11월 논산시 상수도 수질검사 결과 안내해 ...
											</a>
										
											<span class="txNew"><img src="/web/images/list/ico_new.gif" alt="새로운 글" /></span>
										
										</p>
									</div>
								</div>
								<div>
									<span class="sName">이선옥</span>
								
									<span class="sName"><img src="/web/images/list/file.gif" alt="첨부파일" /></span>
								
									<span class="sName">2016-11-28</span>
									<span>조회수 </span><span>75</span>
								</div>
							</li>
							
							<li>
								<div class="group">
								
									<div class="th02">
										<p class="txPoint01">
						
							
							
							
							
								기타
							
						
										</p>
										<p>
											<a href="/news/sub01/noti01View.do?seq=84714&brdId=KO27&mobileYn=Y&orderByField=&orderByDirection=&s_mid=105" title="(고성수도센터) 2016년 11월 수질검사 결과 안내">
												(고성수도센터) 2016년 11월 수질검사 결과 안내
											</a>
										
										</p>
									</div>
								</div>
								<div>
									<span class="sName">이성준</span>
								
									<span class="sName"><img src="/web/images/list/file.gif" alt="첨부파일" /></span>
								
									<span class="sName">2016-11-25</span>
									<span>조회수 </span><span>81</span>
								</div>
							</li>
							
							<li>
								<div class="group">
								
									<div class="th02">
										<p class="txPoint01">
						
							
							
							
							
								기타
							
						
										</p>
										<p>
											<a href="/news/sub01/noti01View.do?seq=84676&brdId=KO27&mobileYn=Y&orderByField=&orderByDirection=&s_mid=105" title="[K-water연구원] 위촉연구직 1차전형(서류합격자) 발표">
												[K-water연구원] 위촉연구직 1차전형(서류합격자)...
											</a>
										
										</p>
									</div>
								</div>
								<div>
									<span class="sName">이종현</span>
								
									<span class="sName"><img src="/web/images/list/file.gif" alt="첨부파일" /></span>
								
									<span class="sName">2016-11-25</span>
									<span>조회수 </span><span>97</span>
								</div>
							</li>
							
							
							<!-- //모바일 리스트 6개씩 뿌립니다 -->
						</ul>
					</div>
					<!-- //모바일 리스트 -->




						<!-- #paging area start -->
						<div class="numBox mobileOff">
							<div class="list-page-num">
								<span style='font-weight:bold' class='on'>1</span><a href="?pageNo=2&amp;orderByField=&amp;orderByDirection=&amp;brdId=KO27&amp;s_mid=105" title="2 페이지로 이동합니다.">2</a><a href="?pageNo=3&amp;orderByField=&amp;orderByDirection=&amp;brdId=KO27&amp;s_mid=105" title="3 페이지로 이동합니다.">3</a><a href="?pageNo=4&amp;orderByField=&amp;orderByDirection=&amp;brdId=KO27&amp;s_mid=105" title="4 페이지로 이동합니다.">4</a><a href="?pageNo=5&amp;orderByField=&amp;orderByDirection=&amp;brdId=KO27&amp;s_mid=105" title="5 페이지로 이동합니다.">5</a><a href="?pageNo=6&amp;orderByField=&amp;orderByDirection=&amp;brdId=KO27&amp;s_mid=105" title="6 페이지로 이동합니다.">6</a><a href="?pageNo=7&amp;orderByField=&amp;orderByDirection=&amp;brdId=KO27&amp;s_mid=105" title="7 페이지로 이동합니다.">7</a><a href="?pageNo=8&amp;orderByField=&amp;orderByDirection=&amp;brdId=KO27&amp;s_mid=105" title="8 페이지로 이동합니다.">8</a><a href="?pageNo=9&amp;orderByField=&amp;orderByDirection=&amp;brdId=KO27&amp;s_mid=105" title="9 페이지로 이동합니다.">9</a>&nbsp;<a href="?pageNo=10&amp;orderByField=&amp;orderByDirection=&amp;brdId=KO27&amp;s_mid=105" title="10 페이지로 이동합니다.">10</a><a class='BtnNext1' href="?pageNo=11&amp;orderByField=&amp;orderByDirection=&amp;brdId=KO27&amp;s_mid=105" title="11 페이지로 이동합니다.">&nbsp;</a>&nbsp;<a class='BtnNext2' href="?pageNo=26&amp;orderByField=&amp;orderByDirection=&amp;brdId=KO27&amp;s_mid=105" title="26 페이지로 이동합니다.">&nbsp;</a>
							</div>
							<table>
								<tbody id='numBoxTb'></tbody>
							</table>
						</div>

						<div class="mobileNumBox mobileOn">
							<div class="list-page-num">
								<span style='font-weight:bold' class='on'>1</span><a href="?mobileYn=Y&amp;pageNo=2&amp;orderByField=&amp;orderByDirection=&amp;brdId=KO27&amp;s_mid=105" title="2 페이지로 이동합니다.">2</a><a href="?mobileYn=Y&amp;pageNo=3&amp;orderByField=&amp;orderByDirection=&amp;brdId=KO27&amp;s_mid=105" title="3 페이지로 이동합니다.">3</a><a href="?mobileYn=Y&amp;pageNo=4&amp;orderByField=&amp;orderByDirection=&amp;brdId=KO27&amp;s_mid=105" title="4 페이지로 이동합니다.">4</a>&nbsp;<a href="?mobileYn=Y&amp;pageNo=5&amp;orderByField=&amp;orderByDirection=&amp;brdId=KO27&amp;s_mid=105" title="5 페이지로 이동합니다.">5</a><a class='BtnNext1' href="?mobileYn=Y&amp;pageNo=6&amp;orderByField=&amp;orderByDirection=&amp;brdId=KO27&amp;s_mid=105" title="6 페이지로 이동합니다.">&nbsp;</a>&nbsp;<a class='BtnNext2' href="?mobileYn=Y&amp;pageNo=43&amp;orderByField=&amp;orderByDirection=&amp;brdId=KO27&amp;s_mid=105" title="43 페이지로 이동합니다.">&nbsp;</a>
							</div>
							<table>
								<tbody id='mobileNumBoxTb'></tbody>
							</table>
						</div>
						<!-- @paging area end -->
						<!-- 검색 -->
						<div class="listSearchBox">
							<div class="inBox3 selHide" id="txBox3">
							<form id="homePortalBoardVO" class="orderByForm" action="?" method="POST">
								<input type="hidden" name="s_mid" value="105" />
								<input id="brdId" name="brdId" type="hidden" value="KO27"/>
								<input id="orderByField" name="orderByField" type="hidden" value="SEQ"/>
								<input id="orderByDirection" name="orderByDirection" type="hidden" value="DESC"/>
								<fieldset>
								<legend>공지사항검색 폼</legend>
								
								<div class="selBox3">
									<select id="s_type" name="s_type" title="검색 구분">
										<option value="all">전체</option>
										<option value="title">제목</option>
										<option value="type">구분</option>
										<option value="dept">부서</option>
										<option value="name">작성자</option>
										<option value="content">내용</option>
									</select>
									<select id="type" name="type" title="유형 검색" class="subSel">
										<option value="A">행사</option>

										<option value="C">보상</option>
										<option value="Z">기타</option>
									</select>									
								</div>
								<div class="txBox3">
									<input id="s_text" name="s_text" title="검색어 입력" type="text" value=""/>
									<input type="image" src="/web/images/list/btn_search02.gif" alt="검색" />
								</div>
								</fieldset>
							</form>
							</div>
						</div>
						<!-- //검색 -->

<!-- <div class="listSearchBox"> -->
<!--                   <div class="inBox3"> -->
<!--                   <form action=""> -->
<!--                      <fieldset> -->
<!--                      <legend>지식재산권 검색 폼</legend> -->
<!--                      <div class="selBox3"> -->
<!--                         <select name="" title="검색 구분"> -->
<!--                            <option value="#" selected="selected">전체</option> -->
<!--                            <option value="#">기타</option> -->
<!--                         </select> -->
<!--                         <select name="" title="상세 구분"> -->
<!--                            <option value="#" selected="selected">발명명칭</option> -->
<!--                            <option value="#">기타</option> -->
<!--                         </select> -->
<!--                      </div> -->
<!--                      <div class="txBox3"> -->
<!--                         <input type="text" name="" title="검색어 입력" value="검색어를 입력하세요."  /> -->
<!--                         <input type="image" src="/web/images/news/btn_search02.gif" alt="검색" /> -->
<!--                      </div> -->
<!--                      </fieldset> -->
					<!-- //검색 -->

				</div>
			</div><!-- //contents -->

		</div>
		</div><!-- //container -->

		






	
<br><br>

<div id="footer_2016"> 
	<div class="al_box">
		<ul class="footer_m">
			<li><a href="/guid/infoV99Page.do?s_mid=1560">개인정보처리방침</a></li>
			<li><a href="/guid/sitemapPage.do?s_mid=1710">사이트맵</a></li>

			<li><a href="/water/sub01/sub08/publList.do?s_mid=1016">직원광장</a></li>
			<li><a href="/water/sub01/sub09/contact.do?s_mid=132">찾아오시는길</a></li>
		</ul>
		<div class="certifi_mark">
			<a href="http://www.webwatch.or.kr/Situation/WA_Situation.html?MenuCD=110" target="_blank" title="새창이동"><img src="/web/images/comm/ico_main01.png" alt="미래창조과학부 WEB ACCESSIBILITY 마크(웹 접근성 품질인증 마크)" /></a>
			<img src="/web/images/comm/ico_main02.png" alt="Most Admired MAKE" />
			<img src="/web/images/comm/ico_main03.png" alt="ICSI" />
			<img src="/web/images/comm/ico_main04.png" alt="K-GWPI" />
			<img src="/web/images/comm/ico_main05.png" alt="Most Admired Cempanica" />
			<img src="/web/images/comm/ico_main07.gif" style="width:58px; height:58px; margin-top:6px;" alt="2015년도 정부3.0 우수기관" />	
			<img src="/web/images/comm/ico_main06.png" alt="http://www.kwater.or.kr/" />	
			
		</div>
		<address>우편번호 34350 대전광역시 대덕구 신탄진로 200 <span>대표전화 : 042- 629-3114</span><span class="call_main">고객센터 : 1577-0600</span></address>
		<p>copyright ⓒ K-water all rights reserved.</p>
	</div>
</div>
<div class="floating_top"><a href="#top"><span>맨위로</span></a></div> <!-- //footer -->

<script type="text/javascript" src="/web/js/action.js"></script>
<script type="text/javascript" src="/web/js/action02.js"></script>
<script type="text/javascript" src="/web/js/action03.js"></script>
<script type="text/javascript" src="/web/js/cust.js"></script>



<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-57089475-4', 'auto');
  ga('send', 'pageview');
</script>


<script type="text/javascript">
	function admLoginFnc() {
		/*
		document.admTemLogin.submit();
		setTimeout("document.admLogin.submit();",1000);
		*/
		document.admLogin.submit();
	}
</script>



<!--  웹필터 수정 -->


<!--  웹필터 수정 -->
	</div><!-- //wrap -->
</body>
</html>