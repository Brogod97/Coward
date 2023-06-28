package kr.co.coward.contest.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.coward.contest.model.service.ContestService;
import kr.co.coward.member.model.vo.Member;

@Controller
@RequestMapping("/contest")
@SessionAttributes({ "loginMember" })
public class ContestController {

	private Logger logger = LoggerFactory.getLogger(ContestController.class);

	@Autowired
	private ContestService service;

	/**
	 * 공모전 메인페이지로 이동
	 * 
	 * @return
	 */
	@RequestMapping("/main")
	public String contestMain() {

		return "contest/contest-main";
	}

	/**
	 * 공모전 개최 페이지로 이동
	 * 
	 * @return
	 */
	@RequestMapping("/create")
	public String contestCreate() {

		return "contest/contest-create";
	}

	/**
	 * 공모전 개최
	 * 
	 * @param map
	 * @return
	 */
	@PostMapping("/create")
	public String contestCreate(@ModelAttribute("loginMember") Member loginMember,
			@RequestParam Map<String, Object> paramMap, String[] skill, RedirectAttributes ra,
			@RequestParam("thumbnail") MultipartFile uploadImage, HttpServletRequest req) throws IOException {

		String skillList = String.join("/", skill);

		// 웹 접근경로
		String webPath = "/resources/assets/images/contest-thumbnail/";

		// 서버 저장 폴더 경로
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);

		paramMap.put("webPath", webPath);
		paramMap.put("folderPath", folderPath);
		paramMap.put("skill", skillList);
		paramMap.put("thumbnail", uploadImage);
		paramMap.put("memberNo", loginMember.getMemberNo());

		int result = service.contestCreate(paramMap);

		String message = null;
		String path = null;

		if (result > 0) {
			message = "공모전 개최가 완료되었습니다.";

			path = "main";

		} else {
			message = "공모전 개최를 실패하였습니다.";
			path = "create";
		}
		ra.addFlashAttribute("message", message);

		return "redirect:" + path;
	}

	@GetMapping("/recommend")
	public String contestRecommend() {
		return "contest/contest-recommend";
	}

}
