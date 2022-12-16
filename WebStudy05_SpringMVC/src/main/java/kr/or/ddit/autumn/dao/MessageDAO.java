package kr.or.ddit.autumn.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.MessageVO;


@Mapper
public interface MessageDAO {

	
	public int insertMessage(MessageVO message);

//	public MessageVO selectMessage(Integer roomId);
	
	public List<MessageVO> selectChatRoomList(String memId);
	
	public List<MessageVO> selectMessageList(Integer roomId);
	
	public int deleteMessage(@Param("msgNo") Integer msgNo);

}
