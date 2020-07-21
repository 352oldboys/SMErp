package com.kh.erp.notice.model.exception;

public class NoticeException extends RuntimeException{

	public NoticeException() {
		super();
	}

	public NoticeException(String message) {
		super("Board 에러 발생 : "+message);
	}
	
}

