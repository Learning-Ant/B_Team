package com.koreait.baraON.command.review;

import java.io.File;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.baraON.dao.ReviewDao;

public class ReviewInsertCommand implements ReviewCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)model.asMap().get("multipartRequest");
//		RedirectAttributes rttr = (RedirectAttributes)model.asMap().get("rttr");
//		System.out.println(rttr);
		
		int m_no = Integer.parseInt(multipartRequest.getParameter("m_no"));
		System.out.println(m_no);
		int p_no = Integer.parseInt(multipartRequest.getParameter("p_no"));
		System.out.println(p_no);
		String rv_content = multipartRequest.getParameter("rv_content");
		System.out.println(rv_content);
		String rv_img = null;
		int rv_star = Integer.parseInt(multipartRequest.getParameter("rv_star"));
		System.out.println(rv_star);
		ReviewDao reviewDao = sqlSession.getMapper(ReviewDao.class);
		
		List<MultipartFile> files = multipartRequest.getFiles("rv_img");
		int size = files.size();
		StringBuffer sb = new StringBuffer();
		sb.trimToSize();
		// 지원하는 이미지파일 확장자는 jpg, jpeg, gif, png로 한다.
		for (MultipartFile file : files) {
			if (file != null && !file.isEmpty()) {
				String originalFilename = file.getOriginalFilename();
				
				String extension = originalFilename.substring( originalFilename.lastIndexOf(".")+1);
				if(!extension.equalsIgnoreCase("jpg") ||
					!extension.equalsIgnoreCase("jpeg") ||
					!extension.equalsIgnoreCase("gif") ||
					!extension.equalsIgnoreCase("png")) {
					model.addAttribute("insertResult", 0);
					return;
				}
				String filename = originalFilename.substring(0, originalFilename.lastIndexOf("."));
				
				String uploadFilename = filename + "-" + System.currentTimeMillis() + "." + extension;
				
				String realPath = multipartRequest.getServletContext().getRealPath("resources/images/ReviewImages");
				
				File dir = new File(realPath);
				if(!dir.exists()) {
					dir.mkdirs();
				}
				
				File uploadFile = new File(realPath, uploadFilename);
				
				try {
					file.transferTo(uploadFile);
				} catch (Exception e) {
					e.printStackTrace();
				}
				if(files.get(size-1) != file) {
					sb.append(uploadFilename+", ");
				} else {
					sb.append(uploadFilename+"]}");
					sb.insert(0,"{ \"review-image\" : [");
				}
			} else {
				model.addAttribute("insertResult", reviewDao.reviewInsert(m_no, p_no, rv_star, "", rv_content));
				return;
			}
			if ( !sb.toString().isEmpty() && sb.toString() != null) {
				rv_img = sb.toString();
			}
			model.addAttribute("insertResult", reviewDao.reviewInsert(m_no, p_no, rv_star, rv_img, rv_content));
		}
	}

}
