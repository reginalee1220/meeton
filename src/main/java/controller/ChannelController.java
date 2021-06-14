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

    // channel : 해당 채널로 이동
    @RequestMapping("/channel.do")
    public String channel(Channel channel, HttpSession session, Model model){
        System.out.println("channel");
        System.out.println("넘어온 userid: " + channel.getUserid());

        // 해당 채널 User 정보 가져오기
        User thisChannelUser = chService.getUser(channel.getUserid());
        System.out.println("thisChannelUser: " + thisChannelUser);

        // 해당 채널 정보 가져오기
        Channel thisChannel = chService.getChannel(channel.getUserid());
        System.out.println("thisChannel: " + thisChannel);

        // 해당 채널 최신 동영상 3개 가져오기
        List<Video> thisChannelVideo = chService.getVideo(channel.getUserid());
        System.out.println("video: " + thisChannelVideo);

        model.addAttribute("user", thisChannelUser);
        model.addAttribute("channel", thisChannel);
        model.addAttribute("video", thisChannelVideo);

        return "channel";
    }


    // videoPage : 해당 채널 영상 리스트
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
        // 한번에 보여질 page nav 갯수
        int nav = 5;

        // 총 데이터 갯수 구하기
        int count = chService.getTotalVideo(video.getChannelnum());
        System.out.println("count: " + count);

        // 총 nav 페이지 수.
        int maxpage = count/limit + ((count % limit == 0)? 0:1);

        // 현재 페이지에 보여줄 nav 시작 페이지 수(1, 6, 11 등...)
        int startpage = (int) ((page - 1) / nav) * nav + 1;
        // 현재 페이지에 보여줄 nav 마지막 페이지 수.(5, 10, 15 등...)
        int endpage = startpage + nav - 1;
        if (endpage > maxpage) { endpage = maxpage; }
        System.out.println("startpage: " + startpage);
        System.out.println("endpage: " + endpage);


        //************************ model로 값 넘겨주기 ************************//
        model.addAttribute("videoList", list);
        model.addAttribute("channelNum", video.getChannelnum());
        model.addAttribute("page", page);
        model.addAttribute("count", count);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);


        return "videoPage";
    }

    // video : 해당 영상 게시글로 이동
    @RequestMapping("video.do")
    public String video(int videonum, Model model, HttpServletRequest request) {
        System.out.println("video");
        System.out.println(videonum);

        // 해당 영상 조회수 올리기
        chService.updateViews(videonum);

        // 해당 영상 정보 불러오기
        Video thisVideo = chService.getThisVideo(videonum);
        System.out.println("thisVideo: " + thisVideo);

        model.addAttribute("video", thisVideo);

        return "video";
    }

    // cmList : 해당 영상 정보와 게시글의 댓글 불러오기
    @RequestMapping("cmList.do")
    public String cmList(Model model, int videonum) {
        System.out.println("cmList");
        System.out.println(videonum);

        // 해당 영상 정보 불러오기
        Video thisVideo = chService.getThisVideo(videonum);
        System.out.println("thisVideo: " + thisVideo);

        // 해당 영상의 댓글리스트 불러오기
        List<Comment> cmList = chService.getcmList(videonum);
        System.out.println("cmList: " + cmList);

        model.addAttribute("video", thisVideo);
        model.addAttribute("cmList", cmList);

        return "cmList";
    }

    // cmInsert : 댓글 삽입하기
    @RequestMapping("cmInsert.do")
    public String cmInsert(Comment comment, int videonum) {
        System.out.println("cmInsert");

        // 댓글 삽입하기
        chService.cmInsert(comment);

        // 해당 video의 comments 수 올리기
        chService.cmIncrease(videonum);

        return "redirect:cmList.do";
    }

    // cmUpdate : 댓글 수정하기
    @RequestMapping("cmUpdate.do")
    public String cmUpdate(Comment comment) {
        System.out.println("cmUpdate");

        // 댓글 수정하기
        chService.cmUpdate(comment);

        String mav = "redirect:cmList.do?videonum="+comment.getVideonum();
        System.out.println(mav);
        return mav;
    }

    // cmDelete : 댓글 삭제하기
    @RequestMapping("cmDelete.do")
    public String cmDelete(Comment comment) {
        System.out.println("cmDelete");

        // 댓글 삭제하기
        chService.cmDelete(comment);

        String mav = "redirect:cmList.do?videonum="+comment.getVideonum();
        System.out.println(mav);
        return mav;
    }

    // mybookmark : 즐겨찾기 추가 및 시청자 수 올리기
    @RequestMapping("mybookmark.do")
    public String mybookmark(String userid, Favorite favorite, Model model, HttpSession session){
        System.out.println("mybookmark");
        System.out.println(userid);   // 채널주인의 userid

        // 해당 채널 즐겨찾기 시청자 수 올리기
        chService.upBookmark(userid);

        // 해당 채널 즐겨찾기 추가한 user의 favorite 에 추가하기
        String loginUser = (String)session.getAttribute("userid");  // 즐겨찾기한 user의 userid
        Channel channel = chService.getChannel(userid);                   // 즐겨찾기하는 채널의 정보
        int channelnum = channel.getChannelnum();

        favorite.setUserid(loginUser);
        favorite.setChannelnum(channelnum);
        chService.insertBookmark(favorite);

        // 해당 채널 즐겨찾기 시청자 수 가져오기
        int bookmarkers = chService.getBookmarkers(userid);
        System.out.println("bookmarkers: " + bookmarkers);

        model.addAttribute("bookmarkers", bookmarkers);

        return "bookmarkers";
    }

    // mybookmarkers : 즐겨찾기 시청자 수 가져오기
    @RequestMapping("mybookmarkers.do")
    public String mybookmarkers(String userid, Model model){
        System.out.println("mybookmarkers");

        // 해당 채널 즐겨찾기 시청자 수 가져오기
        int bookmarkers = chService.getBookmarkers(userid);
        System.out.println("bookmarkers: " + bookmarkers);

        model.addAttribute("bookmarkers", bookmarkers);

        return "bookmarkers";
    }


}
