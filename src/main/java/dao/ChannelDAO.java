package dao;

import model.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ChannelDAO {
    @Autowired
    private SqlSessionTemplate sst;

//*************************************************** channel.do ***************************************************//
    // 해당 채널 User 정보 가져오기
    public User getUser(String userid){
        return sst.selectOne("channel.c_getUser", userid);
    }

    // 해당 채널 정보 가져오기
    public Channel getChannel(String userid){
        return sst.selectOne("channel.c_getChannel", userid);
    }

    // 해당 채널 최신 동영상 3개 가져오기
    public List<Video> getVideo(String userid){
        return sst.selectList("channel.c_getVideo", userid);
    }


//*************************************************** videoPage.do ***************************************************//
    // video를 매개로 데어터 리스트 구해오기
    public List<Video> getVideoList(Video video){
        return sst.selectList("channel.c_getVideoList", video);
    }

    // 총 데이터 갯수 구하기
    public int getTotalVideo(int channelNum){
        return sst.selectOne("channel.c_getTotalVideo",channelNum);
    }


//*************************************************** video.do ***************************************************//
    // 해당 영상 정보 불러오기
    public Video getThisVideo(int videonum){
        return sst.selectOne("channel.c_getThisVideo",videonum);
    }

    // 해당 영상 조회수 올리기
    public void updateViews(int videonum) {
        sst.update("channel.c_updateViews",videonum);
    }


//*************************************************** cmList.do ***************************************************//
    // 해당 영상의 댓글리스트 불러오기
    public List<Comment> getcmList(int videonum){
        return sst.selectList("channel.c_getcmList",videonum);
    }


//*************************************************** cmInsert.do ***************************************************//
    // 댓글 삽입하기
    public void cmInsert(Comment comment){
        sst.insert("channel.c_cmInsert",comment);
    }

    // 해당 video의 comments 수 올리기
    public void cmIncrease(int videonum){
        sst.update("channel.c_cmincrease",videonum);
    }


//*************************************************** cmUpdate.do***************************************************//
    //댓글 수정하기
    public void cmUpdate(Comment comment){
        sst.update("channel.c_cmUpdate",comment);
    }


//*************************************************** cmDelete.do" ***************************************************//
    //댓글 삭제하기
    public void cmDelete(Comment comment){
        sst.delete("channel.c_cmDelete", comment);
    }





}
