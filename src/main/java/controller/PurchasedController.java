package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import scala.util.parsing.json.JSONObject;
import service.PurchasedService;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;



@Controller
public class PurchasedController {
    @Autowired
    private PurchasedService purchase;

    // 구독버튼 누르면 popup 창으로 이동
    @RequestMapping("/purchase.do")
    public String purchase(){


        return "purchasingPopUp";
    }

    // 카카오페이 버튼 누르면 카카오페이 연결
    @RequestMapping("/kakaoPay.do")
//    @ResponseBody  // json 값을 돌려 주는 역할 (list, DTO 포함)
    public String kakaoPay(Model model) {
        System.out.println("kakaoPay");
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

            model.addAttribute("pageUrl", pageUrl);
            return "pageUrl";

        }catch(MalformedURLException e){
            e.printStackTrace();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return "null";
    }

    // 결제 성공
    @RequestMapping("/success.do")
    public String success(Model model, HttpSession session){
        return "main";
    }


    // 결제 리스트 불러오기
    @RequestMapping("/purchasedList.do")
    public String purchasedList(){

        return "purchasedList";
    }
}
