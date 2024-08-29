package com.fitness.app.Service;

import com.fitness.app.Model.Activity;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public interface ActivityService {
    List<Activity> findAll();

    Activity findById(Long id);

    Activity save(Activity activity);
    void deleteById(Long id);

    void updateActivity(Activity activity, Long id);
}