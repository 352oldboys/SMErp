package com.kh.erp.finance.integrated.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.erp.finance.integrated.model.service.IntegrateService;
import com.kh.erp.finance.integrated.model.vo.Integrate;
import com.kh.erp.finance.integrated.model.vo.Total;
import com.kh.erp.finance.purchase.model.service.PurchaseService;
import com.kh.erp.finance.purchase.model.vo.Purchase;
import com.kh.erp.finance.sales.model.service.SalesService;
import com.kh.erp.finance.sales.model.vo.Sales;

@Controller
public class IntegratedController {
   
   @Autowired
   SalesService salesService;
   
   @Autowired
   PurchaseService purchaseService;
   
   @Autowired
   IntegrateService integrateService;
   
   
   @RequestMapping("finance/integrated.do")
   public String integrated(Model model, 
                                    @RequestParam(value="userNo") int userNo) {
      
      List<Purchase> pList = purchaseService.selectList(userNo);
      List<Sales> sList = salesService.selectSalList(userNo);
      List<Integrate> iList = integrateService.selectTotalList(userNo);
      List<Total> tList = integrateService.selectToList(userNo);
      System.out.println("i  : "+ iList);
      System.out.println("t : " + tList);
      
      
      model.addAttribute("pList", pList);
      model.addAttribute("sList", sList);      
      model.addAttribute("iList", iList);
      model.addAttribute("tList", tList);   
      
      return "finance/integrated";
      
   }
   
   @RequestMapping("/finance/pMonthPrice.do")
   @ResponseBody
   public Map<String, Object> pMonthPrice(@RequestParam int userNo) {
      
      String pMonth = purchaseService.purchaseMonthPrice(userNo);
            
      Map<String, Object> map = new HashMap<>();
      
      map.put("pMonth", pMonth);
      
      return map;
   }
   
   @RequestMapping("/finance/sMonthPrice.do")
   @ResponseBody
   public Map<String, Object> sMonthPrice(@RequestParam int userNo) {
      
      String sMonth = salesService.salesMonthPrice(userNo);
            
      Map<String, Object> map = new HashMap<>();
      
      map.put("sMonth", sMonth);
      
      return map;
   }
   



   
}