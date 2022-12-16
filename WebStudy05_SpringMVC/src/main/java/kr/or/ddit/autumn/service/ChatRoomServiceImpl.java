package kr.or.ddit.autumn.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.autumn.dao.ChatRoomDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.vo.ChatRoom2VO;

@Service
public class ChatRoomServiceImpl implements ChatRoomService {
	@Inject
	private ChatRoomDAO dao;


	@Override
	public ServiceResult createChatRoom(ChatRoom2VO chatRoom) {
		ServiceResult result = null;
		
		 
		int rowcnt = dao.insertChatRoom(chatRoom);
		result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;

		return result;
	}

	@Override
	public ChatRoom2VO retrieveChatRoom(Integer roomId) {
		ChatRoom2VO chatroom = dao.selectChatRoom(roomId);
		if (chatroom == null)
			throw new RuntimeException("해당 채팅방 없음");
		return chatroom;
	}

	@Override
	public List<ChatRoom2VO> retrieveChatRoomList(String memId) {
		return dao.selectChatRoomList(memId);
	}

	@Override
	public ServiceResult modifyChatRoom(ChatRoom2VO chatRoom) {
		retrieveChatRoom(chatRoom.getRoomId());
		int rowcnt = dao.updateChatRoom(chatRoom);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeChatRoom(Integer roomId) {
		retrieveChatRoom(roomId);
		int rowcnt = dao.deleteChatRoom(roomId);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

}
