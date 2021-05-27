package dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDAO {
    @Autowired
    private SqlSessionTemplate sst;

    public int getcount(){
        return sst.selectOne("main.getcount");
    }
}
