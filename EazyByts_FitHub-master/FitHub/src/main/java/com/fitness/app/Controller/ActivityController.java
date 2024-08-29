package com.fitness.app.Controller;

import com.fitness.app.Model.Activity;
import com.fitness.app.Service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/activities")
public class ActivityController {

    @Autowired
    private ActivityService activityService;

    @GetMapping
    public String listActivities(Model model) {
        model.addAttribute("activities", activityService.findAll());
        System.out.println(activityService.findAll());
        return "activity";
    }


    @GetMapping("/new")
    public String newActivityForm(Model model) {
        model.addAttribute("activity", new Activity());
        return "addactivity";
    }

    @PostMapping("/new")
    public String saveNewActivity(@Valid Activity activity, Model model) {
        activityService.save(activity);
        try {
            model.addAttribute("message", "Successfully added Activity!!");
            return "redirect:/dashboard/activity";
        } catch (Exception e) {
            model.addAttribute("message", "Something went wrong!!");
            return "addactivity";
        }
    }

    @GetMapping("/update")
    public String editActivityForm(@RequestParam Long id, Model model) {
        model.addAttribute("activity", activityService.findById(id));
        return "updateActivity";
    }

    @GetMapping("/delete/{id}")
    public String deleteActivity(@PathVariable Long id) {
        activityService.deleteById(id);
        return "redirect:/dashboard/activity";
    }

    @PostMapping("/update")
    public String updateActivity(@Valid Activity activity, Model model) {
        try {
            activityService.updateActivity(activity, activity.getId());
            model.addAttribute("message", "Successfully Updated Activity!!");
            return "redirect:/dashboard/activity";
        } catch (Exception e) {
            model.addAttribute("message", "Something went wrong!!");
            return "redirect:/dashboard/activity";
        }
    }
}
