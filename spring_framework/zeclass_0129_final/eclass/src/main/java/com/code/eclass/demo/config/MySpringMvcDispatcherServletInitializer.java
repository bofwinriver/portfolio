	package com.code.eclass.demo.config;

import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

// DispatcherServlet(HTTP 프로토콜로 들어오는 모든 요청을 가장 먼저 받아 적합한 컨트롤러에 위임해주는 프론트 컨트롤러(Front Controller) 설정하기
// 요청이 여기서 처음으로 스프링 프레임워크와 만난다. 게다가 요청을 여러 다른 컴포넌트를 통해 분배하는 것도 이 DispatcherSerlvet의 역할이다.

/* AbstractAnnotationConfigDispatcherServletInitializer를 상속받은 MySpringMvcDispatcherServletInitializer에서 
 * DispatcherServlet과 애플리케이션의 서블릿 컨텍스트내의 스프링 애플리케이션 컨텍스트를 설정
*/
public class MySpringMvcDispatcherServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	
	//  DispatcherServlet이 애플리케이션 컨텍스트를 WebConfig 설정 클래스(java 설정)에서 정의된 빈으로 로딩하도록 되어있다. 
	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return null;
	}
	
	//  DispatcherServlet이 애플리케이션 컨텍스트를 DemoAppConfig 클래스(java 설정)에서 정의된 빈으로 로딩하도록 되어있다. 
	@Override
	protected Class<?>[] getServletConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] { DemoAppConfig.class };
	}

	// getServletMapping()은 DispatcherServlet이 매핑되기 위한 하나 혹은 여러 개의 패스를 지정한다.
	// 애플리케이션 기본 서블릿인 /에만 매핑이 되어 있다. 그리고 이것은 애플리케이션으로 들어오는 모든 요청을 처리한다.
	@Override
	protected String[] getServletMappings() {
		// TODO Auto-generated method stub
		return new String[] {"/"};
	}

	@Override
	protected void customizeRegistration(Dynamic registration) {
		// TODO Auto-generated method stub
		registration.setInitParameter("throwExceptionIfNoHandlerFound", "true");
	}

}
