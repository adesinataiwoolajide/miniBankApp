package com.springapplication.springadmindashboard.controller;

import com.springapplication.springadmindashboard.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.security.Principal;

@Controller
@RequestMapping("administrator")
public class DashboardController {

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public ModelAndView loadAdmin(RedirectAttributes redirectAttributes)
    {
        User user = new User();
        ModelAndView modelAndView = new ModelAndView("dashboard");
        modelAndView.addObject("user", user.getUsername());
        redirectAttributes.addFlashAttribute("success",
                 user.getUsername() + " Welcome To Admin Dashboard");
        return modelAndView;
    }

    private void addUserInSession(User user, HttpSession session){

        session.setAttribute("user", user);
        session.setAttribute("userid", user.getUser_id());
        session.setAttribute("role", user.getRole());
        session.setAttribute("username", user.getUsername());
        session.setAttribute("name", user.getName());
    }
}
