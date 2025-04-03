# frozen_string_literal: true

require 'yaml'
require 'date'
require_relative 'person'

# Library class that allows users to check out books
class Library
  attr_reader :books, :available

  def initialize
    @available = true
    @books = YAML.load_file('./lib/data.yml') || []
    @books.each do |book|
      book[:available] = true 
      book[:return_date] = nil
    end
  end

  def find_book(title)
    @books.find { |b| b[:item][:title].casecmp?(title) }
  end

  def list_books
    @books.select { |book| book[:available] }
          .map { |book| "#{book[:item][:title]} by #{book[:item][:author]}" }
  end

  def checkout_book(book_title, person)
    book = find_book(book_title)
    return 'Book not found or unavailable' unless book && book[:available]
      
      book[:available] = false
      book[:return_date] = Date.today + 30
      borrowed_book = { title: book[:item][:title], author: book[:item][:author], return_date: book[:return_date] }

      person.books_list << borrowed_book
      return "Checked out '#{book_title}'. Return by #{book[:return_date]}."
    end
  

  def return_date(title)
    book = find_book(title)
    book ? book[:return_date] : "No return date found for '#{title}'."
  end

  private

  def save_books
    File.write('./lib/data.yml', YAML.dump(@books))
  end
end
