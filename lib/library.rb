# frozen_string_literal: true

require 'json'
require 'date'

# A Library that manages collection of books and allows users to checkout
class Library
  attr_reader :books

  def initialize
    load_books
  end

  def add_books(book)
    @books << book
    save_books
  end

  def list_books
    available_books = @books.select { |book| book[:available] }
    available_books.map { |b| "#{b[:title]} by #{b[:author]}" }
  end

  def checkout_book(title)
    book = @books.find { |b| b[:title] == title }

    return unless book && book[:available]

    book[:available] = false
    book[:return_date] = Date.today + 30
  end

  def return_date(title)
    book = @books.find { |b| b[:title] == title }
    book ? book[:return_date] : nil
  end

  private

  def load_books
    if File.exist?('./lib/books.json')
      file = File.read('./lib/books.json')
      @books = JSON.parse(file, symbolize_names: true)
    else
      @books = []
    end
  end

  def save_books
    File.write('./lib/books.json', JSON.pretty_generate(@books))
  end
end
