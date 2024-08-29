package com.fitness.app.Service.Impl;

import com.fitness.app.Model.Activity;
import com.fitness.app.Repository.ActivityRepository;
import com.fitness.app.Service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActivityServiceImpl implements ActivityService {

    @Autowired
    private ActivityRepository repository;

    @Override
    public List<Activity> findAll() {
        return repository.findAll();
    }

    @Override
    public Activity findById(Long id) {
        return repository.findById(id).orElse(null);
    }

    @Override
    public Activity save(Activity activity) {
        return repository.save(activity);
    }

    @Override
    public void deleteById(Long id) {
        repository.deleteById(id);
    }

    @Override
    public void updateActivity(Activity activity, Long id) {
        Activity activity1 = repository.findById(id).orElse(null);
        if (activity1 != null) {
            activity1.setName(activity.getName());
            activity1.setType(activity.getType());
            activity1.setDuration(activity.getDuration());
            repository.save(activity1);
        }
    }
}
