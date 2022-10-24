package com.admin.model;

public class ReportDTO {
	private int report_num;
	private int report_count;
	private int report_content;
	private int chall_num_fk;
	private String mem_id_reported;
	private String mem_id_report;
	public int getReport_num() {
		return report_num;
	}
	public void setReport_num(int report_num) {
		this.report_num = report_num;
	}
	public int getReport_count() {
		return report_count;
	}
	public void setReport_count(int report_count) {
		this.report_count = report_count;
	}
	public int getReport_content() {
		return report_content;
	}
	public void setReport_content(int report_content) {
		this.report_content = report_content;
	}
	public int getChall_num_fk() {
		return chall_num_fk;
	}
	public void setChall_num_fk(int chall_num_fk) {
		this.chall_num_fk = chall_num_fk;
	}
	public String getMem_id_reported() {
		return mem_id_reported;
	}
	public void setMem_id_reported(String mem_id_reported) {
		this.mem_id_reported = mem_id_reported;
	}
	public String getMem_id_report() {
		return mem_id_report;
	}
	public void setMem_id_report(String mem_id_report) {
		this.mem_id_report = mem_id_report;
	}
}
