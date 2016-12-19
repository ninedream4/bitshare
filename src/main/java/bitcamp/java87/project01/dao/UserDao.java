package bitcamp.java87.project01.dao;

import java.util.List;

import bitcamp.java87.project01.domain.Search;
import bitcamp.java87.project01.domain.User;

public interface UserDao {

	public void addUser(User user) throws Exception;

	public void addUserTag(User user) throws Exception;

	public User getUser(User user) throws Exception;
	
	public List<String> getUserTag(int userId) throws Exception;

	public List<User> getUserList(Search search) throws Exception;

	public void updateUser(User user) throws Exception;

	public void deleteUserTag(int userId) throws Exception;

	public int getTotalCount(Search search) throws Exception;
	
	public boolean checkDuplication(String email) throws Exception;

}