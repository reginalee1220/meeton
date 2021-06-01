package service;

import dao.UserDAO;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserDAO userDao;

    // id중복검사
    public int checkUserId(String userid) throws Exception{
        return userDao.checkUserId(userid);
    }

    // 회원정보저장
    public void insertMember(User user) throws Exception{
        userDao.insertMember(user);
    }

    // 로그인 저장 체크
    public User userCheck(String userid) throws Exception{
        return userDao.userCheck(userid);
    }

    // 비밀번호 찾기
    public User findpwd(User upwd) throws Exception{
        return userDao.findpwd(upwd);
    }

    // 회원정보수정
    public void updateMember(User user) throws Exception{
        userDao.updateMember(user);
    }

    // 회원탈퇴
    public void deleteMember(User user) throws Exception{
        userDao.deleteMember(user);
    }

}
