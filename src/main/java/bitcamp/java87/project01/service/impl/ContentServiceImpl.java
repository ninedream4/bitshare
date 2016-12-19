package bitcamp.java87.project01.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import bitcamp.java87.project01.common.ConvertFile;
import bitcamp.java87.project01.common.Upload;
import bitcamp.java87.project01.dao.ContentDao;
import bitcamp.java87.project01.domain.Content;
import bitcamp.java87.project01.domain.Search;
import bitcamp.java87.project01.service.ContentService;

@Service("contentServiceImpl")
public class ContentServiceImpl implements ContentService {

	/// Field
	@Autowired
	@Qualifier("contentDaoImpl")
	private ContentDao contentDao;
	
	private Upload upload = new Upload();
	
	public void setContentDao(ContentDao contentDao) {
		this.contentDao = contentDao;
	}

	/// Constructor
	public ContentServiceImpl() {
		System.out.println(this.getClass());
	}

	/// Method
	public void addContent(Content content, MultipartFile file) throws Exception {
		
		System.out.println("content : "+content);
		
		upload.uploadFile(file, content);
		
		contentDao.addContent(content);
		contentDao.addContentTag(content);
		
		new PdfToJpegConverter(content.getFilePath(), content.getFileName()).start();
	}
	
	@Override
	public Content getContent(String title) throws Exception {
		return contentDao.getContent(title);
	}

	
	@Override
	public Map<String, Object> getContentList(Search search) throws Exception {
		List<Content> list = contentDao.getContentList(search);
		int totalCount = contentDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		for(Content c : list)
			System.out.println(c);
		
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	public void deleteContent(int contentId) throws Exception {
		contentDao.deleteContent(contentId);
	}

	public void updateContent(Content content) throws Exception {
		contentDao.updateContent(content);
		contentDao.deleteContentTag(content.getContentId());
		contentDao.addContentTag(content);
	}
	
	class PdfToJpegConverter extends Thread {
		String filePath;
		String fileName;
		
		public PdfToJpegConverter() {
			super();
		}

		public PdfToJpegConverter(String filePath, String fileName) {
			super();
			this.filePath = filePath;
			this.fileName = fileName;
		}

		@Override
		public void run() {
			try {
				ConvertFile.convertFileToJpg(filePath, fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	
}
