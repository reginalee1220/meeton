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
