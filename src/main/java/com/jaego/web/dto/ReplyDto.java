package com.jaego.web.dto;

import java.util.Date;
public class ReplyDto {

	private int rn;
	private Integer rno;        // 댓글 번호
    private Integer lectureroomId;        // 게시글 번호
    private String replytext;    // 댓글 내용
    private Integer replyer;        // 댓글 작성자
    private String userName;    // 댓글 작성자의 이름(회원의 이름)
    private Date regdate;        // 댓글 작성일자
    private Date updatedate;    // 댓글 수정일자
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public Integer getRno() {
		return rno;
	}
	public void setRno(Integer rno) {
		this.rno = rno;
	}
	public Integer getLectureroomId() {
		return lectureroomId;
	}
	public void setLectureroomId(Integer lectureroomId) {
		this.lectureroomId = lectureroomId;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public Integer getReplyer() {
		return replyer;
	}
	public void setReplyer(Integer replyer) {
		this.replyer = replyer;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
	@Override
	public String toString() {
		return "ReplyDto [rn=" + rn + ", rno=" + rno + ", lectureroomId=" + lectureroomId + ", replytext=" + replytext
				+ ", replyer=" + replyer + ", userName=" + userName + ", regdate=" + regdate + ", updatedate="
				+ updatedate + "]";
	}
    

    
	
    
}
