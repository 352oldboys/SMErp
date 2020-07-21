package com.kh.erp.inventory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InventoryController {



@RequestMapping("/inventory/inventory.do")
public void inventory() {
	// view 이름이 지정되지 않았을 경우,
	// viewNameTranslator 객체가 url의 경로를 통해,
	// view가 받을 이름을 유추하여 지어낸다.
	// /board/boardForm.do --> /board/boardForm.jsp
	// 간편하지만, 실제 개발 시에는 명확한 값전달이
	// 우선시 되기 때문에 권장하지는 않는다.

}
}