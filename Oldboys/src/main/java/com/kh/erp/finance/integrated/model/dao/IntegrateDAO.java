package com.kh.erp.finance.integrated.model.dao;

import java.util.List;

import com.kh.erp.finance.integrated.model.vo.Integrate;
import com.kh.erp.finance.integrated.model.vo.Total;

public interface IntegrateDAO {

	List<Integrate> selectTotalList(int userNo);

	List<Total> selectToList(int userNo);

}
