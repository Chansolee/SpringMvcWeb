package kr.or.ddit.login.service;

import javax.inject.Inject;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.UserNotFoundException;
import kr.or.ddit.login.BadCredentialException;
import kr.or.ddit.member.dao.MemberDAO;
import kr.or.ddit.vo.MemberVO;


@Service
public class AuthenticationServiceImpl implements AuthenticationService {
	@Inject
	private MemberDAO dao;

	@Override
	public MemberVO autheticate(MemberVO inputData) {
		// 상품 전체 정보 + 분류명, 거래처명 + 상품 구매자목록(아이디, 구매자명, 지역, 이메일)
		MemberVO saved = dao.selectMember(inputData.getMemId());
		if (saved == null)
			throw new UserNotFoundException(inputData.getMemId());
		String inputPass = inputData.getMemPass();
		PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String encoded = encoder.encode(inputPass);
		String savedPass = saved.getMemPass();
		System.out.println(encoded);
		System.out.println(savedPass);
		if (encoder.matches(inputPass, savedPass)) {
			
			return saved;
		} else {
			throw new BadCredentialException("비밀번호 오류");
		}

//		String password = "java";
//		PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
//		String encoded = encoder.encode(inputPass);
//		System.out.println(encoded);
//		
//		String saved = "{bcrypt}$2a$10$DtZDYQOMkuSVXps.FgISP.eW9SSvkEC7vCicqKyXV0kFsDK5VGfYG";
//		System.out.println(encoder.matches(password, saved));
				
		
	}
}
