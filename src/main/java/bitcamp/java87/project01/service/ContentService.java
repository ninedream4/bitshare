package bitcamp.java87.project01.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import bitcamp.java87.project01.domain.Comment;
import bitcamp.java87.project01.domain.Content;
import bitcamp.java87.project01.domain.Search;

public interface ContentService {

	public void addContent(Content content, MultipartFile file) throws Exception;

	public void addComment(Comment comment) throws Exception;
	
	public Content getContent(String title) throws Exception;

	public Map<String, Object> getContentList(Search search) throws Exception;
	
	public void deleteContent(int contentId) throws Exception;
	
	public void deleteComment(Comment comment) throws Exception;

	public void updateContent(Content content) throws Exception;
	
	public void updateComment(Comment comment) throws Exception;
	
	
}
