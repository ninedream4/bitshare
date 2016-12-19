package bitcamp.java87.project01.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import bitcamp.java87.project01.dao.ContentDao;
import bitcamp.java87.project01.domain.Content;
import bitcamp.java87.project01.domain.Search;

@Repository("contentDaoImpl")
public class ContentDaoImpl implements ContentDao {

	/// Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	/// Constructor
	public ContentDaoImpl() {
		System.out.println(this.getClass());
	}

	/// Method
	public void addContent(Content content) throws Exception {
		sqlSession.insert("ContentMapper.addContent", content);
	}
	
	@Override
	public void addContentTag(Content content) throws Exception {
		sqlSession.insert("ContentMapper.addContentTag", content);
	}
	
	public Content getContent(String title) throws Exception {
		Content content = sqlSession.selectOne("ContentMapper.getContentList", title);
		System.out.println("너왜안뜨냐");
		System.out.println(content);
		return content;
	}
	
	
	
	
	
	
	
	@Override
	public List<Content> getContentList(Search search) throws Exception {
		return sqlSession.selectList("contentMapper.getContentList", search);
	}

	public void deleteContent(int contentId) throws Exception {
		sqlSession.selectOne("ContentMapper.deleteContent", contentId);
	}

	@Override
	public void updateContent(Content content) throws Exception {
		sqlSession.update("ContentMapper.updateContent", content);
	}

	@Override
	public void deleteContentTag(int contentId) throws Exception {
		sqlSession.delete("ContentMapper.deleteContentTag", contentId);
	}

  @Override
  public List<String> getContentTag(int contentId) throws Exception {
    // TODO Auto-generated method stub
    return null;
  }

 

  @Override
  public int getTotalCount(Search search) throws Exception {
    // TODO Auto-generated method stub
    return 0;
  }

}
