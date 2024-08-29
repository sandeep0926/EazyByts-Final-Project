package com.fitness.app.Service;

import com.fitness.app.Model.UserActivity;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public interface UserActivityService {


    void saveUserActivity(int activityId, String userID);

    List<UserActivity> findAll();

    void deleteById(Long id);

    void updateUserActivity(Long id);
}
