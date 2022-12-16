package kr.or.ddit.chat.controller;

import java.security.Principal;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.Headers;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.WebApplicationContext;

import kr.or.ddit.vo.ChatRoomVO;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController // RestController를 붙이면, 컨트롤러 클래스 하위 메서드에 @ResponseBody 어노테이션을 붙이지 않아도 문자열과 JSON// 등을 전송가능
public class EchoMessageHandler {
	@Inject
	private SimpMessagingTemplate messagingTemplate;
	
	
	
	ChatRoomVO chatRoom = new ChatRoomVO();
	
	@Data
	public static class MessageVO {
		private String roomId;
		private String sender; // 보내는 자
		private String message; // 보내는 데이터
	}

	@MessageMapping("/handledEcho") // 클라이언트에서 handledEcho로 send하면 여기로 와서 메소드실행됨
//	@SendTo("/topic/echoed") // return되는 반환값을 여기 /topic/echoed를 구독 하는 공통 구독자들에게 브로드캐스팅 메시지를 전송할때 사용할 주소
	public void handler(@Payload MessageVO messageVO, @Header String id) {
		System.out.println("2");
		log.info("id header : {}", id);
		log.info("roomId : {}, sender : {}, message : {}",messageVO.getRoomId(), messageVO.getSender(), messageVO.getMessage());
//		return messageVO;
		
		messagingTemplate.convertAndSend("/topic/echoed/"+messageVO.getRoomId(), messageVO);
		//이부분에서 messageVO를 db에 인서트 때리면 되지 않을까?? 
	}

	// destination 이 /app/handledEcho 인 구독 요청에 대해 동작하며,
	// 한번의 요청에 한번의 응답만을 처리하게 됨.
	@SubscribeMapping("/handledEcho")
	public String subscribeHandler(@Headers Map<String, Object> headers
									,Principal principal
									) {
		log.info("headers : {}", headers);
		System.out.println(" 1");
		
		// subscription id 를 생성함.
		String sub_id = principal.getName();
		
//		String sub_id = "찬솔";
		return sub_id;
	}

	//=================================1대1==========================================
	

	@MessageMapping("/myProcess")
	@SendToUser("/queue/myProcessResult") // 접속 유저를 대상으로 한 push 메시지,
	public String handlerProcessResult(@Payload String message) {
		log.info("; message : {}", message);
		return message;
	}

	@MessageMapping("/DM")
	public void handlerDM(@Payload MessageVO body) {
		log.info("DM message : {}", body);
//		messagingTemplate.convertAndSendToUser(body.getReceiver(), "/queue/DM", body);

	}
}