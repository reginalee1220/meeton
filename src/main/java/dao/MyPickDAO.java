package dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPickDAO {
    @Autowired
    private SqlSessionTemplate sst;

    // 채널 즐겨찾기 목록
    public List<Favorite> getFavoriteList(String userid){
        System.out.println("MyPickDAO");

        return sst.selectList("main.favoriteList", userid);
    }


}
