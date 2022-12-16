package kr.or.ddit.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import kr.or.ddit.chat.service.ChatService;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.vo.ChatRoomVO;
import kr.or.ddit.vo.MemberVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/chat")
public class ChatRoomController {
	private final ChatService chatService;
	private List<ChatRoomVO> chatList;
	
	private final MemberService memberService;
	
	@Resource(name="allWsSessions")
	private List<WebSocketSession> allWsSessions;
	
	// 채팅방 뷰 
	// 여기서 application chatList를 줬음
	@GetMapping("/room.do")
	public String rooms(HttpServletRequest request, Model model) {
		chatList = chatService.findAllRoom();
		ServletContext application = request.getServletContext();
		application.setAttribute("chatList", chatList);
		
		model.addAttribute("allWsSessions", allWsSessions);
		return "chat/room";
	}

	@GetMapping("/bootchat.do")
	public String bootchat(HttpServletRequest request, Model model) {
		chatList = chatService.findAllRoom();
		ServletContext application = request.getServletContext();
		application.setAttribute("chatList", chatList);
		
		model.addAttribute("allWsSessions", allWsSessions);
		return "chat/bootchat";
	}
	
	// 채팅방 생성
	@PostMapping("/roomCreate.do")
	@ResponseBody
	public ChatRoomVO createRoom(@RequestParam String name, Model model) {
	
		ChatRoomVO room = chatService.createRoom(name);
		chatList.add(room);
//        model.addAttribute("room", room);
		for(int i=0; i<chatList.size(); i++) {
			System.out.println(chatList.get(i));
			}
		return room;
	}

	//채팅방에 입장하는 컨트롤러
	@GetMapping("/chat.do")
	public String view_chat3(@RequestParam("roomId") String roomId
							, @RequestParam("roomName") String roomName
							, Model model) {
		model.addAttribute("roomId", roomId);
		model.addAttribute("roomName", roomName);
		return "chat/echo";
	}

    // 모든 채팅방 목록 반환
    @GetMapping("/roomList.do")
    @ResponseBody
    public List<ChatRoomVO> room() {
        return chatService.findAllRoom();
    }
    
    @GetMapping(value="/allMemberList.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public List<MemberVO> member(){
    	List<MemberVO> memberList = memberService.allRetrieveMemberList();
    	
    	return memberList;
    }
    
    @GetMapping(value="/allWsMemberList.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Map<String,List<MemberVO>> memberWs(){
    	Map<String,List<MemberVO>> twoMember = new HashMap<>();
		List<MemberVO> wsMember = new ArrayList<>();
		
    	for(WebSocketSession singleSession : allWsSessions) {
		wsMember.add(memberService.retrieveMember(singleSession.getPrincipal().getName()));
	}
    	twoMember.put("wsMember", wsMember);
    	List<MemberVO> Allmember = memberService.allRetrieveMemberList();
    	twoMember.put("allMember", Allmember);
    	
    	return twoMember;
    }

}