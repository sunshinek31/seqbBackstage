package com.sunshinek31.seqb.common;

/**
 * 返回结果枚举类
 * @ClassName: ResultEnum
 * @Description: 配合Result类使用
 * @author sunshinek31
 * @date 2017年3月29日 上午1:38:06
 *
 */
public enum ResultEnum {

	/** 1:成功 **/
	SUCCESS(0,"成功"),
	
	/** 0:系统异常 **/
	ERROR(1,"系统错误"),
	
	;

	private int code;
	private String message;

	private ResultEnum(int code,String message) {
		this.code = code;
		this.message = message;
	}
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		for (ResultEnum result : ResultEnum.values()) {
			if (code == result.getCode()) {
				return result.getMessage();
			}
		}
		return this.message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
