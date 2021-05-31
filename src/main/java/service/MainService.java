package service;

import dao.MainDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainService {
    @Autowired
    private MainDAO main;
    public int getcount(){
        return main.getcount();
    }
}
