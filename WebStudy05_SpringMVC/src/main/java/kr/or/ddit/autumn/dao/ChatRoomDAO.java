package kr.or.ddit.autumn.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.ChatRoom2VO;

@Mapper
public interface ChatRoomDAO {
	
	
	public int insertChatRoom(ChatRoom2VO chatroom);

	public ChatRoom2VO selectChatRoom(Integer roomId);
	
	
	public List<ChatRoom2VO> selectChatRoomList(String memId);
	
	public int updateChatRoom(ChatRoom2VO chatroom);

	public int deleteChatRoom(@Param("roomId") Integer roomId);

}
