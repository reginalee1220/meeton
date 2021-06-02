package dao;

import model.Favorite;
import model.Video;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class MyPickDAO {
    @Autowired
    private SqlSessionTemplate sst;


    // 채널 즐겨찾기 목록
    public List<Favorite> getBookmark_favoriteList(String userid){
        System.out.println("MyPickDAO");

        return sst.selectList("myPick.bookmark_favoriteList", userid);
    }

    // 최근에 본 영상
    public List<Video> getVideoList(String userid) {


        return sst.selectList("myPick.history" , userid);
    }

    // 나중에 볼 영상




    // 좋아요 한 영상


}
