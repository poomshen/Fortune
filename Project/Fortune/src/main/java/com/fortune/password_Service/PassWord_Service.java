package com.fortune.password_Service;

import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
/*
 	* @Filename :PassWord_Service.java
 	* @Date: 2016-11-22
 	* @Author: 이성준
 	* @Desc : 비밀번호 암호화 복호화 할때 필요한 서비스
*/
public class PassWord_Service implements PasswordEncoder {
    private ShaPasswordEncoder shaPasswordEncoder;
    private Object salt = null;
    
    
    public PassWord_Service() {
    	shaPasswordEncoder = new ShaPasswordEncoder();
	}
    
    public PassWord_Service(int sha) {
    	shaPasswordEncoder = new ShaPasswordEncoder(sha);
    }
    
    public void setEncodeHashAsBase64(boolean encodeHashAsBase64) {
        shaPasswordEncoder.setEncodeHashAsBase64(encodeHashAsBase64);
    }
    
    public void setSalt(Object salt) {
        this.salt = salt;
    }
    
	
	@Override
	public String encode(CharSequence rawPassword) {
		return shaPasswordEncoder.encodePassword(rawPassword.toString(), salt);
    }
	
	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		return shaPasswordEncoder.isPasswordValid(encodedPassword, rawPassword.toString(), salt);
	}
	
	public String encode(String rawPassword) {
		return shaPasswordEncoder.encodePassword(rawPassword.toString(), salt);
		
	}

}
