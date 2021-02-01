package com.koreait.baraON.command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.command.BaraONCommand;
import com.koreait.baraON.dao.MemberDao;
import com.koreait.baraON.dto.MemberDto;
import com.koreait.baraON.dto.SellerDto;

public class FindPwCommand implements BaraONCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email") + "@" + request.getParameter("domains");
		String grade = request.getParameter("grade");
		
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		if(grade.equals("member")) {  // 멤버일때
			MemberDto memberDto = memberDao.findMemberPw(id, name, email);
			if(memberDto != null) {
				model.addAttribute("Dto", memberDto);
			}
		} else {  // 호스트일때
			SellerDto sellerDto = memberDao.findSellerPw(id, name, email);
			if(sellerDto != null) {
				model.addAttribute("Dto", sellerDto);
			}
		}
			
		model.addAttribute("findPwResult", true);
		model.addAttribute("email", email);

	}

}
