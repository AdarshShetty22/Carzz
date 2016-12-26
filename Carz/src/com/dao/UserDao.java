package com.dao;

import com.model.User;
import java.util.List;

public abstract interface UserDao
{
  public abstract void addUser(User paramUser);
  
  public abstract void editUser(User paramUser);
  
  public abstract void deleteUser(int paramInt);
  
  public abstract User findUser(int paramInt);
  
  public abstract User findUserByName(String paramString);
  
  public abstract User findUserByEmail(String paramString);
  
  public abstract List<User> getAllUser();
}