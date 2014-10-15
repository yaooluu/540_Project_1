package edu.ncsu.gradiance.dao;

// Generated Oct 15, 2014 11:40:44 AM by Hibernate Tools 4.3.1

/**
 * Answer generated by hbm2java
 */
public class Answer implements java.io.Serializable {

	private Integer id;
	private Integer qid;
	private String valid;
	private String content;
	private String expln;

	public Answer() {
	}

	public Answer(Integer qid, String valid, String content, String expln) {
		this.qid = qid;
		this.valid = valid;
		this.content = content;
		this.expln = expln;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getQid() {
		return this.qid;
	}

	public void setQid(Integer qid) {
		this.qid = qid;
	}

	public String getValid() {
		return this.valid;
	}

	public void setValid(String valid) {
		this.valid = valid;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getExpln() {
		return this.expln;
	}

	public void setExpln(String expln) {
		this.expln = expln;
	}

}
