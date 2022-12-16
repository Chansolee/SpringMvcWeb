package kr.or.ddit.noti.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.NotiVO;

public interface NotiService {

	public ServiceResult createNoti(NotiVO noti);

	public NotiVO retrieveNoti(Integer notNo);

	public List<NotiVO> retrieveNotiList(String memId);

	public ServiceResult modifyNoti(NotiVO noti);

	public ServiceResult removeNoti(NotiVO noti);
}
