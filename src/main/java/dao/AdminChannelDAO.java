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

    // 채널 이름, 프로필 가져오기
    public User getUser(String userid){
        return sst.selectOne("adminChannel.ac_getUser", userid);
    }


//*************************************************** dashboard ***************************************************//
    // 최신 동영상 실적
    public Video getLatestVideo(String userid){
        return sst.selectOne("adminChannel.ac_getLatestVideo",userid);
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


//*************************************************** content ***************************************************//
    // 동영상 리스트 가져오기
    public List<Video> getVideoList(Video video){
        return sst.selectList("adminChannel.ac_getVideoList", video);
    }

    // 총 동영상 갯수 구해오기
    public int getListCount(Video video){
        return sst.selectOne("adminChannel.ac_getListCount", video);
    }


//*************************************************** videoUpload ***************************************************//
    // video DTO를 매개로 video DB에 업로드 정보 반영
    public void insertVideo(Video video){
        sst.insert("adminChannel.ac_insertVideo", video);
    }

}
