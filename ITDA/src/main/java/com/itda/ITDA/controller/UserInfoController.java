package com.itda.ITDA.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itda.ITDA.domain.ChCategory;
import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.MailVO;
import com.itda.ITDA.domain.Seller;
import com.itda.ITDA.domain.UserCategory;
import com.itda.ITDA.domain.UserLeaveReason;
import com.itda.ITDA.service.ChannelList_Service;
import com.itda.ITDA.service.ContentService;
import com.itda.ITDA.service.Itda_UserService;
import com.itda.ITDA.service.SellerService;
import com.itda.ITDA.service.UserCategoryService;
import com.itda.ITDA.task.SendMail;
import com.itda.ITDA.util.Constants;
import com.itda.ITDA.util.Message;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Controller
@RequestMapping(value="/user")
public class UserInfoController {
	private static final Logger logger = LoggerFactory.getLogger(UserInfoController.class);
	
	@Value("${my.savefolder}")
	private String saveFolder;
	
	private final int PASSWD_CONFIRM_OK = 1;
	private final int EMAIL_CONFIRM_OK = 1;
	private final int THREE_MINUTE_TIMER = 60*3;
	
	private Itda_UserService itdaUserService;
	private ChannelList_Service channelList_Service;
	private ContentService contentService;
	private UserCategoryService userCategoryService;
	private SellerService sellerService;
	private SendMail sendMail;
	
