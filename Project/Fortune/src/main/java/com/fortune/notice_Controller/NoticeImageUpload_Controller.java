package com.fortune.notice_Controller;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.fortune.function_DTO.NoticeFileUpload_DTO;

@Controller
public class NoticeImageUpload_Controller {

	@RequestMapping(value="/noticeImageUpload")
	public String NoticeImageUpload(final HttpServletRequest request, NoticeFileUpload_DTO nfdto, Model model) {

		System.out.println("NoticeFileImageUpload_Controller/NoticeImageUpload함수");

		Date date = new Date();
		int year = date.getYear() + 1900;
		int month = date.getMonth();
		String monthStr = "";

		if (month < 10)
			monthStr = "0" + month;
		else
			monthStr = "" + month;

		@SuppressWarnings("deprecation")
		String defaultPath = request.getRealPath("/");
		String contextPath = request.getSession().getServletContext().getContextPath();
		String fileUploadPathTail = "ckeImage/" + year + "" + monthStr;
		String fileUploadPath = defaultPath + "/" + fileUploadPathTail;

		
		try {
			MultipartFile file = nfdto.getUpload();

			if (file != null) {
				String fileName = file.getOriginalFilename();
				String fileNameExt = fileName.substring(fileName.indexOf(".") + 1);

				if (!"".equals(fileName)) {
					File destD = new File(fileUploadPath);

					if (!destD.exists()) {
						destD.mkdirs();
					}

					File destination = File.createTempFile("ckeditor_", "." + fileNameExt, destD);
					file.transferTo(destination);

					nfdto.setNewFilename(destination.getName());
					nfdto.setImageUrl(contextPath + "/" + fileUploadPathTail + "/" + destination.getName());

				}

			}

		} catch (Exception e) {
			// TODO: handle exception
		}		
		
		return null;

	}
}
