package kr.or.ddit.websocket;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocketPushMessageHandler extends TextWebSocketHandler {
	@Resource(name="allWsSessions")
	private List<WebSocketSession> allWsSessions;


	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		allWsSessions.add(session); //연결된 세션 리스트에 추가
		
//		System.out.println("웹소켓푸시임 "+session.toString());
//		System.out.println("프린시퍼임 : "+session.getPrincipal().getName());
		
//		for(WebSocketSession singleSession : allWsSessions) {
//			System.out.println("접속자리스트 : "+singleSession.getPrincipal().getName());
//		}
	
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		allWsSessions.remove(session);//연결 끈어진 세션 리스트에서 제거
	}
}
