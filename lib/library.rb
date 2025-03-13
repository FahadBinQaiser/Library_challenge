require 'json'
class Library
  def initialize
    file = File.read('./lib/books.json')
    @books = JSON.parse(file, symbolize_names: true)
  end
  def add_books(book) 
    @books << book
  end
  def list_books
    available_books = @books.select { |book| book[:available] }
    available_books.map { |book| "#{book[:title]} by #{book[:author]}" }
  end  
end