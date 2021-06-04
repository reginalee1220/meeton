package controller;

import model.Channel;
import model.PagingDTO;
import model.User;
import model.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.ChannelService;

import javax.servlet.http.HttpServletRequest;
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
    @RequestMapping("videoPage.do")
    public String videoPage(Model model,
                            PagingDTO p,
                            int channelnum,
                            HttpSession session, HttpServletRequest request) {
        System.out.println("videoPage");
        int page = 1;     //page 초기값
        int limit = 20;    //한 화면에 몇개의 데이터를 넣을 것인가
        if (request.getParameter("page") != null) {  // 만약 페이지 값을 전달 받으면
            page = Integer.parseInt(request.getParameter("page"));
        }
        int start = ((page - 1) * limit + 1) - 1;
        int end = page * limit;

        p.setPage(page);
        p.setStart(start);
        p.setStart(end);
        p.setChannelnum(channelnum);
        System.out.println("channelnum: " + channelnum);
        p.setLimit(limit);

        int count = chService.getTotalVideo(channelnum);
        System.out.println("count: " + count);

        // PagingDTO를 DAO클래스에게 전달한다.
                List<Video>  list = chService.getVideoList(p);

        System.out.println("list: " + list);


        // 총 페이지 수.
        int maxpage = (int) ((double) count / limit + 0.95); // 0.95를 더해서 올림

        // 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
        int startpage =(int) ((page - 1) / limit) * limit + 1;
        // 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
        int endpage = startpage + limit - 1;

        if (endpage > count) {
            endpage = count;
        }
        System.out.println("startpage: " + startpage);
        System.out.println("endpage: " + endpage);

        model.addAttribute("page", page);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("maxpage", maxpage);
        model.addAttribute("count", count);
        model.addAttribute("videoList", list);
        model.addAttribute("channelNum",channelnum);

        return "videoPage";
    }

}
