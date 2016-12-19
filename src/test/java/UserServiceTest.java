
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import bitcamp.java87.project01.domain.Page;
import bitcamp.java87.project01.domain.Search;
import bitcamp.java87.project01.domain.User;
import bitcamp.java87.project01.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
																	"classpath:config/context-aspect.xml",
																	"classpath:config/context-mybatis.xml",
																	"classpath:config/context-transaction.xml" })
public class UserServiceTest {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

//	@Test
	public void testAddUser() throws Exception {
		User user = new User();
		user.setEmail("a");
		user.setPwd("a");
		List<String> tag = new ArrayList<String>();
		tag.add("a");
		tag.add("b");
		tag.add("c");
		user.setTag(tag);
		
		//method
		userService.addUser(user);
	}
	
//	@Test
	public void testGetUser() throws Exception {
		User user = new User();
		user.setEmail("bbb");
		user.setPwd("bbbb");
		
		//method
		userService.getUser(user.getEmail(), user.getPwd());
	}
	
	@Test
	public void testGetUserList() throws Exception {
		Search search = new Search();
		search.setSearchKeyword("a");
		search.setPageSize(10);
		search.setCurrentPage(1);
		
		//method
		userService.getUserList(search);
	}
	
//	@Test
	 public void testUpdateUser() throws Exception{
		 
		User user = userService.getUser("asdf", "asdf");
		
		user.setEmail("asdf");
		user.setPwd("asdf");
		List<String> tag = new ArrayList<String>();
		tag.add("bbb");
		user.setTag(tag);
		
		//method
		userService.updateUser(user);
		userService.getUser(user.getEmail(),user.getPwd());

	}
	 
//	@Test
	public void testCheckDuplication() throws Exception{
		String email = "w";
		userService.checkDuplication(email);
			
	}

}