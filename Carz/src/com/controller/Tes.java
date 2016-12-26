package com.controller;

import java.io.PrintStream;

public class Tes
{
  public static void main(String[] args)
  {
    String token = "adasdasda";
    String name = "http://localhost:8081/app/emailVerification/" + token;
    System.out.println(name);
  }
}
