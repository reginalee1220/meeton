package service;

import dao.MainDAO;
import model.Channel;
import model.MainDTO;
import model.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MainService {
    @Autowired
    private MainDAO mainDAO;

    /* Main Favorite 목록 */
    public List<MainDTO> getFavoriteList(String userid){
        System.out.println("MainService");
        return mainDAO.getFavoriteList(userid);
    }

    /* Main video 목록 */
    public List<Video> getVideoList(){
        return mainDAO.getVideoList();
    }

    /* Main channel 목록 */
    public List<Channel> getChannelList() {
        return mainDAO.getChannelList();
    }

}
