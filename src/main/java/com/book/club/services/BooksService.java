package com.book.club.services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.club.models.Books;
import com.book.club.models.User;
import com.book.club.repositories.BooksRepository;

@Service
public class BooksService {
	@Autowired
	BooksRepository bookRepo;
	
	public BooksService(BooksRepository bookRepo) {
		this.bookRepo=bookRepo;
	}
	
	public List<Books> allBooks(){
		return bookRepo.findAll();
	}
	
	public Books createBook(Books n) {
		return bookRepo.save(n);
	}
	
	  public Books findBook(Long id) {
	      Optional<Books> books = bookRepo.findById(id);
	      if(books.isPresent()) {
	          return books.get();
	      } else {
	          return null;
	      }
	  }

	public void updateBook(@Valid Books books) {
		// TODO Auto-generated method stub
		bookRepo.save(books);
	}
	
	public void deleteBook(Long id) {
		bookRepo.deleteById(id);
	}
	
	//borrow
	public List<Books> unborrowedBooks(User user){
		return bookRepo.findByBorrowerIdIsOrUserIdIs(null, user.getId());
	}
	
	public List<Books> borrowedBooks(User user){
		return bookRepo.findByBorrowerIdIs(user.getId());
	}
	
	public List<Books> myBooks(User user){
		return bookRepo.findByUserIdIs(user.getId());
	}
	
	public void removeBorrower(Books book) {
		book.setBorrower(null);
		bookRepo.save(book);
	}
	
	public void addBorrower(Books book, User user) {
		book.setBorrower(user);
		bookRepo.save(book);
	}
}
