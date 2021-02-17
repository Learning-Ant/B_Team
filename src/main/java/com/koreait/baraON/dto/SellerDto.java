package com.koreait.baraON.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class SellerDto {
	private int s_no;
	private String s_id;
	private String s_pw;
	private String s_phone;
	private String s_name;
	private String s_birth;
	private String s_email;
	private Date s_regDate;
	private int s_agreement;
	private String s_companyNo;
}
