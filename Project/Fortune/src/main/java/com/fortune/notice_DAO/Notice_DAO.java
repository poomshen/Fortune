/*
* @Class : Notice_DAO
* @Date : 2016.11.15
* @Author : 김지율
* @Desc : 공지사항게시판 DAO
*/

package com.fortune.notice_DAO;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.fortune.notice_DTO.Notice_DTO;

public class Notice_DAO implements NoticeAction {
	
	JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public Notice_DAO(){
		
	}

	@Override
	public ArrayList<Notice_DTO> listNotice() {
		String query = "select * from notice order by notice_date desc";
		return (ArrayList<Notice_DTO>) template.query(query, new BeanPropertyRowMapper<Notice_DTO>(Notice_DTO.class));
	}

	@Override
	public void writeNotice(String user_id, String notice_title, String notice_text) {
		// TODO Auto-generated method stub

	}

	@Override
	public Notice_DTO viewNotice(String user_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteNotice(String user_id) {
		// TODO Auto-generated method stub

	}

}
