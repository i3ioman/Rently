package com.webapp.rently.login.controllers;

import com.webapp.rently.login.controllers.dto.UserAuthorisationDTO;
import com.webapp.rently.login.controllers.dto.UserAuthorisationResponseDTO;
import com.webapp.rently.login.services.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LoginController {

    final LoginService loginService;

    @Autowired
    public LoginController(LoginService loginService) {
        this.loginService = loginService;
    }

    @PostMapping("/authorize")
    public UserAuthorisationResponseDTO authorize(@RequestBody UserAuthorisationDTO user) {
            return UserAuthorisationResponseDTO.builder()
                    .isAuthorised(loginService.isUserAuthorised(user))
                    .build();
    }


}
