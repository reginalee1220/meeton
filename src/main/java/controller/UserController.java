package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

    @RequestMapping("/login.do")
    public String login() {


        return "login";
    }

    @RequestMapping("/signUp.do")
    public String signUp(){
        return "signUp";


    }

    @RequestMapping("/withdrawal.do")
    public String withdrawal(){

        return "withdrawal";
    }


}
