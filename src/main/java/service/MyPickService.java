package service;

import dao.MyPickDAO;
import model.Favorite;
import model.HistoryDTO;
import model.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyPickService {
    @Autowired
    private MyPickDAO myPickDAO;
    
    // 채널 즐겨찾기 목록
    public List<Favorite> getBookmark_favoriteList(String userid){
        System.out.println("MyPickService");

        return myPickDAO.getBookmark_favoriteList(userid);
    }

    // 최근에 본 영상
    public List<HistoryDTO> getMy_historyList(String userid) {
        System.out.println("MyPickService");


        return myPickDAO.getMy_historyList(userid);
    }

    // 나중에 볼 영상
    public List<Video> getMy_watchLaterList(String userid) {
        System.out.println("MyPickService");

        return myPickDAO.getMy_watchLaterList(userid);
    }


    // 좋아요 한 영상
    public List<Video> getMy_likedVideoList(String userid) {
        System.out.println("MyPickService");

        return myPickDAO.getMy_likedVideoList(userid);
    }


}
