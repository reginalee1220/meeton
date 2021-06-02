package dao;

import model.Channel;
import model.User;
import model.Video;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdminChannelDAO {
    @Autowired
    private SqlSessionTemplate sst;

    // 채널 이름 가져오기
    public User getUser(String userid){
        return sst.selectOne("adminChannel.ac_getUser", userid);
    }

    // 최신 동영상 실적
    public Video getVideo(String userid){
        return sst.selectOne("adminChannel.ac_getVideo",userid);
    }

    // 채널분석
    public Channel getChannel(String userid){
        return sst.selectOne("adminChannel.ac_getChannel",userid);
    }

    // 총 조회수
    public int getViews(String userid){
        return  sst.selectOne("adminChannel.ac_getViews", userid);
    }

    // 인기 동영상
    public Video getTopVideo(String userid){
        return sst.selectOne("adminChannel.ac_getTopVideo", userid);
    }

    // 총 동영상 갯수 구해오기
    public int getListCount(String userid){
        return sst.selectOne("adminChannel.ac_getListCount",userid);
    }

    // 동영상 리스트 가져오기
    public List<Video> getVideoList(String userid){
        return sst.selectList("adminChannel.ac_getVideoList", userid);
    }


}
