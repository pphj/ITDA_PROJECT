package com.itda.ITDA.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChBoardCategory;
import com.itda.ITDA.domain.ChannelList;
import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.Seller;
import com.itda.ITDA.domain.Tag;
import com.itda.ITDA.domain.sub;
import com.itda.ITDA.service.ChannelList_Service;
import com.itda.ITDA.service.TagService;

//DAO와 Service가 작성되어야 Controller가 완성된다
@Controller
@RequestMapping(value = "/channels")
public class ChannelListController {

	private static final Logger logger = LoggerFactory.getLogger(ChannelListController.class);

	@Value("${my.savefolder}")
	private String saveFolder;

	private ChannelList_Service channelList_Service;
	private TagService TagService;

	// chnum 파라미터가 없거나 null인 경우에 대한 처리를 수행합니다.
	final int WRONG_CHNUM = 0;

	@Autowired
	public ChannelListController(ChannelList_Service channelList_Service, TagService TagService) {
		this.channelList_Service = channelList_Service;
		this.TagService = TagService;
	}

	@RequestMapping(value = "/{chnum}", method = RequestMethod.GET)
	public ModelAndView showChannelMainPage(@PathVariable(value = "chnum") int chnum, // chnum을 파라미터로 전달 받음
			String userid, ModelAndView mv, HttpServletRequest request, Principal principal, HttpSession session)
			throws JsonProcessingException {

		if (chnum == WRONG_CHNUM) {
			logger.info("채널 메인 페이지 표시 실패: chnum 파라미터가 없거나 잘못된 값입니다.");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "채널 메인 페이지 표시 실패: chnum 파라미터가 없거나 잘못된 값입니다.");
			return mv;
		}
		logger.info("채널 메인 페이지 표시 요청: chnum=" + chnum);

		// 채널 리스트를 가져옴
		ChannelList ChannelList = channelList_Service.getChannelDetail(chnum);

		// 채널주인 확인
		Seller sellerinfo = channelList_Service.getSellerInfo(userid);

		List<sub> subData = channelList_Service.getSubData(chnum);
		ObjectMapper om = new ObjectMapper();
		String subDataJson = om.writeValueAsString(subData);

		// 구독자 확인
		Map<String, Object> subinfo = channelList_Service.getBoardVisit(chnum);
		// sub subinfo = channelList_Service.getBoardVisit(chnum);
		mv.addObject("subinfo", subinfo);

