package com.springdemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.springdemo.dao.CustomerDao;
import com.springdemo.model.Customers;

@Service("customerService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerDao employeeDao;

    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addEmployee(Customers employee) {
        employeeDao.addEmployee(employee);
    }

    public List<Customers> listEmployeess() {
        return employeeDao.listEmployeess();

    }

    public Customers getEmployee(int empid) {
        return employeeDao.getEmployee(empid);
    }

    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteEmployee(Integer inId) {
        employeeDao.deleteEmployee(inId);
    }
}
