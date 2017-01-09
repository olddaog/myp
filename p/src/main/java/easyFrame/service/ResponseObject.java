package easyFrame.service;

public class ResponseObject extends BaseObject{

	int resp_code;
	Object resp_data;
	
	public int getResp_code() {
		return resp_code;
	}
	
	public void setResp_code(int resp_code) {
		this.resp_code = resp_code;
	}

	public Object getResp_data() {
		return resp_data;
	}

	public void setResp_data(Object resp_data) {
		this.resp_data = resp_data;
	}

	
	
	@Override
	public String toString() {
		return "responseObject";
	}

	@Override
	public boolean equals(Object o) {
		return false;
	}

	@Override
	public int hashCode() {
		return 0;
	}
}
