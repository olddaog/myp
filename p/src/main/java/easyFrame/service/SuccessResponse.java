package easyFrame.service;

public class SuccessResponse extends ResponseObject {


	
	final public static int success_code = 200;//必须
	final public static String success_message = "请求成功";
	
	public SuccessResponse(){
		this.resp_code = success_code;
		this.resp_data = success_message;
	}
	
	
	public SuccessResponse(Object object){
		resp_code = success_code;
		resp_data = object;
	}
	
}
