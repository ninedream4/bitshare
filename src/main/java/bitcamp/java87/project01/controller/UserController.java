package bitcamp.java87.project01.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import bitcamp.java87.project01.domain.Page;
import bitcamp.java87.project01.domain.Search;
import bitcamp.java87.project01.domain.User;
import bitcamp.java87.project01.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	/// Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public UserController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value="addUser", method=RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user) throws Exception {

		System.out.println("/user/addUser : POST");
		// Business Logic
		userService.addUser(user);

		return "redirect:/index.jsp";
	}

	@RequestMapping(value="updateUser", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user, Model model, HttpSession session) throws Exception {

		System.out.println("/user/updateUser : POST");
		// Business Logic
		userService.updateUser(user);

		String sessionId = ((User) session.getAttribute("user")).getEmail();
		if (sessionId.equals(user.getEmail())) {
			session.setAttribute("user", user);
		}

		return "redirect:/index.jsp";
	}

	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(@ModelAttribute("user") User user, HttpSession session) throws Exception {

		System.out.println("/user/login : POST");
		
		// Business Logic
		User dbUser = userService.getUser(user.getEmail(), user.getPwd());
		
		if(dbUser != null) {
			session.setAttribute("user", dbUser);
			return "redirect:/index.jsp";
		}
		
		return "redirect:/common/error.jsp";
	
	}

	@RequestMapping(value="logout", method=RequestMethod.POST)
	public String logout(HttpSession session) throws Exception {

		System.out.println("/user/logout : POST");

		session.invalidate();

		return "redirect:/index.jsp";
	}

	@RequestMapping(value="checkDuplication")
	public @ResponseBody Boolean checkDuplication(String email) throws Exception {

		System.out.println("/user/checkDuplication : POST");
		
		// Business Logic
		boolean result = userService.checkDuplication(email);
	
	  return result;
	}

	@RequestMapping(value="listUserByTag")
	public String listUserByTag(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
			throws Exception {

		System.out.println("/user/listUser : GET / POST");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = userService.getUserList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/user/listUser.jsp";
	}
}