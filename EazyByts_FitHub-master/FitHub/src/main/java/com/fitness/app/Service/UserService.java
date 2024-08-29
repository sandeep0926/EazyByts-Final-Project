package com.fitness.app.Service;

import com.fitness.app.Model.User;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public interface UserService {

    User getlogin(String email, String password);

    User saveUser(User user);

    User getUser(String email);

    List<User> getAllUsers();

    Optional<User> getUserBYUserId(int userId);

    void updateUser(User user, int userId);

}