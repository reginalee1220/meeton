package controller;

import model.Channel;
import model.Favorite;
import model.Purchased;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.PurchasedService;


import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

@Controller
public class PurchasedController {
    @Autowired
    private PurchasedService purchase;

    // purchase : 구독버튼 누르면 popup 창으로 이동
    @RequestMapping("/purchase.do")
    public String purchase(Channel channel, Model model){
        System.out.println("purchase");

        model.addAttribute("channel", channel);   // channel에 담겨진 값 : channelnum, aka

        return "purchasingPopUp";
    }

    // kakaoPay : 카카오페이 버튼 누르면 카카오페이 연결
    @RequestMapping("/kakaoPay.do")
    public String kakaoPay(Channel channel, Model model, HttpSession session) {
        System.out.println("kakaoPay");

        int channelnum = channel.getChannelnum();  // 구독하는 채널
        System.out.println("channelnum : " + channelnum);

        try{
            URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
            HttpURLConnection connect = (HttpURLConnection) address.openConnection();
            connect.setRequestMethod("POST");
            connect.setRequestProperty("Authorization","KakaoAK 47c732bc2e4371c8666855da3c56c538");
            connect.setRequestProperty("Content-type","application/x-www-form-urlencoded;charset=utf-8");
            connect.setDoOutput(true);

            String param = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=구독&quantity=1&total_amount=100&vat_amount=10&tax_free_amount=0&approval_url=http://localhost/success.do&fail_url=http://localhost/fail.do&cancel_url=http://localhost/cancel.do";
            OutputStream giver = connect.getOutputStream();
            DataOutputStream dataGiver = new DataOutputStream(giver);
            dataGiver.writeBytes(param);
            dataGiver.close();

            int resultCode = connect.getResponseCode();

            InputStream recipient;
            if(resultCode == 200){ // 연결성공
                System.out.println("connect success");
                recipient = connect.getInputStream();
            }else {                // 연결실패
                recipient = connect.getErrorStream();
            }

            InputStreamReader reader = new InputStreamReader(recipient);
            BufferedReader change = new BufferedReader(reader);

            String choose = change.readLine();

            String result[] = choose.split(",");
            String result1 = new String(result[4]);
            System.out.println("result1:" + result1);
            String result2[] = result1.split(":");
            String pageUrl = new String(result2[1]+":"+result2[2]);
            pageUrl = pageUrl.replace("\"","");

            System.out.println("pageUrl: " + pageUrl);

            // 구독결제한 채널 세션 설정
            session.setAttribute("channelnum", channelnum);
            model.addAttribute("pageUrl", pageUrl);

            return "pageUrl";

        }catch(MalformedURLException e){
            e.printStackTrace();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return "null";
    }

    // success : 결제 성공, purchaseed, favorite 추가
    @RequestMapping("/success.do")
    public String success(HttpSession session, Purchased purchased, Favorite favorite){
        System.out.println("success");

        String userid = (String) session.getAttribute("userid");     // 결제하는 id
        System.out.println("결제하는 id: " + userid);
        int channelnum = (int) session.getAttribute("channelnum");   // 구독하는 채널
        System.out.println("구독하는 채널: " + channelnum);

        purchased.setPayment(110);                               // 결제 금액
        purchased.setMethod("kakaopay");                         // 결제 방법
        purchased.setUserid(userid);                             // 결제한 userid

        // favorite DTO를 매개로 결제한 userid의 purchased에 추가
        purchase.updatePurchased(purchased);

        favorite.setUserid(userid);                                 // 결제한 userid
        favorite.setChannelnum(channelnum);                         // 구독한 채널
        favorite.setType("subscript");                              // Type: 구독
        favorite.setPurchasednum(purchase.getMyLatestNum(userid));  // 결제번호

        // favorite DTO를 매개로 결제한 userid의 favorite에 추가
        purchase.updateFavorite(favorite);

        // 구독한 채널의 subscribers 수 올려주기
        purchase.updateSubscribers(channelnum);

        return "success";
    }

    // done : 결제성공 후 main 넘어가기
    @RequestMapping("/done.do")
    public String done(HttpSession session){
        System.out.println("done");

        int channelnum = (int) session.getAttribute("channelnum");

        // 구독결제한 채널의 userid 가져오기
        String userid = purchase.getChannelUserid(channelnum);

        // 구독결제한 채널 세션 삭제
        session.removeAttribute("channelnum");

        String mav = "redirect:channel.do?userid="+userid;
        System.out.println(mav);
        return mav;
    }

    // fail : 결제 실패
    @RequestMapping("/fail.do")
    public String fail(HttpSession session){
        System.out.println("fail");

        // 구독결제한 채널 세션 삭제
        session.removeAttribute("channelnum");

        return "fail";
    }

    // cancle : 결제 취소
    @RequestMapping("/cancle.do")
    public String cancle(HttpSession session){
        System.out.println("cancle");

        // 구독결제한 채널 세션 삭제
        session.removeAttribute("channelnum");

        return "cancle";
    }

    // purchasedList : 결제 리스트 불러오기
    @RequestMapping("/purchasedList.do")
    public String purchasedList(HttpSession session, Model model){
        System.out.println("purchasedList");
        String userid = (String) session.getAttribute("userid");  // 로그인한 userid
        System.out.println("userid: " + userid);

        // 해당 userid의 결제 리스트 가져오기
        List<Purchased> purchasedList = purchase.getPurchasedList(userid);
        System.out.println(purchasedList);




        model.addAttribute("list", purchasedList);

        return "purchasedList";
    }
}
