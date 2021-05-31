package controller;

import model.Channel;
import model.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.AdminChannelService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
public class AdminChannelController {
    @Autowired
    private AdminChannelService adChannel;

    @RequestMapping("/adminChannel.do")
    public String adminChannel(Model model, HttpSession session, HttpServletRequest request){
        String userid = (String)session.getAttribute("userid");

        // 최신 동영상 실적
        Video video = adChannel.getVideo(userid);
        System.out.println("video: " + video);
        model.addAttribute("video", video);

        // 채널분석
        Channel channel = adChannel.getChannel(userid);
        System.out.println("channel: " + channel);
        model.addAttribute("channel", channel);

        // 총 조회수
        int totalviews = adChannel.getViews(userid);
        System.out.println("totalviews: " + totalviews );
        model.addAttribute("totalviews",totalviews);

        return "adminChannel";
    }

}
