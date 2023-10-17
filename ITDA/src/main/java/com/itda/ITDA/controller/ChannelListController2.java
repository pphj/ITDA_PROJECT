/*package com.itda.ITDA.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChBoardCategory;
import com.itda.ITDA.domain.ChannelList;
import com.itda.ITDA.domain.Seller;
import com.itda.ITDA.service.ChannelList_Service;

//DAO와 Service가 작성되어야 Controller가 완성된다
@Controller
@RequestMapping(value = "/channels")
public class ChannelListController2 {

	private static final Logger logger = LoggerFactory.getLogger(ChannelListController2.class);

	@Value("${my.savefolder}")
	private String saveFolder;

	private ChannelList_Service channelList_Service;

	// chnum 파라미터가 없거나 null인 경우에 대한 처리를 수행합니다.
	final int WRONG_CHNUM = 0;

	@Autowired
	public ChannelListController2(ChannelList_Service channelList_Service) {
		this.channelList_Service = channelList_Service;
	}

	@RequestMapping(value = "/{chnum}", method = RequestMethod.GET)
	public ModelAndView showChannelMainPage(@PathVariable(value = "chnum") int chnum, // chnum을 파라미터로 전달 받음
			String userid, ModelAndView mv, HttpServletRequest request) {

		if (chnum == WRONG_CHNUM)
		{
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

		if (ChannelList == null)
		{
			logger.info("채널 메인 페이지 표시 실패: 해당 번호의 채널을 찾을 수 없습니다.");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "채널 메인 페이지 표시 실패: 해당 번호의 채널을 찾을 수 없습니다.");
		} else
		{
			// logger.info("채널 메인 페이지 표시 성공");
			// 채널 정보를 뷰로 전달
			mv.setViewName("channel/ChannelMain");
			mv.addObject("ChannelList", ChannelList);

			mv.addObject("sellerinfo", sellerinfo);

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
			@RequestParam(name = "state", required = false) String state) {

		if (chnum == WRONG_CHNUM)
		{
			logger.info("컨텐츠 목록 페이지 표시 실패: channelnum 파라미터가 없거나 잘못된 값입니다.");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "컨텐츠 목록 페이지 표시 실패: channelnum 파라미터가 없거나 잘못된 값입니다.");
		} else
		{
			logger.info("컨텐츠 목록 페이지 표시 요청: channelnum=" + chnum);
			List<ChBoardCategory> chcategorylist = channelList_Service.getChannelCategoryList(chnum);
			mv.setViewName("content/content_list");

			List<ChBoard> contentlist = new ArrayList<ChBoard>();
			int listcount = 0;

			if (chCate_Id == 0)
			{ // 전체
				contentlist = channelList_Service.getAllChannelCategoryData(chnum, order, page, limit);
				listcount = channelList_Service.getAllChannelCategoryCount(chnum);

			} else
			{ // 카테고리
				contentlist = channelList_Service.getChannelCategoryData(chnum, chCate_Id, page, limit);
				System.out.println(contentlist.get(0).getBoardDate());
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

	@RequestMapping(value = "{chnum}/sellersetting", method = {
				RequestMethod.GET, RequestMethod.POST })
	public ModelAndView showChannelSetting(@PathVariable("chnum") int chnum, ModelAndView mv, ChannelList ChannelList,
			String check, HttpServletRequest request, HttpSession session) throws Exception {

		MultipartFile uploadfile = ChannelList.getUploadfile();

		if (check != null && !check.equals(""))
		{// 기존 파일 그대로 사용하는 경우입니다.
			logger.info("기존파일 그대로 사용합니다.");
			ChannelList.setChProfile_original(check);
			// <input type="hidden" name ="BOARD_FILE" value="${boarddata.BOARD_FILE}">
			// 위 문장 때문에 board.setBOARD_FILE()값은 자동 저장 됩니다.
		} else
		{

			// 답변글의 경우 파일 첨부에 대한 기능이 없습니다.
			// 만약 답변글을 수정할 경우
			// <input type="file" id="upfile" name="uploadfile"> 엘리먼트가 존재하지 않아
			// private MultipartFile uploadfile; 에서 uploadfile은 null 입니다.
			if (uploadfile != null && !uploadfile.isEmpty())
			{
				logger.info("파일 추가/변경되었습니다.");

				String fileName = uploadfile.getOriginalFilename(); // 원래 파일명
				ChannelList.setChProfile_original(fileName);

				String fileDBName = fileDBName(fileName, saveFolder);
				logger.info("fileDBName = " + fileDBName);
				// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
				uploadfile.transferTo(new File(saveFolder + fileDBName));
				logger.info("transferTo path = " + saveFolder + fileDBName);
				// 바뀐 파일명으로 저장
				ChannelList.setChProfile(fileDBName);
			} else
			{// 기존 파일이 없는데 파일 선택하지 않은 경우 또는 기존 파일이 있었는데 삭제한 경우
				logger.info("선택 파일이 없습니다.");
				// <input type ="hidden" name = "BOARD_FILE" value="${boarddat.BOARD_FILE}">
				// 위 태그에 같이 있다면 "" 로 값을 변경 합니다.
				ChannelList.setChProfile("");// ""로 초기화합니다.
				ChannelList.setChProfile_original("");// ""로 초기화 합니다.
			} // else end

		} // else end

		// 채널 설정 변경
		ChannelList SellerSetting = channelList_Service.getSellerSetting(chnum);
		// 채널 프로필 변경
		int ChannelProfile = channelList_Service.getSellerUpdate(ChannelList);


		// 세션에 새로운 설정 정보 저장
		ChannelList SellerSetting = (ChannelList) session.getAttribute("SellerSetting");
		SellerSetting.setChProfile(ChannelList.getChProfile());
		SellerSetting.setChName(ChannelList.getChName());
		session.setAttribute("SellerSetting", SellerSetting);

		mv.addObject("ChannelProfile", ChannelProfile);
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

		*//**** 확장자 구하기 시작 ****//*
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
							
							}
							*/