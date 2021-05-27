package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPickController {
    @RequestMapping("/bookmark.do")
    public String bookmark(){
        return "bookmark";
    }
}
