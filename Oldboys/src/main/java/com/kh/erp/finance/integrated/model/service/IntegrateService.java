package com.kh.erp.finance.integrated.model.service;

import java.util.List;

import com.kh.erp.finance.integrated.model.vo.Integrate;
import com.kh.erp.finance.integrated.model.vo.Total;

public interface IntegrateService {

	List<Integrate> selectTotalList(int userNo);
	
	List<Total> selectToList(int userNo);
	
}
