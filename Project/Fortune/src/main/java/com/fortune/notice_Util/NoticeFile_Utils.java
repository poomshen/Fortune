package com.fortune.notice_Util;

import java.util.UUID;

public class NoticeFile_Utils {

	// 서버에 저장될 파일명 랜덤한 문자열(숫자포함) 32글자로 만들어서 반환해주는 메소드
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

}
