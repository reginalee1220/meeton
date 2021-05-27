package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.MainService;

import java.util.Date;

@Controller
public class MainController {
    @Autowired
    private MainService main;

    @RequestMapping("/main.do")
    public String main(Model model){
        int count = main.getcount();

        model.addAttribute("count", count);
        return "main";
    }

    @RequestMapping("call")
    public String call(Model model){
        Date d = new Date();
        model.addAttribute("dt", d);

        return "result";
    }
}
