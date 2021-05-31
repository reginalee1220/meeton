package controller;

import model.Channel;
import model.MainDTO;
import model.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.MainService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    private MainService main;

    /* Main 목록 */
    @RequestMapping("/main.do")
    public String main(Model model, HttpServletRequest request, HttpSession session) {
        /* HttpSession session = request.getSession(); */

        // My 구독,즐겨찾기 채널
        List<MainDTO> favoriteList = new ArrayList<MainDTO>();
        String userid = (String)session.getAttribute("userid");
        System.out.println("userid : " + userid);

        favoriteList = main.getFavoriteList(userid);
        System.out.println("favoriteList: " + favoriteList);
        model.addAttribute("favoriteList", favoriteList);


        // Video 목록
        List<Video> videoList = new ArrayList<Video>();
        videoList = main.getVideoList();
        System.out.println("videoList: " + videoList);
        model.addAttribute("videoList", videoList);

        // channel 목록
        List<Channel> channelList = new ArrayList<Channel>();
        channelList = main.getChannelList();
        System.out.println("channelList: " + channelList);
        model.addAttribute("channelList", channelList);

        return "main";
    }







    @RequestMapping("call")
    public String call(Model model){
        Date d = new Date();
        model.addAttribute("dt", d);

        return "result";
    }
}
