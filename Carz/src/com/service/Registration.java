package com.service;

import com.dao.UserDao;
import com.model.User;
import java.io.PrintStream;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Registration
{
  private UUID uniqueKey;
  @Autowired
  UserDao ud;
  
  public Registration()
  {
    System.out.println("Registration Object created");
  }
  
  public void RegisterUser(User user)
  {
    System.out.println("RegistrationUser method called");
    user.setToken(""+uniqueKey);
    ud.addUser(user);
  }
  
  public void createToken()
  {
    this.uniqueKey = UUID.randomUUID();
    System.out.println(this.uniqueKey);
  }
  
  public String getUniqueKey()
  {
    return ""+uniqueKey;
  }
}