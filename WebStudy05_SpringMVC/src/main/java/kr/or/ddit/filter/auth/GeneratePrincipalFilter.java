package kr.or.ddit.filter.auth;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemberVOWrapper;
import lombok.extern.slf4j.Slf4j;

/**
 * adapter 패턴을 이용하여 memberwrapper이용  그후 HttpServletRequestWrapper 오버라이딩
 * 을 하여 authmember 담아서 보냄
 *
 */
@Slf4j
public class GeneratePrincipalFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		log.info("{} 필터 초기화", this.getClass().getSimpleName());
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		MemberVO authMember = (MemberVO) req.getSession().getAttribute("authMember");
		if(authMember!=null) {
			HttpServletRequestWrapper wrapperReq = new HttpServletRequestWrapper(req) {
				@Override
				public Principal getUserPrincipal() {
					MemberVOWrapper principal = new MemberVOWrapper(authMember);
					return principal;
				}
			};
			chain.doFilter(wrapperReq, response);
		}else {
			chain.doFilter(request, response);
		}

	
		
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
