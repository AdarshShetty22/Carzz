package com.controller;

import com.model.Role;
import com.model.User;
import com.service.GetAllUsers;
import com.service.Registration;
import com.service.SendMail;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController
{
  @Autowired
  Registration reg;
  @Autowired
  GetAllUsers users;
  @Autowired
  SendMail sendMail;
  String s;
  
  public MainController()
  {
    System.out.println("MainController Object created!!!!!");
  }
  
  @RequestMapping("/login")
  public String login(ModelMap m)
  {
    System.out.println("/login method of HelloController called!!!!!");
    String roles = " ";
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String userName = authentication.getName();
    Collection<GrantedAuthority> roleNames = (Collection<GrantedAuthority>) authentication.getAuthorities();
    for (GrantedAuthority roleName : roleNames) {
      roles = roles + roleName + " ";
    }
    String roleWithUnderscoreRemoved = roles.replace("ROLE_", "");
    m.addAttribute("name", userName);
    m.addAttribute("role", roleWithUnderscoreRemoved);
    return "success";
  }
  
  @RequestMapping("/logout")
  public String logout(ModelMap m)
  {
    String s = "Succesfully logged out";
    m.put("loggedOutMessage", s);
    return "first";
  }
  
  @RequestMapping("/admin")
  public String adminLogin(ModelMap m)
  {
	  String roles = " ";
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String userName = authentication.getName();
	    Collection<GrantedAuthority> roleNames = (Collection<GrantedAuthority>) authentication.getAuthorities();
	    for (GrantedAuthority roleName : roleNames) {
	      roles = roles + roleName + " ";
	    }
	    String roleWithUnderscoreRemoved = roles.replace("ROLE_", "");
	    m.addAttribute("name", userName);
	    m.addAttribute("role", roleWithUnderscoreRemoved);
	    List<User> allUsers = users.displayAllUsers();
	    m.addAttribute("allUsers", allUsers);
	    for (User user : allUsers) {
	      System.out.println("username:" + user.getFirstname());
	    }
	    return "success";
	  }
  @RequestMapping("/reg")
  public ModelAndView register(@Valid @ModelAttribute("user") User user, BindingResult rs)
  {
    System.out.println("/reg of HelloController is called");
    System.out.println(user.getFirstname());
    System.out.println(user.getLastname());
    System.out.println(user.getPassword());
    if (rs.hasErrors())
    {
      System.out.println("Has ERRORS CALLED");
      ModelAndView mav = new ModelAndView("reg");
      return mav;
    }
    Role role = new Role();
    role.setRoleId(1);
    role.setRoleName("ROLE_USER");
    ArrayList<Role> roles = new ArrayList();
    roles.add(role);
    user.setRoles(roles);
    reg.createToken();
    reg.RegisterUser(user);
    s = reg.getUniqueKey();
    sendMail.sendMail("adarsh892@gmail.com", "adarsh892@gmail.com", "test", "http://localhost:8081/app/emailVerification/" + this.s);
    ModelAndView mav = new ModelAndView("regsuccess");
    return mav;
  }
  
  @RequestMapping("/emailVerification/{token}")
  public ModelAndView emailVerification(@PathVariable("token") String token)
  {
    System.out.println("token is" + token);
    System.out.println("uuid is" + s);
    if (s.equals(token)) {
      return new ModelAndView("emailVerified");
    }
    return new ModelAndView("emailNotVerified");
  }
}
