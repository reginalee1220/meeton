package dao;

import model.Channel;
import model.Video;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminChannelDAO {
    @Autowired
    private SqlSessionTemplate sst;

    // 최신 동영상 실적
    public Video getVideo(String userid){
        return sst.selectOne("adminChannel.getVideo",userid);
    }

    // 채널분석
    public Channel getChannel(String userid){
        return sst.selectOne("adminChannel.getChannel",userid);
    }
}
