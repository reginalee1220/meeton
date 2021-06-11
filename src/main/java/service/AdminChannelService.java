package service;

import dao.AdminChannelDAO;
import model.Channel;
import model.User;
import model.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminChannelService {
    @Autowired
    private AdminChannelDAO adChannelDAO;

    // 채널 이름, 프로필 가져오기
    public User getUser(String userid){
        return adChannelDAO.getUser(userid);
    }


//*************************************************** dashboard ***************************************************//
    // 최신 동영상 실적
    public Video getLatestVideo(String userid){ return adChannelDAO.getLatestVideo(userid); }

    // 채널분석
    public Channel getChannel(String userid){
        return adChannelDAO.getChannel(userid);
    }

    // 총 조회수
    public int getViews(String userid){
        return  adChannelDAO.getViews(userid);
    }

    // 인기 동영상
    public Video getTopVideo(String userid){
        return adChannelDAO.getTopVideo(userid);
    }


//*************************************************** content ***************************************************//
    // 동영상 리스트 가져오기
    public List<Video> getVideoList(Video video){
        return adChannelDAO.getVideoList(video);
    }

    // 총 동영상 갯수 구해오기
    public int getListCount(Video video){
        return adChannelDAO.getListCount(video);
    }



    // 동영상 업로드 하기
    public void insertVideo(Video video){
        adChannelDAO.insertVideo(video);
    }

    // 최신동영상 번호 가져오기
    public int getlatestVideo(){
        return adChannelDAO.getlatestVideo();
    }

}
