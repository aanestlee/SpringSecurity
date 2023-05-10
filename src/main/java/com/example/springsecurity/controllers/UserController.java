package com.example.springsecurity.controllers;

import com.example.springsecurity.exp.Br;
import com.example.springsecurity.exp.BrRepository;
import com.example.springsecurity.exp.Prob;
import com.example.springsecurity.exp.ProbRepository;
import com.example.springsecurity.models.User;
import com.example.springsecurity.repositories.UserRepository;
import com.example.springsecurity.services.UserService;
import com.example.springsecurity.models.UserNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    @Autowired
    private BrRepository brRepository;
    @Autowired
    private ProbRepository probRepository;
    @Autowired
    private UserRepository userRepository;
    @GetMapping("/login")
    public String login() {
        return "login";
    }
    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }


    @PostMapping("/registration")
    public String createUser(User user) {
        userService.createUser(user);
        return "redirect:/login";
    }

    @GetMapping("/user")
    public String userView(@RequestParam(name = "name", required = false, defaultValue = "World") String name, Model model) {
        model.addAttribute("name", name);
        List<Br> BRI = brRepository.findAll();
        System.out.println(BRI);
        model.addAttribute("bri", BRI);
        return "user";

    }

    @GetMapping("/admin")
    public String adminView(@RequestParam(name = "name", required = false, defaultValue = "World") String name, Model model) {
        model.addAttribute("name", name);
        List<Prob> PRO = probRepository.findAll();
        System.out.println(PRO);
        model.addAttribute("pro", PRO);
        return "admin.html";

    }

    @GetMapping("/table")
    public String tsble() {
        return "table";
    }

    @GetMapping("/userform")
    public String user_form() {
        return "form";
    }






    @Autowired private UserService service;

    @GetMapping("/users")
    public String showUserList(Model model){
        List<User> listUsers = service.listAll();
        model.addAttribute("listUsers", listUsers);
        return "users";
    }

    @GetMapping("/users/new")
    public String showNewForm(Model model){
        model.addAttribute("user",new User());
        model.addAttribute("pageTitle", "Добавление нового пользователя!");
        return "user_form";
    }

    @PostMapping("/users/save")
    public String saveUser(User user, RedirectAttributes ra){
        service.save(user);
        ra.addFlashAttribute("message", "Пользователь сохранен!");

        return "redirect:/users";
    }

    @GetMapping("/users/edit/{id}")
    public String showEditForm(@PathVariable("id") Integer id, Model model, RedirectAttributes ra){
        try {
            User user = service.get(id);
            model.addAttribute("user", user);
            model.addAttribute("pageTitle", "Редактирование пользователя!");
            return "user_form";
        } catch (UserService.UserNotFoundException e) {
            throw new RuntimeException(e);
        }

    }



    //Рабочее
/*    @GetMapping("/users/delete/{id}")
    public String deleteUser(@PathVariable("id") Integer id, RedirectAttributes ra){
        try {
            service.delete(id);
            ra.addFlashAttribute("message", "Пользователь удален!");
        } catch (UserService.UserNotFoundException e) {
            throw new RuntimeException(e);
        }
        return "redirect:/users";

    }*/

    @GetMapping("/users/delete/{id}")
    public String deleteUser(@PathVariable("id") Integer id,RedirectAttributes ra){
        Optional <User> user = userRepository.findById(Long.valueOf(id));
        User user1 =  user.get();
        user1.setActive(false);
        userRepository.save(user1);
        ra.addFlashAttribute("message", "Пользователь удален!");
        return "redirect:/users";
    }


    }











