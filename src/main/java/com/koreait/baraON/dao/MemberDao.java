package com.koreait.baraON.dao;

import com.koreait.baraON.dto.MemberDto;
import com.koreait.baraON.dto.SellerDto;

public interface MemberDao {
	public MemberDto memberLogin(String id, String pw);
	public SellerDto sellerLogin(String id, String pw);
	public MemberDto findMemberId(String name, String email);
	public SellerDto findSellerId(String name, String email);
	public MemberDto findMemberPw(String id, String name, String email);
	public SellerDto findSellerPw(String id, String name, String email);
	public int changeMemberPw(String pw, String id);
	public int changeSellerPw(String pw, String id);
	
}
