package kr.or.ddit.autumn.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.ChatRoom2VO;


public interface ChatRoomService {

	public ServiceResult createChatRoom(ChatRoom2VO chatRoom);

	public ChatRoom2VO retrieveChatRoom(Integer roomId);

	public List<ChatRoom2VO> retrieveChatRoomList(String memId);

	public ServiceResult modifyChatRoom(ChatRoom2VO chatRoom);

	public ServiceResult removeChatRoom(Integer roomId);
}
