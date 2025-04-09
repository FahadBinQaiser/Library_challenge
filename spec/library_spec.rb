# frozen_string_literal: true

require './lib/library'
require_relative '../lib/person'

describe Library do # rubocop:disable Metrics/BlockLength
  let(:library) { Library.new }
  let(:person) { Person.new('Fahad') }

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

  it 'sets a return date when a book is checked out' do
    book_title = 'Pippi Långstrump'
    library.checkout_book(book_title, person)
    book = library.books.find { |b| b[:item][:title] == book_title }

    expect(book[:return_date]).to eq(Date.today + 30)
  end

  it 'marks the book as unavailable after checkout' do
    book_title = 'Pippi Långstrump'
    library.checkout_book(book_title, person)
    book = library.books.find { |b| b[:item][:title] == book_title }

    expect(book[:available]).to eq false
  end

  it 'returns a return date from return_date method' do
    book_title = 'Pippi Långstrump'
    library.checkout_book(book_title, person)
    return_date = library.return_date(book_title)

    expect(return_date).to eq(Date.today + 30)
  end

  # Sad path tests

  it 'does not allow checkout of a checked-out book' do
    book_title = 'The Hobbit'
    result = library.checkout_book(book_title, person)

    expect(result).to eq('Sorry, this book is not available.')
  end

  it "doesn't add a checked-out book to person's list" do
    book_title = 'The Hobbit'
    library.checkout_book(book_title, person)

    expect(person.books_list).to be_empty
  end

  it 'does not allow checkout of a non-existent book' do
    book_title = 'Nonexistent Book'
    result = library.checkout_book(book_title, person)

    expect(result).to eq('Sorry, this book is not available.')
  end

  it "doesn't add a non-existent book to person's list" do
    book_title = 'Nonexistent Book'
    library.checkout_book(book_title, person)

    expect(person.books_list).to be_empty
  end

  it 'returns error when book_title is empty' do
    book_title = ''
    result = library.checkout_book(book_title, person)

    expect(result).to eq('Book title cannot be empty.')
  end

  it "doesn't update person's books list if book_title is empty" do
    book_title = ''
    library.checkout_book(book_title, person)

    expect(person.books_list).to be_empty
  end

  it 'does not allow checkout if person is nil' do
    book_title = 'Pippi Långstrump'
    result = library.checkout_book(book_title, nil)

    expect(result).to eq('Account cannot be nil (Invalid Person)')
  end
end
