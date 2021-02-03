package com.koreait.baraON.command.review;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.ReviewDao;

public class ReviewDeleteCommand {
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		int rv_no = (int)model.asMap().get("rv_no");
		
		ReviewDao reviewDao = sqlSession.getMapper(ReviewDao.class);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", reviewDao.reviewDelete(rv_no));
		
		return resultMap;
	}
}
