package controller;

import model.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.SearchService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class SearchController {
    @Autowired
    private SearchService scService;

    @RequestMapping("/search.do")
    public String search(Video video, Model model, HttpServletRequest request){
        System.out.println("search");
        System.out.println(video.getKeyword());

        //************************ Page 화면 구성하기 ************************//
        int page = 1;                         // page 초기화
        int limit = 6;                        // 한 화면에 몇개의 데이터를 넣을 것인가
        if (request.getParameter("page") != null) {  // 만약 페이지 값을 전달 받으면
            page = Integer.parseInt(request.getParameter("page"));
        }
        System.out.println("page: "+ page);

        // 뽑아올 데이터 시작점과 개수 정해주기
        int start = ((page - 1) * limit + 1) - 1;
        int end = limit;
        video.setStart(start);            // 시작점
        video.setEnd(end);                // 가져올 데이터 개수
        System.out.println("start: "+ video.getStart());
        System.out.println("end: "+ video.getEnd());

        // videoDTO를 매개로 데어터 리스트 구해오기
        List<Video> searchList = scService.getSearchList(video);  // video에 담긴 값 : keyword, start, end
        System.out.println("searchList: " + searchList);


        //************************ Page nav 구성하기 ************************//
        // 한번에 보여질 page nav 갯수
        int nav = 5;

        // 해당 keyword에 해당하는 video 갯수 구하기
        int count = scService.getTotal(video);                    // video에 담긴 값 : keyword, start, end
        System.out.println("count: " + count);

        // 총 페이지 수.
        int maxpage = count/limit + ((count % limit == 0)? 0:1);
        System.out.println("maxpage: " + maxpage);

        // 현재 페이지에 보여줄 nav 시작 페이지 수(1, 6, 11 등...)
        int startpage = (int) ((page - 1) / nav) * nav + 1;
        // 현재 페이지에 보여줄 nav 마지막 페이지 수.(5, 10, 15 등...)
        int endpage = startpage + nav - 1;
        if (endpage > maxpage) { endpage = maxpage; }
        System.out.println("startpage: " + startpage);
        System.out.println("endpage: " + endpage);


        //************************ model로 값 넘겨주기 ************************//
        model.addAttribute("searchList", searchList);
        model.addAttribute("keyword", video.getKeyword());
        model.addAttribute("page", page);
        model.addAttribute("count", count);
        model.addAttribute("maxpage",maxpage);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("nav", nav);

        return "search";
    }
}
