<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap-notify.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script type="text/javascript">

	let url = "//localhost${pageContext.request.contextPath }/ws/pushMsg"
		
	let notiUrl = "//localhost${pageContext.request.contextPath }/nt/pushMsg"

	let sock = new SockJS(url);
	
	let notiSock = new SockJS(notiUrl);
	
	notiSock.onopen=function(event){
		console.log("알림연결수립=============");		
		console.log(event); //발생한 이벤트의 레퍼런스		
	}
	
	notiSock.onclose=function(event){ 
		console.log("=============알림연결종료");		
		console.log(event); 		
	}
	
	notiSock.onmessage=function(event){ 
		console.log("메시지 수신"+event.data);
		//넘어온 데이터 언먀살링하기
		let newNoti = JSON.parse(event.data);
		let memId = newNoti.memId; //수신자
		let sendmemId = newNoti.sendmemId; //발신자
		let sendmemName = newNoti.sendmemName; //발신자이름
		let notiMsg = "<a href=\"${pageContext.request.contextPath }/calendar/calendarList.do\">"+memId+"님! "+sendmemName+"님이 새로운 알림을 보냈습니다!"+"</a>";
		
		
		$.notify({
			// options
			title: "새글 알림"
			,message:notiMsg
		},{
			// settings
			type: "info"
		   ,placement:{
			   from:"bottom"
			  ,align:"right"
		   }
		});
	}
	
	
	
	
	
	
	
	
	
	
	
	sock.onopen=function(event){
		console.log("연결수립=============");		
		console.log(event); //발생한 이벤트의 레퍼런스		
	}
	
	sock.onclose=function(event){ 
		console.log("=============연결종료");		
		console.log(event); 		
	}
	
	sock.onmessage=function(event){ 
		console.log("메시지 수신"+event.data);
		//넘어온 데이터 언먀살링하기
		let newCalendar = JSON.parse(event.data);
		let id = newCalendar.testId;
		let userName = newCalendar.testUsername;
		let testMsg = "<a href=\"${pageContext.request.contextPath }/calendar/calendarList.do\">"+userName+"님의 새로운 업무일정"+"</a>";
		
		
		//toast 방식 <footer에 #msgStack를 만들어놨음>
		let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
	    toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
	    toast += "<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
	    toast += "<span aria-hidden='true'>&times;</span></button>";
	    toast += "</div> <div class='toast-body'>" + testMsg + "</div></div>";
	    $("#msgStack").append(toast);   // msgStack div에 생성한 toast 추가
	    $(".toast").toast({"animation": true, "autohide": false});
	    $('.toast').toast('show');
		
	    
		
		
		
// 	    <a href="javascript:void(window.open('주소', '팝업창 이름','width=#, height=#'))">

		let notiMsg = $("<a>").attr("href","${pageContext.request.contextPath }/calendar/calendarList.do")
							  .text(userName+"님의 새로운 업무일정");
		let testMsg1 = "<a href=\"javascript:void(window.open('${pageContext.request.contextPath }/chat/chat.do','채팅방','width=400px,height=500px,scrollbars=yes'))\">"+userName+"님의 새로운 업무일정"+"</a>";
		
		$.notify({
			// options
			title: "새글 알림"
			,message:testMsg1
		},{
			// settings
			type: "info"
		   ,placement:{
			   from:"bottom"
			  ,align:"right"
		   }
		});
	}
	sock.onerror=function(event){ 
		console.log("에러발생");		
		console.log(event); 			
	}
</script>