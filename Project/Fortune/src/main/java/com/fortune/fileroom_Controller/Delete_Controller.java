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
	
	/*@RequestMapping(value = "/filedelete.htm", produces = "application/json")
	@ResponseBody
	public HashMap<String, Object> filedelete(MultipartHttpServletRequest request) throws Exception {
		System.out.println("filedelete 컨트롤러");
		HashMap<String, Object> result = new HashMap<String, Object>();
		FileDAO fileDAO = sqlsession.getMapper(FileDAO.class);
		FileDTO filedto = new FileDTO();
		System.out.println("입력 전 : " + filedto.getFilesrc());
		filedto.setFilesrc(request.getParameter("filename"));
		System.out.println("입력 후 : " + filedto.getFilesrc());
		fileDAO.deletefile(filedto);
		return result;
	}*/
	
	/*@RequestMapping(value = "/filedelete.htm")
	public String filedelte(HttpServletRequest request){
		System.out.println("filedelete 컨트롤러");
		
		FileDAO fileDAO = sqlsession.getMapper(FileDAO.class);
		FileDTO filedto = new FileDTO();
		String fileName = request.getParameter("filename");
		filedto.setFilesrc(fileName);
		fileDAO.deletefile(filedto);
		
		String path = request.getServletContext().getRealPath("upload");
		File file = new File(path + "/" + fileName);
		if(file.exists() == true){
			file.delete();
		}
		
		return "redirect:index.htm";
	}*/
	
	@RequestMapping(value = "/deletefile.ajax", produces = "application/json")
	@ResponseBody
	public HashMap<String, Object> deleteFile(@RequestParam(value="checkArray[]") List<String> arrayParams, HttpServletRequest request){
		System.out.println("deleteFile 컨트롤러");
		System.out.println("arrayParams : " + arrayParams);
		HashMap<String, Object> result = new HashMap<String, Object>();
		IFileRoom fileromm_DAO = sqlsession.getMapper(IFileRoom.class);
		FileRoom_DTO fileroom_DTO = new FileRoom_DTO();
		
		for(int i = 0; i < arrayParams.size(); i++){
			String file_name = arrayParams.get(i);
			System.out.println("file_name : " + file_name);
			fileroom_DTO.setFile_room_rename(file_name);
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

		int total_count = fileromm_DAO.countFile(); // file 개수
		System.out.println("total_count : " + total_count);

		// ... 목록
		int all_page = (int) Math.ceil(total_count / (double) row_size); // 페이지수
		// int totalPage = total/rowSize + (total%rowSize==0?0:1);
		System.out.println("페이지수 : " + all_page);

		int block = 5; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9]
		// [10] >>
		int from_page = ((page - 1) / block * block) + 1; // 보여줄 페이지의 시작
		// ((1-1)/10*10)
		int to_page = ((page - 1) / block * block) + block; // 보여줄 페이지의 끝
		if (to_page > all_page) { // 예) 20>17
			to_page = all_page;
		}
		
		List<FileRoom_DTO> list = fileromm_DAO.listFiles(page);
		result.put("file", list);
		result.put("total_count", total_count);
		result.put("pg", page);
		result.put("all_page", all_page);
		result.put("block", block);
		result.put("from_page", from_page);
		result.put("to_page", to_page);

		return result;
	}
	
	@RequestMapping(value = "/deletefiles.ajax", produces = "application/json")
	@ResponseBody
	public HashMap<String, Object> deleteFiles(@RequestParam(value="deletefilename") String deletefilename, HttpServletRequest request){
		System.out.println("deleteFile 컨트롤러");
		System.out.println("deletefilename : " + deletefilename);
		HashMap<String, Object> result = new HashMap<String, Object>();
		IFileRoom fileromm_DAO = sqlsession.getMapper(IFileRoom.class);
		FileRoom_DTO fileroom_DTO = new FileRoom_DTO();
		
		String file_name = deletefilename;
		System.out.println("file_name : " + file_name);
		fileroom_DTO.setFile_room_rename(file_name);
		fileromm_DAO.deleteFile(fileroom_DTO);
			
		String path = request.getServletContext().getRealPath("upload");
		File file = new File(path + "/" + file_name);
		if(file.exists() == true){
			file.delete();
		}
		
		//View 화면에 뿌려주기 위한 list
		int page = 1;
		int row_size = 12;

		int total_count = fileromm_DAO.countFile(); // file 개수
		System.out.println("total_count : " + total_count);

		// ... 목록
		int all_page = (int) Math.ceil(total_count / (double) row_size); // 페이지수
		// int totalPage = total/rowSize + (total%rowSize==0?0:1);
		System.out.println("페이지수 : " + all_page);

		int block = 5; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9]
		// [10] >>
		int from_page = ((page - 1) / block * block) + 1; // 보여줄 페이지의 시작
		// ((1-1)/10*10)
		int to_page = ((page - 1) / block * block) + block; // 보여줄 페이지의 끝
		if (to_page > all_page) { // 예) 20>17
			to_page = all_page;
		}
		
		List<FileRoom_DTO> list = fileromm_DAO.listFiles(page);
		result.put("file", list);
		result.put("total_count", total_count);
		result.put("pg", page);
		result.put("all_page", all_page);
		result.put("block", block);
		result.put("from_page", from_page);
		result.put("to_page", to_page);

		return result;
	}
}
