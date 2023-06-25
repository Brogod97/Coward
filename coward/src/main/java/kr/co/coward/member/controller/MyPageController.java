package kr.co.coward.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.coward.member.model.service.MyPageService;

@Controller
@RequestMapping("/mypage/myPage")
@SessionAttributes({"loginMember"}) // session scope���� loginMember�� ����
public class MyPageController {

	@Autowired
	private MyPageService service;

	// ȸ�� ���� ��ȸ(����)
	@GetMapping("/info")
	public String info() {
		return "mypage/person-main";
	}
	
	
	// ������ ����
	@GetMapping("/progress")
	public String progress() {
		return "mypage/contest-progress";
	}
}
