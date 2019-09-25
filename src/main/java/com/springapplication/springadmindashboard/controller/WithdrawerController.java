package com.springapplication.springadmindashboard.controller;

import com.springapplication.springadmindashboard.Repository.CustomerBalanceRepository;
import com.springapplication.springadmindashboard.Repository.TransactionRepository;
import com.springapplication.springadmindashboard.Repository.WithdrawerRepository;
import com.springapplication.springadmindashboard.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("administrator")
public class WithdrawerController {

    @Autowired
    WithdrawerRepository withdrawerRepository;

    @Autowired
    CustomerBalanceRepository customerBalanceRepository;

    @Autowired
    TransactionRepository transactionRepository;

    @RequestMapping(value = "/withdrawer/", method = RequestMethod.GET)
    public ModelAndView index(){

        ModelAndView modelAndView = new ModelAndView("withdrawer/index");
        modelAndView.addObject("withdrawer",
                customerBalanceRepository.findAll(Sort.by(Sort.Direction.DESC, "balanceid")));
        return modelAndView;
    }

    @RequestMapping(value = "/withdrawer/save", method = RequestMethod.POST)
    public ModelAndView store(
            @RequestParam("accountid") Long accountid,
            @RequestParam("customername") String customername,
            @RequestParam("customerid") Long customerid,
            @RequestParam("amount") Long amount,
            @RequestParam("balance") Long balance,
            RedirectAttributes redirectAttributes
    ) {
        Withdrawer withdrawer = new Withdrawer();
        ModelAndView modelAndView = new ModelAndView("redirect:/administrator/withdrawer/");
        withdrawer.setAmount(amount);

        Account account = new Account();
        CustomerBalance customerBalance = new CustomerBalance();
        account.setAccountid(accountid);
        Customer customer = new Customer();
        customer.setCustomerid(customerid);

        if (amount == null) {
            redirectAttributes.addFlashAttribute("error",
                    "Please Enter An Amount To Perform The Withdrawer");
            return modelAndView;
        } else {

            if (amount > balance) {

                redirectAttributes.addFlashAttribute("error",
                        "Insufficient Fund In " + customername);
                return modelAndView;
            } else {

                Transaction transaction = new Transaction();
                transaction.setAccount(account);
                transaction.setCustomer(customer);
                transaction.setAmount(amount);
                transaction.setTransactiontype("DR");

                CustomerBalance updateBalance = (CustomerBalance) customerBalanceRepository.findByAccountAccountid(accountid);
                Long finalamt = balance - amount;
                updateBalance.setCloseab(finalamt);
                updateBalance.setOnlinecb(finalamt);
                updateBalance.setWorkingb(finalamt);
                updateBalance.setOpenab(finalamt);
                updateBalance.setOnlineac(finalamt);
                updateBalance.setAccount(account);

                redirectAttributes.addFlashAttribute("success",
                        "You Have Withdraw " + amount + " From " + customername + " Account Successfully");
                customerBalanceRepository.save(updateBalance);
                withdrawerRepository.save(withdrawer);
                transactionRepository.save(transaction);
                return modelAndView;
            }
        }

    }

}
