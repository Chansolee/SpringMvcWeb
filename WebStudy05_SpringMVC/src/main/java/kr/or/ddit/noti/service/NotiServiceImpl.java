package kr.or.ddit.noti.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.noti.dao.NotiDAO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.NotiVO;

@Service
public class NotiServiceImpl implements NotiService {
	@Inject
	private NotiDAO dao;
	
	@Inject
	private MemberService memberService;

	@Override
	public ServiceResult createNoti(NotiVO noti) {
		ServiceResult result = null;
		MemberVO member = memberService.retrieveMember(noti.getSendmemId());
		noti.setSendmemName(member.getMemName()); 
		int rowcnt = dao.insertNoti(noti);
		result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;

		return result;
	}

	@Override
	public NotiVO retrieveNoti(Integer notNo) {
		NotiVO noti = dao.selectNoti(notNo);
		if (noti == null)
			throw new RuntimeException("해당 알림 없음");
		return noti;
	}

	@Override
	public List<NotiVO> retrieveNotiList(String memId) {
		return dao.selectNotiList(memId);
	}

	@Override
	public ServiceResult modifyNoti(NotiVO noti) {
		retrieveNoti(noti.getNotNo());
		int rowcnt = dao.updateNoti(noti);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeNoti(NotiVO noti) {
		retrieveNoti(noti.getNotNo());
		int rowcnt = dao.deleteNoti(noti.getNotNo());
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

}
