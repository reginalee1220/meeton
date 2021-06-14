package service;

import dao.PurchasedDAO;
import model.Favorite;
import model.Purchased;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PurchasedService {
    @Autowired
    private PurchasedDAO DAO;

//*************************************************** success.do ***************************************************//
    // favorite DTO를 매개로 결제한 userid의 purchased에 추가
    public void updatePurchased(Purchased purchased){
        DAO.updatePurchased(purchased);
    }

    // 나의 마지막 구매번호
    public int getMyLatestNum(String userid){
        return DAO.getMyLatestNum(userid);
    }

    // favorite DTO를 매개로 결제한 userid 의 favorite에 추가
    public void updateFavorite(Favorite favorite){
        DAO.updateFavorite(favorite);
    }

    // 구독한 채널의 subscribers 수 올려주기
    public void updateSubscribers(int channelnum){
        DAO.updateSubscribers(channelnum);
    }


//*************************************************** done.do ***************************************************//
    // 구독결제한 채널의 userid 가져오기
    public String getChannelUserid(int channelnum){
        return DAO.getChannelUserid(channelnum);
    }

}
