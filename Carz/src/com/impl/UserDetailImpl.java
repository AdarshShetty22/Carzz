package com.impl;

import com.dao.UserDao;
import com.model.Role;
import java.io.PrintStream;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserDetailImpl
  implements UserDetailsService
{
  @Autowired
  private UserDao userDao;
  
  public UserDetailImpl()
  {
    System.out.println("UserDetailImplObject created !!!!!");
  }
  
  @Transactional(readOnly=false)
  public UserDetails loadUserByUsername(String s)
    throws UsernameNotFoundException
  {
    System.out.println("UserDeatails method of UserDeatailsImpl called !!!!!");
    
    com.model.User user = this.userDao.findUserByEmail(s);
    if (user != null)
    {
      String password = user.getPassword();
      ArrayList<GrantedAuthority> auth = new ArrayList();
      for (Role role : user.getRoles()) {
        auth.add(new SimpleGrantedAuthority(role.getRoleName()));
      }
      org.springframework.security.core.userdetails.User secureUser = new org.springframework.security.core.userdetails.User(s, password, auth);
      return secureUser;
    }
    throw new UsernameNotFoundException("User not found");
  }
  
  public void setUserDao(UserDao userDao)
  {
    this.userDao = userDao;
  }
}