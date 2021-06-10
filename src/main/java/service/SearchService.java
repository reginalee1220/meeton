package service;

import dao.SearchDAO;
import model.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SearchService {
    @Autowired
    private SearchDAO scDAO;

    // 서치된 video 리스트 구하기
    public List<Video> getSearchList(Video video){
        return scDAO.getSearchList(video);
    }

    // 서치된 video 갯수 구하기
    public int getTotal(Video video){
        return scDAO.getTotal(video);
    }
}
