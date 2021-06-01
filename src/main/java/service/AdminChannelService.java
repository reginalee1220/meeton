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

    // 최신 동영상 실적
    public Video getVideo(String userid){
        return adChannelDAO.getVideo(userid);
    }

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

    // 동영상 리스트 가져오기
    public List<Video> getVideoList(String userid){
        return adChannelDAO.getVideoList(userid);
    }
}
