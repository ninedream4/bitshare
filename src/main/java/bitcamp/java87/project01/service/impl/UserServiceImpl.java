package bitcamp.java87.project01.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import bitcamp.java87.project01.dao.UserDao;
import bitcamp.java87.project01.domain.Search;
import bitcamp.java87.project01.domain.User;
import bitcamp.java87.project01.service.UserService;;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

	/// Field
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	/// Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	/// Method
	public void addUser(User user) throws Exception {
		userDao.addUser(user);
		userDao.addUserTag(user);
	}

	public User getUser(String email, String pwd) throws Exception {
		User user = new User();
		user.setEmail(email);
		user.setPwd(pwd);
		
		user = userDao.getUser(user);
		user.setTag(userDao.getUserTag(user.getUserId()));
		return user;
	}

	public Map<String, Object> getUserList(Search search) throws Exception {
		List<User> list = userDao.getUserList(search);
		int totalCount = userDao.getTotalCount(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
		userDao.deleteUserTag(user.getUserId());
		userDao.addUserTag(user);
	}

	public boolean checkDuplication(String email) throws Exception {
		if (userDao.checkDuplication(email)) {
			return true;
		}
		
		return false;
	}

}