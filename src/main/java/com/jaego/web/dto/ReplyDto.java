package com.jaego.web.dto;

import java.util.Date;
public class ReplyDto {

	private int rn;
	private Integer rno;        // ��� ��ȣ
    private Integer lectureroomId;        // �Խñ� ��ȣ
    private String replytext;    // ��� ����
    private Integer replyer;        // ��� �ۼ���
    private String userName;    // ��� �ۼ����� �̸�(ȸ���� �̸�)
    private Date regdate;        // ��� �ۼ�����
    private Date updatedate;    // ��� ��������
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
