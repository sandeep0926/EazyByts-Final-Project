package com.fitness.app.Controller;

import com.fitness.app.Model.Activity;
import com.fitness.app.Model.User;
import com.fitness.app.Model.UserActivity;
import com.fitness.app.Service.ActivityService;
import com.fitness.app.Service.UserActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private UserController userController;

    @Autowired
    private ActivityService activityService;


    @Autowired
    UserActivityService userActivityService;

    @GetMapping("/")
    public String listActivities(Model model) {
        model.addAttribute("activities", activityService.findAll());
        System.out.println(activityService.findAll());
        return "index";
    }

    @GetMapping("/dashboard/users")
    public String getUsers(Model model) {
        List<User> users = userController.getUsers();
        model.addAttribute("users", users);
        return "DashBoard/users";
    }

    @GetMapping("/dashboard/activity")
    public String getCars(Model model) {
        List<Activity> activities = activityService.findAll();
        model.addAttribute("activities", activities);
        return "DashBoard/activity";
    }

    @GetMapping("/dashboard/useractivity")
    public String getUserActivityPage(Model model){
        List<UserActivity> userActivities = userActivityService.findAll();
        model.addAttribute("userActivity", userActivities);
        return "DashBoard/UserActivity";
    }

}