package bitcamp.java87.project01.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import bitcamp.java87.project01.dao.UserDao;
import bitcamp.java87.project01.domain.Search;
import bitcamp.java87.project01.domain.User;

@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao {

	/// Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	/// Constructor
	public UserDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addUser(User user) throws Exception {
		sqlSession.insert("UserMapper.addUser", user);
	}
	
	@Override
	public void addUserTag(User user) throws Exception {
		sqlSession.insert("UserMapper.addUserTag", user);
	}
	
	@Override
	public User getUser(User user) throws Exception {
		user = sqlSession.selectOne("UserMapper.getUser", user);
		return user;
	}
	
	@Override
	public List<String> getUserTag(int userId) throws Exception {
		return sqlSession.selectList("UserMapper.getUserTag", userId);
	}
	
	@Override
	public List<User> getUserList(Search search) throws Exception {
		return sqlSession.selectList("UserMapper.getUserList", search);
	}
	
	@Override
	public void updateUser(User user) throws Exception {
		sqlSession.update("UserMapper.updateUser", user);
	}

	@Override
	public void deleteUserTag(int userId) throws Exception {
		sqlSession.delete("UserMapper.deleteUserTag", userId);
	}
	
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("UserMapper.getTotalCount", search);
	}

	@Override
	public boolean checkDuplication(String email) throws Exception {
		if(sqlSession.selectOne("UserMapper.checkDuplication", email)==null) {
			return true;
		}
		return false;
	}

}