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
    // 영상 총개수 구하기
    public int getTotalVideo(int channelNum){
        return sst.selectOne("channel.c_getTotalVideo",channelNum);
    }
    // 페이징 영상 리스트 불러오기
    public List<Video> getVideoList(Video video){
        return sst.selectList("channel.c_getVideoList", video);
    }

    //해당 비디오 정보 불러오기
    public Video getThisVideo(int videonum){
        return sst.selectOne("channel.c_getThisVideo",videonum);
    }

    //댓글리스트 불러오기
    public List<Comment> getcmList(int videonum){
        return sst.selectList("channel.c_getcmList",videonum);
    }

    //댓글 삽입하기
    public void cmInsert(Comment comment){
        sst.insert("channel.c_cmInsert",comment);
    }

    //video의 comments 수 올리기
    public void cmIncrease(int videonum){
        sst.update("channel.c_cmincrease",videonum);
    }
    //video의 댓글 개수 구하기
    public int getcmcount(int videonum){
        return sst.selectOne("channel.c_cmcount",videonum);
    }

    //댓글 수정하기
    public void cmUpdate(Comment comment){
        sst.update("channel.c_cmUpdate",comment);
    }
    //댓글 삭제하기
    public void cmDelete(Comment comment){
        sst.delete("channel.c_cmDelete", comment);
    }
}
