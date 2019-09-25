package com.springapplication.springadmindashboard.controller;

import com.springapplication.springadmindashboard.Repository.UserRepo;
import com.springapplication.springadmindashboard.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("administrator")
public class UserController {

    @Autowired
    UserRepo userRepo;
    User user;

    @Autowired
    private PasswordEncoder passwordEncoder;


    @RequestMapping("/users/")
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView("users/index");
        modelAndView.addObject("users", userRepo.findAll(Sort.by(Sort.Direction.ASC, "name")));
        return modelAndView;
    }

    private boolean checkEmail(String username){
        User user = userRepo.findByUsername(username);
        if(user != null){
            return true;
        }else{
            return false;
        }

    }
    @RequestMapping(value = "/users/save", method = RequestMethod.POST)
    public  ModelAndView store(@RequestParam("fullname") String name,
                               @RequestParam("username") String username,
                               @RequestParam("password") String password,
                               @RequestParam("role") String role,
                               RedirectAttributes redirectAttributes)
    {
        User user  = new User();
        ModelAndView modelAndView = new ModelAndView("redirect:/administrator/users/");
        if(checkEmail(username)){

            redirectAttributes.addFlashAttribute("email",
                    username + " is in use by another user");
            return modelAndView;

        }else{
            user.setUsername(username);
            user.setName(name);
            user.setPassword(passwordEncoder.encode(password));
            user.setStatus(true);
            user.setRole(role);
            redirectAttributes.addFlashAttribute("success",
                    " You have added " + username + " Successfully");
            userRepo.save(user);
            return modelAndView;
        }


    }

    @RequestMapping(value = "users/edit/{user_id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable("user_id") Long user_id){
        ModelAndView modelAndView = new ModelAndView("users/edit");
        modelAndView.addObject("lists", userRepo.findById(user_id).orElse(null));
        modelAndView.addObject("users", userRepo.findAll(Sort.by(Sort.Direction.ASC, "name")));
        return modelAndView;
    }

    @RequestMapping(value = "users/delete/{user_id}", method = RequestMethod.GET)
    public ModelAndView destroy(@PathVariable("user_id") Long user_id, RedirectAttributes redirectAttributes){
        ModelAndView modelAndView = new ModelAndView("redirect:/administrator/users/");
        User user = (User) userRepo.findById(user_id).orElse(null);
        redirectAttributes.addFlashAttribute("success",
                  " You have deleted " + user.getUsername() + "Successfully");
        userRepo.deleteById(user_id);
        return modelAndView;

    }

    @RequestMapping(value = "/users/update", method = RequestMethod.POST)
    public  ModelAndView update(@RequestParam("user_id") Long user_id,
                                @RequestParam("fullname") String name,
                               @RequestParam("username") String username,
                               @RequestParam("password") String password,
                               @RequestParam("role") String role,
                                RedirectAttributes redirectAttributes)
    {

        User user = (User) userRepo.findById(user_id).orElse(null);

        ModelAndView modelAndView = new ModelAndView("redirect:/administrator/users/");
        user.setUsername(username);
        user.setName(name);

        if(password == null){
            String prev = user.getPassword();
            user.setPassword(passwordEncoder.encode(prev));
        }else {
            user.setPassword(passwordEncoder.encode(password));
        }

        user.setStatus(true);
        user.setRole(role);
        redirectAttributes.addFlashAttribute("success",
                " You have updated " + user.getUsername() + " Successfully");
        userRepo.save(user);
        return modelAndView;

    }
}


