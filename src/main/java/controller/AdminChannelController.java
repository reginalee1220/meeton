package controller;

import model.Channel;
import model.User;
import model.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import service.AdminChannelService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

@Controller
public class AdminChannelController {
    @Autowired
    private AdminChannelService adChannel;

    // adminChannel : state 에 따라 불러오는 값이 다름 (state 종류 : dashboard, content, analysis)
    @RequestMapping("/adminChannel.do")
    public String adminChannel(String state, Video video,
                               Model model, HttpSession session, HttpServletRequest request){
        String userid = (String)session.getAttribute("userid");   //  로그인 된(요청한) userid
        System.out.println(userid);

        // 채널 이름, 프로필 가져오기
        User user = adChannel.getUser(userid);
        System.out.println("user: " + user);
        model.addAttribute("user", user);

        if(state.equals("dashboard")){ // dashboard Page
            System.out.println("dashboard");

            // 최신 동영상 실적
            Video latestVideo = adChannel.getLatestVideo(userid);
            System.out.println("latestVideo: " + latestVideo);

            // 채널 분석
            Channel channel = adChannel.getChannel(userid);
            System.out.println("channel: " + channel);

            // 총 조회수
            int totalViews = adChannel.getViews(userid);
            System.out.println("totalViews: " + totalViews );

            // 인기 동영상
            Video topVideo = adChannel.getTopVideo(userid);
            System.out.println("topvideo: " + topVideo);


            model.addAttribute("video", latestVideo);
            model.addAttribute("channel", channel);
            model.addAttribute("totalviews", totalViews);
            model.addAttribute("topvideo", topVideo);

        }else if(state.equals("content")){ // content Page
            System.out.println("content");

            //************************ Page 화면 구성하기 ************************//
            int page = 1;                         // page 초기화
            int limit = 5;                       // 한 화면에 몇개의 데이터를 넣을 것인가
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
            video.setUserid(userid);                              // VideoDTO에 userid 설정
            List<Video>  list = adChannel.getVideoList(video);    // video에 담긴 값 : userid, start, end
            System.out.println("list: " + list);

            //************************ Page nav 구성하기 ************************//
            // 한번에 보여질 page nav 갯수
            int nav = 5;

            // 총 데이터 갯수 구하기
            int count = adChannel.getListCount(video);
            System.out.println("count: " + count);

            // 총 nav 페이지 수.
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
            model.addAttribute("videoList", list);
            model.addAttribute("page", page);
            model.addAttribute("count", count);
            model.addAttribute("maxpage", maxpage);
            model.addAttribute("startpage", startpage);
            model.addAttribute("endpage", endpage);
            model.addAttribute("nav", nav);

        }else if(state.equals("analysis")){ // analysis Page
            System.out.println("analysis");

            // 채널분석
            Channel channel = adChannel.getChannel(userid);
            System.out.println("channel: " + channel);

            // 총 조회수
            int totalviews = adChannel.getViews(userid);
            System.out.println("totalviews: " + totalviews );

            model.addAttribute("channel", channel);
            model.addAttribute("totalviews",totalviews);
        }

        model.addAttribute("state",state);
        return "adminChannel";
    }

    // videoUploadgo : videoUpload 페이지로 이동
    @RequestMapping("/videoUploadgo.do")
    public String videoUploadgo(){
        System.out.println("videoUploadgo");
        return "videoUpload";
    }

