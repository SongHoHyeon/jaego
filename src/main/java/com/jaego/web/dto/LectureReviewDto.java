package com.jaego.web.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias(value = "LectureReviewDto")
public class LectureReviewDto {
	private int rn;
	private int reviewId;
	private int lectureId;
	private int mentorId;
	private int memberId;
	private String reviewContent;
	private int reviewScore;
	private Date reviewRegdate;
	
	
	
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	public int getLectureId() {
		return lectureId;
	}
	public void setLectureId(int lectureId) {
		this.lectureId = lectureId;
	}
	public int getMentorId() {
		return mentorId;
	}
	public void setMentorId(int mentorId) {
		this.mentorId = mentorId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public int getReviewScore() {
		return reviewScore;
	}
	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}
	public Date getReviewRegdate() {
		return reviewRegdate;
	}
	public void setReviewRegdate(Date reviewRegdate) {
		this.reviewRegdate = reviewRegdate;
	}
	
	@Override
	public String toString() {
		return "LectureroomDto [rn=" + rn + ", reviewId=" + reviewId + ", lectureId=" + lectureId
				+ ", mentorId=" + mentorId + ", memberId=" + memberId + ", reviewContent="
				+ reviewContent + ", reviewScore=" + reviewScore + ", reviewRegdate="
				+ reviewRegdate + "]";
	}

	
	
}
