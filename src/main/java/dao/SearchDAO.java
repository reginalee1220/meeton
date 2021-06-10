package dao;

import model.Video;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SearchDAO {
    @Autowired
    private SqlSessionTemplate sst;

    // 서치된 video 리스트 구하기
    public List<Video> getSearchList(Video video){
        return sst.selectList("search.sc_getSearchList", video);
    }

    // 서치된 video 갯수 구하기
    public int getTotal(Video video){
        return sst.selectOne("search.sc_getTotal",video);
    }
}