    // videoUpload : 영상 업로드 하기
    @RequestMapping(headers = ("content-type=multipart/*"), value = "/videoUpload.do", method = RequestMethod.POST)
    public String upload(@RequestParam("videofile1") MultipartFile mf1,
                         @RequestParam("thumbnail1") MultipartFile mf2,
                         Video video,
                         HttpServletRequest request,
                         HttpSession session,
                         Model model) throws Exception{
        System.out.println("upload");
        String uploadid = (String)session.getAttribute("userid");
        System.out.println("uploadid: " + uploadid);

        //************************ 첨부파일 받아서 서버에 실제로 업로드 ************************//
        String filename1 = mf1.getOriginalFilename();  // 첨부파일명 (사용자가 올린) videofile1
        String filename2 = mf2.getOriginalFilename();  // 첨부파일명 (사용자가 올린) thumbnail1
        int size1 = (int) mf1.getSize();               // 첨부파일 크기 (사용자가 올린) 단위: byte
        int size2 = (int) mf2.getSize();               // 첨부파일 크기 (사용자가 올린) 단위: byte

        String path = request.getRealPath("/videoUpload");  // videoUpload 절대경로 구하기

        // videofile1
        System.out.println("mf=" + mf1);
        System.out.println("filename=" + filename1);
        System.out.println("size=" + size1);
        // thumbnail1
        System.out.println("mf=" + mf2);
        System.out.println("filename=" + filename2);
        System.out.println("size=" + size2);
        // 업로드 될 절대경로
        System.out.println("Path=" + path);

        int result=0;

        String file1[] = new String[2];
        String file2[] = new String[2];

        /* video 파일 */
        StringTokenizer st = new StringTokenizer(filename1, ".");
        file1[0] = st.nextToken();            // 파일명
        file1[1] = st.nextToken();		      // 확장자

        if(size1 > 104857600){                // 100MB 사이즈가 초과되면 업로드 되지 못하도록 막는다
            result=1;
            model.addAttribute("result", result);
            return "videoUploadResult";
        }else if(!file1[1].equals("mp4") &&   // 동영상 확장자가 아니면 업로드 되지 못하도록 막는다
                !file1[1].equals("webm") &&
                !file1[1].equals("ogg") ){
            result=2;
            model.addAttribute("result", result);
            return "videoUploadResult";
        }
        if (size1 > 0) {    // 첨부파일이 있으면
            mf1.transferTo(new File(path + "/" + filename1));  // 첨부파일을 업로드 해라
            // 절대경로값
        }

        /* thumbnail 파일 */
        StringTokenizer st2 = new StringTokenizer(filename2, ".");
        file2[0] = st2.nextToken();           // 파일명
        file2[1] = st2.nextToken();		      // 확장자

        if(size2 > 1048576){                  // 1MB 사이즈가 초과되면 업로드 되지 못하도록 막는다
            result=1;
            model.addAttribute("result", result);
            return "videoUploadResult";
        }else if(!file2[1].equals("jpg") &&   // 동영상 확장자가 아니면 업로드 되지 못하도록 막는다
                !file2[1].equals("gif") &&
                !file2[1].equals("png") ){
            result=2;
            model.addAttribute("result", result);
            return "videoUploadResult";
        }
        if (size2 > 0) {    // 첨부파일이 있으면
            mf2.transferTo(new File(path + "/" + filename2));  // 첨부파일을 업로드 해라
            // 절대경로값
        }
        System.out.println("실제 업로드 완료");

        //************************ DB에 반영 (videofile,thumbnail 파일명 DB반영) ************************//
        String userid = (String)session.getAttribute("userid");             // 로그인 된 (업로드 하는) userid

        // 채널 정보
        Channel channel = adChannel.getChannel(userid);

        String title = request.getParameter("title").trim();                // 업로드하는 영상 제목
        String description = request.getParameter("description").trim();    // 업로드하는 영상 설명
        String visibility = request.getParameter("visibility").trim();      // 업로드하는 영상 공개여부

        // video DTO에 넘어온 값 설정
        video.setChannelnum(channel.getChannelnum());
        video.setUserid(userid);
        video.setTitle(title);
        video.setDescription(description);
        video.setVisibility(visibility);
        video.setVideofile(filename1);
        video.setThumbnail(filename2);

        // video DTO를 매개로 video DB에 업로드 정보 반영
        adChannel.insertVideo(video);

        System.out.println("DB 반영 완료");

        return "redirect:adminChannel.do?state=content";
    }
}
