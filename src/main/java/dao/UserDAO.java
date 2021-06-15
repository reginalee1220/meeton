package dao;

import model.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {

    @Autowired
    private SqlSessionTemplate sst;

    // 아이디 중복 체크
    public int checkUserId(String userid) throws Exception{
        int re = -1;    // 사용가능한 ID
        User user = (User) sst.selectOne("login_check", userid);
        if (user != null)
                re = 1;     // 중복id

        return re;
    }

    // 닉네임 중복 체크
    public int checkUserAka(String aka) throws Exception{
        int re = -1;    // 사용가능한 닉네임
        User user = (User) sst.selectOne("aka_check", aka);
        if (user != null)
            re = 1;     // 중복 닉네임

        return re;
    }

    // 회원정보저장
    public void insertMember(User user) throws Exception{

        sst.insert("user_signUp", user);
    }

    // 채널 생성
    public void createChannel(User user){
        sst.insert("user.createChannel", user);
    }

    // 로그인 인증 체크
    public User userCheck(String userid) throws Exception{

        return (User) sst.selectOne("login_check", userid);
    }

    // 닉네임 인증 체크
    public User akaCheck(String aka) throws Exception{

        return (User) sst.selectOne("aka_check", aka);
    }

    // 비번 검색
    public User findpwd(User pwd) throws Exception{
        return (User) sst.selectOne("pwd_find", pwd);
    }

    // 회원수정
    public void updateMember(User user) throws Exception {
        sst.update("user_edit", user);
    }

    // 회원삭제
    public void deleteMember(User delm) throws Exception {
//		getSession();
        sst.update("user_delete", delm);
    }

}
