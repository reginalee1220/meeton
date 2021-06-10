package service;

import dao.ChannelDAO;
import model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChannelService {
    @Autowired
    private ChannelDAO dao;

    // 채널 구하기
    public Channel getChannel(String userid){
        return dao.getChannel(userid);
    }

    // 회원 구하기
    public User getUser(String userid){
        return dao.getUser(userid);
    }

    //최근 영상 3개 구하기
    public List<Video> getVideo(String userid){
        return dao.getVideo(userid);
    }

    // 영상 총개수 구하기
    public int getTotalVideo(int channelNum){
        return dao.getTotalVideo(channelNum);
    }

    // 페이징 영상 리스트 불러오기
    public List<Video> getVideoList(Video video){
        return dao.getVideoList(video);
    }

    //해당 비디오 정보 불러오기
    public Video getThisVideo(int videonum){
        return dao.getThisVideo(videonum);
    }

    //댓글리스트 불러오기
    public List<Comment> getcmList(int videonum){
        return dao.getcmList(videonum);
    }
    //댓글 삽입하기
    public void cmInsert(Comment comment){
        dao.cmInsert(comment);
    };

    //video의 comments 수 올리기
    public void cmIncrease(int videonum){
        dao.cmIncrease(videonum);
    }
    //video의 댓글 개수 구하기
    public int getcmcount(int videonum){
       return dao.getcmcount(videonum);
    }

    //댓글 수정하기
    public void cmUpdate(Comment comment){
        dao.cmUpdate(comment);
    }

    //댓글 삭제하기
    public void cmDelete(Comment comment){
        dao.cmDelete(comment);
    }
}
