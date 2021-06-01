package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PurchasedController {
    @RequestMapping("/purchasedList.do")
    public String purchasedList(){

        return "purchasedList";
    }
}
