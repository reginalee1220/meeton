package service;

import dao.PurchasedDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PurchasedService {
    @Autowired
    private PurchasedDAO DAO;

    public String getAka(int channelNum){
        return DAO.getAka(channelNum);
    }

    // 구독자수 증가
    public void updateSubscribers(int channelNum){
        DAO.updateSubscribers(channelNum);
    }


}
