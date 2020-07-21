package com.kh.erp.board.model.exception;

public class BoardException extends RuntimeException {

	public BoardException() {
		super();
	}

	public BoardException(String message) {
		super("Board 에러 발생 : "+message);
	}
	
}
