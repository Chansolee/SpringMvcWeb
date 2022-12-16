package kr.or.ddit.vo;

import java.util.Set;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Data
@EqualsAndHashCode(of = "msgNo")
@ToString
@Slf4j
public class MessageVO {
	
	private Integer msgNo;
	private String memId;
	private String msgCon;
	private Integer roomId;
	private String msgDay;
	
	private Set<ChatRoom2VO> chatRoomList;
}
