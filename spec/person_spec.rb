# frozen_string_literal: true

require '../lib/person'
require '../lib/library'

describe Person do 
  let(:person) { Person.new("Fahad") } 
  let(:library) { Library.new }
  
  it 'stores checkout books in the book_shelf' do
    library.checkout_book("The Hobbit",person)
    expect(person.book_shelf).to include({ title: 'The Hobbit', author: 'J.R.R. Tolkien' })
  end

#  it 'creates a person with a name and an empty list of books' do 
#     expect(person.name).to eq("Fahad")
#     expect(person.books_list).to be_empty 
#   end
#  it 'allows a person to borrow a book and assign a return date' do
#     book = { title:"The Hobbit", author: 'J.R.R. Tolkien' }
#  person.borrow_books(book)

#     expect(person.books_list).to include(book)
#     expect(person.books_list.first[:return_date]).to eq(Date.today + 30)
#   end
end