package com.test.sceditor.service;


import com.test.sceditor.entity.User;
import com.test.sceditor.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    UserRepository userRepository;

    public User getByLogin(String login) {
        return userRepository.findByLogin(login);
    }
}
