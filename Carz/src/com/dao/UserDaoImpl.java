package com.dao;

import com.model.User;
import java.io.PrintStream;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

public class UserDaoImpl
  implements UserDao
{
  SessionFactory sf;
  
  public UserDaoImpl()
  {
    System.out.println("UserDaoImpl Object created !!!!!");
  }
  
  public void addUser(User user)
  {
    System.out.println("add user called");
    Session s = this.sf.openSession();
    Transaction t = s.beginTransaction();
    try
    {
      s.save(user);
    }
    catch (Exception e)
    {
      System.out.println("EEEEEEEEEEEEEEEEE");
      System.out.println(e);
    }
    t.commit();
    s.close();
  }
  
  public void editUser(User user)
  {
    this.sf.getCurrentSession().update(user);
  }
  
  public void deleteUser(int userId)
  {
    this.sf.getCurrentSession().delete(Integer.valueOf(userId));
  }
  
  public User findUser(int userId)
  {
    return (User)this.sf.getCurrentSession().get(User.class, Integer.valueOf(userId));
  }
  
  public User findUserByName(String firstname)
  {
    System.out.println("");
    
    Criteria cf = this.sf.getCurrentSession().createCriteria(User.class);
    Criterion cn = Restrictions.eq("firstname", firstname);
    cf.add(cn);
    User user = (User)cf.uniqueResult();
    return user;
  }
  
  public User findUserByEmail(String email)
  {
    Criteria cf = this.sf.getCurrentSession().createCriteria(User.class);
    Criterion cn = Restrictions.eq("email", email);
    cf.add(cn);
    User user = (User)cf.uniqueResult();
    return user;
  }
  
  public List<User> getAllUser()
  {
    return this.sf.getCurrentSession().createQuery("from User").list();
  }
  
  public void setSf(SessionFactory sf)
  {
    this.sf = sf;
  }
  
  public SessionFactory getSf()
  {
    return this.sf;
  }
}
