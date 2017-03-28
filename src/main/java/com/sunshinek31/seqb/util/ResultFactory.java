package com.sunshinek31.seqb.util;

import com.sunshinek31.seqb.common.Result;
import com.sunshinek31.seqb.common.ResultEnum;

public class ResultFactory {

	public static Result buildResult(Integer code, String message, Object content){
		
		return new Result(code, message, content);
	}
	
	public static Result buildResult(ResultEnum resultEnum, Object content){
		
		return new Result(resultEnum.getCode(), resultEnum.getMessage(), content);
	}
}
