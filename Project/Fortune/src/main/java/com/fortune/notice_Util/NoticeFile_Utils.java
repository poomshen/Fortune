package com.fortune.notice_Util;

import java.util.UUID;

public class NoticeFile_Utils {

	// 서버에 저장될 파일명 랜덤한 문자열(숫자포함) 32글자로 만들어서 반환해주는 메소드
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	/*
	한글 및 영문 글자 길이를 잘라서 리턴 
	@param String 원본문자열
	@param int  리턴할 문자열갯수
	@return String
 	*/
	//긴 이름들 ..으로 치환(추가 작업 : 김중완)
	public static String getFixString(String message, int len) {
		int sublen = 0;
		StringBuffer sbuf = new StringBuffer();
		
		if (message == null)
			return "";

		for (int j = 0; (j < message.length() && sublen < len); j++) {
			if (Character.getType(message.charAt(j)) == 5){
				sublen = sublen + 2;// 한글
			}else{
				sublen++; // 기타 영문,특수문자,공백
			}

			sbuf.append(message.charAt(j));
		}
		
		if (message.length() > len){
			sbuf.append("..");
		}

		return sbuf.toString();
	}
}
