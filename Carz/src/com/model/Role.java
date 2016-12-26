package com.model;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="ROLE")
public class Role
{
  @Id
  @GeneratedValue(strategy=GenerationType.AUTO)
  private int roleId;
  private String roleName;
  @ManyToMany(mappedBy="roles")
  private List<User> users;
  
  public Role(int roleId, String roleName, List<User> users)
  {
    this.roleId = roleId;
    this.roleName = roleName;
    this.users = users;
  }
  
  public Role() {
	  System.out.println("Role object created");
  }
  
  public int getRoleId()
  {
    return this.roleId;
  }
  
  public void setRoleId(int roleId)
  {
    this.roleId = roleId;
  }
  
  public String getRoleName()
  {
    return this.roleName;
  }
  
  public void setRoleName(String roleName)
  {
    this.roleName = roleName;
  }
  
  public List<User> getUsers()
  {
    return this.users;
  }
  
  public void setUsers(List<User> users)
  {
    this.users = users;
  }
}
