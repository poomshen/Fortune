package com.fortune.Ajax_Controller;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Request;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.member_DAO.IJoin;
import com.fortune.password_Service.PassWord_Service;

@Controller
public class IdSearchAjax_Controller {

	private JavaMailSender mailSender;
	
	@Autowired
	public void setMailSender(JavaMailSender mailSender){
		this.mailSender=mailSender;
	}
	
	
	@Autowired
	public SqlSession sqlsession;
	
	@RequestMapping(value="/idsearch.ajax", method=RequestMethod.GET)
	public @ResponseBody String geId(HttpServletRequest request, Model model){
	
		System.out.println("IdSearchAjax_Controller/geId함수");
		
		IJoin dao = sqlsession.getMapper(IJoin.class);
		String search_name = request.getParameter("search_name");
		String search_phone = request.getParameter("search_phone");
		String search_birth = request.getParameter("search_birth");
		
		String resultId = dao.searchId(search_name,search_phone,search_birth);
		model.addAttribute("resultId",resultId);
		
		return resultId;
	}
	@RequestMapping("/pwdsearch.ajax")
	public @ResponseBody int getpwd(HttpServletRequest request) throws MessagingException{
	
		System.out.println("IdSearchAjax_Controller/getpwd함수");
		
		IJoin dao = sqlsession.getMapper(IJoin.class);
		PassWord_Service passWord_Service = new PassWord_Service();
		Random random = new Random();
		Join_DTO dto = new Join_DTO();
		
		int ranNum = random.nextInt(9000)+1000;
		String ranNum2 = Integer.toString(ranNum);	
		
		
		String search_id = request.getParameter("search_id");
		String search_name2 = request.getParameter("search_name2");
		String search_phone2 = request.getParameter("search_phone2");
		String pwa = passWord_Service.encode(ranNum2);

		dto.setUser_password(pwa);
		int result = dao.searchpwd(pwa, search_id, search_name2, search_phone2);
		

		if(result!=0){
			//update 성공
			result=ranNum;
			MimeMessage mimemessage = mailSender.createMimeMessage();
			mimemessage.setSubject("[for春] 비밀번호 변경내역을 알려드립니다.", "utf-8");
			
			String htmlContent = "<div align='center'>";
			/*htmlContent += "<img alt='fortune' src='http://cfile9.uf.tistory.com/image/21432B4D5203839212F543'>";*/
			/*htmlContent+= "<br><strong>[임시 비밀번호 를 발송하였습니다.]</strong><br>" + ranNum;	*/		
			htmlContent += "<img alt='fortune' src='http://i67.tinypic.com/2upx074.png'>";
			htmlContent+= "<br><br>";
			htmlContent+= "변경된 비밀번호는 " + "<strong>[" +ranNum+"]</strong>" + "입니다.";
			htmlContent+= "<br><br>";			
			htmlContent+= "로그인 후, 비밀번호를 변경하고 사용해주세요 *^^*<br><br>";
			htmlContent +="</div>";
			 
			mimemessage.setText(htmlContent, "utf-8", "html");
			
			mimemessage.addRecipient(RecipientType.TO, new InternetAddress(search_id));
			mailSender.send(mimemessage);
		}
		
		return result;
	}
}
