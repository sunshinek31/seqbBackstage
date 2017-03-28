package com.sunshinek31.seqb.common;

/**
 * 
 * @ClassName: Result
 * @Description: 接口请求返回数据类
 * @author sunshinek31
 * @date 2017年3月29日 上午1:33:15
 *
 */
public class Result {

	private Integer code;  			/**< 识别码 */
	private String 	message;		/**< 备注信息 */
	private Object	content;		/**< 数据包 */
	
	public Result() {}
	
	public Result(Integer code, String message, Object content){
		this.code = code;
		this.message = message;
		this.content = content;
	}
	
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getContent() {
		return content;
	}
	public void setContent(Object content) {
		this.content = content;
	}
	
	
}
