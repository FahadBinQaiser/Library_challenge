# Library Challenge

#### A Library project that allows a user to:

⚪ See the list of available books. <br>
⚪ Checkout a book if it's available. <br>
⚪ Have a return date on a book checkout. <br>

## Dependencies

Ruby ( Ruby 3.3.7 (2025-01-15 revision be31f993d7) [x64-mingw-ucrt])<br>
RSpec

## Setup:
Clone my repository using the web URL:

https://github.com/FahadBinQaiser/Library_challenge.git

After cloning, run **bundle install** in your terminal.

## Type IRB in your terminal

1) irb

### Then load the files using require

2) require './lib/library'
3) require './lib/person'

### Create a library instance

3) library = Library.new
4) library.list_books

### Create a person instance

4) person = Person.new("Fahad")
5) person.books_list 

### For checking out a book, type

5) book_title = 'Alfons och soldatpappan'
6) library.checkout_book(book_title, person)

### Check person books_list and library books

#### For person list,

7) person.books_list

#### For library list,

8) library.list_books

### Check return date 

9) library.return_date(book_title)

### License
This project is licensed under the MIT license, See the license file for more information.


