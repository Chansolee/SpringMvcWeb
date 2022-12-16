package kr.or.ddit.autumn.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.MessageVO;
import kr.or.ddit.vo.NotiVO;

public interface MessageService {

	public ServiceResult createMessage(MessageVO message);
//
//	public MessageVO retrieveMessage(Integer notNo);

	//채팅방 목록
	public List<MessageVO> retrieveChatRoomList(String memId);
	
	//예시) 1번방의 메세지목록
	public List<MessageVO> retrieveMessageList(Integer roomId);

	

	public ServiceResult removeMessage(Integer msgNo);
}
