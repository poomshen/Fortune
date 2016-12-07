/*
작성자 : 김중완
최초 작업일 : 2016/11/14
최종 수정일 : 2016/11/20
*/
package com.fortune.fileroom_Controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fortune.Table_DTO.FileRoom_DTO;
import com.fortune.fileroom_DAO.IFileRoom;

@Controller
public class Delete_Controller {
	
	@Autowired
	private SqlSession sqlsession;
	
	//파일 다중 삭제 컨트롤러 함수
	@RequestMapping(value = "/deletefile.ajax", produces = "application/json")
	@ResponseBody
	public HashMap<String, Object> deleteFile(@RequestParam(value="checkArray[]") List<String> arrayParams, HttpServletRequest request){
		System.out.println("deleteFile 다중 삭제 컨트롤러");
		HashMap<String, Object> result = new HashMap<String, Object>();
		IFileRoom fileromm_DAO = sqlsession.getMapper(IFileRoom.class);
		FileRoom_DTO fileroom_DTO = new FileRoom_DTO();
		int collabo_no = Integer.parseInt(request.getParameter("collabo_no"));
		
		for(int i = 0; i < arrayParams.size(); i++){
			String file_name = arrayParams.get(i);
			fileroom_DTO.setFile_room_rename(file_name);
			fileroom_DTO.setCollabo_no(collabo_no);
			fileromm_DAO.deleteFile(fileroom_DTO);
			
			String path = request.getServletContext().getRealPath("upload");
			File file = new File(path + "/" + file_name);
			
			if(file.exists() == true){
				file.delete();
			}
		}
		
		//View 화면에 뿌려주기 위한 list
		int page = 1;
		int row_size = 12;
		int total_count = fileromm_DAO.countFile(collabo_no); // file 개수
		int all_page = (int) Math.ceil(total_count / (double) row_size); // 페이지수
		int block = 5; // 한페이지에 보여줄 범위
		int from_page = ((page - 1) / block * block) + 1; // 보여줄 페이지의 시작
		int to_page = ((page - 1) / block * block) + block; // 보여줄 페이지의 끝
		
		if (to_page > all_page) {
			to_page = all_page;
		}
		
		List<FileRoom_DTO> list = fileromm_DAO.listFiles(page, collabo_no);
		result.put("file", list);
		result.put("total_count", total_count);
		result.put("pg", page);
		result.put("all_page", all_page);
		result.put("block", block);
		result.put("from_page", from_page);
		result.put("to_page", to_page);
		result.put("collabo_no", collabo_no);
		
		return result;
	}
	
	//파일 드래그 삭제 컨트롤러 함수
	@RequestMapping(value = "/deletefiles.ajax", produces = "application/json")
	@ResponseBody
	public HashMap<String, Object> deleteFiles(@RequestParam(value="deletefilename") String deletefilename, HttpServletRequest request){
		System.out.println("deleteFile 드래그 삭제 컨트롤러");
		HashMap<String, Object> result = new HashMap<String, Object>();
		IFileRoom fileromm_DAO = sqlsession.getMapper(IFileRoom.class);
		FileRoom_DTO fileroom_DTO = new FileRoom_DTO();
		int collabo_no = Integer.parseInt(request.getParameter("collabo_no"));		
		String file_name = deletefilename;
		
		fileroom_DTO.setFile_room_rename(file_name);
		fileroom_DTO.setCollabo_no(collabo_no);
		fileromm_DAO.deleteFile(fileroom_DTO);
			
		String path = request.getServletContext().getRealPath("upload");
		File file = new File(path + "/" + file_name);
		
		if(file.exists() == true){
			file.delete();
		}
		
		int page = 1;
		int row_size = 12;
		int total_count = fileromm_DAO.countFile(collabo_no); // file 개수
		int all_page = (int) Math.ceil(total_count / (double) row_size); // 페이지수
		int block = 5; // 한페이지에 보여줄 범위
		int from_page = ((page - 1) / block * block) + 1; // 보여줄 페이지의 시작
		int to_page = ((page - 1) / block * block) + block; // 보여줄 페이지의 끝
		
		if (to_page > all_page) {
			to_page = all_page;
		}
		
		List<FileRoom_DTO> list = fileromm_DAO.listFiles(page, collabo_no);
		result.put("file", list);
		result.put("total_count", total_count);
		result.put("pg", page);
		result.put("all_page", all_page);
		result.put("block", block);
		result.put("from_page", from_page);
		result.put("to_page", to_page);
		result.put("collabo_no", collabo_no);
		
		return result;
	}
}
