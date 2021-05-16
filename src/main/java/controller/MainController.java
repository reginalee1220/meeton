package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

@Controller
public class MainController {
    @RequestMapping("/test.do")
    public String test(){
        return "main";
    }

    @RequestMapping("call")
    public String call(Model model){
        Date d = new Date();
        model.addAttribute("dt", d);

        return "result";
    }
}
