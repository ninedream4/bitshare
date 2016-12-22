package bitcamp.java87.project01.controller;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import bitcamp.java87.project01.domain.Comment;
import bitcamp.java87.project01.domain.Content;
import bitcamp.java87.project01.domain.Page;
import bitcamp.java87.project01.domain.Search;
import bitcamp.java87.project01.domain.User;
import bitcamp.java87.project01.service.ContentService;

@Controller
@RequestMapping("/content/*")
public class ContentController {

	/// Field
	@Autowired
	@Qualifier("contentServiceImpl")
	private ContentService contentService;

	public ContentController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value = "addContent", method = RequestMethod.POST)
	public String addContent(@ModelAttribute("content") Content content, HttpSession session, @RequestParam("file") MultipartFile file) throws Exception {
		
		System.out.println("/content/addContent : POST");
		// Business Logic
		User user = (User)session.getAttribute("user");
		content.setUserId(user.getUserId());
		contentService.addContent(content, file);
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value = "addComment", method = RequestMethod.POST)
	public String addComment(@ModelAttribute("comment") Comment comment, HttpSession session, @RequestParam("file") MultipartFile file) throws Exception {
		
		System.out.println("/content/addContent : POST");
		// Business Logic
		User user = (User)session.getAttribute("user");
		comment.setUserId(user.getUserId());
		
		Content content = (Content)session.getAttribute("content");
		comment.setContentId(content.getContentId());
		
		contentService.addComment(comment);
		
		return "redirect:/index.jsp";
	}

	@RequestMapping(value = "getContent", method = RequestMethod.GET)
	public String getContent(@RequestParam("title") String title, Model model) throws Exception {

		System.out.println("/content/getContent : GET");
		// Business Logic
		Content content = contentService.getContent(title);
		model.addAttribute("content", content);

		return "redirect:/index.jsp";
	}

	@RequestMapping(value = "getContentList", method = RequestMethod.GET)
	public void getContentList(@RequestParam("search") Search search, Model model) throws Exception {
		System.out.println("/content/getContentList : GET");
		
		if(search.getCurrentPage()==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = contentService.getContentList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
	}
	
//	@RequestMapping(value = "deleteContent", method = RequestMethod.GET)
//	public String deleteContent(@RequestParam("contentId") int contentId, Model model) throws Exception {
//
//		System.out.println("/content/deleteContent : GET");
//		// Business Logic
//		Content content = contentService.deleteContent(contentId);
//		model.addAttribute("content", content);
//
//		return "redirect:/index.jsp";
//	}

	@RequestMapping(value = "updateContent", method = RequestMethod.POST)
	public String updateContent(@ModelAttribute("content") Content content, Model model) throws Exception {

		System.out.println("/content/updateContent : POST");
		System.out.println(content);
		System.out.println(model);

		contentService.updateContent(content);

		// Business Logic
		content = contentService.getContent(content.getTitle());
		model.addAttribute("content", content);

		return "forward:/index.jsp";
	}
	
	@RequestMapping(value = "updateComment", method = RequestMethod.POST)
	public String updateComment(@ModelAttribute("comment") Comment comment, Model model, HttpSession session) throws Exception {
		User user = (User)session.getAttribute("user");
		comment.setUserId(user.getUserId());
		
		Content content = (Content)session.getAttribute("content");
		comment.setContentId(content.getContentId());
		contentService.updateComment(comment);

		return "forward:/index.jsp";
	}
	
	@RequestMapping(value = "download")
	@ResponseBody
	public void download(OutputStream out) throws Exception {
		BufferedInputStream fileIn = new BufferedInputStream(new FileInputStream("c:/bitshare/aaa/1.png"));
		
		int b = 0;
		while ((b = fileIn.read()) != -1) {
			out.write(b);
		}
		
		fileIn.close();
		out.flush();
	}
}