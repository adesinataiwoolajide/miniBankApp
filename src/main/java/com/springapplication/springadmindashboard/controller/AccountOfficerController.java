package com.springapplication.springadmindashboard.controller;

import com.springapplication.springadmindashboard.Repository.AccountOfficerRepository;
import com.springapplication.springadmindashboard.model.AccountOfficer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("administrator")
public class AccountOfficerController {

    @Autowired
    AccountOfficerRepository accountOfficerRepository;

    @RequestMapping(value = "/account_officers/", method = RequestMethod.GET)
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView("account_officers/index");
        modelAndView.addObject("officer", accountOfficerRepository.findAll(Sort.by(Sort.Direction.ASC, "officername")));
        return modelAndView;
    }

    private boolean checkOfficerName(String officername){
        AccountOfficer officer = accountOfficerRepository.findByOfficername(officername);
        if(officer != null){
            return true;
        }else{
            return false;
        }

    }

    @RequestMapping(value = "/account_officer/save", method = RequestMethod.POST)
    public ModelAndView store(
            @RequestParam("officername") String officername, RedirectAttributes redirectAttributes
    ) {

        AccountOfficer accountOfficer = new AccountOfficer();
        ModelAndView modelAndView = new ModelAndView("redirect:/administrator/account_officers/");
        accountOfficer.setOfficername(officername);
        if(checkOfficerName(officername)){
            redirectAttributes.addFlashAttribute("error",
                    "You Have Added "  + officername + " To The Account Officer List Before");
            return modelAndView;
        }else{
            redirectAttributes.addFlashAttribute("success",
                    "You Have Added "  + officername + " To The Account Officer List Successfully");
            accountOfficerRepository.save(accountOfficer);
            return modelAndView;
        }


    }

    @RequestMapping(value = "/account_officer/update", method = RequestMethod.POST)
    public ModelAndView update(
            @RequestParam("officerid") Long officerid,
            @RequestParam("officername") String officername,
            RedirectAttributes redirectAttributes
    ) {

        AccountOfficer accountOfficer = (AccountOfficer) accountOfficerRepository.findById(officerid).orElse(null);
        ModelAndView modelAndView = new ModelAndView("redirect:/administrator/account_officers/");
        accountOfficer.setOfficername(officername);
        redirectAttributes.addFlashAttribute("success",
                "You Have Updated "  + officername + " From The Account Officer List Successfully");
        accountOfficerRepository.save(accountOfficer);
        return modelAndView;

    }

    @RequestMapping(value = "account_officer/delete/{officerid}", method = RequestMethod.GET)
    public ModelAndView destroy(@PathVariable("officerid") Long officerid, RedirectAttributes redirectAttributes){
        ModelAndView modelAndView = new ModelAndView("redirect:/administrator/account_officers/");
        AccountOfficer office = (AccountOfficer) accountOfficerRepository.findById(officerid).orElse(null);
        redirectAttributes.addFlashAttribute("success",
                "You Have Deleted "  + office.getOfficername() + " From The Account Officer List Successfully");
        accountOfficerRepository.deleteById(officerid);
        return modelAndView;
    }

    @RequestMapping(value = "account_officer/edit/{officerid}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable("officerid") Long officerid){
        ModelAndView modelAndView = new ModelAndView("account_officers/edit");
        modelAndView.addObject("office", accountOfficerRepository.findById(officerid).orElse(null));
        modelAndView.addObject("officer", accountOfficerRepository.findAll(Sort.by(Sort.Direction.ASC, "officername")));
        return modelAndView;
    }


}
