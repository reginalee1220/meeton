package dao;

import model.Channel;
import model.MainDTO;
import model.Video;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MainDAO {
    @Autowired
    private SqlSessionTemplate sst;

    /* Main Favorite 목록 */
    public List<MainDTO> getFavoriteList(String userid){
        System.out.println("MainDAO");
        return sst.selectList("main.favoriteList",userid);
    }

    /*  Main Video 목록  */
    public List<Video> getVideoList (){
        return sst.selectList("main.videoList");
    }

    /* Main channel 목록 */
    public List<Channel> getChannelList() {
        return sst.selectList("main.channelList");
    }

}
