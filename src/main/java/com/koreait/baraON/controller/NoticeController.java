package com.koreait.baraON.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.baraON.command.board.FAQListCommand;
import com.koreait.baraON.command.board.NoticeCommand;
import com.koreait.baraON.command.board.NoticeListCommand;
import com.koreait.baraON.command.board.NoticeViewCommand;

@Controller
public class NoticeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private NoticeCommand noticeCommand;
	
	@RequestMapping(value="noticeListPage.do",method=RequestMethod.GET)
	public String noticeListPage(HttpServletRequest request, Model model){
		model.addAttribute("request" , request);
		noticeCommand = new NoticeListCommand();
		noticeCommand.execute(sqlSession, model);
		return "board/noticeListPage";
	}
	@RequestMapping(value="noticeViewPage.do",method=RequestMethod.GET)
	public String noticeViewPage(HttpServletRequest request,
									Model model) {
		model.addAttribute("request" , request);
		noticeCommand = new NoticeViewCommand();
		noticeCommand.execute(sqlSession, model);
		return "board/noticeViewPage";
	}
	@RequestMapping(value="faqListPage.do" , method=RequestMethod.GET)
	public String FAQListPage(HttpServletRequest request, Model model) {
		model.addAttribute("request" , request);
		noticeCommand = new FAQListCommand();
		noticeCommand.execute(sqlSession, model);
		return "board/faqListPage";
	}
	
}
