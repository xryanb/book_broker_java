package com.book.club.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.book.club.models.Books;
import com.book.club.models.LoginUser;
import com.book.club.models.User;
import com.book.club.services.BooksService;
import com.book.club.services.UserService;

@Controller
public class HomeController {
	
	 // Add once service is implemented:
     @Autowired
     private UserService userServ;
     
     @Autowired
 	private BooksService bookServ;
    
    @GetMapping("/")
    public String index(Model model) {
        // Bind empty User and LoginUser objects to the JSP
        // to capture the form input
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        User user=userServ.register(newUser, result);
        // TO-DO Later -- call a register method in the service 
        // to do some extra validations and create a new user!
        if(result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        session.setAttribute("newLogin", user.getId());
        return "redirect:/welcome";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        // Add once service is implemented:
         User user = userServ.login(newLogin, result);
        if(result.hasErrors() || user==null) {
            model.addAttribute("newUser", new User());
            System.out.println("fail");
            return "index.jsp";
        }
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        session.setAttribute("newLogin", user.getId());
        System.out.println("pass");
        return "redirect:/welcome";
    }
    
    @GetMapping("/welcome")
	public String welcome(HttpSession session, Model model) {
		// If no userId is found, redirect to logout
		if(session.getAttribute("newLogin") == null) {
			System.out.println("login fail");
			return "redirect:/logout";
		}
		// We get the userId from our session (we need to cast the result to a Long as the 'session.getAttribute("userId")' returns an object
		Long userId = (Long) session.getAttribute("newLogin");
		model.addAttribute("user", userServ.findById(userId));
		model.addAttribute("all", bookServ.allBooks());
		List<Books> books = bookServ.unborrowedBooks(userServ.findById(userId));
		model.addAttribute("books", books);

		List<Books> myBooks = bookServ.borrowedBooks(userServ.findById(userId));
		model.addAttribute("myBooks", myBooks);
		System.out.println("login success");
	    return "show.jsp";   
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		// Set userId to null and redirect to login/register page
		session.setAttribute("newLogin", null);  
	    return "redirect:/";
	}
	
}
