package com.kh.erp.member.model.exception;

public class MemberException extends RuntimeException {

	public MemberException() {
		super();
	}

	public MemberException(String message) {
		super("회원기능 에러발생 : " + message);
	}

}
