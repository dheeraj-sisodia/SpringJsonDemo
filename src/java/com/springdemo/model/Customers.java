package com.springdemo.model;
// Generated Dec 27, 2013 1:20:24 PM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Customers generated by hbm2java
 */
public class Customers  implements java.io.Serializable {


     private Integer fldId;
     private String fldName;
     private String fldAddress;
     private String fldEmailId;
     private String fldMobileNo;
     private String fldPhoneNo;

    public Customers() {
    }

    public Customers(String fldName, String fldAddress, String fldEmailId, String fldMobileNo, String fldPhoneNo, Set tasks) {
       this.fldName = fldName;
       this.fldAddress = fldAddress;
       this.fldEmailId = fldEmailId;
       this.fldMobileNo = fldMobileNo;
       this.fldPhoneNo = fldPhoneNo;
    }
   
    public Integer getFldId() {
        return this.fldId;
    }
    
    public void setFldId(Integer fldId) {
        this.fldId = fldId;
    }
    public String getFldName() {
        return this.fldName;
    }
    
    public void setFldName(String fldName) {
        this.fldName = fldName;
    }
    public String getFldAddress() {
        return this.fldAddress;
    }
    
    public void setFldAddress(String fldAddress) {
        this.fldAddress = fldAddress;
    }
    public String getFldEmailId() {
        return this.fldEmailId;
    }
    
    public void setFldEmailId(String fldEmailId) {
        this.fldEmailId = fldEmailId;
    }
    public String getFldMobileNo() {
        return this.fldMobileNo;
    }
    
    public void setFldMobileNo(String fldMobileNo) {
        this.fldMobileNo = fldMobileNo;
    }
    public String getFldPhoneNo() {
        return this.fldPhoneNo;
    }
    
    public void setFldPhoneNo(String fldPhoneNo) {
        this.fldPhoneNo = fldPhoneNo;
    }
}

