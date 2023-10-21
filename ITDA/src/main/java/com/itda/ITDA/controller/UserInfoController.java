package com.itda.ITDA.controller;

import java.security.Principal;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itda.ITDA.domain.ChCategory;
import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.MailVO;
import com.itda.ITDA.domain.UserCategory;
import com.itda.ITDA.domain.UserLeaveReason;
import com.itda.ITDA.service.ChannelList_Service;
import com.itda.ITDA.service.ContentService;
import com.itda.ITDA.service.Itda_UserService;
import com.itda.ITDA.service.UserCategoryService;
import com.itda.ITDA.task.SendMail;
import com.itda.ITDA.util.Constants;
import com.itda.ITDA.util.Message;
import com.itda.ITDA.util.Util;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Controller
@RequestMapping(value="/user")
public class UserInfoController {
	private static final Logger logger = LoggerFactory.getLogger(UserInfoController.class);
	
	private final int PASSWD_CONFIRM_OK = 1;
	private final int EMAIL_CONFIRM_OK = 1;
	
	private Itda_UserService itdaUserService;
	private ChannelList_Service channelList_Service;
	private ContentService contentService;
	private UserCategoryService userCategoryService;
	private SendMail sendMail;
	
	@Autowired
	public UserInfoController(Itda_UserService itdaUserService, ChannelList_Service channelList_Service, 
								ContentService contentService, UserCategoryService userCategoryService
								, SendMail SendMail) {
		this.itdaUserService = itdaUserService;
		this.channelList_Service = channelList_Service;
		this.contentService = contentService;
		this.userCategoryService = userCategoryService;
		this.sendMail = SendMail;
	}

	
	// 마이페이지 나의 정보 자세히 보기
	@RequestMapping(value="/myInfo")
	public String getMyInfo(Model model,
			HttpSession session, Principal principal) {
		
		String id = principal.getName();
		logger.info("id : " + principal.getName());
		
		Itda_User idCheck = itdaUserService.isUserIdORSellerId(id);
		logger.info("getUserId 결과 : " + idCheck.getUserId());
		logger.info("getSellerId 결과 : " + idCheck.getSellerId());
		
		String sellerId = idCheck.getSellerId();
    	
		if(idCheck.getUserId() != null) {
			
			Itda_User vo = itdaUserService.read(id);
	    	model.addAttribute("user", vo);
	    	session.setAttribute("userName", vo.getUserName());
	    	
	    	
	    	List<ChCategory> chCategoryList = contentService.selectchCate_Id();
	    	
	    	model.addAttribute("chCategoryList", chCategoryList);
			
	    	if (sellerId == null || sellerId.equals("")) {
	    	    model.addAttribute("message", "NOT_SELLER");
	    	}
	    	
		    	return "mypage/userinfo/myinfopage";
		    	
		} else {
	    	logger.info("페이지 연결 에러");
	    	return "redirect:/";
	    }
		
	}
	
	// 마이페이지 나의 정보 자세히 보기
	@ResponseBody
	@PostMapping(value = "myInfo/emailCheck")
	public int getEmailCheck(Model model, 
							HttpSession session, 
							Principal principal,
							@RequestParam("userEmail") String userEmail) {

		String id = principal.getName();

		logger.info("id : " + principal.getName());

		Itda_User user = itdaUserService.emailCheck(id);

		String getUserEmail = user.getUserEmail();

		int result = 0;
		if (userEmail.equals(getUserEmail)) {
			logger.info(userEmail);
			result = EMAIL_CONFIRM_OK;

			return result;
		} else {
			logger.info(Message.ERROR);
			return result;
		}

	}
	
	private String generateAuthCode() {
		Random random = new Random();
		int range = (int) Math.pow(10, 6); // 10의 6승
		int trim = (int) Math.pow(10, 5); // 10의 5승
		int result = random.nextInt(range) + trim;

		if (result > range) {
			result -= trim;
		}
		logger.info(Integer.toString(result));
		return Integer.toString(result);
	}
	
	// 이메일 인증
	@ResponseBody
	@PostMapping(value="myInfo/emailCheck/authentication")
	public int emailAuthentication(@RequestParam("email") String email,
									MailVO vo,
									Model model) {

		
		String authCode = generateAuthCode();
		
		sendMail.emailAuthentication(email, authCode, vo);
		
		
		int result = 0;
		
		return result;
	}
	
		
	
	// 회원 정보의 주소 수정
	@RequestMapping(value="/addressUpdatePro")
	public String userAddressUpdatePro(Itda_User user, 
										Model model,
										RedirectAttributes rattr,
										HttpSession session) {
		
				
		
		
		System.out.println("address2 : " + user.getUserAddress2());

		user.setUserId(user.getUserId());
		user.setUserPost(user.getUserPost());
		user.setUserAddress1(user.getUserAddress1());
		user.setUserAddress2(user.getUserAddress2());
		
		int result = itdaUserService.userAddressUpdate(user);

		if( result == Constants.UPDATE_SUCCESS) {
			
			rattr.addFlashAttribute("result", "updateSuccess");
			logger.info("update_success");
			return "redirect:/user/myInfo";
		}else {
			logger.info("update_fail");
			return "redirect:/user/myInfo";
		}
	}
	
