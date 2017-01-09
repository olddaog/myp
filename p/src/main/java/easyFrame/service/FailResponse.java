package easyFrame.service;

public class FailResponse extends ResponseObject {

	private static final long serialVersionUID = 3010422367222022571L;
	
	final public static int fail_code = 400;
	final public static String fail_message = "请求失败";
	
	public FailResponse(){
		this.resp_code = fail_code;
		this.resp_data = fail_message;
	}

	public FailResponse(Object object){
		this.resp_code = fail_code;
		this.resp_data = object;
	}

	
	public FailResponse(int code, Object object){
		if(code == SuccessResponse.success_code){//避免混淆
			code = fail_code;
		}
		else{
			this.resp_code = code;
		}
		this.resp_data = object;
	}
	
}
