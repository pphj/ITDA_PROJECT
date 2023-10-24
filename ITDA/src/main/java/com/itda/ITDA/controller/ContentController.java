package com.itda.ITDA.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itda.ITDA.domain.BoardReply;
import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChBoardCategory;
import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.Seller;
import com.itda.ITDA.domain.Tag;
import com.itda.ITDA.service.ContentService;
import com.itda.ITDA.service.ReplyService;
import com.itda.ITDA.service.TagService;
import com.itda.ITDA.service.heartService;

@Controller
@RequestMapping(value = "/contents")
public class ContentController {

	private static final Logger logger = LoggerFactory.getLogger(ContentController.class);

	@Value("${my.savefolder}")
	private String saveFolder;

	private ContentService contentService;
	private TagService TagService;
	private ReplyService replyService;
	private heartService heartService;

	// chnum 파라미터가 없거나 null인 경우에 대한 처리를 수행합니다.
	final int WRONG_CHNUM = 0;

	@Autowired
	public ContentController(ContentService contentService, TagService TagService, ReplyService replyService,
			heartService heartService) {
		this.contentService = contentService;
		this.TagService = TagService;
		this.replyService = replyService;
		this.heartService = heartService;
	}

	// 게시글 자세히 보기
	@RequestMapping(value = "/{chnum}/{boardNum}", method = RequestMethod.GET)
	public String getContentDetailMove(@PathVariable(value = "boardNum") int boardnum, Model model,
			@PathVariable(value = "chnum") int chnum, String userid, Principal principal) {

		ChBoard board = contentService.getContentDetail(boardnum);
		logger.info("boardNum = " + board.getBoardNum());

		// 채널주인 확인
		Seller sellerinfo = contentService.getSellerInfo(userid);

		Itda_User userinfo = null;

		int rcnt = 0;
		rcnt = replyService.getListCount(boardnum);

		// 채널과 연관된 카테고리 목록을 가져옴
		List<ChBoardCategory> ContentCategory = contentService.getChannelCategory(boardnum);

		// 로그인한 사용자의 ID를 가져오기
		if (principal != null)
		{
			String userId = principal.getName();
			// user확인
			userinfo = contentService.getUserInfo(userId);
		}

		// 태그
		List<Tag> taginfo = contentService.getTagInfo(chnum, boardnum);
		logger.info("taginfo = " + taginfo);

		// model.addAttribute("ContentCategory", ContentCategory);
		model.addAttribute("userinfo", userinfo);
		model.addAttribute("rcnt", rcnt);
		model.addAttribute("taginfo", taginfo);
		model.addAttribute("sellerinfo", sellerinfo);
		model.addAttribute("board", board);

		return "/content/content_detail";

	}

	// 게시글 수정 view
	@GetMapping("/{chnum}/modifyView")
	public String contentModify(@PathVariable("chnum") int chnum, @RequestParam("boardnum") int boardnum, Model model,
			Principal principal, HttpServletRequest request, RedirectAttributes rattr) {

		// 게시글 정보 가져오기
		ChBoard chboard = contentService.getContentDetail(boardnum);
		List<ChBoardCategory> cbctlist = contentService.getCategoryNameList(chnum);
		List<Tag> taginfo = contentService.getTagInfo(chnum, boardnum);

		if (chboard == null)
		{
			// 해당 번호의 게시글이 없다면 에러 페이지로 리다이렉션
			return "redirect:/error";
		}

		// 현재 사용자가 게시글 작성자와 일치하는지 확인
		if (!principal.getName().equals(chboard.getWriter()))
		{
			// 작성자와 현재 사용자가 다르다면 에러 페이지로 리다이렉션
			return "redirect:/error";
		}
		model.addAttribute("taginfo", taginfo);
		model.addAttribute("cbctlist", cbctlist);
		model.addAttribute("chboard", chboard);

		return "content/content_modify"; // 실제 수정 페이지 뷰 이름으로 변경해야 합니다.
	}