	@Autowired
	public UserInfoController(Itda_UserService itdaUserService, ChannelList_Service channelList_Service, 
								ContentService contentService, UserCategoryService userCategoryService
								, SendMail SendMail, SellerService sellerService) {
		this.itdaUserService = itdaUserService;
		this.channelList_Service = channelList_Service;
		this.contentService = contentService;
		this.userCategoryService = userCategoryService;
		this.sendMail = SendMail;
		this.sellerService = sellerService;
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
	public int getEmailCheck(Principal principal,
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
	
	// 이메일 인증 메일 발송
	@ResponseBody
	@PostMapping(value="myInfo/emailCheck/authentication")
	public int emailAuthentication(@RequestParam("email") String email,
									MailVO vo,
									HttpSession session,
									HttpServletRequest request) {
			
		session.removeAttribute("authCode");
		//request.getSession().getAttribute("authCode");
		String authCode = generateAuthCode();
		
		session.setAttribute("authCode", authCode);
		//session.setMaxInactiveInterval(THREE_MINUTE_TIMER);
		//session.removeAttribute("authCode");
		int result = 0;
		
		sendMail.emailAuthentication(email, authCode, vo);
		if (sendMail.emailAuthentication(email, authCode, vo) == true) {
			
			result = Constants.CONNECT_SUCCESS;
			logger.info("메일 전송에 성공하였습니다.");
		}else {
			result = Constants.MAIL_SEND_ERROR;
			logger.info("메일 전송에 실패하였습니다.");
		}
		
		return result;
	}
	
	// 인증코드 비교
	@ResponseBody
	@PostMapping(value="myInfo/emailCheck/authCodeCheck")
	public int checkAuthCode(HttpSession session,
							HttpServletRequest request,
							@RequestParam("authNo") String authNo) {
		
		String authCode = (String) request.getSession().getAttribute("authCode");
		
		logger.info("authCode : " + authCode +  "/ authNo : " + authNo);
		int result = 0;
		
		if(authCode.equals(authNo)) {
			
			result = 200;
			logger.info(Message.SUCCESS);
			
			return result;
		}else {
			
			logger.info(Message.ERROR);
			return result;
		}
		
	}
	
	// 회원 이메일 변경 프로세스
	@PostMapping(value="/emailChangePro")
	public String userEmailUpdateProcess(Itda_User user,
										Principal principal) {
		
		String id = principal.getName();
		
		user.setUserId(id);
		user.setUserEmail(user.getUserEmail());
		logger.info("user.setUserEmail : " + user.getUserEmail());
		
		int result = itdaUserService.userEmailUpdate(user);		
		
		String newMail = user.getUserEmail();
		
		if(newMail != null && newMail != "" &&  result == Constants.UPDATE_SUCCESS) {
			
			logger.info(Message.USER_UPDATE_SUCCESS);
			return "redirect:/user/myInfo";
		}else {
			
			logger.info(Message.USER_UPDATE_FALL);
			return "redirect:/user/myInfo";
		}
	}
	
	
	// 마이페이지 seller 이메일 체크
	@ResponseBody
	@PostMapping(value = "myInfo/sellerEmailCheck")
	public int getSellerEmailCheck(Principal principal,
							@RequestParam("sellerEmail") String sellerEmail) {

		String id = principal.getName();

		logger.info("id : " + principal.getName());

		Seller seller = sellerService.sellerEmailCheck(id);

		String getSellerEmail = seller.getSellerEmail();

		int result = 0;
		if (sellerEmail.equals(getSellerEmail)) {
			logger.info(sellerEmail);
			result = EMAIL_CONFIRM_OK;

			return result;
		} else {
			logger.info(Message.ERROR);
			return result;
		}

	}
	
	
	// 회원 이메일 변경 프로세스
	@PostMapping(value="/sellerEmailChangePro")
	public String sellerEmailUpdateProcess(Seller seller,
										Principal principal) {
		
		String id = principal.getName();
		
		seller.setUserId(id);
		seller.setSellerEmail(seller.getSellerEmail());
		logger.info("seller.setUserEmail : " + seller.getSellerEmail());
		
		int result = sellerService.sellerEmailUpdate(seller);		
		
		String newMail = seller.getSellerEmail();
		
		if(newMail != null && newMail != "" &&  result == Constants.UPDATE_SUCCESS) {
			
			logger.info(Message.USER_UPDATE_SUCCESS);
			return "redirect:/user/myInfo";
		}else {
			
			logger.info(Message.USER_UPDATE_FALL);
			return "redirect:/user/myInfo";
		}
	}
	
	// 회원 정보의 주소 수정
	@RequestMapping(value="/addressUpdatePro")
	public String userAddressUpdatePro(Itda_User user, 
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
			return result -1;
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

		user.setUserId(id);
		user.setUserPw(userPw);

		itdaUserService.pwUpdate(user);

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
	public String myProfile(Principal principal, 
							HttpServletRequest request,
							Model model) {
		
		String id = principal.getName();
		
		if(id == null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("url", "/");
			
			return "alert";
		}else {
			Itda_User vo = itdaUserService.getUser(id);
			model.addAttribute("vo", vo);
		}
		
		
		return "mypage/userinfo/myProfile";
	}
	
	private String fileDBName(String fileName, String saveFolder) {
		// 새로운 폴더 이름 : 오늘 년 + 월 + 일
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);// 오늘 년도 구합니다.
		int month = c.get(Calendar.MONTH) + 1;// 오늘 월 구합니다.
		int date = c.get(Calendar.DATE);// 오늘 일 구합니다.

		
		File idPath1 = new File(saveFolder);
		if (!(idPath1.exists()))
		{
			idPath1.mkdir();// 새로운 폴더를 생성
		}
		
		String homedir = saveFolder + "/" + year + "-" + month + "-" + date;
		logger.info(homedir);
		File path1 = new File(homedir);
		if (!(path1.exists()))
		{
			path1.mkdir();// 새로운 폴더를 생성
		}

		// 난수를 구합니다.
		Random r = new Random();
		int random = r.nextInt(100000000);

		/**** 확장자 구하기 시작 ****/
		int index = fileName.lastIndexOf(".");
		// 문자열에서 특정 문자열의 위치 값(index)를 반환합니다.
		// indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
		// lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
		// (파일명에 점에 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.
		logger.info("index = " + index);

		String fileExtension = fileName.substring(index + 1);
		logger.info("fileExtension = " + fileExtension);

		// 새로운 파일명
		String refileName = "bbs" + year + month + date + random + "." + fileExtension;
		logger.info("refileName = " + refileName);

		// 오라클 디비에 저장될 파일 명
		// String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
		String fileDBName = File.separator + year + "-" + month + "-" + date + File.separator + refileName;
		logger.info("fileDBName = " + fileDBName);

		return fileDBName;
	}
	
	@PostMapping("myInfo/changeProfilePro")
	public String changeProfileProcess( Itda_User user,
										@AuthenticationPrincipal Itda_User customUser) throws Exception {
		
		String id = customUser.getUserId();
		
		user.setUserId(id);
		user.setUserProfile(user.getUserProfile());
		
		String fileDBName = "";
		
		MultipartFile uploadfile = user.getProfile();
		if (uploadfile != null && !uploadfile.isEmpty())
		{
			logger.info("파일 추가/변경되었습니다.");

			String fileName = uploadfile.getOriginalFilename(); // 원래 파일명


			fileDBName = fileDBName(fileName, saveFolder + "/Member/" + id);
			logger.info("fileDBName = " + fileDBName);
			
			String userFolder = saveFolder + "/Member/" + id + File.separator + fileDBName;

			byte[] bytes = uploadfile.getBytes(); // 파일의 내용을 바이트 배열로 읽어옵니다.

			Path path = Paths.get(userFolder); // 파일을 저장할 절대경로 객체(Path)

			Files.write(path, bytes); // 해당 경로에 파일 쓰기

			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			// uploadfile.transferTo(new File(saveFolder + "/" + chnum + fileDBName));
			//logger.info("transferTo path = " + saveFolder + "/" + chnum + userFolder);
			// 바뀐 파일명으로 저장
			user.setUserProfile(fileDBName);
		}

		int result = itdaUserService.userUpdateProfile(user);
		customUser.setUserProfile(fileDBName);

		if (result == 0)
		{
			logger.info("업데이트 실패");
			return "redirect:error/error";
		} else
		{// 수정 성공의 경우
			logger.info("업데이트 완료");
			// 수정한 글 내용을 보여주기 위해 글 내용 보기 페이지로 이동하기 위해 경로를 설정합니다.
			return "redirect:/user/myProfile";
		}

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
	
	@ResponseBody
	@PostMapping("/leaveAction")
	public String leaveAction( 
								UserLeaveReason leaveReason, 
								HttpServletRequest request) {

		

		leaveReason.setUserId(leaveReason.getUserId());
		leaveReason.setLeaveReason_id((leaveReason.getLeaveReason_id()));
		leaveReason.setUserLeaveReason(leaveReason.getUserLeaveReason());

		int result = itdaUserService.leaveResonInsert(leaveReason);
		if (result == Constants.INSERT_SUCCESS) {

			logger.info("탈퇴이유 insert 성공");

			if (result == Constants.INSERT_SUCCESS) {
				result = itdaUserService.deleteUserInsert(leaveReason.getUserId());
				System.out.println("탈퇴유저 insert 성공 :" + result);

				
				result = itdaUserService.itda_userDelete(leaveReason.getUserId());

				if (result == Constants.DELETE_SUCCESS) {

					logger.info("탈퇴 유저 정보 insert 성공, 유저 delete 성공");
				}
			}

			logger.info("탈퇴 성공");
			return Message.USER_LEAVE_SUCCESS;

		} else {
			logger.info("회원 탈퇴 실패");
			return  Message.USER_LEAVE_FALL;
		}
	}
	

}
