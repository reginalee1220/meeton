package controller;

import model.Favorite;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import scala.collection.mutable.ArrayLike;
import service.MyPickService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MyPickController {

    @Autowired
    private MyPickService myPickService;

    // 최근에 본 영상
    @RequestMapping("/history.do")
    public String history(Model model,
                          HttpServletRequest request,
                          HttpSession session) {

        // 최근에 본 영상
        String userid = (String) session.getAttribute("userid");
        myPickService.getVideoList(userid);




        return "history";

    }

    @RequestMapping("/watrchlater.do")
    public String wartchlater() {

        return "watrchlater";
    }

    // 채널 즐겨찾기
    @RequestMapping("/bookmark.do")
    public String bookmark(Model model,
                           HttpServletRequest request,
                           HttpSession session) {
        // MY 즐겨찾기 채널
        List<Favorite> favoriteList = new ArrayList<>();
            String userid = (String) session.getAttribute("userid");
            System.out.println("userid : " + userid);

            favoriteList = myPickService.getFavoriteList(userid);
            System.out.println("favoriteList: " + favoriteList);
            model.addAttribute("favoriteList", favoriteList);


        return "bookmark";

    }

    @RequestMapping("/likedvideo.do")
    public String test() {

        return "likedvideo";

    }


}
