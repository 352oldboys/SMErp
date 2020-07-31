package com.kh.erp.qboard.model.exception;

public class QBoardException extends RuntimeException{

	public QBoardException() {
		super();
	}

	public QBoardException(String message) {
		super("Board 에러 발생 : "+message);
	}
	
}
