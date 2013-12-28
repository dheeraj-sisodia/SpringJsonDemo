package com.springdemo.dao;

import com.springdemo.model.Customers;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.orm.hibernate3.HibernateTemplate;

@Repository("customerDao")
public class CustomerDaoImpl implements CustomerDao {

    @Autowired
    private SessionFactory sessionFactory;
//    @Autowired
//    private HibernateTemplate template;

    public void addEmployee(Customers customer) {
        sessionFactory.getCurrentSession().saveOrUpdate(customer);
    }

    @SuppressWarnings("unchecked")
    public List<Customers> listEmployeess() {

        return (List<Customers>) sessionFactory.getCurrentSession().createCriteria(Customers.class).list();
    }

    public Customers getEmployee(int empid) {
        return (Customers) sessionFactory.getCurrentSession().get(Customers.class, empid);
    }

    public void deleteEmployee(Integer inId) {
        System.out.println("inId"+inId);
        sessionFactory.getCurrentSession().getSessionFactory().getCurrentSession().createQuery("DELETE FROM Customers WHERE FldId = " + inId).executeUpdate();
    }
}
