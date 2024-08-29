package com.fitness.app.Controller;

import com.fitness.app.Model.UserActivity;
import com.fitness.app.Service.UserActivityService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserActivityController {

    @Autowired
    private UserActivityService userActivityService;

    @GetMapping("/activities/activity")
    public String getUserActivityPage(@RequestParam int activityId, HttpServletRequest request) {
        String userID = "";
        HttpSession session = request.getSession(false);
        if (session != null) {
            userID = (String) session.getAttribute("userId");
            System.out.println(userID);
        }
        userActivityService.saveUserActivity(activityId, userID);
        return "redirect:/userActivity";
    }

    @GetMapping("/userActivity")
    public String getUserActivityPage(Model model){
        List<UserActivity> userActivities = userActivityService.findAll();
        model.addAttribute("userActivity", userActivities);
        return "UserActivity";
    }

    @GetMapping("userActivity/delete/{id}")
    public String deleteActivity(@PathVariable Long id) {
        userActivityService.deleteById(id);
        return "redirect:/userActivity";
    }

    @GetMapping("userActivity/update")
    public String editActivity(@RequestParam Long id) {
        userActivityService.updateUserActivity(id);
        return "redirect:/userActivity";
    }
}
