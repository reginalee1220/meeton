package controller;

import model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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

    // videoPage : 비디오 리스트
    @RequestMapping("videoPage.do")
    public String videoPage(Video video, Model model, HttpSession session, HttpServletRequest request) {
        System.out.println("videoPage");
        System.out.println("channelnum: " + video.getChannelnum()); // 데이터 뽑아올 채널 num 출력

        //************************ Page 화면 구성하기 ************************//
        int page = 1;                         // page 초기화
        int limit = 20;                       // 한 화면에 몇개의 데이터를 넣을 것인가
        if (request.getParameter("page") != null) {  // 만약 페이지 값을 전달 받으면
            page = Integer.parseInt(request.getParameter("page"));
        }

        // 뽑아올 데이터 시작점과 개수 정해주기
        int start = ((page - 1) * limit + 1) - 1;
        int end = limit;
        video.setStart(start);            // 시작점
        video.setEnd(end);                // 가져올 데이터 개수
        System.out.println("start: "+ video.getStart());
        System.out.println("end: "+ video.getEnd());

        // video를 매개로 데어터 리스트 구해오기
        List<Video>  list = chService.getVideoList(video); // video에 담긴 값 : channelnum, start, end
        System.out.println("list: " + list);


        //************************ Page nav 구성하기 ************************//
        // 총 데이터 갯수 구하기
        int count = chService.getTotalVideo(video.getChannelnum());
        System.out.println("count: " + count);

        // 총 nav 페이지 수.
        int maxpage = count/limit + ((count % limit == 0)? 0:1);

        // 현재 페이지에 보여줄 nav 시작 페이지 수(1, 6, 11 등...)
        int startpage = (int) ((page - 1) / 5) * 5 + 1;
        // 현재 페이지에 보여줄 nav 마지막 페이지 수.(5, 10, 15 등...)
        int endpage = startpage + 5 - 1;
        if (endpage > count) { endpage = count;}
        System.out.println("startpage: " + startpage);
        System.out.println("endpage: " + endpage);


        //************************ model로 값 넘겨주기 ************************//
        model.addAttribute("page", page);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("maxpage", maxpage);
        model.addAttribute("count", count);
        model.addAttribute("videoList", list);
        model.addAttribute("channelNum",video.getChannelnum());

        return "videoPage";
    }

    // video : 해당 비디오 게시글
    @RequestMapping("video.do")
    public String video(Model model, int videonum, HttpSession session, HttpServletRequest request) {
        System.out.println("video");
        System.out.println(videonum);

        Video thisVideo = chService.getThisVideo(videonum);

        model.addAttribute("video",thisVideo);

        return "video";
    }

    @RequestMapping("cmList.do")
    public String cmList(Model model, int videonum, HttpSession session, HttpServletRequest request) {
        System.out.println("cmList");
        System.out.println(videonum);

        Video video = chService.getThisVideo(videonum);
        //댓글리스트 불러오기
        List<Comment> cmList = chService.getcmList(videonum);

        System.out.println("cmList: "+ cmList);

        model.addAttribute("video",video);
        model.addAttribute("cmList",cmList);

        return "cmList";
    }

    @RequestMapping("cmInsert.do")
    public String cmInsert(Model model, Comment comment, int videonum) {
        System.out.println("cmInsert");

        //댓글 삽입하기
        chService.cmInsert(comment);
        //video의 comments 수 올리기
        chService.cmIncrease(videonum);

        return "redirect:cmList.do";
    }

//    @RequestMapping("cmCount.do")
//    public String cmCount(Model model, int videonum) {
//        System.out.println("cmCount");
//
//        //video의 댓글 개수 구하기
//        int comments = chService.getcmcount(videonum);
//        System.out.println(comments);
//        model.addAttribute("comments",comments);
//
//        return "cmCount";
//    }
    @RequestMapping("cmUpdate.do")
    public String cmUpdate(Comment comment, Model model) {
        System.out.println("cmUpdate");
        chService.cmUpdate(comment);
        String mav = "redirect:cmList.do?videonum="+comment.getVideonum();
        System.out.println(mav);
        return mav;
    }

    @RequestMapping("cmDelete.do")
    public String cmDelete(Comment comment, Model model) {
        chService.cmDelete(comment);
        String mav = "redirect:cmList.do?videonum="+comment.getVideonum();
        System.out.println(mav);
        return mav;
    }


}
