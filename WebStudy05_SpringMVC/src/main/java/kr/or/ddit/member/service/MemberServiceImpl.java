package kr.or.ddit.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.UserNotFoundException;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.dao.MemberDAO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO dao;

	@Override
	public ServiceResult createMember(MemberVO member) {
		ServiceResult result = null;
		try {
			retrieveMember(member.getMemId());
			result = ServiceResult.PKDUPLICATED;
		} catch (UserNotFoundException e) {
			int rowcnt = dao.insertMember(member);
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}
		return result;
	}

	@Override
	public MemberVO retrieveMember(String memId) {
		MemberVO member = dao.selectMember(memId);
		if (member == null)
			throw new UserNotFoundException(memId);
		return member;
	}

	@Override
	public List<MemberVO> allRetrieveMemberList() {
		return dao.AllMemberList();
	}
	
	public int retrieveMemberCount(PagingVO pagingVO) {
		return dao.selectTotalRecord(pagingVO);

	}

	@Override
	public List<MemberVO> retrieveMemberList(PagingVO pagingVO) {
		return dao.selectMemberList(pagingVO);
	}
	
	

	@Override
	public ServiceResult modifyMember(MemberVO member) {
		retrieveMember(member.getMemId());
		int rowcnt = dao.updateMember(member);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeMember(MemberVO member) {
		retrieveMember(member.getMemId());
		int rowcnt = dao.deleteMember(member.getMemId());
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}
	
	@Override
	public ServiceResult logOutMember(String memId) {
		retrieveMember(memId);
		int rowcnt = dao.logoutMember(memId);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}
	

}
