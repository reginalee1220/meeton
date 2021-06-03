package controller;

import model.Channel;
import model.User;
import model.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.ChannelService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ChannelController {
    @Autowired
    private ChannelService chService;

    @RequestMapping("/channel.do")
    public String channel(String userid,HttpSession session, Model model){
                // 채널정보가져오기
                Channel channel = chService.getChannel(userid);
                System.out.println("channel: " + channel);

                // 해당 채널 유저정보 가져오기
                User user = chService.getUser(userid);
                System.out.println("user: " + user);

                // 해당 채널 최신 동영상 3개 가져오기
                List<Video> video = chService.getVideo(userid);
                System.out.println("video: " + video);

                model.addAttribute("channel",channel);
                model.addAttribute("user", user);
                model.addAttribute("video", video);
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