		if (ChannelList == null) {
			logger.info("채널 메인 페이지 표시 실패: 해당 번호의 채널을 찾을 수 없습니다.");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "채널 메인 페이지 표시 실패: 해당 번호의 채널을 찾을 수 없습니다.");
		} else {
			// logger.info("채널 메인 페이지 표시 성공");
			// 채널 정보를 뷰로 전달
			mv.setViewName("channel/ChannelMain");
			mv.addObject("ChannelList", ChannelList);
			session.setAttribute("chname", ChannelList.getChName());
			mv.addObject("sellerinfo", sellerinfo);

			mv.addObject("subData", subDataJson);

			// 채널과 연관된 게시물 목록을 가져옴
			List<ChBoard> ChannelBoardList = channelList_Service.getBoardListByBoardNum(chnum);
			mv.addObject("ChannelBoardList", ChannelBoardList);

			// 채널과 연관된 카테고리 목록을 가져옴
			List<ChBoardCategory> ChannelCategory = channelList_Service.getChannelCategory(chnum);
			mv.addObject("ChannelCategory", ChannelCategory);

		}

		return mv;
	}

	@RequestMapping(value = "/contentlist.co", method = RequestMethod.GET)
	public ModelAndView showContentList(@RequestParam(name = "chnum") int chnum, ModelAndView mv,
			HttpServletRequest request, @RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "limit", defaultValue = "10") int limit,
			@RequestParam(name = "order", defaultValue = "desc") String order,
			@RequestParam(name = "chcate_id", defaultValue = "0") int chCate_Id,
			@RequestParam(name = "state", required = false) String state, Principal principal) {

		if (chnum == WRONG_CHNUM) {
			logger.info("컨텐츠 목록 페이지 표시 실패: channelnum 파라미터가 없거나 잘못된 값입니다.");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "컨텐츠 목록 페이지 표시 실패: channelnum 파라미터가 없거나 잘못된 값입니다.");
		} else {
			logger.info("컨텐츠 목록 페이지 표시 요청: channelnum=" + chnum);
			List<ChBoardCategory> chcategorylist = channelList_Service.getChannelCategoryList(chnum);
			mv.setViewName("content/content_list");

			List<ChBoard> contentlist = new ArrayList<ChBoard>();

			ChannelList ChannelList = channelList_Service.getChannelDetail(chnum);
			mv.addObject("ChannelList", ChannelList);

			int listcount = 0;

			if (chCate_Id == 0) { // 전체
				contentlist = channelList_Service.getAllChannelCategoryData(chnum, order, page, limit);
				listcount = channelList_Service.getAllChannelCategoryCount(chnum);

			} else { // 카테고리
				contentlist = channelList_Service.getChannelCategoryData(chnum, order, chCate_Id, page, limit);

				if (!contentlist.isEmpty()) {
					System.out.println(contentlist.get(0).getBoardDate());
				} else {
					System.out.println("등록된 게시글이 없습니다.");
				}

				listcount = channelList_Service.getChannelCategoryCount(chnum, chCate_Id);

			}
			int maxpage = (listcount + limit - 1) / limit;
			int startpage = ((page - 1) / 10) * 10 + 1;
			int endpage = startpage + 10 - 1;
			if (endpage > maxpage)
				endpage = maxpage;

			mv.addObject("page", page);
			mv.addObject("limit", limit);
			mv.addObject("channelnum", chnum);
			mv.addObject("order", order);
			mv.addObject("chCate_Id", chCate_Id);
			mv.addObject("state", state);
			mv.addObject("maxpage", maxpage);
			mv.addObject("startpage", startpage);
			mv.addObject("endpage", endpage);
			mv.addObject("listcount", listcount);
			mv.addObject("contentlist", contentlist);
			mv.addObject("chcategorylist", chcategorylist);

		}
		return mv;
	}

	@PostMapping("{chnum}/sellersetting")
	public String showChannelUpdate(@PathVariable("chnum") int chnum, ModelAndView mv, ChannelList ChannelList,
			ChBoardCategory ChBoardCategory, HttpServletRequest request, RedirectAttributes rattr, HttpSession session,
			Principal principal) throws Exception {

		MultipartFile uploadfile = ChannelList.getUploadfile();
		String url = "";

		if (uploadfile != null && !uploadfile.isEmpty()) {
			logger.info("파일 추가/변경되었습니다.");

			String fileName = uploadfile.getOriginalFilename(); // 원래 파일명

			String fileDBName = fileDBName(fileName, saveFolder + "/MemberUpload/" + principal.getName());
			logger.info("fileDBName = " + fileDBName);

			String userFolder = saveFolder + "/MemberUpload/" + principal.getName() + File.separator + fileDBName;

			byte[] bytes = uploadfile.getBytes(); // 파일의 내용을 바이트 배열로 읽어옵니다.

			Path path = Paths.get(userFolder); // 파일을 저장할 절대경로 객체(Path)

			Files.write(path, bytes); // 해당 경로에 파일 쓰기

			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			// uploadfile.transferTo(new File(saveFolder + "/" + chnum + fileDBName));
			logger.info("transferTo path = " + saveFolder + "/MemberUpload/" + principal.getName() + userFolder);
			// 바뀐 파일명으로 저장
			ChannelList.setChProfile(fileDBName);
		}

		// 채널 프로필 변경
		int result = channelList_Service.getSellerUpdate(ChannelList);

		if (result == 0) {
			logger.info("업데이트 실패");
			return "redirect:error/error";
		} else {// 수정 성공의 경우
			logger.info("업데이트 완료");
			// 수정한 글 내용을 보여주기 위해 글 내용 보기 페이지로 이동하기 위해 경로를 설정합니다.
			return "redirect:sellersetting";
		}

	}

	@GetMapping(value = "{chnum}/sellersetting")
	public ModelAndView showChannelSetting(@PathVariable("chnum") int chnum, ModelAndView mv, ChannelList ChannelList,
			String check, HttpServletRequest request, HttpSession session) {

		if (ChannelList == null) {
			logger.info("상세보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "상세보기 실패입니다.");
			return mv;
		}
		logger.info("상세보기 성공");

		ChannelList SellerSetting = channelList_Service.getSellerSetting(chnum);
		List<ChBoardCategory> SellerCategory = channelList_Service.getSellerCategory(chnum);

		mv.addObject("SellerCategory", SellerCategory);
		mv.addObject("SellerSetting", SellerSetting);
		mv.setViewName("channel/ChannelSetting");
		return mv;
	}

	private String fileDBName(String fileName, String saveFolder) {
		// 새로운 폴더 이름 : 오늘 년 + 월 + 일
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);// 오늘 년도 구합니다.
		int month = c.get(Calendar.MONTH) + 1;// 오늘 월 구합니다.
		int date = c.get(Calendar.DATE);// 오늘 일 구합니다.

		File idPath1 = new File(saveFolder);
		if (!(idPath1.exists())) {
			idPath1.mkdir();// 새로운 폴더를 생성
		}

		// 채널번호 폴더 생성하는 거
		File path2 = new File(saveFolder);
		if (!(path2.exists())) {
			path2.mkdir();// 새로운 폴더를 생성
		}

		String homedir = saveFolder + "/" + year + "-" + month + "-" + date;
		logger.info(homedir);
		File path1 = new File(homedir);
		if (!(path1.exists())) {
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

	@ResponseBody
	@PostMapping(value = "{chnum}/checkChannelName")
	public int checkChannelName(@PathVariable("chnum") int chnum, @RequestBody Map<String, String> payload) {
		String chName = payload.get("chName");
		int result = channelList_Service.checkChannelName(chnum, chName);

		if (result > 0) {
			logger.info("동일한 채널명이 있습니다. 결과: " + result);
		} else {
			logger.info("동일한 채널명이 없습니다.");
		}

		return result;
	}

	@ResponseBody
	@RequestMapping(value = "{chnum}/categorychange", method = RequestMethod.POST)
	public int ChangeCategory(@PathVariable("chnum") int chnum, @RequestBody Map<String, Object> payload) {
		String chcatename = (String) payload.get("chcatename");
		logger.info(chcatename);

		int result = channelList_Service.addCategory(chnum, chcatename);

		if (result > 0) {
			logger.info("카테고리 변경 성공. 결과: " + result);
		} else {
			logger.error("카테고리 변경 실패.");
		}

		return result;
	}

	@ResponseBody
	@RequestMapping(value = "{chnum}/categoryupdate", method = RequestMethod.PUT)
	public int updateCategory(@PathVariable("chnum") int chnum, @RequestBody Map<String, Object> payload) {
		String chCate_Name = (String) payload.get("chCate_Name");
		int chCate_Id = Integer.parseInt((String) payload.get("chCate_Id"));

		logger.info(chCate_Name);

		int result = channelList_Service.updateCategory(chCate_Id, chCate_Name);

		if (result > 0) {
			logger.info("카테고리 업데이트 성공. 결과: " + result);
		} else {
			logger.error("카테고리 업데이트 실패.");
		}

		return result;
	}

	@ResponseBody
	@RequestMapping(value = "{chnum}/categorydelete", method = RequestMethod.DELETE)
	public int deleteCategory(@PathVariable("chnum") int chnum, @RequestBody Map<String, Object> payload) {
		int chCate_Id = Integer.parseInt((String) payload.get("chCate_Id"));

		int result = channelList_Service.deleteCategory(chCate_Id);

		if (result > 0) {
			logger.info("카테고리 삭제 성공. 결과: " + result);
		} else {
			logger.error("카테고리 삭제 실패.");
		}

		return result;
	}

	@RequestMapping(value = "/contentwrite.co/{chnum}", method = RequestMethod.GET)
	public ModelAndView addBoard(@PathVariable("chnum") int chnum, ModelAndView mv, HttpServletRequest request,
			HttpSession session, Principal principal) {

		session.setAttribute("chnum", chnum);

		if (chnum == WRONG_CHNUM) {
			logger.info("글작성 페이지: chnum 파라미터가 없거나 잘못된 값입니다.");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "채널 메인 페이지 표시 실패: chnum 파라미터가 없거나 잘못된 값입니다.");
			return mv;
		}

		logger.info("글 작성 페이지: chnum=" + chnum);

		List<ChBoardCategory> cbctlist = channelList_Service.getCategoryNameList(chnum);

		mv.addObject("cbctlist", cbctlist);
		mv.setViewName("content/content_write");

		return mv;

	}

	@PostMapping("/contentadd")
	public String insertContent(ChBoard chboard, Tag tag,
			@RequestParam(value = "tagname", required = false) List<String> taglist, Principal principal,
			HttpSession session, HttpServletRequest request, BindingResult result) throws Exception {

		MultipartFile uploadfile = chboard.getUpload();

		if (uploadfile != null && !uploadfile.isEmpty()) {
			logger.info("파일 추가/변경되었습니다.");

			String fileName = uploadfile.getOriginalFilename(); // 원래 파일명

			String fileDBName = fileDBName(fileName, saveFolder + "/contents/" + chboard.getChNum());
			logger.info("fileDBName = " + fileDBName);

			String userFolder = saveFolder + "/contents/" + chboard.getChNum() + File.separator + fileDBName;

			byte[] bytes = uploadfile.getBytes(); // 파일의 내용을 바이트 배열로 읽어옵니다.

			Path path = Paths.get(userFolder); // 파일을 저장할 절대경로 객체(Path)

			Files.write(path, bytes); // 해당 경로에 파일 쓰기

			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			// uploadfile.transferTo(new File(saveFolder + "/" + chnum + fileDBName));
			logger.info("transferTo path = " + saveFolder + "/contents/" + chboard.getChNum() + userFolder);
			// 바뀐 파일명으로 저장
			chboard.setThumbNail(fileDBName);
		}

		// 세션에서 데이터 가져오기
		int chnum = (int) session.getAttribute("chnum");

		String contentText = chboard.getBoardContent(); // 여기를 수정했습니다.

		Document doc = Jsoup.parse(contentText);

		Elements paragraphs = doc.select("p,a,h");
		String Intro = "";
		for (int i = 0; i < paragraphs.size(); i++) {
			System.out.println(paragraphs.get(i).text());
			boolean text = paragraphs.get(i).text().matches("^(?=.*\\S).*$");
			if (text) {
				Intro += paragraphs.get(i).text();
				if (Intro.length() > 80) {
					break;
				}
			}
		}

		chboard.setChNum(chnum);
		chboard.setWriter(principal.getName());
		chboard.setIntro(Intro);

		int results = channelList_Service.contentInsert(chboard);
		List<ChBoard> newcontent = channelList_Service.newContentSelect(chnum);

		int contentNum = 0;
		if (!newcontent.isEmpty()) {
			contentNum = newcontent.get(0).getBoardNum();
			System.out.println(contentNum);

		}

		int tagLength = 0;
		if (request.getParameterValues("tagname") != null) {
			tagLength = request.getParameterValues("tagname").length;
		}

		if (taglist != null && !taglist.isEmpty()) {
			// 태그 입력 처리
			for (String tags : taglist) {
				logger.info("tags =" + tags);

				Map<String, Object> parameters = new HashMap<>();
				parameters.put("tagName", tags); // Here use 'tags' instead of 'tag.getTagName()'
				parameters.put("boardNum", contentNum);

				int resultTagInsert = TagService.tagInsert(parameters);
			}
		}

		if (results > 0) {
			String userId = principal.getName();
			return "redirect:/channels/" + chnum + "?userid=" + userId;
		} else {
			throw new Exception("게시물 작성 오류");
		}
	}

	@PostMapping("/subscribe")
	@ResponseBody
	public String subscribe(@RequestParam String userId, @RequestParam int chnum) {
		logger.info("구독 요청 처리 시작: userId = " + userId + ", chnum = " + chnum);
		channelList_Service.subscribe(userId, chnum);
		logger.info("구독 요청 처리 완료: userId = " + userId + ", chnum = " + chnum);
		return "구독 처리 완료";
	}

	@PostMapping("/unsubscribe")
	@ResponseBody
	public String unsubscribe(@RequestParam String userId, @RequestParam int chnum) {
		logger.info("구독 취소 처리 시작: userId = " + userId + ", chnum = " + chnum);
		channelList_Service.unsubscribe(userId, chnum);
		logger.info("구독 취소 처리 시작: userId = " + userId + ", chnum = " + chnum);
		return "구독 취소 처리 완료";
	}

	@PostMapping("/checkSubscription")
	@ResponseBody
	public Map<String, Boolean> checkSubscription(@RequestParam String userId, @RequestParam int chnum) {
		logger.info("구독 상태 확인 시작: userId = " + userId + ", chnum = " + chnum);
		boolean isSubscribed = channelList_Service.checkSubscription(userId, chnum);
		Map<String, Boolean> response = new HashMap<>();
		response.put("isSubscribed", isSubscribed);
		logger.info("구독 상태 확인 완료: userId = " + userId + ", chnum = " + chnum);
		return response;
	}

	@PostMapping("/getSubscriberCount")
	@ResponseBody
	public Map<String, Integer> getSubscriberCount(@RequestParam String userId, @RequestParam int chnum) {
		logger.info("구독자 수 확인 시작: userId = " + userId + ", chnum = " + chnum);

		int subscriberCount = channelList_Service.getSubscriberCount(userId, chnum);

		Map<String, Integer> response = new HashMap<>();
		response.put("subscriberCount", subscriberCount);

		logger.info("구독자 수 확인 완료: userId = " + userId + ", chnum = " + chnum);
		return response;
	}

}