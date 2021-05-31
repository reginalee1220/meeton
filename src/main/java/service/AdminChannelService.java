package service;

import dao.AdminChannelDAO;
import model.Channel;
import model.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminChannelService {
    @Autowired
    private AdminChannelDAO adChannelDAO;

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

}
