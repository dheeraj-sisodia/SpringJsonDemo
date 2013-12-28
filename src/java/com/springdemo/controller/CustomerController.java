package com.springdemo.controller;

import com.springdemo.bean.CustomerBean;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.springdemo.model.Customers;
import com.springdemo.service.CustomerService;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CustomerController {

    @Autowired
    private CustomerService employeeService;

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public String saveEmployee(@RequestBody CustomerBean customerBean) {
        String OutStatus = "Saved successfuly";
        Customers customer = null;
        try {
            customer = prepareModel(customerBean);
            System.out.println("customerBean:" + customerBean.getmAddress());
            employeeService.addEmployee(customer);
        } catch (Exception e) {
            e.printStackTrace();
            OutStatus = "Error";
        }
        return OutStatus;
    }

    @RequestMapping(value = "/customers", method = RequestMethod.GET)
    @ResponseBody
    public List<CustomerBean> listEmployees(String produces) {
//        Map<String, Object> model = new HashMap<String, Object>();
//        model.put("customers", prepareListofBean(employeeService.listEmployeess()));
        return prepareListofBean(employeeService.listEmployeess());
    }

    @RequestMapping(value = "/tasktracker", method = RequestMethod.GET)
    public ModelAndView tasktracker(@ModelAttribute("customer") CustomerBean employeeBean,
            BindingResult result) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("customer", new CustomerBean());
        return new ModelAndView("tasktracker", model);
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView welcome() {
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @ResponseBody
    public String deleteEmployee(@PathVariable int id) {
        try {
            employeeService.deleteEmployee(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "Delete";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    @ResponseBody
    public CustomerBean editEmployee(@PathVariable int id) {
        return prepareEmployeeBean(employeeService.getEmployee(id));
    }

    private Customers prepareModel(CustomerBean employeeBean) {
        Customers customer = new Customers();
        customer.setFldId(employeeBean.getmId());
        customer.setFldAddress(employeeBean.getmAddress());
        customer.setFldEmailId(employeeBean.getmEmailId());
        customer.setFldMobileNo(employeeBean.getmMobileNo());
        customer.setFldName(employeeBean.getmName());
        customer.setFldPhoneNo(employeeBean.getmPhoneNo());
        return customer;
    }

    private List<CustomerBean> prepareListofBean(List<Customers> employees) {
        List<CustomerBean> beans = null;
        if (employees != null && !employees.isEmpty()) {
            beans = new ArrayList<CustomerBean>();
            CustomerBean bean = null;
            for (Customers employee : employees) {
                bean = new CustomerBean();
                bean.setmId(employee.getFldId());
                bean.setmAddress(employee.getFldAddress());
                bean.setmEmailId(employee.getFldEmailId());
                bean.setmMobileNo(employee.getFldMobileNo());
                bean.setmName(employee.getFldName());
                bean.setmPhoneNo(employee.getFldPhoneNo());
                beans.add(bean);
            }
        }
        return beans;
    }

    private CustomerBean prepareEmployeeBean(Customers employee) {
        CustomerBean bean = new CustomerBean();
        bean.setmId(employee.getFldId());
        bean.setmAddress(employee.getFldAddress());
        bean.setmEmailId(employee.getFldEmailId());
        bean.setmMobileNo(employee.getFldMobileNo());
        bean.setmPhoneNo(employee.getFldPhoneNo());
        bean.setmName(employee.getFldName());
        return bean;
    }
}