	// 게시물 수정
	@PostMapping("/{chnum}/contentmodify")
	public String updateContent(ChBoard chboard, ChBoardCategory chBoardCategory, Tag tag,
			@PathVariable("chnum") int chnum,
			@RequestParam(value = "tagname", required = false) List<String> taglist,
			@RequestParam(value = "tagId", required = false) List<String> tagIdlist,
			@RequestParam(value = "chCate_Id", defaultValue = "0") int chCateId,
			@RequestParam(value = "upload", required = false) MultipartFile uploadfile, Principal principal,
			RedirectAttributes rattr, BindingResult result, String check, Model mv, HttpServletRequest request)
			throws IOException {

		boolean usercheck = contentService.isContentWriter(chboard.getBoardNum());

		String url = "";

		uploadfile = chboard.getUpload();

		if (check != null && !check.equals(""))
		{
			logger.info("기존 파일 그대로 사용합니다.");
			chboard.setThumbNail(check);
		} else
		{
			if (uploadfile != null && !uploadfile.isEmpty())
			{
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
			} else
			{
				logger.info("선택된 파일이 없습니다.");
				chboard.setBoardUpdate("");
				chboard.setThumbNail("");
			}
			String contentText = chboard.getBoardContent(); // 여기를 수정했습니다.

			Document doc = Jsoup.parse(contentText);

			Elements paragraphs = doc.select("p");
			String Intro = "";
			for (int i = 0; i < paragraphs.size(); i++)
			{
				System.out.println(paragraphs.get(i).text());
				boolean text = paragraphs.get(i).text().matches("^(?=.*\\S).*$");
				if (text)
				{
					Intro += paragraphs.get(i).text();
					if (Intro.length() > 80)
					{
						break;
					}
				}
			}

			chboard.setChNum(chnum);
			chboard.setWriter(principal.getName());
			chboard.setIntro(Intro);

			int results = contentService.contentModify(chboard);
			List<ChBoard> newcontent = contentService.newContentSelect(chnum);

			int contentNum = 0;
			if (!newcontent.isEmpty())
			{
				contentNum = newcontent.get(0).getBoardNum();
				System.out.println(contentNum);

			}

			int tagLength = 0;
			if (request.getParameterValues("tagname") != null)
			{
				tagLength = request.getParameterValues("tagname").length;
			}
			if (tagIdlist != null && !tagIdlist.isEmpty())
			{
				TagService.tagDelete(tagIdlist);
			}

			if (taglist != null && !taglist.isEmpty())
			{

				for (String tags : taglist)
				{
					logger.info("tags =" + tags);

					Map<String, Object> parameters = new HashMap<>();
					parameters.put("tagName", tags);
					parameters.put("boardNum", contentNum);
					parameters.put("tagId", tag.getTagId());
					System.out.println(tag.getTagId());

					int resultTagUpdate = TagService.tagInsert(parameters);
					System.out.println("resultTagUpdate =" + resultTagUpdate);
				}
			}

			// 수정에 실패한 경우
			if (results == 0)
			{
				logger.info("게시판 수정 실패");
				mv.addAttribute("url", request.getRequestURL());
				mv.addAttribute("message", "게시판 수정 실패");
				url = "error/error";
			} else
			{ // 수정 성공의 경우
				logger.info("게시판 수정 완료");
				// 수정한 글 내용을 보여주기 위해 글 내용 보기 페이지로 이동하기 위해 경로를 설정합니다.
				url = "redirect:/contents/" + chnum + "/" + chboard.getBoardNum() + "?userid=" + principal.getName()
						+ "&chcate_name=" + chBoardCategory.getChCate_Name();

				String chcateName = contentService.findNameById(chCateId);

				url = "redirect:/contents/" + chnum + "/" + chboard.getBoardNum() + "?userid=" + principal.getName()
						+ "&chcate_name=" + chcateName;

			}
		}
		return url;
	}

