package kr.or.ddit.noti.event;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.vo.NotiVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class NotiEventListener {
	

	@Resource(name="otherWsSessions")
	private List<WebSocketSession> otherWsSessions;

	@EventListener(NewNotiEvent.class)
	public void newBoardEventListener(NewNotiEvent event) throws IOException {
		NotiVO newNoti = event.getSource();
		log.info("{} 가 작성한 새 알림, {} 한테 보냈음.", newNoti.getSendmemId(), newNoti.getMemId());
		
		ObjectMapper mapper = new ObjectMapper();
		//마샬링작업
		String jsonPayload = mapper.writeValueAsString(newNoti);
		TextMessage message = new TextMessage(jsonPayload);
		
		// WebSocket 연결이 수립되어 있는 모든 사용자에게 푸시 메시지 전송하기.
		
		for(WebSocketSession singleSession : otherWsSessions) {
			System.out.println(singleSession.getPrincipal().getName());
			String memId = singleSession.getPrincipal().getName();

			if(memId.equals(newNoti.getMemId())) {
				
			singleSession.sendMessage(message);
			}
		}
	}

}
