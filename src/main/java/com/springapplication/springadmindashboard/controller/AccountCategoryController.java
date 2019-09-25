package com.springapplication.springadmindashboard.controller;

import com.springapplication.springadmindashboard.Repository.AccountCategoryRepository;
import com.springapplication.springadmindashboard.model.AccountCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("administrator")
public class AccountCategoryController {

    @Autowired
    AccountCategoryRepository accountCategoryRepository;
    public String message = "Success";

    public String error(){
        return "Failure !";
    }
    @RequestMapping("/account_category/")
    public ModelAndView index(){

        ModelAndView modelAndView = new ModelAndView("account_category/index");
        modelAndView.addObject("account_category", accountCategoryRepository.findAll
                (Sort.by(Sort.Direction.ASC, "accountcategoryname")));

        return modelAndView;
    }

    private boolean checkCategoryname(String accountcategoryname){
        AccountCategory accountCategory = accountCategoryRepository.findByAccountcategoryname(accountcategoryname);
        if(accountCategory != null){
            return true;
        }else{
            return false;
        }

    }


    @RequestMapping(value = "/account_category/save", method = RequestMethod.POST)
    public ModelAndView store(
            @RequestParam("accountcategoryname") String accountcategoryname,
            @RequestParam("amount") Long amount,
            RedirectAttributes redirectAttributes
    ){
        AccountCategory accountCategory = new AccountCategory();
        ModelAndView modelAndView = new ModelAndView("redirect:/administrator/account_category/");
        accountCategory.setAccountcategoryname(accountcategoryname);
        accountCategory.setAmount(amount);
        if(checkCategoryname(accountcategoryname)){

            redirectAttributes.addFlashAttribute("error",
                    "You Have Added "  + accountcategoryname + " To The Account Category Before");
            return modelAndView;
        }else {
            //modelAndView.addObject("success", getSuccess("You Have Added the Category Name Successfully"));
            redirectAttributes.addFlashAttribute("success",
                    "You Have Added "  + accountcategoryname + " Successfully");
            accountCategoryRepository.save(accountCategory);
            return modelAndView;
        }

    }

    @RequestMapping(value = "account_category/delete/{accountcategoryid}", method = RequestMethod.GET)
    public ModelAndView destroy(@PathVariable("accountcategoryid") Long accountcategoryid, RedirectAttributes redirectAttributes){
        ModelAndView modelAndView = new ModelAndView("redirect:/administrator/account_category/");
        AccountCategory accountCategory = (AccountCategory) accountCategoryRepository.findById(accountcategoryid).orElse(null);
        redirectAttributes.addFlashAttribute("success",
                "You Have Deleted " +accountCategory.getAccountcategoryname() +  " From The Account Category Successfully");
        accountCategoryRepository.deleteById(accountcategoryid);
        return modelAndView;
    }

    @RequestMapping(value = "account_category/edit/{accountcategoryid}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable("accountcategoryid") Long accountcategoryid){
        ModelAndView modelAndView = new ModelAndView("account_category/edit");
        modelAndView.addObject("category", accountCategoryRepository.findById(accountcategoryid).orElse(null));

        modelAndView.addObject("account_category", accountCategoryRepository.findAll
                (Sort.by(Sort.Direction.ASC, "accountcategoryname")));

        return modelAndView;
    }


    @RequestMapping(value = "/account_category/update", method = RequestMethod.POST)
    public ModelAndView update(
            @RequestParam("accountcategoryid") Long accountcategoryid,
            @RequestParam("accountcategoryname") String accountcategoryname,
            @RequestParam("amount") Long amount,
            RedirectAttributes redirectAttributes
    ){

        AccountCategory accountCategory = (AccountCategory) accountCategoryRepository.findById(accountcategoryid).orElse(null);
        ModelAndView modelAndView = new ModelAndView("redirect:/administrator/account_category/");
        accountCategory.setAccountcategoryname(accountcategoryname);
        accountCategory.setAmount(amount);
        redirectAttributes.addFlashAttribute("success",
                "You Have Updated " + accountcategoryname +  " The Account Category Successfully");
        accountCategoryRepository.save(accountCategory);
        return modelAndView;


    }


}
