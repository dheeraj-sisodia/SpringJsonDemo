package com.springdemo.dao;

import com.springdemo.model.Customers;
import java.util.List;


public interface CustomerDao {

    public void addEmployee(Customers employee);

    public List<Customers> listEmployeess();

    public Customers getEmployee(int empid);

    public void deleteEmployee(Integer inId);
}
