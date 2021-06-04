package service;

import com.sun.xml.internal.ws.api.ha.StickyFeature;
import dao.ChannelDAO;
import model.Channel;
import model.User;
import model.Video;
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
}
