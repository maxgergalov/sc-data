package com.test.sceditor.repository;

import com.test.sceditor.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;



public interface UserRepository extends JpaRepository<User, Integer> {

    public  User findByLogin(String login);
}
