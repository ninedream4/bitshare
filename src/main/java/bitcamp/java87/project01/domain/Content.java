package bitcamp.java87.project01.domain;

import java.util.Date;
import java.util.List;

public class Content {

	private String title;
	private int userId;
	private String email;
	private int contentId;
	private String fileDesc;
	private String filePath;
	private String fileName;
	private int fileLength;
	private String category;
	private String regDate;
	private List<String> tag;
	 
	public Content() {
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getContentId() {
		return contentId;
	}

	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	public String getFileDesc() {
		return fileDesc;
	}

	public void setFileDesc(String fileDesc) {
		this.fileDesc = fileDesc;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getFileLength() {
		return fileLength;
	}

	public void setFileLength(int fileLength) {
		this.fileLength = fileLength;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public List<String> getTag() {
		return tag;
	}

	public void setTag(List<String> tag) {
		this.tag = tag;
	}

	@Override
	public String toString() {
		return "Content [title=" + title + ", userId=" + userId + ", email=" + email + ", contentId=" + contentId
				+ ", fileDesc=" + fileDesc + ", filePath=" + filePath + ", fileName=" + fileName + ", fileLength="
				+ fileLength + ", category=" + category + ", regDate=" + regDate + ", tag=" + tag + "]";
	}

}
