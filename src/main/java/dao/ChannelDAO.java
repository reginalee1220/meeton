package dao;

import model.Channel;
import model.User;
import model.Video;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ChannelDAO {
    @Autowired
    private SqlSessionTemplate sst;

    // 채널 구하기
    public Channel getChannel(String userid){
        return sst.selectOne("channel.c_getChannel", userid);
    }

    // 회원 구하기
    public User getUser(String userid){
        return sst.selectOne("channel.c_getUser", userid);
    }

    //최근 영상 3개 구하기
    public List<Video> getVideo(String userid){
        return sst.selectList("channel.c_getVideo", userid);
    }
}
