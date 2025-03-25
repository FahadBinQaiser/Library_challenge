# frozen_string_literal: true

require './lib/library'

describe Library do
  let(:library) { Library.new }

  it 'shows a list of available books' do
    expect(library.list_books).to eq([
      "Alfons och soldatpappan by Gunilla Bergström",
      "Osynligt med Alfons by Gunilla Bergström",
      "Pippi Långstrump by Astrid Lindgren",
      "Pippi Långstrump går ombord by Astrid Lindgren"
    ])
  end

  it 'loads books from the yaml file' do
    expect(library.books).not_to be_empty
  end

  it 'allows users to check out a book if it is available' do
    book_title = 'Pippi Långstrump'
    library.checkout_book(book_title)

    available_books = library.list_books
    expect(available_books).not_to include("#{book_title} by Astrid Lindgren")
  end

  it 'returns a date when a book is checked out' do
    book_title = 'Pippi Långstrump'
    library.checkout_book(book_title)
    book = library.books.find { |b| b[:item][:title] == book_title }

    expect(book[:return_date]).to eq((Date.today + 30).to_s)
    expect(book[:available]).to eq false
  end

  it 'should return a return date on checkout' do
    book_title = 'Pippi Långstrump'
    library.checkout_book(book_title)
    return_date = library.return_date(book_title)

    expect(return_date).to eq((Date.today + 30).to_s)
  end
end
