package edu.ncsu.gradiance.dao;

// Generated Oct 20, 2014 5:39:06 PM by Hibernate Tools 4.3.1

import java.util.HashSet;
import java.util.Set;

/**
 * Topic generated by hbm2java
 */
public class Topic implements java.io.Serializable {

	private Integer tid;
	private String name;
	private Set questions = new HashSet(0);
	private Set courses = new HashSet(0);

	public Topic() {
	}

	public Topic(String name, Set questions, Set courses) {
		this.name = name;
		this.questions = questions;
		this.courses = courses;
	}

	public Integer getTid() {
		return this.tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set getQuestions() {
		return this.questions;
	}

	public void setQuestions(Set questions) {
		this.questions = questions;
	}

	public Set getCourses() {
		return this.courses;
	}

	public void setCourses(Set courses) {
		this.courses = courses;
	}

}
