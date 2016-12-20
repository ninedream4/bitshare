package bitcamp.java87.project01.domain;

import java.util.Date;

public class Comment {

	private int commentId;
	private int userId;
	private int contentId;
	private String desc;
	private Date regDate;
	 
	public Comment() {
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getContentId() {
		return contentId;
	}

	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "comment [commentId=" + commentId + ", userId=" + userId + ", contentId=" + contentId + ", desc=" + desc
				+ ", regDate=" + regDate + "]";
	}

}
