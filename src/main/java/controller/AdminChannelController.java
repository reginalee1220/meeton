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

    @RequestMapping("/adminChannel.do")
    public String adminChannel(String state, String pageNum,
                               Model model, HttpSession session, HttpServletRequest request){
        String userid = (String)session.getAttribute("userid");

        // 채널 이름, 프로필 가져오기
        User user = adChannel.getUser(userid);
        System.out.println("user: " + user);
        model.addAttribute("user", user);

        if(state.equals("dashboard")){ // dashboard Page
            // 최신 동영상 실적
            Video video = adChannel.getVideo(userid);
            System.out.println("video: " + video);
            model.addAttribute("video", video);

            // 채널분석
            Channel channel = adChannel.getChannel(userid);
            System.out.println("channel: " + channel);
            model.addAttribute("channel", channel);

            // 총 조회수
            int totalviews = adChannel.getViews(userid);
            System.out.println("totalviews: " + totalviews );
            model.addAttribute("totalviews",totalviews);

            // 인기 동영상
            Video topvideo = adChannel.getTopVideo(userid);
            System.out.println("topvideo: " + topvideo);
            model.addAttribute("topvideo", topvideo);

        }else if(state.equals("content")){ // content Page
            /* 한번에 출력할 데이터 수, 한번에 보일 nav number 수 */
            final int rowPerPage = 5;
            final int navNum = 5;

            /* 현재 어떤 페이지 인지 가져오고 없으면 1페이지 넣기 */
            if (pageNum == null || pageNum.equals("")) { pageNum = "1";}
            int currentPage = Integer.parseInt(pageNum);
            System.out.println("currentPage: "+ currentPage);
            // 총 동영상 갯수 구해오기
            int total = adChannel.getListCount(userid);
            if(total == 0){
                return "adminChannel"; // 업로드한 동영상 없으면 바로 리턴
            }

            /* currentPage 일때 보여야할 navNum 구하기 */
            int navBegin = currentPage - currentPage%navNum + 1;
            if(currentPage%navNum == 0){ // navNum의 배수일 때
                navBegin = currentPage - currentPage%navNum - 4;
            }
            int navEnd = navBegin + 4;
            if(total < (navEnd * rowPerPage) ){ // total 값이 navEnd 보다 많을 때
                navEnd = total/rowPerPage + 1;
            }

            System.out.println("navB: "+ navBegin + " navE: " + navEnd);
            model.addAttribute("navBegin", navBegin);
            model.addAttribute("navEnd", navEnd);
            model.addAttribute("pageNum", currentPage);

            /* 출력해야할 navNum 갯수 구하기*/
            int navNumCount;
            if(total%rowPerPage == 0){ // 총 데이터의 갯수가 rowPerPage의 배수 일 때
                navNumCount = total/rowPerPage;
                model.addAttribute("navNumCount",navNumCount);
            }else if(total%rowPerPage != 0){
                navNumCount = total/rowPerPage + 1;
                model.addAttribute("navNumCount",navNumCount);
            }

            /* 한 개의 navNum에서 출력하는 list의 index 시작값과 끝값 */
            int startPage = (currentPage - 1) * rowPerPage + 1;
            int endPage = startPage + rowPerPage - 1;
            model.addAttribute("startPage",startPage);
            model.addAttribute("endPage",endPage);

            // 동영상 리스트 가져오기
            List<Video> acvideoList = new ArrayList<Video>();
            acvideoList = adChannel.getVideoList(userid);
            System.out.println("acvideoList: " + acvideoList);
            model.addAttribute("acvideoList", acvideoList);


        }else if(state.equals("analysis")){ // analysis Page

        }else if(state.equals("subscribe")){

        }


        model.addAttribute("state",state);
        return "adminChannel";
    }
    @RequestMapping("/videoUploadgo.do")
    public String videoUploadgo(){
        System.out.println("videoUploadgo");
        return "videoUpload";
    }

    // 영상 업로드 하기
    @RequestMapping(headers = ("content-type=multipart/*"), value = "/videoUpload.do", method = RequestMethod.POST)
    public String upload(@RequestParam("videofile1") MultipartFile mf1,
                         @RequestParam("thumbnail1") MultipartFile mf2,
                         Video video,
                         HttpServletRequest request,
                         HttpSession session,
                         Model model) throws Exception{
        System.out.println("upload");
        String filename1 = mf1.getOriginalFilename();  // 첨부파일명 (사용자가 올린)
        String filename2 = mf2.getOriginalFilename();  // 첨부파일명 (사용자가 올린)
        int size1 = (int) mf1.getSize();               // 첨부파일 크기 (사용자가 올린) 단위: byte
        int size2 = (int) mf2.getSize();               // 첨부파일 크기 (사용자가 올린) 단위: byte

        String path = request.getRealPath("/videoUpload");  // videoUpload 절대경로 구하기

        System.out.println("mf=" + mf1);
        System.out.println("filename=" + filename1);
        System.out.println("size=" + size1);

        System.out.println("mf=" + mf2);
        System.out.println("filename=" + filename2);
        System.out.println("size=" + size2);

        System.out.println("Path=" + path);

        int result=0;

        String file1[] = new String[2];
        String file2[] = new String[2];

        /* video 파일 */
        StringTokenizer st = new StringTokenizer(filename1, ".");
        file1[0] = st.nextToken();      // 파일명
        file1[1] = st.nextToken();		// 확장자

        if(size1 > 1000000000){                   // 사이즈가 초과되면 업로드 되지 못하도록 막는다
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
        file2[0] = st2.nextToken();      // 파일명
        file2[1] = st2.nextToken();		// 확장자

        if(size2 > 10000000){                   // 사이즈가 초과되면 업로드 되지 못하도록 막는다
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

        /*===============================================================================*/
        String userid = (String)session.getAttribute("userid");
        Channel channel = adChannel.getChannel(userid);
        String title = request.getParameter("title").trim();
        String description = request.getParameter("description").trim();
        String visibility = request.getParameter("visibility").trim();

        video.setChannelnum(channel.getChannelnum());
        video.setUserid(userid);
        video.setTitle(title);
        video.setDescription(description);
        video.setVisibility(visibility);
        video.setVideofile(filename1);
        video.setThumbnail(filename2);

        adChannel.insertVideo(video);

        return "main";
    }
}
