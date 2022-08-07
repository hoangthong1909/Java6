package poly.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @GetMapping("/login/form")
    public String formLogin() {
        return "security/login";
    }

    @RequestMapping("/login/success")
    public String login(Model model) {
        model.addAttribute("message", "Login Successfully");
        return "forward:/home/index";
    }

    @GetMapping("/login/error")
    public String errorLogin(Model model) {
        model.addAttribute("message", "Incorrect account or password");
        return "forward:/auth/login/form";
    }

    @GetMapping("/logout/success")
    public String logout(Model model) {
        model.addAttribute("message", "Logout Successfully");
        return "security/login";
    }

    @GetMapping("/unauthorized")
    public String denied(Model model) {
        model.addAttribute("message", "No Access Rights");
        return "security/login";
    }

}
