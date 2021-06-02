package service;

import dao.MyPickDAO;
import model.Favorite;
import model.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyPickService {
    @Autowired
    private MyPickDAO myPickDAO;
    
    // 채널 즐겨찾기 목록
    public List<Favorite> getFavoriteList(String userid){
        System.out.println("MyPickService");

        return myPickDAO.getFavoriteList(userid);
    }

    // 최근에 본 영상
    public List<Video> getVideoList(String userid) {


        return myPickDAO.getVideoList(userid);
    }


}
