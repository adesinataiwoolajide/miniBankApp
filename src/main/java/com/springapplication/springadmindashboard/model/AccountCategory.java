package com.springapplication.springadmindashboard.model;


import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.UniqueElements;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name = "account_category")

@Getter
@Setter
public class AccountCategory {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "accountcategoryid")
    public Long accountcategoryid;


    @NotEmpty(message = "You Have Added This Account Category Before")
//    @UniqueElements
    @Column(name = "accountcategoryname")
    public String accountcategoryname;

    public Long getAccountcategoryid() {
        return accountcategoryid;
    }

    public void setAccountcategoryid(Long accountcategoryid) {
        this.accountcategoryid = accountcategoryid;
    }

    public String getAccountcategoryname() {
        return accountcategoryname;
    }

    public void setAccountcategoryname(String accountcategoryname) {
        this.accountcategoryname = accountcategoryname;
    }

    public void setAmount(Long amount) {
        this.amount = amount;
    }

    public Long getAmount() {
        return amount;
    }

    @Column(name = "amount")
    public Long amount;


}
