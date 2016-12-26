package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

@Service
public class SendMail
{
  @Autowired
  private MailSender mailSender;
  public SendMail(){
	  System.out.println("SendMail object created!!!1");
  }
  public void sendMail(String from, String to, String subject, String msg)
  {
    SimpleMailMessage message = new SimpleMailMessage();
    message.setFrom(from);
    message.setTo(to);
    message.setSubject(subject);
    message.setText(msg);
    
    this.mailSender.send(message);
  }
  
  public MailSender getMailSender()
  {
    return this.mailSender;
  }
  
  public void setMailSender(MailSender mailSender)
  {
    this.mailSender = mailSender;
  }
}
