package com.book.club.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.club.models.Books;
import com.book.club.services.BooksService;
import com.book.club.services.UserService;

@Controller
public class ShelfController {
	@Autowired
 	private BooksService bookServ;
	
	@Autowired
    private UserService userServ;
	
	
	@RequestMapping("/books/new")
	public String createBook(@ModelAttribute("book") Books book, HttpSession session, Model model) {
		
		if(session.getAttribute("newLogin") == null) {
			System.out.println("login fail");
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("newLogin");
		model.addAttribute("user", userServ.findById(userId));
		return "newbook.jsp";
	}
	
	@PostMapping("/books/create")
	public String create(@Valid @ModelAttribute("book") Books book, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "newbook.jsp";
        } else {
           bookServ.createBook(book);
            return "redirect:/welcome";
        }
    }
	
	@RequestMapping("/books/{id}")
	public String show(@PathVariable("id")Long id, Model model,HttpSession session) {
		if(session.getAttribute("newLogin") == null) {
			System.out.println("login fail");
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("newLogin");
		model.addAttribute("book", bookServ.findBook(id));
		model.addAttribute("user", userServ.findById(userId));
		return "display.jsp";
	}
	
	//update
    @RequestMapping("/books/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
       Books books = bookServ.findBook(id);
        model.addAttribute("book", books);
        return "edit.jsp";
    }
    
    @RequestMapping(value="/books/{id}", method=RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("book") Books books, BindingResult result,HttpSession session) {
        if (result.hasErrors()) {
        	System.out.println("hello");
            return "edit.jsp";
        }else if(session.getAttribute("newLogin") == null) {
        	System.out.println("login fail");
			return "redirect:/logout";
        }else {
        	bookServ.updateBook(books);
        	return "redirect:/welcome";
        	
        }
    }
    
    //delete
    @RequestMapping("/books/delete/{id}")
	public String deleteBook(@PathVariable("id") Long id, HttpSession session) {
		 
		if(session.getAttribute("newLogin") == null) {
			return "redirect:/logout";
		}
    	 
    	bookServ.deleteBook(id);
    	 
    	return "redirect:/welcome";
	}
    
    //borrow
 
	
	@RequestMapping("/bookmarket/{bookID}")
	public String borrowBook(@PathVariable("bookID") Long bookID, HttpSession session, Model model) {
	 
		if(session.getAttribute("newLogin") == null) {
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("newLogin");
		model.addAttribute("user", userServ.findById(userId));
		bookServ.addBorrower(bookServ.findBook(bookID), userServ.findById(userId));
		 
		return "redirect:/welcome";
	}
	
	@RequestMapping("/bookmarket/return/{bookID}")
	public String returnBook(@PathVariable("bookID") Long bookID, HttpSession session,Model model) {
	 
		if(session.getAttribute("newLogin") == null) {
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("newLogin");
		model.addAttribute("user", userServ.findById(userId));
		bookServ.removeBorrower(bookServ.findBook(bookID));
		 
		return "redirect:/welcome";
	}

}
