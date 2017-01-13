package bitcamp.java87.project01.controller;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;

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
		content.setEmail(user.getEmail());
		contentService.addContent(content, file);
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value = "addComment", method = RequestMethod.POST)
	public @ResponseBody String addComment(@ModelAttribute("comment") Comment comment, HttpSession session) throws Exception {
		
		System.out.println("/content/addComment : POST");
		// Business Logic
		User user = (User)session.getAttribute("user");
		comment.setUserId(user.getUserId());
		comment.setEmail(user.getEmail());
		contentService.addComment(comment);
		return "redirect:/index.jsp";
	}

	@RequestMapping(value = "getContent", method = RequestMethod.GET, produces="application/json")
	public ResponseEntity getContent(@RequestParam("title") String title) throws Exception {
		//utf-8 문제 해결 ResponseEntity
		System.out.println("/content/getContent : GET");
		System.out.println(title);
		// Business Logic
		Map<String, Object> map = contentService.getContent(title);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonText = mapper.writeValueAsString(map);
		System.out.println("=!="+jsonText);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json;charset=UTF-8");
		return new ResponseEntity(jsonText, responseHeaders, HttpStatus.OK);
	}
	
	@RequestMapping(value = "getContentList", method = RequestMethod.POST, produces="application/json")
	public ResponseEntity getContentList() throws Exception {
		System.out.println("/content/getContentList : POST");
		Search search = new Search();
		Map<String, Object> map = contentService.getContentList(search);
		ObjectMapper mapper = new ObjectMapper();
		String jsonText = mapper.writeValueAsString(map);
		System.out.println("=!="+jsonText);

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json;charset=UTF-8");
		return new ResponseEntity(jsonText, responseHeaders, HttpStatus.OK);
	}
	
	@RequestMapping(value = "getMyContentList", method = RequestMethod.GET, produces="application/json")
	public @ResponseBody String getMyContentList(HttpSession session) throws Exception {
	  User user = (User)session.getAttribute("user");
	  Search search = new Search();
	  search.setSearchKeyword(user.getEmail());
	  
	  List<Content> list = contentService.getMyContentList(search);
	  ObjectMapper mapper = new ObjectMapper();
    String jsonText = mapper.writeValueAsString(list);
    System.out.println("=!="+jsonText);
	  return jsonText;
	}
	
	@RequestMapping(value = "getContentListByKeyword/{searchCd}", method = RequestMethod.GET, produces="application/json")
	  public @ResponseBody String getContentListByKeyword(@PathVariable String searchCd, Model model) throws Exception {
	    System.out.println("/content/getContentListByKeyword : GET");
	    Search search  = new Search();
	    searchCd=searchCd.toLowerCase();
	    search.setSearchKeyword(searchCd);
	    Map<String, Object> map = contentService.getContentList(search);
	    ObjectMapper mapper = new ObjectMapper();
	    String jsonText = mapper.writeValueAsString(map);
	    System.out.println("=!="+jsonText);
	    
	    return jsonText;
		}
	
	 @RequestMapping(value = "getContentListByCategory",  produces="application/json")
	  public @ResponseBody String getContentListByCategory(@RequestParam("category") String category, Model model) throws Exception {
	    System.out.println("/content/getContentListByCategory : START");
	    Search search  = new Search();
	    search.setSearchKeyword(category);
	    Map<String, Object> map = contentService.getContentListByCategory(search);
	    System.out.println("getContentListByCategory");
	    ObjectMapper mapper = new ObjectMapper();
	    String jsonText = mapper.writeValueAsString(map);
	    System.out.println("getContentListByCategory"+jsonText);
	    
	    return jsonText;
	  }

	@RequestMapping(value = "updateContent", method = RequestMethod.POST)
	public String updateContent(@ModelAttribute("content") Content content, Model model) throws Exception {

		System.out.println("/content/updateContent : POST");
		
		// Business Logic
		contentService.updateContent(content);
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
	public void download(OutputStream out, @RequestParam("src") String src) throws Exception {
		String path = "c:/bitshare/";
		path+= src;
		BufferedInputStream fileIn = new BufferedInputStream(new FileInputStream(path));
		
		int b = 0;
		while ((b = fileIn.read()) != -1) {
			out.write(b);
		}
		
		fileIn.close();
		out.flush();
		out.close();
	}
	
	@RequestMapping(value = "checkTitle")
	public @ResponseBody Boolean checkTitle(String title) throws Exception {
		System.out.println("/contents/checkTitle: Start");

		boolean result = contentService.checkTitle(title);

		return result;
	}
	
	@RequestMapping(value ="contentDelete/{contentId}")
	public String  contentDelete(@PathVariable int contentId )throws Exception{
	  System.out.println("contentDelete Start");
	  
	  System.out.println("deleteContent !");
	  contentService.deleteContent(contentId);	
	  

	  System.out.println("deleteContent @");
	  return "forward:/myPage.jsp"; 
	}
}