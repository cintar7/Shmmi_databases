package com.myapp.controller;

import com.myapp.repository.RecipeRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebController {

    private final RecipeRepository recipeRepository;

    public WebController(RecipeRepository recipeRepository) {
        this.recipeRepository = recipeRepository;
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/welcome")
    public String welcome() {
        return "welcome";
    }

    @GetMapping("/recipes")
    public String listRecipes(Model model) {
        model.addAttribute("recipes", recipeRepository.findAll());
        return "recipes";
    }
}
