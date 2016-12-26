package com.validator;

import com.dao.UserDao;
import com.model.User;
import java.io.PrintStream;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;

public class UsernameValidator
  implements ConstraintValidator<IsUnique, String>
{
  @Autowired
  UserDao dao;
  
  public UsernameValidator()
  {
    System.out.println("UsernameValidator Object created");
  }
  
  public void initialize(IsUnique is) {}
  
  public boolean isValid(String email, ConstraintValidatorContext cvx)
  {
    System.out.println("Is valid Method called");
    System.out.println("Username is " + email);
    User user = this.dao.findUserByEmail(email);
    System.out.println();
    if (user == null)
    {
      System.out.println("Isvalid user!=null method called");
      return true;
    }
    System.out.println("Isvalid user=null method calledthe user!!!!----" + email);
    
    return false;
  }
}
