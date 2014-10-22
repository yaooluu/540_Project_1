package edu.ncsu.gradiance.dao;

// Generated Oct 20, 2014 5:39:06 PM by Hibernate Tools 4.3.1

import java.util.Date;

/**
 * Attempt generated by hbm2java
 */
public class Attempt implements java.io.Serializable {

	private AttemptId id;
	private Assessment assessment;
	private Seed seed;
	private Student student;
	private Date subtime;
	private Integer answer;
	private String ansList;
	private Integer point;

	public Attempt() {
	}

	public Attempt(AttemptId id, Assessment assessment, Seed seed,
			Student student) {
		this.id = id;
		this.assessment = assessment;
		this.seed = seed;
		this.student = student;
	}

	public Attempt(AttemptId id, Assessment assessment, Seed seed,
			Student student, Date subtime, Integer answer, String ansList,
			Integer point) {
		this.id = id;
		this.assessment = assessment;
		this.seed = seed;
		this.student = student;
		this.subtime = subtime;
		this.answer = answer;
		this.ansList = ansList;
		this.point = point;
	}

	public AttemptId getId() {
		return this.id;
	}

	public void setId(AttemptId id) {
		this.id = id;
	}

	public Assessment getAssessment() {
		return this.assessment;
	}

	public void setAssessment(Assessment assessment) {
		this.assessment = assessment;
	}

	public Seed getSeed() {
		return this.seed;
	}

	public void setSeed(Seed seed) {
		this.seed = seed;
	}

	public Student getStudent() {
		return this.student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Date getSubtime() {
		return this.subtime;
	}

	public void setSubtime(Date subtime) {
		this.subtime = subtime;
	}

	public Integer getAnswer() {
		return this.answer;
	}

	public void setAnswer(Integer answer) {
		this.answer = answer;
	}

	public String getAnsList() {
		return this.ansList;
	}

	public void setAnsList(String ansList) {
		this.ansList = ansList;
	}

	public Integer getPoint() {
		return this.point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

}
