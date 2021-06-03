package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PurchasedDAO {
    @Autowired
    private SqlSessionTemplate sst;

    public String getAka(int channelNum){
        return sst.selectOne("purchased.p_getAka", channelNum);
    }

    // 구독자수 증가
    public void updateSubscribers(int channelNum){
        sst.update("purchased.p_updatesub", channelNum);
    }
}
