package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPickController {
    @RequestMapping("/history.do")
    public String history() {
        return "history";
    }
}
