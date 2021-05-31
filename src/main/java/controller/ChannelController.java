package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChannelController {

    @RequestMapping("/channel.do")
    public String channel(){

        return "channel";

    }

    // videoPage : 비디오 게시글
    @RequestMapping("/videoPage.do")
    public String videoPage(){




        return "videoPage";
    }
    
    // video : 비디오
    @RequestMapping("video")
    public String video(){


        
        return "video";
    }

}
