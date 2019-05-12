package io.github.senhw.basiclogin.dao;

import io.github.senhw.basiclogin.entity.User;

public interface UserDao {

    User findByUserName(String userName);
    
    void save(User user);
    
}
