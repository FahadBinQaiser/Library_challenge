# frozen_string_literal: true

require './lib/library'
require_relative '../lib/person'

describe Library do # rubocop:disable Metrics/BlockLength
  let(:library) { Library.new }
  let(:person) { Person.new("Fahad") }

  it 'shows a list of available books' do
    expected_books = library.books.select { |book| book[:available] }
                            .map { |book| "#{book[:item][:title]} by #{book[:item][:author]}" }
    expect(library.list_books).to eq(expected_books)
  end

  it 'loads books from the yaml file' do
    expect(library.books).not_to be_empty
  end

  it 'allows users to check out a book if it is available' do
    book_title = 'Pippi Långstrump'
    library.checkout_book(book_title, person)

    available_books = library.list_books
    expect(available_books).not_to include("#{book_title} by Astrid Lindgren")
  end

  it 'returns a date when a book is checked out' do
    book_title = 'Pippi Långstrump'
    library.checkout_book(book_title, person)
    book = library.books.find { |b| b[:item][:title] == book_title }

    expect(book[:return_date]).to eq(Date.today + 30)
    expect(book[:available]).to eq false
  end

  it 'should return a return date on checkout' do
    book_title = 'Pippi Långstrump'
    library.checkout_book(book_title, person)
    return_date = library.return_date(book_title)

    expect(return_date).to eq(Date.today + 30)
  end
end
