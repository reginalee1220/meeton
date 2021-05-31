package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPickController {

    @RequestMapping("/watrchlater.do")
    public String wartchlater() {

        return "watrchlater";
    }

    @RequestMapping("/bookmark.do")
    public String bookmark() {

        return "bookmark";

    }

    @RequestMapping("/likedvideo.do")
    public String test(){

        return "likedvideo";

    }
}
