package kr.or.ddit.autumn.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.autumn.dao.MessageDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.MessageVO;

@Service
public class MessageServiceImpl implements MessageService {
	@Inject
	private MessageDAO dao;

	@Override
	public List<MessageVO> retrieveChatRoomList(String memId) {
		
		return dao.selectChatRoomList(memId);
	}

	@Override
	public List<MessageVO> retrieveMessageList(Integer roomId) {
		
		return dao.selectMessageList(roomId);
	}

	@Override
	public ServiceResult createMessage(MessageVO message) {
		
		ServiceResult result = null;
		
		 
		int rowcnt = dao.insertMessage(message);
		result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;

		return result;
	}

	@Override
	public ServiceResult removeMessage(Integer msgNo) {
		
		int rowcnt = dao.deleteMessage(msgNo);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}






}
