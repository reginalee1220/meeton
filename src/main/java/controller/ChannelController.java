package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChannelController {
    @RequestMapping("/video.do")
    public String video(){
        return "video";
    }
}
