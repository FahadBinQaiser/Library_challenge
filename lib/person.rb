# frozen_string_literal: true
require 'date'
# A person class that can borrow books from the library
class Person
  attr_reader :name, :borrowed_books
  
  def initialize(name)
    @name = name
    @borrowed_books = []
    @books_list = []
  end
  def books_list
    @books_list
  end
  def borrow_books(book)
 book[:return_date] = Date.today + 30
    @books_list.push(book)
  end
end