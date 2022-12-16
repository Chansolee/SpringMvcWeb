<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- 	<title>웹소켓 채팅</title> -->
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
	<script type="text/javascript">
		let webSocket = {
			init: function(param) {
				this._url = param.url;
				this._initSocket();
			},
			sendChat: function() {
				this._sendMessage($('#message').val());
				$('#message').val('');
			},
			receiveMessage: function(str) {
				$('#divChatData').append('<div>' + str + '</div>');	//대화를 화면에 계속 추가함			
			},
			closeMessage: function(str) {
				$('#divChatData').append('<div>' + '연결 끊김 : ' + str + '</div>'); 
			},
			disconnect: function() {
				this._socket.close();
			},
			_initSocket: function() {
				this._socket = new SockJS(this._url);
				this._socket.onmessage = function(evt) {  //어디서 보내든 evt에 담겨있음 여기가 커멘드센터 
					webSocket.receiveMessage(evt.data + "[test]"); // 담긴 메세지를 화면에 출력해주는 기능
				};
				this._socket.onclose = function(evt) {
					webSocket.closeMessage(evt.data);
				}
			},
			_sendMessage: function(str) {
				this._socket.send("${pageContext.request.userPrincipal.realUser.memName} : "+ str );
			}
		};
	</script>	
	<script type="text/javascript">
		$(document).ready(function() {
			webSocket.init({ url: '<c:url value="/chat" />' });			
		});
	</script>


	<div style="width: 350px; height: 450px; padding: 10px; border: solid 1px #e1e3e9;">
		<div id="divChatData"></div>
	</div>
	<div style="width: 350px; height: 10%; padding: 10px;">
		<input type="text" id="message" size="110" onkeypress="if(event.keyCode==13){webSocket.sendChat();}" />
<!-- 		onkeypress : 엔터로 메소드 호출 -->
		<input type="button" id="btnSend" value="채팅 전송" onclick="webSocket.sendChat()" />
	</div>
	

	

<!-- </body> -->
<!-- </html> -->