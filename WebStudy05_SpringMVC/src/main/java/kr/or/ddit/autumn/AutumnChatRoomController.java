package kr.or.ddit.autumn;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.WebSocketSession;

import kr.or.ddit.autumn.service.ChatRoomService;
import kr.or.ddit.autumn.service.MessageService;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.vo.ChatRoom2VO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MessageVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/autumn")
public class AutumnChatRoomController {
	private final MessageService messageService;
	private final ChatRoomService chatRoomService;
	private List<ChatRoom2VO> chatList;
	
	private final MemberService memberService;
	
	@Resource(name="allWsSessions")
	private List<WebSocketSession> allWsSessions;
	
	// 채팅방 뷰 
	// 여기서 application chatList를 줬음
	@GetMapping("/chatView.do")
	public String rooms(HttpServletRequest request, Model model) {
		
		ServletContext application = request.getServletContext();
		application.setAttribute("chatList", chatList);
		
		model.addAttribute("allWsSessions", allWsSessions);
		return "autumn/autumnChat";
	}
	
	//채팅방목록 가져오기
	@GetMapping(value="/chatRoomList.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<MessageVO> roomList(@RequestParam("memId") String memId,Model model) {
//		chatList = chatRoomService.retrieveChatRoomList(memId);
		List<MessageVO> messageList = messageService.retrieveChatRoomList(memId);
		
		model.addAttribute("allWsSessions", allWsSessions);
		return messageList;
	}
	
	  @GetMapping(value="/allMemberList.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	    @ResponseBody
	    public List<MemberVO> member(){
	    	List<MemberVO> memberList = memberService.allRetrieveMemberList();
	    	
	    	return memberList;
	    }
	  
	  
	  	@PostMapping(value="/insertChatRoom.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	    @ResponseBody
	    public ChatRoom2VO roomCreate(@RequestParam("memId[]") String[] memId){
	  		ChatRoom2VO room = new ChatRoom2VO();
	  		room.setRoomName("배열테스트");
      	    chatRoomService.createChatRoom(room);

      	    MessageVO message = new MessageVO();

	  		for(String mem : memId) {

	  			message.setMemId(mem);
	  			message.setRoomId(room.getRoomId());
	  		messageService.createMessage(message);
	  		
	  		}
	    	
	    	
	    	return room;
	    }

}