package com.springapplication.springadmindashboard.controller;

import com.springapplication.springadmindashboard.Repository.TransactionRepository;
import com.springapplication.springadmindashboard.model.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("administrator")
public class TransactionController {

    @Autowired
    TransactionRepository transactionRepository;

    @RequestMapping(value = "/transactions/", method = RequestMethod.GET)
    public ModelAndView index(){

        ModelAndView modelAndView = new ModelAndView("transactions/index");
        modelAndView.addObject("transactions", transactionRepository.findAll(Sort.by(Sort.Direction.DESC, "transactionid")));
        return modelAndView;
    }



}
