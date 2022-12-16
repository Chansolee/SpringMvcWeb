package kr.or.ddit.noti.event;

import kr.or.ddit.vo.NotiVO;

public class NewNotiEvent {
	private NotiVO source;

	public NewNotiEvent(NotiVO source){
		this.source = source;
	}

	public NotiVO getSource() {
		return source;
	}
}
