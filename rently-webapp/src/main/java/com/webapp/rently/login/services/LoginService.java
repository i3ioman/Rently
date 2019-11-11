package com.webapp.rently.login.services;

import com.webapp.rently.login.controllers.dto.UserAuthorisationDTO;
//import com.webapp.rently.login.repository.LoginRepository;
//import com.webapp.rently.login.repository.enitites.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

//    @Autowired
//    LoginRepository loginRepository;

    public boolean isUserAuthorised(UserAuthorisationDTO user) {
//        return loginRepository.findUserEntitiesByEmailAndPassword(user.getEmail(),
//                user.getPassword()) != null;
        return true;
    }

    public boolean/*UserEntity*/ findUserByEmailAndPassword(String email) {
//        return loginRepository.findUserEntitiesByEmail(email);
        return true;
    }
}