	private String fileDBName(String fileName, String saveFolder) {
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		int date = c.get(Calendar.DATE);

		File path2 = new File(saveFolder);
		if (!(path2.exists()))
		{
			path2.mkdir();
		}

		String homedir = saveFolder + "/" + year + "-" + month + "-" + date;
		File path1 = new File(homedir);
		if (!(path1.exists()))
		{
			path1.mkdir();
		}

		Random r = new Random();
		int random = r.nextInt(100000000);

		int index = fileName.lastIndexOf(".");
		String fileExtension = fileName.substring(index + 1);

		String refileName = "bbs" + year + month + date + random + "." + fileExtension;

		String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;

		return fileDBName;
	}

	// 게시글 삭제
	@PostMapping("/{chnum}/delete")
	public String BoardDeleteAction(@PathVariable("chnum") int chnum, @RequestParam("boardnum") int boardnum, Model mv,
			RedirectAttributes rattr, HttpServletRequest request) {

		logger.info("Attempting to delete post with boardnum= " + boardnum);

		try
		{
			// 1. Get the post details using the board number
			ChBoard chboard = contentService.getContentDetail(boardnum);

			// 2. Delete the uploaded image file if it exists
			if (chboard.getThumbNail() != null && !chboard.getThumbNail().isEmpty())
			{
				Path filePath = Paths.get(
						saveFolder + "/contents/" + chboard.getChNum() + File.separator + chboard.getThumbNail());
				Files.deleteIfExists(filePath);
			}

			// 3. Delete tags associated with this post
			// TagService.deleteTagsByBoardNum(boardnum);

			// 4. Finally delete the post itself
			contentService.deleteBoard(boardnum);

			logger.info("Successfully deleted post with boardNum: " + boardnum);

			rattr.addFlashAttribute("result", "deleteSuccess");

			return "redirect:/channels/" + chnum;

		} catch (Exception e)
		{

			logger.error("Failed to delete post with boardNum: " + boardnum);
			mv.addAttribute("url", request.getRequestURL());
			mv.addAttribute("message", "삭제 실패");
			return "error/error";
		}
	}

	// 댓글 리스트
	@PostMapping("/{chnum}/{boardNum}/replyView")
	@ResponseBody
	public Map<String, Object> getReplies(@PathVariable int chnum, @RequestParam int boardNum,
			@RequestParam(required = false) Integer state, HttpServletRequest request, Model mv) {

		List<BoardReply> replies = replyService.getReplies(boardNum, state);
		Map<String, Object> response = new HashMap<>();

		if (replies == null || replies.isEmpty())
		{
			logger.warn("No replies found for boardNum: " + boardNum);
			response.put("replylist", Collections.emptyList()); // 빈 리스트를 반환
		} else
		{
			logger.info(replies.size() + " replies found for board Num: " + boardNum);
			// 각각의 reply 객체에 대한 정보도 로그로 남깁니다.
			for (BoardReply reply : replies)
			{
				logger.info("Reply: " + reply.toString());
			}
			response.put("replylist", replies); // 조회한 댓글 목록을 반환
			mv.addAttribute("replylist", replies);

		}

		return response;
	}

	// 댓글 추가하기
	@PostMapping("/{chnum}/{boardNum}/replies/add")
	@ResponseBody
	public Map<String, Object> addReply(@RequestBody BoardReply reply, Principal principal) {
		logger.info(" id: " + reply.getBoardNum());
		int result = replyService.commentsInsert(reply);
		Map<String, Object> response = new HashMap<>();

		if (result == 1)
		{
			logger.info("Successfully: " + reply.getBoardNum());
			response.put("status", "success");

			int totalReplies = replyService.getTotalReplies(reply.getBoardNum());
			response.put("commentCount", totalReplies);
		} else
		{
			logger.error("Failed: " + reply.getBoardNum());
			response.put("status", "fail");
		}
		return response;
	}

	// 대댓글
	@ResponseBody
	@PostMapping(value = "/ReplyReply")
	public int CommentAdd(BoardReply reply, Principal principal) {
		String username = principal.getName();
		System.out.println("Logged in user: " + username); // Add this line for debugging

		reply.setReplyWriter(username);
		return replyService.addReply(reply);
	}

	// 댓글 수정
	@ResponseBody
	@PostMapping(value = "/replyupdate")
	public int CommentUpdate(BoardReply reply) {
		return replyService.commentsUpdate(reply);
	}

