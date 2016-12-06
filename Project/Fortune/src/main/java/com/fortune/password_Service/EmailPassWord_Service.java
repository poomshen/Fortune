package com.fortune.password_Service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.member_DAO.IJoin;

@Controller
public class EmailPassWord_Service {
	
	private JavaMailSender mailSender;
	
	@Autowired
	public void setMailSender(JavaMailSender mailSender){
		this.mailSender=mailSender;
	}
	
	@Autowired
	public SqlSession sqlsession;
	
	
	@RequestMapping(value="/pwdsearch.mail")
	public @ResponseBody String sendMail(HttpServletRequest request, Model model) throws AddressException, MessagingException{
		IJoin dao = sqlsession.getMapper(IJoin.class);
		PassWord_Service passWord_Service = new PassWord_Service();
		Random random = new Random();
		Join_DTO dto = new Join_DTO();
		
		int ranNum = random.nextInt(9000)+1000;
		String ranNum2 = Integer.toString(ranNum);	
		//System.out.println("랜덤 숫자 : " + ranNum);
		
		String search_id = request.getParameter("search_id");
		String search_name2 = request.getParameter("search_name2");
		String search_phone2 = request.getParameter("search_phone2");
		String pwa = passWord_Service.encode(ranNum2);

		dto.setUser_password(pwa);
		int result = dao.searchpwd(pwa, search_id, search_name2, search_phone2);
		
		String ck ="no";
		
		/*return ranNum;*/
		if(result!=0){
			ck = "yes";
			//update 성공
			result=ranNum;
			MimeMessage mimemessage = mailSender.createMimeMessage();
			mimemessage.setSubject("변경된 비밀번호는.", "utf-8");
			String htmlContent="<strong>[MimeMessage]</strong><br>" + ranNum + "<br>";
			mimemessage.setText(htmlContent, "utf-8", "html");
			
			mimemessage.addRecipient(RecipientType.TO, new InternetAddress(search_id));
			mailSender.send(mimemessage);
		}
		
		return ck;
	}
}
