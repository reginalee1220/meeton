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

//*************************************************** channel.do ***************************************************//
    // 해당 채널 User 정보 가져오기
    public User getUser(String userid){
        return dao.getUser(userid);
    }

    // 해당 채널 정보 가져오기
    public Channel getChannel(String userid){
        return dao.getChannel(userid);
    }

    // 해당 채널 최신 동영상 3개 가져오기
    public List<Video> getVideo(String userid){
        return dao.getVideo(userid);
    }

//*************************************************** videoPage.do ***************************************************//
    // video를 매개로 데어터 리스트 구해오기
    public List<Video> getVideoList(Video video){
        return dao.getVideoList(video);
    }

    // 총 데이터 갯수 구하기
    public int getTotalVideo(int channelNum){
        return dao.getTotalVideo(channelNum);
    }


//*************************************************** video.do ***************************************************//
    // 해당 영상 정보 불러오기
    public Video getThisVideo(int videonum){
        return dao.getThisVideo(videonum);
    }

    // 해당 영상 조회수 올리기
    public void updateViews(int videonum) { dao.updateViews(videonum); }


//*************************************************** cmList.do ***************************************************//
    // 해당 영상의 댓글리스트 불러오기
    public List<Comment> getcmList(int videonum){
        return dao.getcmList(videonum);
    }


//*************************************************** cmInsert.do ***************************************************//
    // 댓글 삽입하기
    public void cmInsert(Comment comment){
        dao.cmInsert(comment);
    };

    // 해당 video의 comments 수 올리기
    public void cmIncrease(int videonum){
        dao.cmIncrease(videonum);
    }


//*************************************************** cmUpdate.do ***************************************************//
    //댓글 수정하기
    public void cmUpdate(Comment comment){
        dao.cmUpdate(comment);
    }


//*************************************************** cmDelete.do" ***************************************************//
    //댓글 삭제하기
    public void cmDelete(Comment comment){
        dao.cmDelete(comment);
    }



}
