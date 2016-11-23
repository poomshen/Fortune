	var wsocket;
	var msg 
	function connect() {
		alert("소켓연결!");
		wsocket = new WebSocket("ws://192.168.0.39:8090/fortune/chat-ws.htm");
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	
	}
	function disconnect() {
		wsocket.close();
	}
	function onOpen(evt) {
		
		appendMessage("연결되었습니다.");
	}
	function onMessage(evt) {
	
		alert("메세지"+evt.data);
	}
	function onClose(evt) {
		appendMessage("연결을 끊었습니다.");
	}
	
	function send() {
		var selectId="sungjun@gmail.com/mclee@gmail.com";
		console.log(msg);
		wsocket.send(selectId);
		
	}

	function appendMessage(msg) {
		console.log(msg);
	/* 	$("#chatMessageArea").append(msg+"\n");
		var chatAreaHeight = $("#chatArea").height();
		var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
		$("#chatArea").scrollTop(maxScroll); */
	}


		
	$(document).ready(function() {
		 msg = $('#total_select').val();
		
		/* 
		console.log(msg);
		if(msg!=null){send();};*/
		
	    $('#conn').click(function() { connect(); });
	    $('#send').click(function() {           
		  
		  $.ajax({
          url : 'ws.ajax',
          type : 'post',
          success : function(data) {
          
        	  
        	  send();
          		
          }
		 
		  });
		  
	  
	  });   	 
		$('#close').click(function() { disconnect(); }); 
	});

