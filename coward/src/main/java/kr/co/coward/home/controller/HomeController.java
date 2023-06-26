package kr.co.coward.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/home")
	public String mainForward() {

		return "common/home"; // DispatcherServlet�� �����Ŵ�! -> View Resolver
	}
}
