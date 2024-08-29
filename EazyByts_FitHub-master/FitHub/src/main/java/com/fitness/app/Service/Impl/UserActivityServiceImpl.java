package com.fitness.app.Service.Impl;

import com.fitness.app.Model.Activity;
import com.fitness.app.Model.User;
import com.fitness.app.Model.UserActivity;
import com.fitness.app.Repository.ActivityRepository;
import com.fitness.app.Repository.UserActivityRepository;
import com.fitness.app.Repository.UserRepository;
import com.fitness.app.Service.UserActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;


@Service
public class UserActivityServiceImpl implements UserActivityService {

    @Autowired
    private UserActivityRepository userActivityRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ActivityRepository activityRepository;

    @Override
    public void saveUserActivity(int activityId, String userID) {

        User user = userRepository.getUser(userID);
        Activity activity = activityRepository.findById((long) activityId).orElse(null);

        if (activity != null) {
            UserActivity userActivity = new UserActivity();
            userActivity.setUser(user);
            userActivity.setActivity(activity);
            userActivity.setStatus("Incomplete");
            userActivityRepository.save(userActivity);
        }
    }

    @Override
    public List<UserActivity> findAll() {
        return userActivityRepository.findAll();
    }

    @Override
    public void deleteById(Long id) {
        userActivityRepository.deleteById(id);
    }

    @Override
    public void updateUserActivity(Long id) {
       UserActivity userActivity= userActivityRepository.getUserActivitiesByActivity_Id(id);
       userActivity.setStatus("completed");
       userActivityRepository.save(userActivity);
    }
}
