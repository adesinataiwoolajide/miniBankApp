package com.springapplication.springadmindashboard.controller;

import com.springapplication.springadmindashboard.Repository.AccountRepository;
import com.springapplication.springadmindashboard.Repository.CustomerRepository;
import com.springapplication.springadmindashboard.Repository.SectorRepository;
import com.springapplication.springadmindashboard.model.Customer;
import com.springapplication.springadmindashboard.model.Sector;
import org.hibernate.mapping.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.swing.*;
import java.util.List;

@Controller
@RequestMapping("administrator")
@Component
public class CustomerController {

    @Autowired
    CustomerRepository customerRepository;
    @Autowired
    SectorRepository sectorRepository;
    @Autowired
    AccountRepository accountRepository;

    @RequestMapping(value = "/customers/", method = RequestMethod.GET)
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView("customers/index");
        modelAndView.addObject("customer", customerRepository.findAll(Sort.by(Sort.Direction.ASC, "customername")));
        modelAndView.addObject("secto", sectorRepository.findAll(Sort.by(Sort.Direction.ASC, "sectorname")));
        return modelAndView;
    }

    @RequestMapping("/customers/save")
    public ModelAndView store(
            @RequestParam("customername") String customername,
            @RequestParam("mnemonic") String mnemonic,
            @RequestParam("gender") String gender,
            @RequestParam("phonenumber") Long phonenumber,
            @RequestParam("nationality") String nationality,
            @RequestParam("sectorid") Long sectorid,
            @RequestParam("address") String address,
            @RequestParam("kinname") String kinname,
            @RequestParam("kinaddress") String kinaddress,
            RedirectAttributes redirectAttributes

    ){
        Customer customer = new Customer();
        Sector sector = new Sector();
        sector.setSectorid(sectorid);
        ModelAndView modelAndView = new ModelAndView("redirect:/administrator/customers/");
        customer.setCustomername(customername);
        customer.setMnemonic(mnemonic);
        customer.setGender(gender);
        customer.setPhonenumber(phonenumber);
        customer.setNationality(nationality);
        customer.setKinname(kinname);
        customer.setKinaddress(kinaddress);

        customer.setSector(sector);
        customer.setNationality(nationality);
        customer.setAddress(address);
        redirectAttributes.addFlashAttribute("success",
                "You Have Added "  + customername + " to The Customer List Successfully");
        customerRepository.save(customer);
        return modelAndView;

    }

    @RequestMapping(value = "customer/delete/{customerid}", method = RequestMethod.GET)
    public ModelAndView destroy(@PathVariable("customerid") Long customerid, RedirectAttributes redirectAttributes){
        ModelAndView modelAndView = new ModelAndView("redirect:/administrator/customers/");

        Customer customer = (Customer) customerRepository.findById(customerid).orElse(null);
        redirectAttributes.addFlashAttribute("success",
                "You Have Deleted "  + customer.getCustomername() + " From The Customer List Successfully");
        customerRepository.deleteById(customerid);
        return modelAndView;
    }

    @RequestMapping(value = "customer/edit/{customerid}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable("customerid") Long customerid){
        ModelAndView modelAndView = new ModelAndView("customers/edit");
        modelAndView.addObject("cust", customerRepository.findById(customerid).orElse(new Customer()));
        modelAndView.addObject("customer", customerRepository.findAll(Sort.by(Sort.Direction.ASC, "customername")));
        modelAndView.addObject("secto", sectorRepository.findAll(Sort.by(Sort.Direction.ASC, "sectorname")));
        return modelAndView;
    }

    @RequestMapping(value = "customer/view/{customerid}", method = RequestMethod.GET)
    public ModelAndView view(@PathVariable("customerid") Long customerid){
        ModelAndView modelAndView = new ModelAndView("customers/view");
        modelAndView.addObject("customer", customerRepository.findById(customerid).orElse(null));
        modelAndView.addObject("cust", customerRepository.findAll());
        modelAndView.addObject("secto", sectorRepository.findAll());
        modelAndView.addObject("accounts", accountRepository.findByCustomerCustomerid(customerid));
        return modelAndView;
    }

    @RequestMapping("/customer/update")
    public ModelAndView update(
            @RequestParam("customerid") Long customerid,
            @RequestParam("customername") String customername,
            @RequestParam("mnemonic") String mnemonic,
            @RequestParam("gender") String gender,
            @RequestParam("phonenumber") Long phonenumber,
            @RequestParam("nationality") String nationality,
            @RequestParam("sectorid") Long sectorid,
            @RequestParam("address") String address,
            @RequestParam("kinname") String kinname,
            @RequestParam("kinaddress") String kinaddress,
            RedirectAttributes redirectAttributes

    ){
        Customer customer = (Customer) customerRepository.findById(customerid).orElse(null);
        ModelAndView modelAndView = new ModelAndView("redirect:/administrator/customers/");

        Sector sector = new Sector();
        sector.setSectorid(sectorid);
        customer.setCustomername(customername);
        customer.setMnemonic(mnemonic);
        customer.setGender(gender);
        customer.setPhonenumber(phonenumber);
        customer.setKinname(kinname);
        customer.setKinaddress(kinaddress);

        customer.setSector(sector);
        customer.setNationality(nationality);
        customer.setAddress(address);

        redirectAttributes.addFlashAttribute("success",
                "You Have Updated "  + customername + " Details Successfully");
        customerRepository.save(customer);
        return modelAndView;

    }
}
