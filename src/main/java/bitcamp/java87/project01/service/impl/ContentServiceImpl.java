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
import bitcamp.java87.project01.domain.Comment;
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

  @Override
  public void addContent(Content content, MultipartFile file) throws Exception {

    upload.uploadFile(file, content);

    new PdfToJpegConverter(contentDao, content, content.getFilePath(), content.getFileName()).start();

  }

  @Override
  public void addComment(Comment comment) throws Exception {
    contentDao.addComment(comment);
  }

  @Override
  public Map<String, Object> getContent(String title) throws Exception {

    Map<String, Object> map = new HashMap<String, Object>();
    Content content = contentDao.getContent(title);
    List<Comment> comments = contentDao.getComment(content.getContentId());
    map.put("content", content);
    map.put("comments", comments);

    return map;
  }

  @Override
  public Map<String, Object> getContentList(Search search) throws Exception {
    List<Content> list = contentDao.getContentList(search);
    int totalCount = contentDao.getTotalCount(search);
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("list", list);
    map.put("totalCount", new Integer(totalCount));
    return map;
  }

  @Override
  public void deleteContent(int contentId) throws Exception {
    contentDao.deleteContent(contentId);
  }

  @Override
  public void deleteComment(Comment comment) throws Exception {
    contentDao.deleteComment(comment);
  }

  @Override
  public void updateContent(Content content) throws Exception {
    contentDao.updateContent(content);
    contentDao.deleteContentTag(content.getContentId());
    contentDao.addContentTag(content);
  }

  @Override
  public void updateComment(Comment comment) throws Exception {
    contentDao.updateComment(comment);
  }

  @Override
  public boolean checkTitle(String title) throws Exception {
    if (contentDao.checkTitle(title)) {
      return true;
    }
    return false;
  }

  @Override
  public Map<String, Object> getContentListByCategory(Search search) throws Exception {
    List<Content> list = contentDao.getContentListByCategory(search);
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("list", list);
    return map;
  }

  class PdfToJpegConverter extends Thread {
    String filePath;
    String fileName;
    Content content;

    private ContentDao contentDao;

    public PdfToJpegConverter() {
      super();
    }

    public PdfToJpegConverter(ContentDao contentDao, Content content, String filePath, String fileName) {
      super();
      this.filePath = filePath;
      this.fileName = fileName;
      this.content = content;
      this.contentDao = contentDao;
    }

    @Override
    public void run() {
      try {
        synchronized (ContentServiceImpl.this.contentDao) {
          ConvertFile.convertFileToJpg(content, filePath, fileName);
        }
        contentDao.addContent(content);
        contentDao.addContentTag(content);
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
  }
}
