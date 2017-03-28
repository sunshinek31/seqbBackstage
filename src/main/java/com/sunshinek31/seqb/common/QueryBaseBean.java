package com.sunshinek31.seqb.common;

public class QueryBaseBean {

	private Integer pageSize = 10;
	private Integer pageNo = 1;

	public Integer getPageSize() {
		return pageSize;
	}
	
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
		if(pageSize == null || pageSize < 1){
			this.pageSize = 1;
		}
	}
	
	public Integer getPageNo() {
		return pageNo;
	}
	
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
		if(pageNo == null || pageNo < 1){
			this.pageNo = 1;
		}
	}
}
