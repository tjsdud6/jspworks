package com.model;

import java.io.Serializable;

public class Board implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	//필드(멤버 변수)
	private int num;			//글 번호
	private String name;		//이름
	private String subject;		//
	private String content;
	private String writeDate;
	private int hit;
	private String id;
	public int getNum() {
		return num;
	}
	
	//getter, setter
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