	// 댓글 삭제
	@ResponseBody
	@PostMapping(value = "/replydelete")
	public int CommentDelete(int num) {
		int result = replyService.commentsDelete(num);
		logger.info("result=========" + result);
		return result;
	}

	@PostMapping("/heartUpdate")
	@ResponseBody
	public Map<String, Object> updateHeartCount(@RequestParam("boardNum") int boardNum,
			@RequestParam("heartstate") int heartState, @RequestParam("userId") String userId, Principal principal) {
		Map<String, Object> response = new HashMap<>();

		userId = principal.getName();
		logger.info("Received heartState: " + heartState + " for user " + userId);

		try
		{
			if (heartState == 1)
			{
				// 좋아요 추가 로직
				try
				{
					heartService.addHeart(boardNum, userId);
					logger.info("좋아요 성공");
				} catch (DuplicateKeyException e)
				{ // 이미 좋아요가 등록된 경우
					response.put("success", false);
					response.put("message", "이미 좋아요를 누른 게시물입니다.");
					return response;
				}
			} else if (heartState == 0)
			{
				// 좋아요 취소 로직
				heartService.removeHeart(boardNum, userId);
				logger.info("좋아요 취소 성공");
			}

			int updatedValue = heartService.getHeartCount(boardNum);
			logger.info("updatedValue = " + updatedValue);

			response.put("success", true);
			response.put("updatedValue", updatedValue);

		} catch (Exception e)
		{
			logger.error("Error updating heart count or getting the count", e);
			response.put("success", false);
		}

		return response;
	}

	@GetMapping("/getHeartStateAndCount")
	@ResponseBody
	public Map<String, Object> getHeartStateAndCount(@RequestParam("boardNum") int boardNum,
			@RequestParam("userId") String userId) {
		Map<String, Object> response = new HashMap<>();

		try
		{
			// '좋아요' 상태 조회 로직
			boolean heartExists = heartService.existsByBoardNumAndUserId(boardNum, userId);

			// '좋아요' 갯수 조회 로직
			int heartCount = heartService.getHeartCount(boardNum);

			response.put("heartState", heartExists ? 1 : 0);
			response.put("heartCount", heartCount);
			response.put("success", true);
		} catch (Exception e)
		{
			logger.error("Error getting heart state and count", e);
			response.put("success", false);
		}

		return response;
	}

	/*@RequestMapping(value = "/contentlist.co")
	public String getContentList(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "limit", defaultValue = "10") int limit,
			@RequestParam(name = "channelnum") int channelnum,
			@RequestParam(name = "order", defaultValue = "desc") String order,
			@RequestParam(name = "chcate_id") int categoryId,
			@RequestParam(name = "state", required = false) String state, Model mv) {
	
		List<ChBoard> contentlist = new ArrayList<ChBoard>();
	
		int listcount = 0;
	
		if (categoryId == 0)
		{ // 전체
			contentlist = contentService.getAllChannelCategoryData(channelnum, order, page, limit);
			listcount = contentService.getAllChannelCategoryCount(channelnum);
	
		} else
		{ // 카테고리
			contentlist = contentService.getChannelCategoryData(channelnum, categoryId, page, limit);
			listcount = contentService.getChannelCategoryCount(channelnum, categoryId);
		}
	
		int maxpage = (listcount + limit - 1) / limit;
	
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;
		if (endpage > maxpage)
			endpage = maxpage;
	
		mv.addAttribute("page", page);
		mv.addAttribute("limit", limit);
		mv.addAttribute("channelnum", channelnum);
		mv.addAttribute("order", order);
		mv.addAttribute("chcate_id", categoryId);
		mv.addAttribute("state", state);
		mv.addAttribute("maxpage", maxpage);
		mv.addAttribute("startpage", startpage);
		mv.addAttribute("endpage", endpage);
		mv.addAttribute("listcount", listcount);
		mv.addAttribute("contentlist", contentlist);
	
		// 뷰 페이지로 이동
		return "content/content_list";
	}*/

}
