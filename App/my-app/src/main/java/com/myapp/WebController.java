package com.myapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebController {

    @GetMapping("/login")
    public String login() {
        return "login"; // This should match the template name 'login.html'
    }
    @GetMapping("/welcome")
    public String welcome() {
        return "welcome";
    }
}
