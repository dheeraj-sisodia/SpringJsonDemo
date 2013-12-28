package com.springdemo.service;

import com.springdemo.model.Customers;
import java.util.List;


public interface CustomerService {

    public void addEmployee(Customers employee);

    public List<Customers> listEmployeess();

    public Customers getEmployee(int empid);

    public void deleteEmployee(Integer inId);
}
