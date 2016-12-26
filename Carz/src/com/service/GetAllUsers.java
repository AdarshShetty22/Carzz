package com.service;

import com.dao.UserDao;
import com.model.User;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GetAllUsers
{
  @Autowired
  UserDao dao;
 
  public GetAllUsers(){
	  System.out.println("GetAllUsers object created");
  }
  public List<User> displayAllUsers()
  {
	  System.out.println("displayAll users method of GetAllUsers called");
    return this.dao.getAllUser();
  }
}
