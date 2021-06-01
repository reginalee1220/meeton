package controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import model.User;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import scala.util.parsing.combinator.testing.Str;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.PrintWriter;
import java.util.StringTokenizer;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    // ID중복검사 ajax 함수로 처리 부분
    @RequestMapping(value = "/user_idCheck.do", method = RequestMethod.POST)
    public String user_idCheck(@RequestParam("userid") String userid, Model model) throws Exception{

        int result = userService.checkUserId(userid);
        model.addAttribute("result", result);

        return "user/idCheckResult";
    }

    // 회원가입 view
    @RequestMapping("/signUp.do")
    public String signUp(){

        return "signUp";
    }

    // 회원가입 저장
    @RequestMapping(value = "/user_signup_ok.do", method = RequestMethod.POST)
    public String user_signup_ok(User user, HttpServletRequest request,
                                 Model model) throws Exception{

        String userid = request.getParameter("userid").trim();
        String passwd = request.getParameter("passwd").trim();
        String name = request.getParameter("name").trim();
        String phone = request.getParameter("phone").trim();
        String email = request.getParameter("email").trim();
        String domain = request.getParameter("domain").trim();
        String zip = request.getParameter("zip").trim();
        String address1 = request.getParameter("address1").trim();
        String address2 = request.getParameter("address2").trim();
        String year = request.getParameter("year").trim();
        String month = request.getParameter("month").trim();
        String day = request.getParameter("day").trim();


        userService.insertMember(user);

        return "redirect:login.do";
    }
    
    // 로그인 view
    @RequestMapping("/login.do")
    public String login() {


        return "login";
    }

    // 로그인 인증
    @RequestMapping(value = "/user_login_ok.do", method = RequestMethod.POST)
    public String user_login_ok(@RequestParam("userid") String userid,
                                @RequestParam("passwd") String passwd,
                                HttpSession session,
                                Model model) throws Exception {
        int result = 0;
        User user = userService.userCheck(userid);

        if (user == null) { // 등록되지 않은 회원일때

            result = 1;
            model.addAttribute("result", result);

            return "user/loginResult";
        } else {    // 등록된 회원일때
            if (user.getPasswd().equals(passwd)) {  // 비번이 같을때
                session.setAttribute("userid", userid);

                String name = user.getName();

                model.addAttribute("name", name);

                return "main";
            } else {    // 비번이 다를때
                result = 2;
                model.addAttribute("result", result);

                return "user/loginResult";
            }
        }
    }

    // 비밀번호 찾기 view
    @RequestMapping(value = "/pwd_find.do")
    public String pwd_find(){

        return "user/pwd_find";
    }

    // 비밀번호 찾기
    @RequestMapping(value = "/pwd_find_ok.do", method = RequestMethod.POST)
    public String pwd_find_ok(@ModelAttribute User use, HttpServletResponse response, Model model)
        throws Exception{
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        User user = userService.findpwd(use);

        if (user == null) { // 값이 없는 경우
            return "user/pwdResult";

        } else {

            // Mail Server 설정
            String charSet = "utf-8";
            String hostSMTP = "smtp.naver.com";
            String hostSMTPid = "iohyeon@naver.com";
            String hostSMTPpwd = "ekfnshdj@573"; // 비밀번호 입력해야함

            // 보내는 사람 EMail, 제목, 내용
            String fromEmail = "iohyeon@naver.com";
            String fromName = "관리자";
            String subject = "비밀번호 찾기";

            // 받는 사람 E-Mail 주소
            String mail = user.getEmail();
            String domain = user.getDomain();

            String result = mail + "@" + domain;

            try {
                HtmlEmail email = new HtmlEmail();
                email.setDebug(true);
                email.setCharset(charSet);
                email.setSSL(true);
                email.setHostName(hostSMTP);
                email.setSmtpPort(587);

                email.setAuthentication(hostSMTPid, hostSMTPpwd);
                email.setTLS(true);
                email.addTo(result, charSet);
                email.setFrom(fromEmail, fromName, charSet);
                email.setSubject(subject);
                email.setHtmlMsg("<p align = 'center'>비밀번호 찾기</p><br>" + "<div align='center'> 비밀번호 : "
                        + user.getPasswd() + "</div>");
                email.send();
            } catch (Exception e) {
                System.out.println(e);
            }


            model.addAttribute("pwdok", "등록된 email을 확인 하세요");

            return "user/pwd_find";
        }
    }

    // 닉네임 중복 검사 ajax 함수로 처리 부분
    @RequestMapping(value = "/user_akaCheck.do", method = RequestMethod.POST)
    public String user_akaCheck(@RequestParam("userid") String userid, Model model) throws Exception{

        int result = userService.checkUserId(userid);
        model.addAttribute("result", result);

        return "user/akaCheckResult";
    }

    // 회원정보 수정 view
    @RequestMapping("/memberInfoCheck.do")
    public String memberInfoCheck(HttpSession session, Model model) throws Exception{

        String userid = (String) session.getAttribute("userid");

        User editm = userService.userCheck(userid);

//        StringTokenizer st02 = new StringTokenizer(join_phone, "-");
//        // java.util 패키지의 StringTokenizer 클래스는 첫번째 전달인자를
//        // 두번째 -를 기준으로 문자열을 파싱해준다.
//        String join_phone1 = st02.nextToken();// 첫번째 전화번호 저장
//        String join_phone2 = st02.nextToken(); // 두번째 전번 저장
//        String join_phone3 = st02.nextToken();// 세번째 전번 저장

        String email = editm.getEmail();
        StringTokenizer st03 = new StringTokenizer(email, "@");
        String domain = st03.nextToken();

        model.addAttribute("editm", editm);
        model.addAttribute("email",email);
        model.addAttribute("domain", domain);

        return "memberInfoCheck";
    }

    // 회원정보 수정 (fileupload)
    @RequestMapping(value = "/memberInfoCheck_ok.do", method = RequestMethod.POST)
    public String memberInfoCheck_ok(@RequestParam("userUp_profile") MultipartFile userUp_profile,
                                     User user,
                                     HttpServletRequest request,
                                     HttpSession session,
                                     Model model) throws Exception{
        String filename = userUp_profile.getOriginalFilename();
        int size = (int) userUp_profile.getSize();

        String path = request.getRealPath("upload");

        int result = 0;
        String file[] = new String[2];
        //		file = filename.split(".");
//		System.out.println(file.length);
//		System.out.println("file0="+file[0]);
//		System.out.println("file1="+file[1]);

        if (filename != ""){    // 첨부파일이 전송된 경우
            
            StringTokenizer st = new StringTokenizer(filename, ".");
            file[0] = st.nextToken();
            file[1] = st.nextToken();   // 확장자

            if (size > 100000){
                result = 1;
                model.addAttribute("result", result);

                return "user/uploadResult";
            } else if (!file[1].equals("jpg") &&
                        !file[1].equals("gif") &&
                        !file[1].equals("png") ){

                result = 2;
                model.addAttribute("result", result);

                return "user/uploadResult";
            }
            
        }
        
        if (size > 0){      // 첨부파일이 전송된 경우
            userUp_profile.transferTo(new File(path + "/" + filename));
        }

        String userid = (String) session.getAttribute("userid");

        String aka = request.getParameter("aka").trim();
        String phone = request.getParameter("phone").trim();
        String email = request.getParameter("email").trim();
        String domain = request.getParameter("domain").trim();

        User editm = this.userService.userCheck(userid);
        
        if (size > 0){      // 첨부파일이 수정되면
            user.setProfile(filename);
        } else {            // 첨부파일이 수정되지 않으면
            user.setProfile(editm.getProfile());
        }

        user.setUserid(userid);
        user.setAka(aka);
        user.setPhone(phone);
        user.setEmail(email);
        user.setDomain(domain);

        userService.updateMember(user);     // 수정 메소드 호출

        model.addAttribute("name", user.getName());
        model.addAttribute("profile", user.getProfile());

        return "main";

    }

    // 회원탈퇴 view
    @RequestMapping("/withdrawal.do")
    public String withdrawal(HttpSession session, Model dm) throws Exception{
        String userid = (String) session.getAttribute("userid");
        User delUser = userService.userCheck(userid);
        dm.addAttribute("userid", userid);
        dm.addAttribute("name", delUser.getName());

        return "withdrawal";
    }
    
    // 회원탈퇴 완료
    @RequestMapping(value = "/user_del_ok", method = RequestMethod.POST)
    public String user_del_ok(@RequestParam("passwd") String passwd,
                              HttpSession session) throws Exception{

        String userid = (String) session.getAttribute("userid");
        User user = this.userService.userCheck(userid);

        if (!user.getPasswd().equals(passwd)){

            return "user/deleteResult";
        } else {        // 비번이 같을 경우
            String up = session.getServletContext().getRealPath("upload");
            String fname = user.getProfile();
            System.out.println("up : " + up );
            
            // 디비에 저장된 기존 이진파일명을 가져옴
            if (fname != null){     // 기존 이진파일이 존재하면
                File delFile = new File(up + "/" + fname);
                delFile.delete();   // 기존 이진파일을 삭제
            }
            User delm = new User();
            delm.setUserid(userid);

            userService.deleteMember(delm);     // 삭제 메서드 호출 
            
            session.invalidate();       // 세션만료

            return "redirect:login.do";
            
        }
    }

    // 로그아웃
    @RequestMapping("logout.do")
    public String logout(HttpSession session){
        session.invalidate();

        return "logout";
    }




}
