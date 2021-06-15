package dao;

import model.Favorite;
import model.Purchased;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PurchasedDAO {
    @Autowired
    private SqlSessionTemplate sst;

//*************************************************** success.do ***************************************************//
    // favorite DTO를 매개로 결제한 userid의 purchased에 추가
    public void updatePurchased(Purchased purchased){
        sst.insert("purchased.p_updatePurchased", purchased);
    }

    // 나의 마지막 구매번호
    public int getMyLatestNum(String userid){
        return sst.selectOne("purchased.p_getMyLatestNum", userid);
    }

    // favorite DTO를 매개로 결제한 userid 의 favorite에 추가
    public void updateFavorite(Favorite favorite){
        sst.insert("purchased.p_updateFavorite", favorite);
    }

    // 구독한 채널의 subscribers 수 올려주기
    public void updateSubscribers(int channelnum){
        sst.update("purchased.p_updateSubscribers", channelnum);
    }

//*************************************************** done.do ***************************************************//
    // 구독결제한 채널의 userid 가져오기
    public String getChannelUserid(int channelnum){
        return sst.selectOne("purchased.p_getChannelUserid", channelnum);
    }


//*************************************************** purchasedList.do ***************************************************//
    // 해당 userid의 결제 리스트 가져오기
    public List<Purchased> getPurchasedList(String userid){
        return sst.selectList("purchased.p_getPurchasedList", userid);
    }
}
