package com.model;

import com.Enum.Status;
import com.validator.IsUnique;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="user_007")
public class User
{
  @Id
  @GeneratedValue(strategy=GenerationType.AUTO)
  private int userId;
  @NotEmpty
  @Pattern(regexp="^[a-z]*$")
  private String firstname;
  @Pattern(regexp="^[a-z]*$")
  private String lastname;
  @NotEmpty
  @Email
  @IsUnique
  private String email;
  @Enumerated
  private Status status = Status.INACTIVE;
  @NotEmpty
  private String password;
  private String token;
  @ManyToMany(cascade={javax.persistence.CascadeType.ALL})
  @JoinTable(name="usernameAndroles", joinColumns={@javax.persistence.JoinColumn(name="userId")}, inverseJoinColumns={@javax.persistence.JoinColumn(name="roleId")})
  private List<Role> roles = new ArrayList();
  
  public User(int userId, String firstname, String lastname, String password, List<Role> roles)
  {
    this.userId = userId;
    this.firstname = firstname;
    this.lastname = lastname;
    this.password = password;
    this.roles = roles;
  }
  
  public User()
  {
    System.out.println("User Object created.....!!!!!!!");
  }
  
  public int getUserId()
  {
    return this.userId;
  }
  
  public void setUserId(int userId)
  {
    this.userId = userId;
  }
  
  public String getFirstname()
  {
    return this.firstname;
  }
  
  public void setFirstname(String firstname)
  {
    this.firstname = firstname;
  }
  
  public String getLastname()
  {
    return this.lastname;
  }
  
  public void setLastname(String lastname)
  {
    this.lastname = lastname;
  }
  
  public String getPassword()
  {
    return this.password;
  }
  
  public void setPassword(String password)
  {
    this.password = password;
  }
  
  public List<Role> getRoles()
  {
    return this.roles;
  }
  
  public void setRoles(List<Role> roles)
  {
    this.roles = roles;
  }
  
  public String getEmail()
  {
    return this.email;
  }
  
  public void setEmail(String email)
  {
    this.email = email;
  }
  
  public Status getStatus()
  {
    return this.status;
  }
  
  public void setStatus(Status status)
  {
    this.status = status;
  }
  
  public String getToken()
  {
    return this.token;
  }
  
  public void setToken(String token)
  {
    this.token = token;
  }
}
