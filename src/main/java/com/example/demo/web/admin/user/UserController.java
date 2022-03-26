package com.example.demo.web.admin.user;

import com.example.demo.model.User;
import com.example.demo.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin/user/users")
    public String showUserList(Model model) {
        List<Map<String, Object>> listOfMaps = userService.getUsers();
        List<User> users = userService.getUserList();

        model.addAttribute("users", users);

        return "admin/user/users";
    }

    /**
     * Удаление пользователя с спользованием RequestParam
     * /admin/user/edit?userId=${user.id}
     * @param userId
     * @return
     */
    @GetMapping("/admin/user/delete")
    public String deleteUser(@RequestParam Integer userId) {
        userService.deleteUser(userId);
        return "redirect:/admin/user/users";
    }

    @GetMapping("/admin/user/{userId}/delete")
    public String deleteUser2(@PathVariable Integer userId) {
        userService.deleteUser(userId);
        return "redirect:/admin/user/users";
    }

    @GetMapping("/admin/user/users-ajax")
    public String showUserList2() {
        return "admin/user/users2";
    }

    @GetMapping("/admin/user/{userId}/edit")
    public String showUserEdit(@PathVariable Integer userId, Model model) {
        User user = userService.getUserById(userId);
        model.addAttribute("user", user);
        return "admin/user/edituser";
    }

    @PostMapping("/admin/user/{userId}/edit")
    public String saveUserEdit(
            @ModelAttribute User user,
            @PathVariable Integer userId) {
        user.setId(userId);
        System.out.println("Сохранние пользователя " + userId);

        userService.save(user);
        return "redirect:/admin/user/users";
    }
}
