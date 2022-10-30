package com.cs.model;

public class FAQDTO {
	
	private int FAQ_Num;
	private String FAQ_title;
	private String FAQ_content;
	private String FAQ_regdate;
	private String FAQ_category_num; 

	  
	public int getFAQ_Num() {
		return FAQ_Num;
	}
	public void setFAQ_Num(int fAQ_Num) {
		FAQ_Num = fAQ_Num;
	}
	public String getFAQ_title() {
		return FAQ_title;
	}
	public void setFAQ_title(String fAQ_title) {
		FAQ_title = fAQ_title;
	}
	public String getFAQ_content() {
		return FAQ_content;
	}
	public void setFAQ_content(String fAQ_content) {
		FAQ_content = fAQ_content;
	}
	public String getFAQ_regdate() {
		return FAQ_regdate;
	}
	public void setFAQ_regdate(String fAQ_regdate) {
		FAQ_regdate = fAQ_regdate;
	}
	public String getFAQ_category_num() {
		return FAQ_category_num;
	}
	public void setFAQ_category_num(String fAQ_category_num) {
		FAQ_category_num = fAQ_category_num;
	}
}