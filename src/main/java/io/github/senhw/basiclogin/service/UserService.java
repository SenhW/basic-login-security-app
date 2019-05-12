package io.github.senhw.basiclogin.service;

import io.github.senhw.basiclogin.entity.User;
import io.github.senhw.basiclogin.user.CrmUser;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {

    User findByUserName(String userName);

    void save(CrmUser crmUser);
}
