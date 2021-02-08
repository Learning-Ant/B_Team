package com.koreait.baraON.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class controller {

	@Autowired
	private SqlSession sqlSession;
	

	@RequestMapping(value={"/","index"}, method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
}