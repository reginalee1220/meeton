package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPickController {
    @RequestMapping("/mypick.do")
    public String test(){
        return "likedvideo";
    }
}
