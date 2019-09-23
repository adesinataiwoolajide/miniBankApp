package com.springapplication.springadmindashboard.Repository;

import com.springapplication.springadmindashboard.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CustomerRepository extends JpaRepository<Customer, Long> {

    Customer findByCustomerid(Long customerid);
    List<Customer> findByAccounts(Long customerid);
}
