package kr.or.ddit.vo;

import java.util.Set;
import java.util.UUID;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ChatRoom2VO {
	private Integer roomId;
//    private String roomId;
    private String roomName;
    

//    public static ChatRoomVO create(String name) {
//        ChatRoomVO room = new ChatRoomVO();
//        room.roomId = UUID.randomUUID().toString();
//        room.roomName = name;
//        return room;
//    }
}