	// 비밀번호 찾기 페이지 이동
	@GetMapping(value="myInfo/viewChangePasswd")
	public String viewChangePasswd() {
		return "mypage/userinfo/viewChangePasswd";
	}
	
	// 기존 비밀번호 일치여부 확인
	@ResponseBody
	@RequestMapping("/passwdCheck")
	public int checkPasswd(	@RequestParam("userPw") String userPw, 
							Principal principal) throws Exception {
		
		logger.info("비밀번호 확인 요청");
		
		int result = 0;
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		String id = principal.getName();
		
		Itda_User user = itdaUserService.pwCheck(id);
		
		if(encoder.matches(userPw, user.getUserPw())) {
			
			result = PASSWD_CONFIRM_OK;
			return result;
			
		} else {
			logger.info("Password confirm fail");
			return result;
		}
		
	}
	
	// 비밀번호 변경
	@PostMapping("myInfo/passWdChangePro")
	public String passWdChangeProcess(Itda_User user,
									Principal principal) {
		
		logger.info("비밀번호 변경 요청 확인");
		
		String id = principal.getName();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		logger.info("비밀번호 입력 값 : " + user.getUserPw());
		
		String userPw = encoder.encode(user.getUserPw());

		Itda_User itdaUser = new Itda_User();
		user.setUserId(id);
		user.setUserPw(userPw);

		itdaUserService.pwUpdate(itdaUser);

		logger.info("비밀번호 암호화 후 : " + userPw);

		logger.info("비밀번호 변경 성공");
		
		return "redirect:/user/myInfo";
		
	}
	
	@PostMapping("myInfo/keyWdChangePro")
	public String keyWdChangeProcess(Principal principal,
									UserCategory userCategory,
									@RequestParam("cateNameYn") String getCateName) {
		
		String id = principal.getName();
		
		
		userCategory.setCate_Id(userCategory.getCate_Id());
		userCategory.setUserId(id);
		
		System.out.println(userCategory.getCate_Id());
		System.out.println(userCategory.getUserId());

		System.out.println("getCateName : " + getCateName);
		
		int result = 0;
		
		// 사용자가 회원가입 시 관심카테고리를 설정하지 않았을 경우 insert
		if(getCateName.equals(null)||getCateName.equals("")) {
			
			result = userCategoryService.insert(userCategory);
			
			if(result == Constants.INSERT_SUCCESS) {
				
				logger.info(Message.INSERT_SUCCESS);
			}
			
		}else {
		
			result = itdaUserService.userCategoryUpdate(userCategory);
		
			if(result == Constants.UPDATE_SUCCESS) {
			
				logger.info(Message.USER_UPDATE_SUCCESS);
			
				return "redirect:/user/myInfo";
			}else {
				logger.info(Message.USER_UPDATE_FALL);
			
			}
		}
			return "redirect:/user/myInfo";
		
	}
	
			
	@RequestMapping("/myProfile")
	public String changeMyProfile() {
		return "mypage/userinfo/myProfile";
	}
	
	@RequestMapping("/leave")
	public String userLeaveView() {
		return "mypage/userinfo/userLeave";
	}
	
	@PostMapping("leave/passwdInput")
	public String userLeavePasswdInput() {
		return "mypage/userinfo/userLeave_pw_input";
	}
	
	@PostMapping("leave/leaveReason")
	public String userLeaveReason(Itda_User user,
								Principal principal,
								Model model) {
		
		String id = principal.getName();
		user = itdaUserService.getUserName(id);
		
		model.addAttribute("userName", user);
		
		List<UserLeaveReason> lrCategorylist = itdaUserService.getLeaveReasonCategory();
		model.addAttribute("reason", lrCategorylist);
		
		return "mypage/userinfo/userLeaveReason";
	}
	
	@PostMapping("/leaveAction")
	public String leaveAction(Principal principal, 
								UserLeaveReason leaveReason, 
								HttpServletRequest request,
								Model model) {

		String id = principal.getName();

		leaveReason.setUserId(id);
		leaveReason.setLeaveReason_id((leaveReason.getLeaveReason_id()));
		leaveReason.setUserLeaveReason(leaveReason.getUserLeaveReason());

		int result = itdaUserService.leaveResonInsert(leaveReason);
		if (result == Constants.INSERT_SUCCESS) {

			logger.info("탈퇴이유 insert 성공");

			if (result == Constants.INSERT_SUCCESS) {
				result = itdaUserService.deleteUserInsert(id);
				System.out.println("탈퇴유저 insert 성공 :" + result);

				
				result = itdaUserService.itda_userDelete(id);

				if (result == Constants.DELETE_SUCCESS) {

					logger.info("탈퇴 유저 정보 insert 성공, 유저 delete 성공");
				}
			}

			logger.info("탈퇴 성공");
			request.setAttribute("msg", Message.USER_LEAVE_SUCCESS);

		} else {
			logger.info("회원 탈퇴 실패");
			request.setAttribute("msg", Message.USER_LEAVE_FALL);
		}
		return "mypage/userinfo/userLeaveAction";
	}
	
	@RequestMapping(value = "myInfo/emailChangePro", method = RequestMethod.POST)
	public String emailChangeProcess(Itda_User user,
									Model model,
									MailVO mailvo) {
		
		
		
		
		
		return "redirect:/my/myInfo";
		
	}
	

}
