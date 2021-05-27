package service;

import dao.MainDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainService {
    @Autowired
    private MainDAO mainDAO;
    public int getcount(){
        return mainDAO.getcount();
    }
}
