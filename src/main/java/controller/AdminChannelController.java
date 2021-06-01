package controller;

import model.Channel;
import model.User;
import model.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.AdminChannelService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class AdminChannelController {
    @Autowired
    private AdminChannelService adChannel;

    @RequestMapping("/adminChannel.do")
    public String adminChannel(String state, Model model, HttpSession session, HttpServletRequest request){
        String userid = (String)session.getAttribute("userid");
        String page = state;

        // 채널 이름, 프로필 가져오기
        User user = adChannel.getUser(userid);
        System.out.println("user" + user);
        model.addAttribute("user", user);

        if(page.equals("dashboard")){
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

            // 인기 동영상
            Video topvideo = adChannel.getTopVideo(userid);
            System.out.println("topvideo: " + topvideo);
            model.addAttribute("topvideo", topvideo);

        }else if(page.equals("content")){
            // 동영상 리스트 가져오기
            List<Video> videoList = new ArrayList<Video>();
            videoList = adChannel.getVideoList(userid);
            System.out.println("videoList: " + videoList);
            model.addAttribute("videoList", videoList);


        }else if(page.equals("analysis")){

        }else if(page.equals("subscribe")){

        }


        model.addAttribute("page",page);
        return "adminChannel";
    }

}
