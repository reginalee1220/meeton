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
    @RequestMapping("videoPage")
    public String videoPage(){




        return "videoPage";   //redirect:videoPage는 주소가 바뀐다.
    }
    
    // video : 비디오
    @RequestMapping("video")
    public String video(){


        
        return "video";
    }



}
