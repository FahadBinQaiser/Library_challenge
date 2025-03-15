require './lib/library'
describe Library do
  let(:library) { Library.new }
  it 'shows a list of available books' do 
    expect(library.list_books).to eq(["The Hobbit by J.R.R. Tolkien"])  
  end
  it 'loads book from the json file' do 
    expect(library.books).not_to be_empty
  end
  it 'allows users to check out a book if it is available' do  
    book_title = 'The Hobbit'
    library.checkout_book(book_title)

    available_books = library.list_books
    expect(available_books).not_to include("The Hobbit by J.R.R Tolkien")
  end
  it 'returns a date when a book is checked out' do
    library.checkout_book('The Hobbit')
    book = library.books.find { |book| book[:title] == 'The Hobbit' }
    expect(book[:return_date]).to eq(Date.today + 30)
    expect(book[:available]).to eq false
  end
  
end