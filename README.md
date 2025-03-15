# Library Challenge

#### An Library project that allows a user to:

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

### Then load the file using require

2) require './lib/library.rb'

### Create a library instance

3) library = Library.new
library.list_books

### For checking out a book, type

4) library.checkout_book("The Hobbit")

### Check return date (optional not imp but a command to show a method :) 

5) library.return_date("The Hobbit")

### License
This project is licensed under the MIT license, See the license file for more information.


