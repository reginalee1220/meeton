package controller;

import model.Channel;
import model.Favorite;
import model.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.MainService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
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
//        //My 구독,즐겨찾기 채널
//        List<Favorite> favoriteList = new ArrayList<Favorite>();
//        /* HttpSession session = request.getSession(); */
//        String userid = (String)session.getAttribute("userid");
//
//        favoriteList = main.getFavoriteList();
//        // Video 목록
//        List<Video> videoList = new ArrayList<Video>();
//        videoList = main.getVideoList();
//        model.addAttribute("videoList",videoList);

//        //channel 목록
//        List<Channel> channelList = new ArrayList<Channel>();
//        channelList = main.getChannelList();
//        model.addAttribute("channelList",channelList);
        int count = main.getcount();

        return "main";
    }







    @RequestMapping("call")
    public String call(Model model){
        Date d = new Date();
        model.addAttribute("dt", d);

        return "result";
    }
}