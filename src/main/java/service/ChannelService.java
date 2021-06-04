package service;

import com.sun.xml.internal.ws.api.ha.StickyFeature;
import dao.ChannelDAO;
import model.Channel;
import model.PagingDTO;
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

    // 영상 총개수 구하기
    public int getTotalVideo(int channelNum){
        return dao.getTotalVideo(channelNum);
    }
    // 페이징 영상 리스트 불러오기
    public List<Video> getVideoList(PagingDTO p){
        return dao.getVideoList(p);
    }
}
