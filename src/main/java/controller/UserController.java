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
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    // ID중복검사 ajax 함수로 처리 부분
    @RequestMapping(value = "/user_idcheck.do", method = RequestMethod.POST)
    public String user_idcheck(@RequestParam("userid") String userid, Model model) throws Exception{

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

        return "redirect:login";
    }

    @RequestMapping("/withdrawal.do")
    public String withdrawal(){

        return "withdrawal";
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
        } else {
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
    public String pwd_find_ok(@ModelAttribute User user, HttpServletResponse response, Model model)
        throws Exception{
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        User upwd = userService.findpwd(user);

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








}
