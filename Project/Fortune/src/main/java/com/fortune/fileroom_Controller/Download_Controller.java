/*
작성자 : 김중완
최초 작업일 : 2016/11/14
최종 수정일 : 2016/11/20
*/
package com.fortune.fileroom_Controller;

import java.io.File;
import java.io.FileInputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fortune.Table_DTO.FileRoom_DTO;
import com.fortune.fileroom_DAO.IFileRoom;

@Controller
public class Download_Controller {
	
	@Autowired
	private SqlSession sqlsession;
	
	//파일 다운로드 컨트롤러 함수
	@RequestMapping(value="/downloadfile.htm")
	public void downloadFile(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Download_Controller/downloadFile함수");
		String filename = request.getParameter("filename");
		int collabo_no = Integer.parseInt(request.getParameter("collabo_no"));
		String path = request.getServletContext().getRealPath("upload");
		String fullPath = path + "/" + filename;
		File downloadFile = new File(fullPath);
		
		FileRoom_DTO fileroom_DTO = new FileRoom_DTO();
		fileroom_DTO.setFile_room_rename(filename);
		fileroom_DTO.setCollabo_no(collabo_no);
		IFileRoom fileromm_DAO = sqlsession.getMapper(IFileRoom.class);
		String orginfilename = fileromm_DAO.selectNameFile(fileroom_DTO);
		
		response.setContentLength((int) downloadFile.length());
		response.setContentType("application/octet-stream; charset=utf-8");
		response.setHeader("Content-Disposition", "attachment;filename=" + new String(orginfilename.getBytes(), "ISO8859_1"));
		response.setHeader("Content-Transfer-Encoding", "binary");

		FileInputStream fin = new FileInputStream(downloadFile);
		ServletOutputStream sout = response.getOutputStream();
		byte[] buf = new byte[1024];
		int size = -1;
		
		while ((size = fin.read(buf, 0, buf.length)) != -1) {
			sout.write(buf, 0, size);
		}
		
		fin.close();
		sout.close();
	}
}
