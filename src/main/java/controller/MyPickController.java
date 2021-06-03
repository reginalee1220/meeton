package controller;

import model.Favorite;
import model.HistoryDTO;
import model.MyPlayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.MyPickService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MyPickController {

    @Autowired
    private MyPickService myPickService;

    // 채널 즐겨찾기
    @RequestMapping("/bookmark.do")
    public String bookmark(Model model,
                           HttpServletRequest request,
                           HttpSession session) {
        // MY 즐겨찾기 채널
        List<Favorite> bookmark_favoriteList = new ArrayList<>();
            String userid = (String) session.getAttribute("userid");
            System.out.println("userid : " + userid);

        bookmark_favoriteList = myPickService.getBookmark_favoriteList(userid);
            System.out.println("bookmark_favoriteList: " + bookmark_favoriteList);
            model.addAttribute("bookmark_favoriteList", bookmark_favoriteList);


        return "bookmark";

    }

    // 최근에 본 영상
    @RequestMapping("/history.do")
    public String history(Model model,
                          HttpServletRequest request,
                          HttpSession session) {

        // 최근에 본 영상
        List<HistoryDTO> my_historyList = new ArrayList<>();
        String userid = (String) session.getAttribute("userid");
        System.out.println("userid : " + userid );

        my_historyList = myPickService.getMy_historyList(userid);
        System.out.println("my_historyList : " + my_historyList);
        model.addAttribute("my_historyList", my_historyList);


        return "history";

    }

    // 나중에 볼 영상
    @RequestMapping("/watchlater.do")
    public String watchlater(Model model,
                              HttpServletRequest request,
                              HttpSession session) {

        // 나중에 볼 영상
        List<HistoryDTO> my_watchLaterList = new ArrayList<>();
        String userid = (String) session.getAttribute("userid");
        System.out.println("userid : " + userid );

        my_watchLaterList = myPickService.getMy_watchLaterList(userid);
        System.out.println("my_watchLaterList:" + my_watchLaterList);
        model.addAttribute("my_watchLaterList", my_watchLaterList);


        return "watchlater";

    }

    // 좋아요 한 영상
    @RequestMapping("/likedvideo.do")
    public String likedvideo(Model model,
                             HttpServletRequest request,
                             HttpSession session) {
        // 좋아요 한 영상
        List<HistoryDTO> my_likedVideoList = new ArrayList<>();
        String userid = (String) session.getAttribute("userid");
        System.out.println("userid : " + userid);

        my_likedVideoList = myPickService.getMy_likedVideoList(userid);
        System.out.println("my_likedVideo:" + my_likedVideoList);
        model.addAttribute("my_likedVideoList", my_likedVideoList);


        return "likedvideo";

    }


}
