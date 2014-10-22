package edu.ncsu.gradiance.dao;

// Generated Oct 20, 2014 5:39:06 PM by Hibernate Tools 4.3.1

import java.util.HashSet;
import java.util.Set;

/**
 * Question generated by hbm2java
 */
public class Question implements java.io.Serializable {

	private Integer qid;
	private Topic topic;
	private Integer difficulty;
	private Set answers = new HashSet(0);
	private Set seeds = new HashSet(0);
	private Set assessments = new HashSet(0);

	public Question() {
	}

	public Question(Topic topic, Integer difficulty, Set answers, Set seeds,
			Set assessments) {
		this.topic = topic;
		this.difficulty = difficulty;
		this.answers = answers;
		this.seeds = seeds;
		this.assessments = assessments;
	}

	public Integer getQid() {
		return this.qid;
	}

	public void setQid(Integer qid) {
		this.qid = qid;
	}

	public Topic getTopic() {
		return this.topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public Integer getDifficulty() {
		return this.difficulty;
	}

	public void setDifficulty(Integer difficulty) {
		this.difficulty = difficulty;
	}

	public Set getAnswers() {
		return this.answers;
	}

	public void setAnswers(Set answers) {
		this.answers = answers;
	}

	public Set getSeeds() {
		return this.seeds;
	}

	public void setSeeds(Set seeds) {
		this.seeds = seeds;
	}

	public Set getAssessments() {
		return this.assessments;
	}

	public void setAssessments(Set assessments) {
		this.assessments = assessments;
	}

}
