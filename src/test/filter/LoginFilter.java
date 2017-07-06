package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/*
 * 	/member2/ 하위의 모든 요청과
 *  /users/private/하위의 모든 요청에 대해
 *  필터링 하도록 설정
 */
@WebFilter({"/member2/*","/users/private/*"})
public class LoginFilter implements Filter{

	@Override
	public void destroy() {
		
		
	}

	@Override
	public void doFilter(ServletRequest req,
			ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		//원래 type 으로 casting
		HttpServletRequest request=(HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)res;
		//HttpSession 객체의 참조값 얻어오기
		HttpSession session=request.getSession();
		//Context 경로 얻어오기
		String cPath=request.getContextPath();
		//원래 요청 uri(url) 정보 얻어오기
		String url=request.getRequestURI();
		//session 에 로그인 정보가 있는지 여부를 확인해서
		if(session.getAttribute("id")==null){
			//로그인 페이지의 경로 구성
			String path=cPath+"/popup/popup_page.jsp?url="+url;
			//로그인 페이지로 이동 시킨다.
			response.sendRedirect(path);
		}else{
			//원래 하려던 작업 진행 시키기
			chain.doFilter(req, res);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
		
	}
	
}
