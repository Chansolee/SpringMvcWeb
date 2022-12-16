package kr.or.ddit.websocket;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class NotiPushMessageHandler extends TextWebSocketHandler {
	
	
	@Resource(name="otherWsSessions")
	private List<WebSocketSession> otherWsSessions;

	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		if(session.getPrincipal().getName() != null) {
			System.out.println(session.getPrincipal().getName());
		otherWsSessions.add(session); //연결된 세션 리스트에 추가
		}else {
			System.out.println("없음");
		}
//		System.out.println("웹소켓푸시임 "+session.toString());
//		System.out.println("프린시퍼임 : "+session.getPrincipal().getName());
		
//		for(WebSocketSession singleSession : allWsSessions) {
//			System.out.println("접속자리스트 : "+singleSession.getPrincipal().getName());
//		}
	
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		otherWsSessions.remove(session);//연결 끈어진 세션 리스트에서 제거
		
	}
}
