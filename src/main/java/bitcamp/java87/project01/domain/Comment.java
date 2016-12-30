package bitcamp.java87.project01.domain;

import java.util.Date;

public class Comment {
	private int commentId;
	private String email;
	private int userId;
	private int contentId;
	private String desc;
	private String regDate;
	 
	public Comment() {
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Comment [commentId=" + commentId + ", email=" + email + ", userId=" + userId + ", contentId="
				+ contentId + ", desc=" + desc + ", regDate=" + regDate + "]";
	}

	
}
